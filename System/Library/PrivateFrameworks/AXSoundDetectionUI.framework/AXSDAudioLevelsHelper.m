@interface AXSDAudioLevelsHelper
+ (id)sharedInstance;
- (AXSDAudioLevelsHelper)init;
- (void)deregisterListener:(id)a3;
- (void)registerListener:(id)a3 forAudioLevelUpdates:(id)a4 withBucketCount:(int)a5;
- (void)updateListenersWithBuffer:(id)a3;
@end

@implementation AXSDAudioLevelsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance___SharedHelper;
  return v2;
}

uint64_t __39__AXSDAudioLevelsHelper_sharedInstance__block_invoke()
{
  sharedInstance___SharedHelper = objc_alloc_init(AXSDAudioLevelsHelper);
  return MEMORY[0x270F9A758]();
}

- (AXSDAudioLevelsHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXSDAudioLevelsHelper;
  v2 = [(AXSDAudioLevelsHelper *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    listenerHanders = v2->_listenerHanders;
    v2->_listenerHanders = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    listenerBucketCounts = v2->_listenerBucketCounts;
    v2->_listenerBucketCounts = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.sounddetection.update_listeners", 0);
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)registerListener:(id)a3 forAudioLevelUpdates:(id)a4 withBucketCount:(int)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = a5;
    _os_log_debug_impl(&dword_226F20000, v10, OS_LOG_TYPE_DEBUG, "Register audio listener: %@ with bucket count: %d", buf, 0x12u);
  }

  v11 = [NSNumber numberWithUnsignedLongLong:v8];
  listenerQueue = self->_listenerQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__AXSDAudioLevelsHelper_registerListener_forAudioLevelUpdates_withBucketCount___block_invoke;
  v15[3] = &unk_2647F4CB0;
  id v16 = v11;
  id v17 = v9;
  v15[4] = self;
  int v18 = a5;
  id v13 = v11;
  id v14 = v9;
  dispatch_async(listenerQueue, v15);
}

void __79__AXSDAudioLevelsHelper_registerListener_forAudioLevelUpdates_withBucketCount___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = (void *)[*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v4 setObject:v5 forKey:*(void *)(a1 + 40)];
}

- (void)deregisterListener:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_debug_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEBUG, "Deregister audio listener: %@", buf, 0xCu);
  }

  v6 = [NSNumber numberWithUnsignedLongLong:v4];
  listenerQueue = self->_listenerQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__AXSDAudioLevelsHelper_deregisterListener___block_invoke;
  v9[3] = &unk_2647F4A58;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(listenerQueue, v9);
}

uint64_t __44__AXSDAudioLevelsHelper_deregisterListener___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v3 removeObjectForKey:v2];
}

- (void)updateListenersWithBuffer:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  id v12 = 0;
  listenerQueue = self->_listenerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke;
  v7[3] = &unk_2647F4D00;
  id v9 = v13;
  id v10 = v11;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenerQueue, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v7, v16, v17, v18, v19);
        int v9 = [v8 intValue];

        if (v9 != *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          id v10 = [*(id *)(a1 + 40) magnitudesWithLevelMultiplier:v9 count:10.0];
          uint64_t v11 = [v10 mutableCopy];
          uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
        }
        if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 3) {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "removeObjectsInRange:", 0, 2);
        }
        int v14 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v7];
        v15 = v14;
        if (v14 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          uint64_t v16 = MEMORY[0x263EF8330];
          uint64_t v17 = 3221225472;
          int v18 = __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke_2;
          v19 = &unk_2647F4CD8;
          id v20 = v14;
          AXPerformBlockOnMainThread();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
}

uint64_t __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listenerBucketCounts, 0);
  objc_storeStrong((id *)&self->_listenerHanders, 0);
}

@end