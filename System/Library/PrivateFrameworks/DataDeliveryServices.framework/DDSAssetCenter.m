@interface DDSAssetCenter
+ (id)sharedInstance;
- (DDSAssetCenter)init;
- (DDSAssetCenter)initWithQueue:(id)a3 provider:(id)a4 trialManager:(id)a5 autoAssetManager:(id)a6 createXPCInterface:(id)a7;
- (DDSAssetObserving)assetObserver;
- (DDSAssetProviding)provider;
- (DDSMAAutoAssetManager)autoAssetManager;
- (DDSTrialManager)trialManager;
- (NSMutableDictionary)managerInterfaceByAssetType;
- (NSSet)delegates;
- (NSSet)managerInterfaces;
- (OS_dispatch_queue)queue;
- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4;
- (id)assertionIDsForClientID:(id)a3;
- (id)assertionIDsForClientID:(id)a3 assetType:(id)a4;
- (id)assetsForQuery:(id)a3 error:(id *)a4;
- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4;
- (id)createXPCInterface;
- (id)managerInterfaceForAssetType:(id)a3;
- (void)addAssertionForAssetsWithQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6;
- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4;
- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4;
- (void)registerDelegate:(id)a3;
- (void)removeAssertionWithIdentifier:(id)a3;
- (void)removeAssertionWithIdentifier:(id)a3 assetType:(id)a4;
- (void)serverDidUpdateAssetsWithType:(id)a3;
- (void)setAssetTypesForDelegates:(id)a3;
- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4;
- (void)setUpTrialForQuery:(id)a3;
- (void)setXPCServiceName:(id)a3 forAssetType:(id)a4;
- (void)start;
- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4;
- (void)trialDidStopForQuery:(id)a3;
- (void)triggerDump;
- (void)triggerUpdate;
- (void)unregisterDelegate:(id)a3;
- (void)updateAssetForQuery:(id)a3 callback:(id)a4;
@end

@implementation DDSAssetCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedAssetCenter;
  return v2;
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DDSAssetCenter registerDelegate:]();
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_delegates addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [v6 assetType];
  int v9 = [v8 isEqualToString:@"com.apple.MobileAsset.LinguisticData"];

  if (v9)
  {
    v10 = [DDSAssetQuery alloc];
    v11 = [v6 filter];
    v12 = (void *)[v11 copy];
    v13 = [(DDSAssetQuery *)v10 initWithAssetType:@"com.apple.MobileAsset.LinguisticDataAuto" filter:v12];

    v14 = [(DDSAssetCenter *)self autoAssetManager];
    v15 = [v14 assetsForQuery:v13];

    v16 = [(DDSAssetCenter *)self provider];
    v17 = [v16 contentItemsFromAssets:v15 matchingFilter:0];
    [v7 addObjectsFromArray:v17];
  }
  v18 = [(DDSAssetCenter *)self provider];
  v19 = [v18 allContentItemsMatchingQuery:v6 error:a4];
  [v7 addObjectsFromArray:v19];

  return v7;
}

- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(DDSAssetCenter *)self provider];
  int v9 = [v8 contentItemsFromAssets:v7 matchingFilter:v6];

  return v9;
}

- (id)assetsForQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [v6 assetType];
  int v9 = [v8 isEqualToString:@"com.apple.MobileAsset.LinguisticData"];

  if (v9)
  {
    v10 = [DDSAssetQuery alloc];
    v11 = [v6 filter];
    v12 = (void *)[v11 copy];
    v13 = [(DDSAssetQuery *)v10 initWithAssetType:@"com.apple.MobileAsset.LinguisticDataAuto" filter:v12];

    -[DDSAssetQuery setCachedOnly:](v13, "setCachedOnly:", [v6 cachedOnly]);
    v14 = [(DDSAssetCenter *)self autoAssetManager];
    v15 = [v14 assetsForQuery:v13];
    [v7 addObjectsFromArray:v15];
  }
  v16 = [(DDSAssetCenter *)self provider];
  v17 = [v16 assetsForQuery:v6 errorPtr:a4];
  [v7 addObjectsFromArray:v17];

  return v7;
}

