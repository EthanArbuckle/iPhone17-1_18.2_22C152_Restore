@interface COHomeKitAdapter
+ (COHomeKitAdapter)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (BOOL)hasOptedToHH2;
- (BOOL)isAlarmsCollectionSetting:(id)a3 forAccessory:(id)a4 inHome:(id)a5;
- (BOOL)isReady;
- (COHomeKitAdapter)init;
- (COHomeKitAdapter)initWithHomeManager:(id)a3;
- (COHomeKitAdapter)initWithHomeManager:(id)a3 MediaGroupsDaemon:(id)a4;
- (HMHomeManager)homekit;
- (HMMediaSystem)currentMediaSystem;
- (MGDaemon)mediaGroupsDaemon;
- (NSCondition)condition;
- (NSDictionary)audioDestinationControllerListeners;
- (NSMutableArray)mediaSystemUpdateHandlers;
- (id)accessoriesForSiriContextTargetReference:(id)a3;
- (id)accessoriesInMediaSystem:(id)a3 inHome:(id)a4;
- (id)accessoriesInRoom:(id)a3 inHome:(id)a4;
- (id)accessoriesInZone:(id)a3 inHome:(id)a4;
- (id)accessoryWithUniqueIdentifier:(id)a3;
- (id)addAlarm:(id)a3 toAccessory:(id)a4 inHome:(id)a5;
- (id)alarmsCollectionForAccessory:(id)a3 inHome:(id)a4 isMediaSystem:(BOOL *)a5;
- (id)alarmsForAccessory:(id)a3 inHome:(id)a4;
- (id)allAccessoriesForSiriContextTargetReference:(id)a3;
- (id)currentAccessory;
- (id)homeForAccessory:(id)a3;
- (id)identifiersForAccessoriesAssociatedWithAccessory:(id)a3 inHome:(id)a4;
- (id)mediaSystemForAccessory:(id)a3 inHome:(id)a4;
- (id)registerMediaSystemUpdateHandler:(id)a3;
- (id)removeAlarm:(id)a3 fromAccessory:(id)a4 inHome:(id)a5;
- (id)roomForAccessory:(id)a3 inHome:(id)a4;
- (id)settingsForKeyPath:(id)a3 fromSettings:(id)a4;
- (id)settingsForKeyPath:(id)a3 onAccessory:(id)a4;
- (id)settingsForKeyPath:(id)a3 onMediaObject:(id)a4;
- (id)updateAlarm:(id)a3 onAccessory:(id)a4 inHome:(id)a5;
- (id)zoneForAccessory:(id)a3 inHome:(id)a4;
- (void)_addAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4;
- (void)_postUsersChangedNotificationForHome:(id)a3;
- (void)_removeAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4;
- (void)_withLock:(id)a3;
- (void)audioDestinationControllerDidUpdateForAccessory:(id)a3 inHome:(id)a4;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didAddZone:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didRemoveZone:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateAuthorizationStatus:(unint64_t)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)prewarm;
- (void)setAudioDestinationControllerListeners:(id)a3;
- (void)setCurrentMediaSystem:(id)a3;
- (void)unregisterMediaSystemUpdateHandler:(id)a3;
@end

@implementation COHomeKitAdapter

- (COHomeKitAdapter)initWithHomeManager:(id)a3 MediaGroupsDaemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)COHomeKitAdapter;
  v9 = [(COHomeKitAdapter *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homekit, a3);
    v11 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    condition = v10->_condition;
    v10->_condition = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mediaSystemUpdateHandlers = v10->_mediaSystemUpdateHandlers;
    v10->_mediaSystemUpdateHandlers = v13;

    objc_storeStrong((id *)&v10->_mediaGroupsDaemon, a4);
    v15 = (NSDictionary *)objc_alloc_init(NSDictionary);
    audioDestinationControllerListeners = v10->_audioDestinationControllerListeners;
    v10->_audioDestinationControllerListeners = v15;

    homekit = v10->_homekit;
    if (homekit)
    {
      v18 = homekit;
      if ([(HMHomeManager *)v18 authorizationStatus] == 1)
      {
        BOOL v19 = 1;
      }
      else
      {
        char v20 = [(HMHomeManager *)v18 status];
        BOOL v19 = (v20 & 0x21) != 1 || (v20 & 0x10) != 0;
      }

      v10->_ready = v19;
      [(HMHomeManager *)v10->_homekit setDelegate:v10];
    }
  }

  return v10;
}

- (COHomeKitAdapter)initWithHomeManager:(id)a3
{
  return [(COHomeKitAdapter *)self initWithHomeManager:a3 MediaGroupsDaemon:0];
}

- (COHomeKitAdapter)init
{
  return [(COHomeKitAdapter *)self initWithHomeManager:0];
}

+ (COHomeKitAdapter)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  id v3 = (id)_COHomeKitAdapterSharedInstance;
  if (!v3)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)_COHomeKitAdapterSharedInstance;
    _COHomeKitAdapterSharedInstance = (uint64_t)v4;

    id v3 = v4;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  return (COHomeKitAdapter *)v3;
}

+ (void)setSharedInstance:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  id v4 = (void *)_COHomeKitAdapterSharedInstance;
  _COHomeKitAdapterSharedInstance = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
}

