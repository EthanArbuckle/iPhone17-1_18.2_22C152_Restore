@interface CHFitnessAppBadgeManager
- (CHFitnessAppBadgeManager)init;
- (int64_t)_badgeCount;
- (int64_t)_loadBadgeCount;
- (void)_launchFitnessApp;
- (void)_storeBadgeCount:(int64_t)a3;
- (void)registerProvider:(id)a3;
- (void)requestBadgeUpdate;
- (void)unregisterProvider:(id)a3;
@end

@implementation CHFitnessAppBadgeManager

- (CHFitnessAppBadgeManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHFitnessAppBadgeManager;
  v2 = [(CHFitnessAppBadgeManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    providers = v2->_providers;
    v2->_providers = (NSHashTable *)v3;

    uint64_t v5 = HKCreateSerialDispatchQueue();
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)registerProvider:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "FitnessAppBadgeManager registerProvider for  %{public}@", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __45__CHFitnessAppBadgeManager_registerProvider___block_invoke;
  v14 = &unk_26471FF80;
  v15 = self;
  id v16 = v4;
  id v10 = v4;
  dispatch_async(serialQueue, &v11);
  [(CHFitnessAppBadgeManager *)self requestBadgeUpdate];
}

uint64_t __45__CHFitnessAppBadgeManager_registerProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)unregisterProvider:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CHFitnessAppBadgeManager_unregisterProvider___block_invoke;
  v7[3] = &unk_26471FF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __47__CHFitnessAppBadgeManager_unregisterProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)requestBadgeUpdate
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CHFitnessAppBadgeManager_requestBadgeUpdate__block_invoke;
  block[3] = &unk_26471FE40;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __46__CHFitnessAppBadgeManager_requestBadgeUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _loadBadgeCount];
  uint64_t result = [*(id *)(a1 + 32) _badgeCount];
  if (v2 != result)
  {
    [*(id *)(a1 + 32) _storeBadgeCount:result];
    id v4 = *(void **)(a1 + 32);
    return [v4 _launchFitnessApp];
  }
  return result;
}

- (int64_t)_badgeCount
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = self->_providers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    v9 = (os_log_t *)MEMORY[0x263F098C8];
    *(void *)&long long v5 = 134218242;
    long long v18 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "badgeCount", v18, (void)v19);
        _HKInitializeLogging();
        os_log_t v13 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          *(_DWORD *)buf = v18;
          uint64_t v24 = v12;
          __int16 v25 = 2114;
          v26 = v16;
          _os_log_impl(&dword_225615000, v14, OS_LOG_TYPE_DEFAULT, "FitnessAppBadgeManager got badge count of %zd from provider %{public}@", buf, 0x16u);
        }
        v7 += [v11 badgeCount];
      }
      uint64_t v6 = [(NSHashTable *)v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_loadBadgeCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"FitnessStoredBadgeCount"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_storeBadgeCount:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  int64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  long long v5 = [NSNumber numberWithInteger:a3];
  [v4 setObject:v5 forKey:@"FitnessStoredBadgeCount"];

  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "FitnessAppBadgeManager stored badge count: %ld", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_launchFitnessApp
{
  v10[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v2 = *MEMORY[0x263F3F5E0];
  v9[0] = *MEMORY[0x263F3F598];
  v9[1] = v2;
  v10[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = (void *)[objc_alloc(NSURL) initWithString:@"fitness-badging://"];
  v10[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  long long v5 = [MEMORY[0x263F3F778] optionsWithDictionary:v4];
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl(&dword_225615000, v6, OS_LOG_TYPE_DEFAULT, "FitnessAppBadgeManager launching app", v8, 2u);
  }
  int v7 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  [v7 openApplication:@"com.apple.Fitness" withOptions:v5 completion:&__block_literal_global_0];
}

void __45__CHFitnessAppBadgeManager__launchFitnessApp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    int64_t v4 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __45__CHFitnessAppBadgeManager__launchFitnessApp__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_providers, 0);
}

void __45__CHFitnessAppBadgeManager__launchFitnessApp__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  id v3 = @"com.apple.Fitness";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225615000, a2, OS_LOG_TYPE_ERROR, "Failed to launch application %@ with error: %@", (uint8_t *)&v2, 0x16u);
}

@end