- (DDSAssetProviding)provider
{
  return self->_provider;
}

- (DDSMAAutoAssetManager)autoAssetManager
{
  return self->_autoAssetManager;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  id v6 = a4;
  id v7 = [(DDSAssetCenter *)self provider];
  [v7 setCompatabilityVersion:a3 forAssetType:v6];
}

- (DDSAssetCenter)initWithQueue:(id)a3 provider:(id)a4 trialManager:(id)a5 autoAssetManager:(id)a6 createXPCInterface:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)DDSAssetCenter;
  v17 = [(DDSAssetCenter *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_provider, a4);
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_trialManager, a5);
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    delegates = v18->_delegates;
    v18->_delegates = v19;

    v21 = objc_alloc_init(DDSAssetObserver);
    assetObserver = v18->_assetObserver;
    v18->_assetObserver = (DDSAssetObserving *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    managerInterfaceByAssetType = v18->_managerInterfaceByAssetType;
    v18->_managerInterfaceByAssetType = (NSMutableDictionary *)v23;

    v18->_lock._os_unfair_lock_opaque = 0;
    uint64_t v25 = MEMORY[0x1E4E7D2C0](v16);
    id createXPCInterface = v18->_createXPCInterface;
    v18->_id createXPCInterface = (id)v25;

    objc_storeStrong((id *)&v18->_autoAssetManager, a6);
  }

  return v18;
}

- (void)start
{
  v3 = [(DDSAssetCenter *)self assetObserver];
  [v3 setDelegate:self];

  id v4 = [(DDSAssetCenter *)self trialManager];
  [v4 setDelegate:self];

  v5 = [(DDSAssetCenter *)self assetObserver];
  [v5 observeAssetType:@"com.apple.MobileAsset.LinguisticData"];

  id v6 = [(DDSAssetCenter *)self assetObserver];
  [v6 observeAssetType:@"com.apple.MobileAsset.LinguisticDataAuto"];

  [(DDSAssetCenter *)self setXPCServiceName:@"com.apple.DataDeliveryServices.AssetService" forAssetType:@"com.apple.MobileAsset.LinguisticData"];
  [(DDSAssetCenter *)self setXPCServiceName:@"com.apple.DataDeliveryServices.AssetService" forAssetType:@"com.apple.MobileAsset.MecabraDictionaryRapidUpdates"];
}

- (DDSAssetObserving)assetObserver
{
  return self->_assetObserver;
}

void __32__DDSAssetCenter_sharedInstance__block_invoke()
{
  attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create((const char *)[@"com.apple.DataDeliveryServices.ddsassetcenter.queue" cStringUsingEncoding:4], attr);
  v1 = objc_alloc_init(DDSMobileAssetv2Provider);
  v2 = [[DDSTrialManager alloc] initWithWorkQueue:v0];
  v3 = objc_alloc_init(DDSMAAutoAssetManager);
  id v4 = [[DDSAssetCenter alloc] initWithQueue:v0 provider:v1 trialManager:v2 autoAssetManager:v3 createXPCInterface:&__block_literal_global_283];
  v5 = (void *)sharedInstance_sharedAssetCenter;
  sharedInstance_sharedAssetCenter = (uint64_t)v4;

  [(id)sharedInstance_sharedAssetCenter start];
}

- (void)setXPCServiceName:(id)a3 forAssetType:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  os_unfair_lock_lock(&self->_lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(DDSAssetCenter *)self managerInterfaceByAssetType];
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
      v12 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
      id v13 = [v12 objectForKeyedSubscript:v11];
      id v14 = [v13 xpcServiceName];
      char v15 = [v14 isEqualToString:v6];

      if (v15) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
    v17 = [v16 objectForKeyedSubscript:v11];

    if (v17) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v18 = [(DDSAssetCenter *)self createXPCInterface];
  v17 = ((void (**)(void, id))v18)[2](v18, v6);