- (BOOL)isReady
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__COHomeKitAdapter_isReady__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COHomeKitAdapter *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__COHomeKitAdapter_isReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

- (void)prewarm
{
  v6 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_10(&dword_2217C1000, v0, v1, "%p request to prewarm HomeKit from %@", v2, v3, v4, v5, 2u);
}

id __27__COHomeKitAdapter_prewarm__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) homekit];
}

- (BOOL)hasOptedToHH2
{
  uint64_t v2 = [(COHomeKitAdapter *)self homekit];
  char v3 = [v2 hasOptedToHH2];

  return v3;
}

- (HMHomeManager)homekit
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __27__COHomeKitAdapter_homekit__block_invoke;
  v11[3] = &unk_2645CB120;
  v11[4] = self;
  v11[5] = &v12;
  [(COHomeKitAdapter *)self _withLock:v11];
  char v3 = [(COHomeKitAdapter *)self condition];
  [v3 lock];
  if (!self->_ready)
  {
    *(void *)&long long v4 = 134217984;
    long long v10 = v4;
    do
    {
      uint64_t v5 = COCoreLogForCategory(7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v10;
        BOOL v19 = self;
        _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p having to wait for HomeKit to come ready!", buf, 0xCu);
      }

      [v3 wait];
      BOOL ready = self->_ready;
      if (self->_ready)
      {
        uint64_t v7 = COCoreLogForCategory(7);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          BOOL v19 = self;
          _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p is able to move forward again.", buf, 0xCu);
        }

        BOOL ready = self->_ready;
      }
    }
    while (!ready);
  }
  objc_msgSend(v3, "unlock", v10);
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (HMHomeManager *)v8;
}

void __27__COHomeKitAdapter_homekit__block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  char v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v3)
  {
    long long v4 = (void *)[objc_alloc(MEMORY[0x263F0E5A8]) initWithOptions:225 cachePolicy:0];
    [v4 setDiscretionary:0];
    id v5 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v4 setDelegateQueue:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F0E3C0]) initWithConfiguration:v4];
    uint64_t v7 = *(void **)(*(void *)v2 + 16);
    *(void *)(*(void *)v2 + 16) = v6;

    id v8 = *(id *)(*(void *)v2 + 16);
    if ([v8 authorizationStatus] == 1)
    {
      BOOL v9 = 1;
    }
    else
    {
      char v10 = [v8 status];
      BOOL v9 = (v10 & 0x21) != 1 || (v10 & 0x10) != 0;
    }

    *(unsigned char *)(*(void *)v2 + 12) = v9;
    objc_msgSend(*(id *)(*(void *)v2 + 16), "setDelegate:");
    v11 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __27__COHomeKitAdapter_homekit__block_invoke_cold_1();
    }

    char v3 = *(void **)(*(void *)v2 + 16);
  }
  uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v12, v3);
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  long long v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)currentAccessory
{
  return 0;
}

- (HMMediaSystem)currentMediaSystem
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__10;
  BOOL v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__COHomeKitAdapter_currentMediaSystem__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COHomeKitAdapter *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HMMediaSystem *)v2;
}

void __38__COHomeKitAdapter_currentMediaSystem__block_invoke(uint64_t a1)
{
}

- (void)setCurrentMediaSystem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke;
  v7[3] = &unk_2645CAED0;
  id v5 = v4;
  id v8 = v5;
  BOOL v9 = self;
  id v10 = &v11;
  [(COHomeKitAdapter *)self _withLock:v7];
  uint64_t v6 = v12[5];
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }

  _Block_object_dispose(&v11, 8);
}

void __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(*(void *)(a1 + 40) + 24) || (objc_msgSend(v2, "isEqual:") & 1) != 0) {
    return;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
  char v3 = COCoreLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v36 = v4;
    __int16 v37 = 2112;
    uint64_t v38 = v5;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p set current media system to %@", buf, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [*(id *)(a1 + 32) components];
  id v8 = [v7 firstObject];
  BOOL v9 = [v8 mediaProfile];
  id v10 = [v9 accessory];

  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 16) currentAccessory];
  LODWORD(v9) = [v10 isEqual:v11];

  v29 = v7;
  if (v9)
  {
    uint64_t v12 = [v7 objectAtIndex:1];
    uint64_t v13 = [v12 mediaProfile];
    uint64_t v14 = [v13 accessory];

    id v10 = (void *)v14;
  }
  v15 = [v10 uniqueIdentifier];
  id v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v17 = [v16 dictionaryForKey:@"HomeKitContext"];
  v18 = [v17 objectForKey:@"MediaSystemCompanion"];
  if (!v18)
  {
    BOOL v19 = 0;
    if (v17) {
      goto LABEL_9;
    }
LABEL_11:
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    goto LABEL_12;
  }
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v18];
  if (!v17) {
    goto LABEL_11;
  }
LABEL_9:
  id v20 = (id)[v17 mutableCopy];
