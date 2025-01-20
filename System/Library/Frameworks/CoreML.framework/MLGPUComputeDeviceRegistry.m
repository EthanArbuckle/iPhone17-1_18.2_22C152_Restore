@interface MLGPUComputeDeviceRegistry
+ (id)registryWithMetalDeviceObserver:(id)a3;
+ (id)sharedRegistry;
- (MLGPUComputeDeviceRegistry)initWithMetalDeviceObserver:(id)a3;
- (MLMetalDeviceObserver)metalDeviceObserver;
- (NSArray)registeredComputeDevices;
- (NSMutableArray)pendingChanges;
- (NSMutableDictionary)availableGPUDevices;
- (NSObject)observationToken;
- (id).cxx_construct;
- (void)dealloc;
- (void)registerGPUDevices;
- (void)setObservationToken:(id)a3;
@end

@implementation MLGPUComputeDeviceRegistry

- (void)registerGPUDevices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v21 = 0;
  v3 = [(MLGPUComputeDeviceRegistry *)self metalDeviceObserver];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__MLGPUComputeDeviceRegistry_registerGPUDevices__block_invoke;
  v19[3] = &unk_1E59A3888;
  v11 = &v20;
  objc_copyWeak(&v20, &location);
  v13 = [v3 startObservingWithBlock:v19 deviceObserver:&v21];

  [(MLGPUComputeDeviceRegistry *)self setObservationToken:v21];
  v12 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v13;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v8 = +[MLGPUComputeDevice deviceWithMetalDevice:](MLGPUComputeDevice, "deviceWithMetalDevice:", v7, v11, v12);
        v9 = [(MLGPUComputeDeviceRegistry *)self availableGPUDevices];
        v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "registryID"));
        [v9 setObject:v8 forKeyedSubscript:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }

  std::mutex::unlock(v12);
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (NSArray)registeredComputeDevices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(MLGPUComputeDeviceRegistry *)self pendingChanges];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v8 = [v7 metalDevice];
        uint64_t v9 = [v7 changeType];
        if (v9)
        {
          if (v9 != 1) {
            goto LABEL_11;
          }
          v10 = [(MLGPUComputeDeviceRegistry *)self availableGPUDevices];
          v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "registryID"));
          [v10 removeObjectForKey:v11];
        }
        else
        {
          v10 = +[MLGPUComputeDevice deviceWithMetalDevice:v8];
          v11 = [(MLGPUComputeDeviceRegistry *)self availableGPUDevices];
          v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "registryID"));
          [v11 setObject:v10 forKeyedSubscript:v12];
        }
LABEL_11:
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  v13 = [(MLGPUComputeDeviceRegistry *)self pendingChanges];
  [v13 removeAllObjects];

  v14 = [(MLGPUComputeDeviceRegistry *)self availableGPUDevices];
  long long v15 = [v14 allValues];

  std::mutex::unlock(v17);

  return (NSArray *)v15;
}

- (NSMutableArray)pendingChanges
{
  return (NSMutableArray *)*((void *)self + 10);
}

- (NSMutableDictionary)availableGPUDevices
{
  return (NSMutableDictionary *)*((void *)self + 9);
}

void __44__MLGPUComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = (id)objc_opt_new();
  uint64_t v2 = objc_msgSend(v1, "registryWithMetalDeviceObserver:");
  v3 = (void *)+[MLGPUComputeDeviceRegistry sharedRegistry]::registry;
  +[MLGPUComputeDeviceRegistry sharedRegistry]::registry = v2;
}

- (void)setObservationToken:(id)a3
{
}

- (MLMetalDeviceObserver)metalDeviceObserver
{
  return (MLMetalDeviceObserver *)*((void *)self + 11);
}

- (MLGPUComputeDeviceRegistry)initWithMetalDeviceObserver:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLGPUComputeDeviceRegistry;
  id v6 = [(MLGPUComputeDeviceRegistry *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v8 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v9;

    objc_storeStrong((id *)v6 + 11, a3);
  }

  return (MLGPUComputeDeviceRegistry *)v6;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MLGPUComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MLGPUComputeDeviceRegistry sharedRegistry]::onceToken != -1) {
    dispatch_once(&+[MLGPUComputeDeviceRegistry sharedRegistry]::onceToken, block);
  }
  uint64_t v2 = (void *)+[MLGPUComputeDeviceRegistry sharedRegistry]::registry;

  return v2;
}

+ (id)registryWithMetalDeviceObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMetalDeviceObserver:v4];
  [v5 registerGPUDevices];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);

  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (NSObject)observationToken
{
  return *((void *)self + 12);
}

void __48__MLGPUComputeDeviceRegistry_registerGPUDevices__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    std::mutex::lock((std::mutex *)(WeakRetained + 8));
    id v5 = [v4 pendingChanges];
    [v5 addObject:v6];

    std::mutex::unlock((std::mutex *)(v4 + 8));
  }
}

- (void)dealloc
{
  v3 = [(MLGPUComputeDeviceRegistry *)self metalDeviceObserver];
  id v4 = [(MLGPUComputeDeviceRegistry *)self observationToken];
  [v3 stopObserving:v4];

  v5.receiver = self;
  v5.super_class = (Class)MLGPUComputeDeviceRegistry;
  [(MLGPUComputeDeviceRegistry *)&v5 dealloc];
}

@end