LABEL_12:
  v19 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
  [v19 setObject:v17 forKeyedSubscript:v20];

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableDictionary)managerInterfaceByAssetType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

DDSInterface *__32__DDSAssetCenter_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[DDSInterface alloc] initWithXPCServiceName:v2];

  return v3;
}

- (DDSTrialManager)trialManager
{
  return self->_trialManager;
}

- (id)createXPCInterface
{
  return objc_getProperty(self, a2, 72, 1);
}

- (DDSAssetCenter)init
{
  return 0;
}

- (id)managerInterfaceForAssetType:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSSet)managerInterfaces
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(DDSAssetCenter *)self managerInterfaceByAssetType];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  return (NSSet *)v3;
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DDSAssetCenter unregisterDelegate:]();
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_delegates removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAssetTypesForDelegates:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(DDSAssetCenter *)self assetObserver];
        [v10 observeAssetType:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addAssertionForAssetsWithQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v10 assetType];
  long long v15 = [(DDSAssetCenter *)self managerInterfaceForAssetType:v14];

  if (v15)
  {
    [v15 addAssertionForQuery:v10 policy:v11 assertionID:v12 clientID:v13];
  }
  else
  {
    uint64_t v16 = DefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DDSAssetCenter addAssertionForAssetsWithQuery:policy:assertionID:clientID:](v10);
    }
  }
}

- (void)removeAssertionWithIdentifier:(id)a3
{
}

- (id)assertionIDsForClientID:(id)a3
{
  return [(DDSAssetCenter *)self assertionIDsForClientID:a3 assetType:@"com.apple.MobileAsset.LinguisticData"];
}

- (void)removeAssertionWithIdentifier:(id)a3 assetType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSAssetCenter *)self managerInterfaceForAssetType:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 removeAssertionWithID:v6];
  }
  else
  {
    id v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DDSAssetCenter removeAssertionWithIdentifier:assetType:]();
    }
  }
}

- (id)assertionIDsForClientID:(id)a3 assetType:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSAssetCenter *)self managerInterfaceForAssetType:v7];
  if (v8)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__DDSAssetCenter_assertionIDsForClientID_assetType___block_invoke;
    v14[3] = &unk_1E6E39F08;
    v14[4] = &v15;
    [v8 assertionIDsForClientID:v6 reply:v14];
    uint64_t v9 = DefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v16[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Found assertions: (%{public}@) for clientID: (%{public}@)", buf, 0x16u);
    }

    id v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = DefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DDSAssetCenter assertionIDsForClientID:assetType:]();
    }

    id v11 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v11;
}

void __52__DDSAssetCenter_assertionIDsForClientID_assetType___block_invoke(uint64_t a1, void *a2)
{
}

- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSAssetCenter *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__DDSAssetCenter_fetchTrialAssetForQuery_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__DDSAssetCenter_fetchTrialAssetForQuery_callback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trialManager];
  [v2 fetchTrialAssetForQuery:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
}

- (void)setUpTrialForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDSAssetCenter *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__DDSAssetCenter_setUpTrialForQuery___block_invoke;
  v7[3] = &unk_1E6E39F58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__DDSAssetCenter_setUpTrialForQuery___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trialManager];
  [v2 setUpTrialForQuery:*(void *)(a1 + 40)];
}

- (NSSet)delegates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableSet *)self->_delegates copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDSAssetCenter *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke;
  v7[3] = &unk_1E6E39F58;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke(uint64_t a1)
{
  id v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  if (+[DDSMAAutoAssetManager isAutoAssetType:*(void *)(a1 + 32)])
  {
    id v9 = @"com.apple.MobileAsset.LinguisticData";
    [*(id *)(a1 + 40) autoAssetManager];
  }
  else
  {
    id v9 = (__CFString *)*(id *)(a1 + 32);
    [*(id *)(a1 + 40) provider];
  id v10 = };
  [v10 serverDidUpdateAssetsWithType:*(void *)(a1 + 32)];

  id v11 = [*(id *)(a1 + 40) delegates];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_292;
  v13[3] = &unk_1E6E39F80;
  long long v14 = v9;
  id v12 = v9;
  [v11 enumerateObjectsUsingBlock:v13];
}