LABEL_12:
  v21 = v20;
  v30 = v6;
  if (*(void *)(a1 + 32))
  {
    objc_super v22 = [v6 UUIDString];
    [v21 setObject:v22 forKey:@"MediaSystem"];

    v23 = [v15 UUIDString];
    [v21 setObject:v23 forKey:@"MediaSystemCompanion"];
  }
  else
  {
    [v20 removeObjectForKey:@"MediaSystem"];
    [v21 removeObjectForKey:@"MediaSystemCompanion"];
  }
  [v16 setObject:v21 forKey:@"HomeKitContext"];
  v24 = [*(id *)(a1 + 40) mediaSystemUpdateHandlers];
  v25 = (void *)[v24 copy];

  if ([v25 count])
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke_25;
    v31[3] = &unk_2645CAEF8;
    id v32 = v25;
    id v33 = v19;
    id v34 = v15;
    uint64_t v26 = MEMORY[0x223C8B4A0](v31);
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

void __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke_25(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)accessoryWithUniqueIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(COHomeKitAdapter *)self homekit];
  long long v6 = [v5 homes];

  uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        long long v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = [v9 accessories];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v16 = [v15 uniqueIdentifier];
              char v17 = [v16 isEqual:v4];

              if (v17)
              {
                id v18 = v15;

                goto LABEL_20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
      }
      uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  long long v6 = COCoreLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[COHomeKitAdapter accessoryWithUniqueIdentifier:]();
  }
  id v18 = 0;
LABEL_20:

  return v18;
}

- (id)identifiersForAccessoriesAssociatedWithAccessory:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v9 = [(COHomeKitAdapter *)self mediaSystemForAccessory:v6 inHome:v7];
  if (v9)
  {
    id v10 = [(COHomeKitAdapter *)self accessoriesInMediaSystem:v9 inHome:v7];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__COHomeKitAdapter_identifiersForAccessoriesAssociatedWithAccessory_inHome___block_invoke;
    v13[3] = &unk_2645CC008;
    id v14 = v8;
    [v10 enumerateObjectsUsingBlock:v13];
  }
  else
  {
    id v10 = [v6 uniqueIdentifier];
    [v8 addObject:v10];
  }

  uint64_t v11 = [v8 allObjects];

  return v11;
}

void __76__COHomeKitAdapter_identifiersForAccessoriesAssociatedWithAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

- (id)mediaSystemForAccessory:(id)a3 inHome:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self homekit];
  long long v9 = [v8 homes];
  int v10 = [v9 containsObject:v7];

  if (v10)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = [v7 mediaSystems];
    uint64_t v26 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v26)
    {
      uint64_t v12 = *(void *)v34;
      long long v28 = v11;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v11);
          }
          id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v27 = v14;
          v15 = objc_msgSend(v14, "components", v25);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = [*(id *)(*((void *)&v29 + 1) + 8 * j) mediaProfile];
                uint64_t v21 = [v20 accessory];
                char v22 = [v21 isEqual:v6];

                if (v22)
                {
                  id v23 = v27;

                  uint64_t v11 = v28;
                  goto LABEL_21;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v25;
          uint64_t v11 = v28;
        }
        id v23 = 0;
        uint64_t v26 = [v28 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v26);
    }
    else
    {
      id v23 = 0;
    }
LABEL_21:
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)accessoriesInMediaSystem:(id)a3 inHome:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  long long v9 = [v6 components];
  int v10 = [(COHomeKitAdapter *)self homekit];
  uint64_t v11 = [v10 homes];
  int v12 = [v11 containsObject:v7];

  if (v12)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "mediaProfile", (void)v22);
          BOOL v19 = [v18 accessory];

          if (v19)
          {
            uint64_t v20 = [v8 arrayByAddingObject:v19];

            id v8 = (id)v20;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  return v8;
}

