@interface CCSetChangeXPCEventHandler
+ (id)sharedInstance;
- (CCSetChangeXPCEventHandler)init;
- (NSMutableArray)listeners;
- (OS_dispatch_queue)queue;
- (void)_handleXPCEvent:(id)a3;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
@end

@implementation CCSetChangeXPCEventHandler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CCSetChangeXPCEventHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_1, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1;

  return v2;
}

void __44__CCSetChangeXPCEventHandler_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x24C5B1100]();
  objc_opt_class();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;
}

- (CCSetChangeXPCEventHandler)init
{
  v15.receiver = self;
  v15.super_class = (Class)CCSetChangeXPCEventHandler;
  v2 = [(CCSetChangeXPCEventHandler *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cascade.setChange.xpc.eventHandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler setting up XPC event handler", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v9 = kCCSetChangeXPCEventStream;
    v10 = v2->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __34__CCSetChangeXPCEventHandler_init__block_invoke;
    handler[3] = &unk_26527AA70;
    objc_copyWeak(&v13, buf);
    xpc_set_event_stream_handler(v9, v10, handler);
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __34__CCSetChangeXPCEventHandler_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleXPCEvent:v3];
}

- (void)_handleXPCEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CCSetChangeXPCEventHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  dispatch_queue_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249B92000, v6, OS_LOG_TYPE_DEFAULT, "Handling xpc_event", buf, 2u);
  }

  v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86C8]));
  id v35 = 0;
  v25 = v4;
  v8 = +[CCSet setFromXPCDictionary:v4 error:&v35];
  id v9 = v35;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = [(CCSetChangeXPCEventHandler *)self listeners];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        v16 = [v15 identifier];
        int v17 = [v16 isEqual:v7];

        if (v17)
        {
          if (([v15 handlesUpdateForSet:v8] & 1) == 0)
          {
            v20 = __biome_log_for_category();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v8;
              _os_log_debug_impl(&dword_249B92000, v20, OS_LOG_TYPE_DEBUG, "Current process does not have read-only or greater access to set: %@, skipping set change update", buf, 0xCu);
            }
            goto LABEL_14;
          }
          v18 = [v15 handlerBlock];

          if (v18)
          {
            v19 = [v15 queue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke;
            block[3] = &unk_26527AA98;
            id v28 = v8;
            v29 = v15;
            id v30 = v9;
            dispatch_async(v19, block);

            goto LABEL_15;
          }
          v21 = [v15 batchHandlerBlock];

          if (v21)
          {
            if (v9)
            {
              v20 = __biome_log_for_category();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v37 = v7;
                __int16 v38 = 2112;
                id v39 = v9;
                _os_log_error_impl(&dword_249B92000, v20, OS_LOG_TYPE_ERROR, "Unable to decode a set from XPC event for listener: %@ with error: %@.", buf, 0x16u);
              }
LABEL_14:

              goto LABEL_15;
            }
            v22 = [v15 setChangeQueue];
            [v22 enqueue:v8];

            v23 = [v15 queue];
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_7;
            v26[3] = &unk_26527AAE8;
            v26[4] = v15;
            dispatch_async(v23, v26);
          }
        }
LABEL_15:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v24 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
      uint64_t v12 = v24;
    }
    while (v24);
  }
}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F29E78];
  id v3 = [*(id *)(a1 + 32) personaIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_2;
  v6[3] = &unk_26527AA98;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  [v2 runAsPersonaIdentifier:v3 block:v6];
}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlerBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) setChangeQueue];
  id v3 = [v2 dequeueAll];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_2_9;
  v4[3] = &unk_26527AAC0;
  v4[4] = *(void *)(a1 + 32);
  +[CCSetChangeQueue groupSetsByPersonaIdentifier:v3 enumerateGroupsUsingBlock:v4];
}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_2_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_queue_t v6 = (void *)MEMORY[0x263F29E78];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_3;
  v8[3] = &unk_265279EE0;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  [v6 runAsPersonaIdentifier:a2 block:v8];
}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) batchHandlerBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = [(CCSetChangeXPCEventHandler *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CCSetChangeXPCEventHandler_addListener___block_invoke;
  v7[3] = &unk_265279EE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __42__CCSetChangeXPCEventHandler_addListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_249B92000, v2, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler adding listener: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) listeners];
  [v4 addObject:*(void *)(a1 + 32)];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  int v5 = [(CCSetChangeXPCEventHandler *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__CCSetChangeXPCEventHandler_removeListener___block_invoke;
  v7[3] = &unk_265279EE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __45__CCSetChangeXPCEventHandler_removeListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_249B92000, v2, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler removing listener: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) listeners];
  [v4 removeObject:*(void *)(a1 + 32)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end