uint64_t __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_292(uint64_t a1, void *a2)
{
  return [a2 didUpdateAssetsWithType:*(void *)(a1 + 32)];
}

- (void)triggerDump
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(DDSAssetCenter *)self managerInterfaces];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) triggerDump];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)triggerUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(DDSAssetCenter *)self managerInterfaces];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) triggerUpdate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(DDSAssetCenter *)self queue];
  dispatch_assert_queue_V2(v8);

  long long v9 = [(DDSAssetCenter *)self delegates];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__DDSAssetCenter_trialDidReceiveAsset_forQuery___block_invoke;
  v12[3] = &unk_1E6E39FA8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v12];
}

void __48__DDSAssetCenter_trialDidReceiveAsset_forQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 trialDidReceiveAsset:*(void *)(a1 + 32) forQuery:*(void *)(a1 + 40)];
  }
}

- (void)trialDidStopForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDSAssetCenter *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DDSAssetCenter *)self delegates];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__DDSAssetCenter_trialDidStopForQuery___block_invoke;
  v8[3] = &unk_1E6E39F80;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __39__DDSAssetCenter_trialDidStopForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 trialDidStopForQuery:*(void *)(a1 + 32)];
  }
}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  long long v8 = [v6 assetType];
  id v9 = [(DDSAssetCenter *)self managerInterfaceForAssetType:v8];

  if (v9)
  {
    [v9 fetchAssetUpdateStatusForQuery:v6 callback:v7];
  }
  else
  {
    id v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DDSAssetCenter fetchAssetUpdateStatusForQuery:callback:](v6);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    v7[2](v7, 0, v11);
  }
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 assetType];
  id v9 = [(DDSAssetCenter *)self managerInterfaceForAssetType:v8];

  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__DDSAssetCenter_updateAssetForQuery_callback___block_invoke;
    v12[3] = &unk_1E6E39FD0;
    id v13 = v7;
    [v9 updateAssetForQuery:v6 callback:v12];
    id v10 = v13;
  }
  else
  {
    id v11 = DefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DDSAssetCenter updateAssetForQuery:callback:](v6);
    }

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __47__DDSAssetCenter_updateAssetForQuery_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createXPCInterface, 0);
  objc_storeStrong((id *)&self->_managerInterfaceByAssetType, 0);
  objc_storeStrong((id *)&self->_autoAssetManager, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_assetObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (void)registerDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E41D6000, v0, v1, "Adding AssetCenter delegate: %{public}@", v2, v3, v4, v5, v6);
}

- (void)unregisterDelegate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E41D6000, v0, v1, "Removing AssetCenter delegate: %{public}@", v2, v3, v4, v5, v6);
}

- (void)addAssertionForAssetsWithQuery:(void *)a1 policy:assertionID:clientID:.cold.1(void *a1)
{
  uint64_t v1 = [a1 assetType];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E41D6000, v2, v3, "Cannot add assertion, manager interface is nil for asset type: %@", v4, v5, v6, v7, v8);
}

- (void)removeAssertionWithIdentifier:assetType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_ERROR, "Cannot remove assertion with identifier, manager interface is nil for asset type: %@", v1, 0xCu);
}

- (void)assertionIDsForClientID:assetType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_ERROR, "Cannot get assertionIDs for clientID, manager interface is nil for asset type: %@", v1, 0xCu);
}

void __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAssetUpdateStatusForQuery:(void *)a1 callback:.cold.1(void *a1)
{
  uint64_t v1 = [a1 assetType];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E41D6000, v2, v3, "Cannot fetch asset update status, manager interface is nil for asset type: %@", v4, v5, v6, v7, v8);
}

- (void)updateAssetForQuery:(void *)a1 callback:.cold.1(void *a1)
{
  uint64_t v1 = [a1 assetType];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E41D6000, v2, v3, "Cannot update asset for type, manager interface is nil for asset type: %@", v4, v5, v6, v7, v8);
}

@end