- (id)homeForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(COHomeKitAdapter *)self homekit];
  id v6 = [v5 homes];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 accessories];
        char v12 = [v11 containsObject:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)zoneForAccessory:(id)a3 inHome:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(COHomeKitAdapter *)self roomForAccessory:a3 inHome:v6];
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = objc_msgSend(v6, "zones", 0);
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = [v12 rooms];
          char v14 = [v13 containsObject:v7];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)accessoriesInZone:(id)a3 inHome:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = objc_msgSend(v6, "rooms", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      char v14 = v8;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = [(COHomeKitAdapter *)self accessoriesInRoom:*(void *)(*((void *)&v17 + 1) + 8 * v13) inHome:v7];
        id v8 = [v14 arrayByAddingObjectsFromArray:v15];

        ++v13;
        char v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)roomForAccessory:(id)a3 inHome:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(v7, "rooms", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v14 = [(COHomeKitAdapter *)self accessoriesInRoom:v13 inHome:v7];
        char v15 = [v14 containsObject:v6];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)accessoriesInRoom:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self homekit];
  uint64_t v9 = [v8 homes];
  if ([v9 containsObject:v7])
  {
    uint64_t v10 = [v7 rooms];
    int v11 = [v10 containsObject:v6];

    if (v11)
    {
      uint64_t v12 = [v6 accessories];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v12 = (void *)MEMORY[0x263EFFA68];
LABEL_6:

  return v12;
}

- (id)settingsForKeyPath:(id)a3 fromSettings:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (settingsForKeyPath_fromSettings__onceToken != -1) {
    dispatch_once(&settingsForKeyPath_fromSettings__onceToken, &__block_literal_global_2);
  }
  id v7 = [v5 componentsSeparatedByString:@"."];
  unint64_t v37 = [v7 count];
  if (v37
    && ([v7 firstObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:*MEMORY[0x263F0B5C0]],
        v8,
        v9))
  {
    uint64_t v10 = [v6 rootGroup];
    if (v10)
    {
      id v34 = v6;
      id v35 = v5;
      unint64_t v11 = 1;
      long long v36 = v7;
      do
      {
        uint64_t v12 = objc_msgSend(v7, "subarrayWithRange:", 0, v11, v34);
        uint64_t v13 = [v12 componentsJoinedByString:@"."];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        char v14 = [v10 groups];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v43 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              long long v20 = [v19 keyPath];
              int v21 = [v20 isEqualToString:v13];

              if (v21)
              {
                id v22 = v19;

                uint64_t v10 = v22;
                goto LABEL_17;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v48 count:16];
            if (v16) {
              continue;
            }
            break;
          }
LABEL_17:
          id v7 = v36;
        }

        if (!v10) {
          break;
        }
        ++v11;
      }
      while (v11 <= v37);
      if (v10)
      {
        uint64_t v23 = [v10 keyPath];
        id v5 = v35;
        char v24 = [v23 isEqualToString:v35];

        if (v24)
        {
          long long v25 = [v10 settings];
        }
        else
        {
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v26 = [v10 settings];
          long long v25 = (void *)[v26 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v25)
          {
            uint64_t v27 = v7;
            uint64_t v28 = *(void *)v39;
            while (2)
            {
              for (uint64_t j = 0; j != v25; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v39 != v28) {
                  objc_enumerationMutation(v26);
                }
                long long v30 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
                long long v31 = [v30 keyPath];
                int v32 = [v31 isEqualToString:v35];

                if (v32)
                {
                  v46 = v30;
                  long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
                  goto LABEL_36;
                }
              }
              long long v25 = (void *)[v26 countByEnumeratingWithState:&v38 objects:v47 count:16];
              if (v25) {
                continue;
              }
              break;
            }
LABEL_36:
            id v7 = v27;
          }
        }
      }
      else
      {
        long long v25 = 0;
        id v5 = v35;
      }
      id v6 = v34;
    }
    else
    {
      long long v25 = 0;
    }
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

void __52__COHomeKitAdapter_settingsForKeyPath_fromSettings___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = (id)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  [MEMORY[0x263F0DF48] setItemValueClasses:v5 forKeyPath:@"root.mobileTimer.alarms"];
}

- (id)settingsForKeyPath:(id)a3 onAccessory:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 settings];
  int v9 = [(COHomeKitAdapter *)self settingsForKeyPath:v6 fromSettings:v8];

  if (!v9)
  {
    uint64_t v10 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v7 uniqueIdentifier];
      int v13 = 134218498;
      char v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      long long v18 = v12;
      _os_log_error_impl(&dword_2217C1000, v10, OS_LOG_TYPE_ERROR, "%p was not able to retrieve %@ for accessory %@!", (uint8_t *)&v13, 0x20u);
    }
  }

  return v9;
}

- (id)settingsForKeyPath:(id)a3 onMediaObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 settings];
  int v9 = [(COHomeKitAdapter *)self settingsForKeyPath:v6 fromSettings:v8];

  if (!v9)
  {
    uint64_t v10 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218498;
      int v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_2217C1000, v10, OS_LOG_TYPE_ERROR, "%p was not able to retrieve %@ for %@!", (uint8_t *)&v12, 0x20u);
    }
  }
  return v9;
}

- (id)registerMediaSystemUpdateHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__COHomeKitAdapter_registerMediaSystemUpdateHandler___block_invoke;
  v8[3] = &unk_2645CBA10;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  [(COHomeKitAdapter *)self _withLock:v8];
  id v6 = (void *)MEMORY[0x223C8B4A0](v5);

  return v6;
}

void __53__COHomeKitAdapter_registerMediaSystemUpdateHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mediaSystemUpdateHandlers];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](*(void *)(a1 + 40));
  [v3 addObject:v2];
}

- (void)unregisterMediaSystemUpdateHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__COHomeKitAdapter_unregisterMediaSystemUpdateHandler___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COHomeKitAdapter *)self _withLock:v6];
}

void __55__COHomeKitAdapter_unregisterMediaSystemUpdateHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mediaSystemUpdateHandlers];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](*(void *)(a1 + 40));
  [v3 removeObject:v2];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[COHomeKitAdapter homeManagerDidUpdateHomes:](v5);
  }

  id v6 = [(COHomeKitAdapter *)self condition];
  [v6 lock];
  if (!self->_ready)
  {
    id v7 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v29 = self;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p is marking HomeKit ready!", buf, 0xCu);
    }

    self->_BOOL ready = 1;
    [v6 broadcast];
  }
  [v6 unlock];
  uint64_t v8 = [(COHomeKitAdapter *)self currentAccessory];
  if (v8)
  {
    id v9 = [(COHomeKitAdapter *)self homeForAccessory:v8];
    if (v9)
    {
      uint64_t v10 = [(COHomeKitAdapter *)self mediaSystemForAccessory:v8 inHome:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(COHomeKitAdapter *)self setCurrentMediaSystem:v10];
  }
  unint64_t v11 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [v4 homes];
  uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        __int16 v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v16 setDelegate:self];
        if (v11) {
          [v11 addHomeKitHome:v16];
        }
        id v17 = [v16 accessories];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __46__COHomeKitAdapter_homeManagerDidUpdateHomes___block_invoke;
        v22[3] = &unk_2645CC030;
        v22[4] = self;
        v22[5] = v16;
        [v17 enumerateObjectsUsingBlock:v22];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
  uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 postNotification:v18];
}

