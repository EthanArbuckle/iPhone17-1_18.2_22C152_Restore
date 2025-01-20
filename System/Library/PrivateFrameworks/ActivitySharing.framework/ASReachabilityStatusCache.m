@interface ASReachabilityStatusCache
- (ASReachabilityStatusCache)init;
- (id)statusForDestination:(id)a3;
- (id)statusesForDestinations:(id)a3;
- (void)addStatusesByDestination:(id)a3;
- (void)setStatus:(id)a3 forDestination:(id)a4;
@end

@implementation ASReachabilityStatusCache

- (ASReachabilityStatusCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASReachabilityStatusCache;
  v2 = [(ASReachabilityStatusCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)statusForDestination:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ASReachabilityStatusCache_statusForDestination___block_invoke;
  block[3] = &unk_2644E8B40;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__ASReachabilityStatusCache_statusForDestination___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1[6] + 8);
  if (!*(void *)(v5 + 40))
  {
    *(void *)(v5 + 40) = &unk_26D051350;
  }
}

- (id)statusesForDestinations:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ASReachabilityStatusCache_statusesForDestinations___block_invoke;
  block[3] = &unk_2644E8B40;
  v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __53__ASReachabilityStatusCache_statusesForDestinations___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectForKey:", v10, (void)v13);
        uint64_t v12 = v11;
        if (v11 && [v11 integerValue]) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)setStatus:(id)a3 forDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ASReachabilityStatusCache_setStatus_forDestination___block_invoke;
  block[3] = &unk_2644E8B68;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __54__ASReachabilityStatusCache_setStatus_forDestination___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

- (void)addStatusesByDestination:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ASReachabilityStatusCache_addStatusesByDestination___block_invoke;
  v7[3] = &unk_2644E8B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __54__ASReachabilityStatusCache_addStatusesByDestination___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end