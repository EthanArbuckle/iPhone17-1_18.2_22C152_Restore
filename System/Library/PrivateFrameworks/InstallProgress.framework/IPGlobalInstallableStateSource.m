@interface IPGlobalInstallableStateSource
+ (id)sharedAllAppStateSource;
- (IPGlobalInstallableStateSource)initWithBehavior:(id)a3;
- (void)addObserver:(id)a3;
- (void)globalStateSourceBehavior:(id)a3 stateSourceAvailableForIdentity:(id)a4 withGenerator:(id)a5;
- (void)makeAndEnumerateStateSourcesForExtantIdentities:(id)a3;
- (void)makeAndEnumerateStateSourcesForInstallingIdentities:(id)a3;
- (void)removeObserver:(id)a3;
- (void)testingActionBarrier;
@end

@implementation IPGlobalInstallableStateSource

- (IPGlobalInstallableStateSource)initWithBehavior:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPGlobalInstallableStateSource;
  v6 = [(IPGlobalInstallableStateSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_behavior, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;
  }
  return v7;
}

+ (id)sharedAllAppStateSource
{
  if (sharedAllAppStateSource_onceToken != -1) {
    dispatch_once(&sharedAllAppStateSource_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedAllAppStateSource_sharedAllAppStateSource;

  return v2;
}

void __57__IPGlobalInstallableStateSource_sharedAllAppStateSource__block_invoke()
{
  v0 = [IPGlobalInstallableStateSource alloc];
  id v3 = +[IPGlobalInstallableStateSourceDefaultBehavior sharedInstance];
  uint64_t v1 = [(IPGlobalInstallableStateSource *)v0 initWithBehavior:v3];
  v2 = (void *)sharedAllAppStateSource_sharedAllAppStateSource;
  sharedAllAppStateSource_sharedAllAppStateSource = v1;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__IPGlobalInstallableStateSource_addObserver___block_invoke;
  v7[3] = &unk_26538F700;
  p_ivarLock = &self->_ivarLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IPDoWithLock(p_ivarLock, v7);
}

uint64_t __46__IPGlobalInstallableStateSource_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 40))
  {
    uint64_t result = objc_msgSend(*(id *)(v3 + 16), "addObserver:");
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__IPGlobalInstallableStateSource_removeObserver___block_invoke;
  v7[3] = &unk_26538F700;
  p_ivarLock = &self->_ivarLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IPDoWithLock(p_ivarLock, v7);
}

uint64_t __49__IPGlobalInstallableStateSource_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)makeAndEnumerateStateSourcesForExtantIdentities:(id)a3
{
}

- (void)makeAndEnumerateStateSourcesForInstallingIdentities:(id)a3
{
}

- (void)testingActionBarrier
{
}

- (void)globalStateSourceBehavior:(id)a3 stateSourceAvailableForIdentity:(id)a4 withGenerator:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __106__IPGlobalInstallableStateSource_globalStateSourceBehavior_stateSourceAvailableForIdentity_withGenerator___block_invoke;
  v21[3] = &unk_26538F728;
  v21[4] = self;
  v21[5] = &v22;
  IPDoWithLock(&self->_ivarLock, v21);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = (id)v23[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        v15 = v9[2](v9);
        [v14 globalInstallableStateSource:self stateSourceIsAvailable:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __106__IPGlobalInstallableStateSource_globalStateSourceBehavior_stateSourceAvailableForIdentity_withGenerator___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];

  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownIdentities, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end