uint64_t __46__COHomeKitAdapter_homeManagerDidUpdateHomes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addAudioDestinationControllerListenerForAccessory:a2 home:*(void *)(a1 + 40)];
}

- (void)homeManager:(id)a3 didUpdateAuthorizationStatus:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(COHomeKitAdapter *)self condition];
  [v6 lock];
  if (!self->_ready)
  {
    id v7 = v5;
    if ([v7 authorizationStatus] == 1 || (unsigned int v8 = objc_msgSend(v7, "status"), (v8 & 0x21) != 1))
    {

      self->_BOOL ready = 1;
    }
    else
    {
      char v9 = v8;
      BOOL v10 = (v8 >> 4) & 1;

      self->_BOOL ready = v10;
      if ((v9 & 0x10) == 0) {
        goto LABEL_10;
      }
    }
    unint64_t v11 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = self;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p not waiting for home updates.  Marking HomeKit ready now!", (uint8_t *)&v12, 0xCu);
    }

    [v6 broadcast];
  }
LABEL_10:
  [v6 unlock];
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(COHomeKitAdapter *)self condition];
  [v6 lock];
  if (!self->_ready)
  {
    id v7 = v5;
    if ([v7 authorizationStatus] == 1 || (unsigned int v8 = objc_msgSend(v7, "status"), (v8 & 0x21) != 1))
    {

      self->_BOOL ready = 1;
    }
    else
    {
      char v9 = v8;
      BOOL v10 = (v8 >> 4) & 1;

      self->_BOOL ready = v10;
      if ((v9 & 0x10) == 0) {
        goto LABEL_10;
      }
    }
    unint64_t v11 = COCoreLogForCategory(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = self;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p got impatient for home updates.  Marking HomeKit ready now!", (uint8_t *)&v12, 0xCu);
    }

    [v6 broadcast];
  }
LABEL_10:
  [v6 unlock];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p Added Home %@", buf, 0x16u);
  }

  [v5 setDelegate:self];
  id v7 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
  unsigned int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotification:v7];

  char v9 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  BOOL v10 = v9;
  if (v9) {
    [v9 addHomeKitHome:v5];
  }
  unint64_t v11 = [v5 accessories];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__COHomeKitAdapter_homeManager_didAddHome___block_invoke;
  v13[3] = &unk_2645CC030;
  void v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [v11 enumerateObjectsUsingBlock:v13];
}

uint64_t __43__COHomeKitAdapter_homeManager_didAddHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addAudioDestinationControllerListenerForAccessory:a2 home:*(void *)(a1 + 40)];
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    char v9 = self;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Updated Current Home", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  if (v6)
  {
    id v7 = [v4 currentHome];
    if (v7) {
      [v6 addHomeKitHome:v7];
    }
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v20 = self;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p Removed Home %@", buf, 0x16u);
  }

  id v7 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
  int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotification:v7];

  char v9 = [v5 accessories];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __46__COHomeKitAdapter_homeManager_didRemoveHome___block_invoke;
  __int16 v16 = &unk_2645CC030;
  __int16 v17 = self;
  id v10 = v5;
  id v18 = v10;
  [v9 enumerateObjectsUsingBlock:&v13];

  unint64_t v11 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  id v12 = v11;
  if (v11) {
    [v11 removeHomeKitHome:v10];
  }
}

uint64_t __46__COHomeKitAdapter_homeManager_didRemoveHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeAudioDestinationControllerListenerForAccessory:a2 home:*(void *)(a1 + 40)];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(COHomeKitAdapter *)self currentAccessory];
  char v9 = [v8 uniqueIdentifier];
  id v10 = [v7 uniqueIdentifier];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218242;
      id v18 = self;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p Added Accessory %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v13 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
    uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotification:v13];
  }
  id v15 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  __int16 v16 = v15;
  if (v15) {
    [v15 addHomeKitAccessory:v7 fromHome:v6];
  }
  [(COHomeKitAdapter *)self _addAudioDestinationControllerListenerForAccessory:v7 home:v6];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(COHomeKitAdapter *)self currentAccessory];
  char v9 = [v8 uniqueIdentifier];
  id v10 = [v7 uniqueIdentifier];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218242;
      id v18 = self;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p Removed Accessory %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v13 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
    uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotification:v13];
  }
  id v15 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  __int16 v16 = v15;
  if (v15) {
    [v15 removeHomeKitAccessory:v7 fromHome:v6];
  }
  [(COHomeKitAdapter *)self _removeAudioDestinationControllerListenerForAccessory:v7 home:v6];
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  char v9 = [(COHomeKitAdapter *)self currentAccessory];
  id v10 = [v9 uniqueIdentifier];
  int v11 = [v8 uniqueIdentifier];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    uint64_t v13 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218242;
      __int16 v19 = self;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p Updated Room for Accessory  %@", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v14 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
    id v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 postNotification:v14];
  }
  __int16 v16 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  int v17 = v16;
  if (v16) {
    [v16 addHomeKitHome:v7];
  }
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self currentAccessory];
  if (v8)
  {
    char v9 = [(COHomeKitAdapter *)self roomForAccessory:v8 inHome:v6];
    int v10 = [v9 isEqual:v7];

    if (v10)
    {
      int v11 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134218242;
        int v17 = self;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p Added Room  %@", (uint8_t *)&v16, 0x16u);
      }

      int v12 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
      uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 postNotification:v12];
    }
  }
  uint64_t v14 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  id v15 = v14;
  if (v14) {
    [v14 addHomeKitRoom:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self currentAccessory];
  if (v8)
  {
    char v9 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p Removed Room  %@", (uint8_t *)&v14, 0x16u);
    }

    int v10 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
    int v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotification:v10];
  }
  int v12 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  uint64_t v13 = v12;
  if (v12) {
    [v12 removeHomeKitRoom:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(COHomeKitAdapter *)self currentAccessory];
  if (v11)
  {
    int v12 = [(COHomeKitAdapter *)self zoneForAccessory:v11 inHome:v8];
    int v13 = [v12 isEqual:v10];

    if (v13)
    {
      int v14 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218242;
        uint64_t v20 = self;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p Updated Zone for Room %@", (uint8_t *)&v19, 0x16u);
      }

      id v15 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
      __int16 v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 postNotification:v15];
    }
  }
  id v17 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  uint64_t v18 = v17;
  if (v17) {
    [v17 addHomeKitHome:v8];
  }
}

- (void)home:(id)a3 didAddZone:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self currentAccessory];
  if (v8)
  {
    id v9 = [(COHomeKitAdapter *)self zoneForAccessory:v8 inHome:v6];
    int v10 = [v9 isEqual:v7];

    if (v10)
    {
      int v11 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134218242;
        id v17 = self;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p Added Zone  %@", (uint8_t *)&v16, 0x16u);
      }

      int v12 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
      int v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 postNotification:v12];
    }
  }
  int v14 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  id v15 = v14;
  if (v14) {
    [v14 addHomeKitZone:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COHomeKitAdapter *)self currentAccessory];
  if (v8)
  {
    id v9 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p Removed Zone  %@", (uint8_t *)&v14, 0x16u);
    }

    int v10 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
    int v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotification:v10];
  }
  int v12 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  int v13 = v12;
  if (v12) {
    [v12 removeHomeKitZone:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p Added Media System %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = [(COHomeKitAdapter *)self currentAccessory];
  if (v9)
  {
    int v10 = [(COHomeKitAdapter *)self mediaSystemForAccessory:v9 inHome:v6];
    if ([v10 isEqual:v7]) {
      [(COHomeKitAdapter *)self setCurrentMediaSystem:v7];
    }
  }
  int v11 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
  int v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotification:v11];

  int v13 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  int v14 = v13;
  if (v13) {
    [v13 addHomeKitMediaSystem:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p Removed Media System %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = [(COHomeKitAdapter *)self currentMediaSystem];
  int v10 = [v7 isEqual:v9];

  if (v10) {
    [(COHomeKitAdapter *)self setCurrentMediaSystem:0];
  }
  int v11 = [MEMORY[0x263F089F8] notificationWithName:@"COHomeKitAdapterSignificantHomeChangeNotification" object:self];
  int v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotification:v11];

  int v13 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  int v14 = v13;
  if (v13) {
    [v13 removeHomeKitMediaSystem:v7 fromHome:v6];
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p User added to home %@", (uint8_t *)&v7, 0x16u);
  }

  [(COHomeKitAdapter *)self _postUsersChangedNotificationForHome:v5];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p User removed from home %@", (uint8_t *)&v7, 0x16u);
  }

  [(COHomeKitAdapter *)self _postUsersChangedNotificationForHome:v5];
}

- (void)audioDestinationControllerDidUpdateForAccessory:(id)a3 inHome:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    int v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p audio destination controller updated for %@", (uint8_t *)&v11, 0x16u);
  }

  __int16 v9 = [(COHomeKitAdapter *)self mediaGroupsDaemon];
  id v10 = v9;
  if (v9) {
    [v9 addHomeKitAccessory:v6 fromHome:v7];
  }
}

- (void)_addAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 category];
  __int16 v9 = [v8 categoryType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0B030]];

  if (v10)
  {
    int v11 = [(COHomeKitAdapter *)self audioDestinationControllerListeners];
    int v12 = [v7 uniqueIdentifier];
    v18[0] = v12;
    __int16 v13 = [v6 uniqueIdentifier];
    v18[1] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    uint64_t v15 = [v11 objectForKey:v14];

    if (!v15)
    {
      __int16 v16 = (void *)[v11 mutableCopy];
      id v17 = [[_COHomeKitAudioDestinationControllerListener alloc] initWitAccessory:v6 home:v7 delegate:self];
      [v16 setObject:v17 forKey:v14];
      [(COHomeKitAdapter *)self setAudioDestinationControllerListeners:v16];
    }
  }
}

- (void)_removeAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(COHomeKitAdapter *)self audioDestinationControllerListeners];
  __int16 v9 = [v6 uniqueIdentifier];

  v14[0] = v9;
  int v10 = [v7 uniqueIdentifier];

  v14[1] = v10;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  int v12 = [v8 objectForKey:v11];
  if (v12)
  {
    __int16 v13 = (void *)[v8 mutableCopy];
    [v13 removeObjectForKey:v11];
    [(COHomeKitAdapter *)self setAudioDestinationControllerListeners:v13];
  }
}

- (void)_postUsersChangedNotificationForHome:(id)a3
{
  id v10 = a3;
  id v4 = [(COHomeKitAdapter *)self homekit];
  id v5 = [v4 currentAccessory];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:@"COHomeKitAdapterUsersChangedInHome" object:v10 userInfo:0];
  if (!v5
    || ([(COHomeKitAdapter *)self homeForAccessory:v5],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqual:v10],
        v7,
        v8))
  {
    __int16 v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotification:v6];
  }
}

- (NSCondition)condition
{
  return self->_condition;
}

- (MGDaemon)mediaGroupsDaemon
{
  return self->_mediaGroupsDaemon;
}

- (NSDictionary)audioDestinationControllerListeners
{
  return self->_audioDestinationControllerListeners;
}

- (void)setAudioDestinationControllerListeners:(id)a3
{
}

- (NSMutableArray)mediaSystemUpdateHandlers
{
  return self->_mediaSystemUpdateHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystemUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_audioDestinationControllerListeners, 0);
  objc_storeStrong((id *)&self->_mediaGroupsDaemon, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_currentMediaSystem, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
}

- (id)alarmsCollectionForAccessory:(id)a3 inHome:(id)a4 isMediaSystem:(BOOL *)a5
{
  id v8 = a3;
  __int16 v9 = [(COHomeKitAdapter *)self mediaSystemForAccessory:v8 inHome:a4];
  if (v9)
  {
    id v10 = [(COHomeKitAdapter *)self settingsForKeyPath:@"root.mobileTimer.alarms" onMediaObject:v9];
    BOOL v11 = 1;
  }
  else
  {
    id v10 = [(COHomeKitAdapter *)self settingsForKeyPath:@"root.mobileTimer.alarms" onAccessory:v8];
    BOOL v11 = 0;
  }
  *a5 = v11;
  int v12 = [v10 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v13 = v12;
  }
  else {
    __int16 v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)isAlarmsCollectionSetting:(id)a3 forAccessory:(id)a4 inHome:(id)a5
{
  char v11 = 0;
  id v8 = a3;
  __int16 v9 = [(COHomeKitAdapter *)self alarmsCollectionForAccessory:a4 inHome:a5 isMediaSystem:&v11];
  LOBYTE(a4) = [v9 isEqual:v8];

  return (char)a4;
}

- (id)alarmsForAccessory:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v27 = 0;
  id v8 = [(COHomeKitAdapter *)self alarmsCollectionForAccessory:v6 inHome:v7 isMediaSystem:&v27];
  if (v8)
  {
    __int16 v9 = COTimerSiriContextTargetReferenceForAccessory();
    id v10 = [MEMORY[0x263EFF910] now];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__27;
    long long v25 = __Block_byref_object_dispose__27;
    id v26 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    char v11 = objc_msgSend(v8, "co_alarms");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__COHomeKitAdapter_COMeshAlarmAddOn__alarmsForAccessory_inHome___block_invoke;
    v16[3] = &unk_2645CE9E0;
    id v12 = v9;
    id v17 = v12;
    char v20 = v27;
    id v13 = v10;
    id v18 = v13;
    uint64_t v19 = &v21;
    [v11 enumerateObjectsUsingBlock:v16];

    id v14 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __64__COHomeKitAdapter_COMeshAlarmAddOn__alarmsForAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = (id)[v3 mutableCopy];
  objc_msgSend(v8, "co_setTargetReference:", *(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend(v8, "co_setIsMediaSystemOriginating");
  }
  [v8 setLastModifiedDate:*(void *)(a1 + 40)];
  id v4 = [v3 lastModifiedDate];

  objc_msgSend(v8, "co_setHomeKitSaveDate:", v4);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) arrayByAddingObject:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)accessoriesForSiriContextTargetReference:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  uint64_t v5 = [MEMORY[0x263F08BA0] componentsWithString:v3];
  uint64_t v6 = [v5 scheme];
  if ([v6 isEqualToString:@"siri-hk-target"])
  {
    id v7 = [v5 path];
    int v8 = [v7 isEqualToString:@"accessory"];

    if (v8)
    {
      id v24 = v3;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      __int16 v9 = [v5 queryItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v15 = [v14 name];
            int v16 = [@"identifier" isEqualToString:v15];

            if (v16)
            {
              id v17 = objc_alloc(MEMORY[0x263F08C38]);
              id v18 = [v14 value];
              uint64_t v19 = (void *)[v17 initWithUUIDString:v18];

              if (v19)
              {
                uint64_t v20 = [(COHomeKitAdapter *)self accessoryWithUniqueIdentifier:v19];
                if (v20)
                {
                  uint64_t v21 = (void *)v20;
                  uint64_t v22 = [v4 arrayByAddingObject:v20];

                  id v4 = (id)v22;
                }
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v11);
      }

      id v3 = v24;
    }
  }
  else
  {
  }
  return v4;
}

- (id)allAccessoriesForSiriContextTargetReference:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  uint64_t v5 = [MEMORY[0x263F08BA0] componentsWithString:v3];
  uint64_t v6 = [v5 scheme];
  if ([v6 isEqualToString:@"siri-hk-target"])
  {
    id v7 = [v5 path];
    int v8 = [v7 isEqualToString:@"accessory"];

    if (v8)
    {
      id v25 = v3;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      __int16 v9 = [v5 queryItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v15 = [v14 name];
            int v16 = [@"identifier" isEqualToString:v15];

            if (v16)
            {
              id v17 = objc_alloc(MEMORY[0x263F08C38]);
              id v18 = [v14 value];
              uint64_t v19 = (void *)[v17 initWithUUIDString:v18];

              if (!v19
                || ([(COHomeKitAdapter *)self accessoryWithUniqueIdentifier:v19],
                    (uint64_t v20 = objc_claimAutoreleasedReturnValue()) == 0))
              {

                uint64_t v23 = 0;
                id v3 = v25;
                goto LABEL_17;
              }
              uint64_t v21 = (void *)v20;
              uint64_t v22 = [v4 arrayByAddingObject:v20];

              id v4 = (id)v22;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v3 = v25;
    }
  }
  else
  {
  }
  id v4 = v4;
  uint64_t v23 = v4;
LABEL_17:

  return v23;
}

- (id)addAlarm:(id)a3 toAccessory:(id)a4 inHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v18 = 0;
  uint64_t v10 = [(COHomeKitAdapter *)self alarmsCollectionForAccessory:v9 inHome:a5 isMediaSystem:&v18];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F58190]);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__COHomeKitAdapter_COMeshAlarmAddOn__addAlarm_toAccessory_inHome___block_invoke;
    v16[3] = &unk_2645CB308;
    id v12 = v11;
    id v17 = v12;
    objc_msgSend(v10, "co_addAlarm:completionHandler:", v8, v16);
    id v13 = v17;
  }
  else
  {
    id v14 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[COHomeKitAdapter(COMeshAlarmAddOn) addAlarm:toAccessory:inHome:](v9);
    }

    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    id v12 = [MEMORY[0x263F58190] futureWithError:v13];
  }

  return v12;
}

uint64_t __66__COHomeKitAdapter_COMeshAlarmAddOn__addAlarm_toAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)updateAlarm:(id)a3 onAccessory:(id)a4 inHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v18 = 0;
  uint64_t v10 = [(COHomeKitAdapter *)self alarmsCollectionForAccessory:v9 inHome:a5 isMediaSystem:&v18];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F58190]);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__COHomeKitAdapter_COMeshAlarmAddOn__updateAlarm_onAccessory_inHome___block_invoke;
    v16[3] = &unk_2645CB308;
    id v12 = v11;
    id v17 = v12;
    objc_msgSend(v10, "co_updateAlarm:completionHandler:", v8, v16);
    id v13 = v17;
  }
  else
  {
    id v14 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[COHomeKitAdapter(COMeshAlarmAddOn) updateAlarm:onAccessory:inHome:](v9);
    }

    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    id v12 = [MEMORY[0x263F58190] futureWithError:v13];
  }

  return v12;
}

uint64_t __69__COHomeKitAdapter_COMeshAlarmAddOn__updateAlarm_onAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)removeAlarm:(id)a3 fromAccessory:(id)a4 inHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v18 = 0;
  uint64_t v10 = [(COHomeKitAdapter *)self alarmsCollectionForAccessory:v9 inHome:a5 isMediaSystem:&v18];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F58190]);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__COHomeKitAdapter_COMeshAlarmAddOn__removeAlarm_fromAccessory_inHome___block_invoke;
    v16[3] = &unk_2645CB308;
    id v12 = v11;
    id v17 = v12;
    objc_msgSend(v10, "co_removeAlarm:completionHandler:", v8, v16);
    id v13 = v17;
  }
  else
  {
    id v14 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[COHomeKitAdapter(COMeshAlarmAddOn) updateAlarm:onAccessory:inHome:](v9);
    }

    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    id v12 = [MEMORY[0x263F58190] futureWithError:v13];
  }

  return v12;
}

uint64_t __71__COHomeKitAdapter_COMeshAlarmAddOn__removeAlarm_fromAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

void __27__COHomeKitAdapter_homekit__block_invoke_cold_1()
{
  uint64_t v6 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_10(&dword_2217C1000, v0, v1, "%p pulling in HomeKit from %@", v2, v3, v4, v5, 2u);
}

- (void)accessoryWithUniqueIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%p is unable to find accessory %@!", v1, 0x16u);
}

- (void)homeManagerDidUpdateHomes:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "Notifying of significant home changes!", v1, 2u);
}

@end