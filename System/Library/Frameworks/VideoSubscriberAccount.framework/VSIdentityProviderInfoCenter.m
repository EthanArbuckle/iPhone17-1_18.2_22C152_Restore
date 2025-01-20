@interface VSIdentityProviderInfoCenter
+ (id)sharedCenter;
- (BOOL)cachedIsSetTopBox;
- (BOOL)ignoredFirstNotification;
- (BOOL)setupCompleted;
- (NSError)currentError;
- (NSOperationQueue)privateQueue;
- (NSString)cachedDesignatedAppBundleIdentifier;
- (OS_dispatch_queue)serialQueue;
- (VSAccountStore)accountStore;
- (VSDevice)device;
- (VSIdentityProvider)cachedIdentityProvider;
- (VSIdentityProviderInfoCenter)init;
- (VSPreferences)preferences;
- (VSRemoteNotifier)remoteNotifier;
- (id)_value:(id)a3 withDefault:(id)a4;
- (id)newIdentityProviderFetchAllOperationBlock;
- (id)newIdentityProviderFetchOperationBlock;
- (void)_accountStoreDidChange;
- (void)_developerSettingsDidChange;
- (void)_identityProviderForSetTopBoxProfile:(id)a3 completion:(id)a4;
- (void)_postdentityProviderInfoDidChangeNotification;
- (void)_refresh:(id)a3;
- (void)dealloc;
- (void)enqueueIdentityProviderAppsQueryWithCompletion:(id)a3;
- (void)enqueueInfoQueryWithCompletion:(id)a3;
- (void)enqueueManagedSetTopBoxInfoQueryWithCompletion:(id)a3;
- (void)enqueueSetTopBoxInfoQueryWithCompletion:(id)a3;
- (void)enqueueSetTopBoxProfileProviderQueryWithCompletion:(id)a3;
- (void)fetchAccountAndIdentityProvider:(id)a3;
- (void)fetchIdentityProviderAppBundleIdFromDeveloperSettings:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setCachedDesignatedAppBundleIdentifier:(id)a3;
- (void)setCachedIdentityProvider:(id)a3;
- (void)setCachedIsSetTopBox:(BOOL)a3;
- (void)setCurrentError:(id)a3;
- (void)setDevice:(id)a3;
- (void)setIgnoredFirstNotification:(BOOL)a3;
- (void)setNewIdentityProviderFetchAllOperationBlock:(id)a3;
- (void)setNewIdentityProviderFetchOperationBlock:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSetupCompleted:(BOOL)a3;
@end

@implementation VSIdentityProviderInfoCenter

+ (id)sharedCenter
{
  if (sharedCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedCenter___vs_lazy_init_predicate, &__block_literal_global_28);
  }
  v2 = (void *)sharedCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __44__VSIdentityProviderInfoCenter_sharedCenter__block_invoke()
{
  sharedCenter___vs_lazy_init_variable = objc_alloc_init(VSIdentityProviderInfoCenter);

  return MEMORY[0x1F41817F8]();
}

- (VSIdentityProviderInfoCenter)init
{
  v19.receiver = self;
  v19.super_class = (Class)VSIdentityProviderInfoCenter;
  v2 = [(VSIdentityProviderInfoCenter *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__accountStoreDidChange name:@"VSAccountStoreDidChangeNotification" object:0];

    dispatch_queue_t v4 = dispatch_queue_create("IdentityProviderInfoCenter", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v6;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSIdentityProviderInfoCenter"];
    v8 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v8;

    uint64_t v10 = +[VSDevice currentDevice];
    device = v2->_device;
    v2->_device = (VSDevice *)v10;

    uint64_t v12 = +[VSAccountStore sharedAccountStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (VSAccountStore *)v12;

    id newIdentityProviderFetchAllOperationBlock = v2->_newIdentityProviderFetchAllOperationBlock;
    v2->_id newIdentityProviderFetchAllOperationBlock = &__block_literal_global_52;

    id newIdentityProviderFetchOperationBlock = v2->_newIdentityProviderFetchOperationBlock;
    v2->_id newIdentityProviderFetchOperationBlock = &__block_literal_global_59;

    v16 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v16;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
  }
  return v2;
}

id __36__VSIdentityProviderInfoCenter_init__block_invoke()
{
  id v5 = 0;
  int v0 = VSLoadInterfaceFramework((uint64_t)&v5);
  id v1 = v5;
  if (v0)
  {
    id v2 = objc_alloc_init(NSClassFromString((NSString *)@"VSIdentityProviderFetchAllOperation"));
  }
  else
  {
    v3 = VSErrorLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1();
    }

    id v2 = 0;
  }

  return v2;
}

id __36__VSIdentityProviderInfoCenter_init__block_invoke_56(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = 0;
  int v3 = VSLoadInterfaceFramework((uint64_t)&v8);
  id v4 = v8;
  if (v3)
  {
    id v5 = (void *)[objc_alloc(NSClassFromString((NSString *)@"VSIdentityProviderFetchOperation")) initWithIdentityProviderID:v2];
  }
  else
  {
    v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1();
    }

    id v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VSAccountStoreDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderInfoCenter;
  [(VSIdentityProviderInfoCenter *)&v4 dealloc];
}

- (void)enqueueInfoQueryWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BD2E90;
  aBlock[4] = self;
  id v5 = v4;
  id v11 = v5;
  v6 = (void (**)(void))_Block_copy(aBlock);
  if ([(VSIdentityProviderInfoCenter *)self setupCompleted]
    && ([(VSIdentityProviderInfoCenter *)self currentError],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v6[2](v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke_2;
    v8[3] = &unk_1E6BD2E90;
    v8[4] = self;
    v9 = v6;
    [(VSIdentityProviderInfoCenter *)self _refresh:v8];
  }
}

void __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentError];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) currentError];
    (*(void (**)(uint64_t, void, VSIdentityProviderInfoQueryResult *))(v3 + 16))(v3, 0, v8);
LABEL_5:

    return;
  }
  id v4 = [*(id *)(a1 + 32) cachedIdentityProvider];

  if (v4)
  {
    id v8 = objc_alloc_init(VSIdentityProviderInfoQueryResult);
    id v5 = [*(id *)(a1 + 32) cachedIdentityProvider];
    [(VSIdentityProviderInfoQueryResult *)v8 setIdentityProvider:v5];

    v6 = [*(id *)(a1 + 32) cachedDesignatedAppBundleIdentifier];
    [(VSIdentityProviderInfoQueryResult *)v8 setDesignatedAppBundleIdentifier:v6];

    (*(void (**)(void, VSIdentityProviderInfoQueryResult *, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, 0);
    goto LABEL_5;
  }
  v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v7();
}

uint64_t __63__VSIdentityProviderInfoCenter_enqueueInfoQueryWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSetupCompleted:1];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)enqueueSetTopBoxProfileProviderQueryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderInfoCenter *)self device];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E6BD3900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchSetTopBoxProfileWithCompletion:v7];
}

void __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke_2;
    v5[3] = &unk_1E6BD38D8;
    id v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 _identityProviderForSetTopBoxProfile:v3 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __83__VSIdentityProviderInfoCenter_enqueueSetTopBoxProfileProviderQueryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enqueueIdentityProviderAppsQueryWithCompletion:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  int v5 = VSLoadInterfaceFramework((uint64_t)&v17);
  id v6 = v17;
  if (v5)
  {
    id v7 = objc_alloc_init(NSClassFromString((NSString *)@"VSIdentityProviderFetchAllOperation"));
    id v8 = (void *)MEMORY[0x1E4F28B48];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke;
    v14[3] = &unk_1E6BD2E90;
    id v15 = v7;
    id v16 = v4;
    id v9 = v7;
    uint64_t v10 = [v8 blockOperationWithBlock:v14];
    [v10 addDependency:v9];
    id v11 = [(VSIdentityProviderInfoCenter *)self privateQueue];
    [v11 addOperation:v9];

    uint64_t v12 = [(VSIdentityProviderInfoCenter *)self privateQueue];
    [v12 addOperation:v10];
  }
  else
  {
    v13 = VSErrorLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VSIdentityProviderInfoCenter enqueueIdentityProviderAppsQueryWithCompletion:]();
    }

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6BD2E68;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3;
  v4[3] = &unk_1E6BD2DA0;
  id v5 = *(id *)(a1 + 40);
  [v3 unwrapObject:v6 error:v4];
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v9 = objc_msgSend(v8, "nonChannelAppDescriptions", v16);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) adamID];
              id v15 = [v14 stringValue];

              if (v15) {
                [v3 addObject:v15];
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(v16 + 32) + 16))();
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enqueueSetTopBoxInfoQueryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSIdentityProviderInfoCenter *)self device];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E6BD3900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchSetTopBoxProfileWithCompletion:v7];
}

void __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke_2;
    v9[3] = &unk_1E6BD3928;
    id v10 = v7;
    id v8 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v8 _identityProviderForSetTopBoxProfile:v7 completion:v9];
  }
}

void __72__VSIdentityProviderInfoCenter_enqueueSetTopBoxInfoQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(VSSetTopBoxInfoQueryResult);
  [(VSSetTopBoxInfoQueryResult *)v4 setSetTopBoxProvider:v3];

  [(VSSetTopBoxInfoQueryResult *)v4 setProfile:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enqueueManagedSetTopBoxInfoQueryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderInfoCenter *)self device];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke;
  v7[3] = &unk_1E6BD3950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchDeviceManagedSetTopBoxProfileWithCompletion:v7];
}

void __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke_2;
    v7[3] = &unk_1E6BD3928;
    id v8 = v5;
    id v6 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v6 _identityProviderForSetTopBoxProfile:v5 completion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __79__VSIdentityProviderInfoCenter_enqueueManagedSetTopBoxInfoQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(VSSetTopBoxInfoQueryResult);
  [(VSSetTopBoxInfoQueryResult *)v4 setSetTopBoxProvider:v3];

  [(VSSetTopBoxInfoQueryResult *)v4 setProfile:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_identityProviderForSetTopBoxProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 providerID];
  id v9 = [(VSIdentityProviderInfoCenter *)self newIdentityProviderFetchAllOperationBlock];
  id v10 = v9[2]();

  if (v10)
  {
    id v11 = v10;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke;
    id v17 = &unk_1E6BD39A0;
    id v18 = v11;
    id v19 = v8;
    id v20 = v6;
    id v21 = v7;
    uint64_t v12 = VSMainThreadOperationWithBlock(&v14);
    objc_msgSend(v12, "addDependency:", v11, v14, v15, v16, v17);
    uint64_t v13 = [(VSIdentityProviderInfoCenter *)self privateQueue];
    [v13 addOperation:v11];

    VSEnqueueCompletionOperation(v12);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] result];
  id v3 = [v2 forceUnwrapObject];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_2;
  v6[3] = &unk_1E6BD3978;
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_3;
  v4[3] = &unk_1E6BD2DA0;
  id v5 = a1[7];
  [v3 unwrapObject:v6 error:v4];
}

void __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "uniqueID", (void)v11);
        id v9 = [v8 forceUnwrapObject];
        int v10 = [v9 isEqual:*(void *)(a1 + 32)];

        if (v10)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([*(id *)(a1 + 40) isDeveloper]) {
    [v4 setIsSetTopBoxSupported:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __80__VSIdentityProviderInfoCenter__identityProviderForSetTopBoxProfile_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_accountStoreDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__VSIdentityProviderInfoCenter__accountStoreDidChange__block_invoke;
  v2[3] = &unk_1E6BD29A8;
  v2[4] = self;
  [(VSIdentityProviderInfoCenter *)self _refresh:v2];
}

uint64_t __54__VSIdentityProviderInfoCenter__accountStoreDidChange__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) ignoredFirstNotification];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _postdentityProviderInfoDidChangeNotification];
  }
  else
  {
    return [v3 setIgnoredFirstNotification:1];
  }
}

- (void)_developerSettingsDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__VSIdentityProviderInfoCenter__developerSettingsDidChange__block_invoke;
  v2[3] = &unk_1E6BD29A8;
  v2[4] = self;
  [(VSIdentityProviderInfoCenter *)self _refresh:v2];
}

uint64_t __59__VSIdentityProviderInfoCenter__developerSettingsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postdentityProviderInfoDidChangeNotification];
}

- (void)_postdentityProviderInfoDidChangeNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VSIdentityProviderInfoDidChangeNotification" object:0];
}

- (void)_refresh:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke;
  v6[3] = &unk_1E6BD3A18;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VSIdentityProviderInfoCenter *)self fetchAccountAndIdentityProvider:v6];
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    [*(id *)(a1 + 32) setCachedIdentityProvider:v7];
    char v8 = [v7 isDeveloper];
    id v9 = [*(id *)(a1 + 32) device];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2;
    v14[3] = &unk_1E6BD39F0;
    int v10 = *(void **)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    char v19 = v8;
    id v18 = v10;
    id v15 = v7;
    id v16 = v6;
    id v17 = v9;
    id v11 = v9;
    id v12 = v7;
    [v11 fetchSetTopBoxProfileWithCompletion:v14];
  }
  else
  {
    [*(id *)(a1 + 32) setCachedIdentityProvider:0];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
  }
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    [*(id *)(a1 + 32) setCachedIsSetTopBox:v5 != 0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__VSIdentityProviderInfoCenter__refresh___block_invoke_88;
    aBlock[3] = &unk_1E6BD39C8;
    aBlock[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 64);
    id v9 = _Block_copy(aBlock);
    if (*(unsigned char *)(a1 + 72))
    {
      int v10 = *(void **)(a1 + 32);
      if (v5)
      {
        [v10 fetchIdentityProviderAppBundleIdFromDeveloperSettings:v9];
        id v11 = [*(id *)(a1 + 32) cachedIdentityProvider];
        [v11 setIsSetTopBoxSupported:1];

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      id v12 = [*(id *)(a1 + 40) nonChannelAppDescriptions];

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 40) nonChannelAppDescriptions];

        if (!v13) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [identityProvider nonChannelAppDescriptions] parameter must not be nil."];
        }
        long long v14 = [*(id *)(a1 + 40) nonChannelAppDescriptions];
        id v24 = 0;
        int v15 = VSLoadInterfaceFramework((uint64_t)&v24);
        id v16 = v24;
        id v17 = v16;
        if (v15)
        {
          id v18 = objc_alloc_init(NSClassFromString((NSString *)@"VSNonChannelAppDecider"));
          [v18 setAppDescriptions:v14];
          [v18 setPreferredAppBundleOrAdamID:*(void *)(a1 + 48)];
          char v19 = [*(id *)(a1 + 56) stringForAMSDeviceFamilies];
          [v18 setPreferredDeviceFamily:v19];

          id v20 = [v18 decidedNonChannelApps];
          id v21 = [v20 firstObject];
          long long v22 = [v21 bundleID];
        }
        else
        {
          if (v16) {
            (*((void (**)(void *, void, id))v9 + 2))(v9, 0, v16);
          }
          long long v22 = 0;
        }
        (*((void (**)(void *, void *, void))v9 + 2))(v9, v22, 0);

        goto LABEL_21;
      }
      int v10 = *(void **)(a1 + 32);
    }
    [v10 setCachedDesignatedAppBundleIdentifier:0];
    uint64_t v23 = *(void *)(a1 + 64);
    if (v23) {
      (*(void (**)(void))(v23 + 16))();
    }
    goto LABEL_21;
  }
  id v7 = VSErrorLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) setCurrentError:v6];
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
LABEL_22:
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __41__VSIdentityProviderInfoCenter__refresh___block_invoke_88_cold_1();
    }

    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = v6;
    goto LABEL_7;
  }
  int v10 = *(void **)(a1 + 32);
  if (v5)
  {
    [v10 setCachedDesignatedAppBundleIdentifier:v5];
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = 0;
LABEL_7:
    [v8 setCurrentError:v9];
    goto LABEL_8;
  }
  [v10 setCachedDesignatedAppBundleIdentifier:0];
LABEL_8:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

- (void)fetchAccountAndIdentityProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderInfoCenter *)self accountStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke;
  v7[3] = &unk_1E6BD2E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAccountsWithCompletionHandler:v7];
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_2;
  v7[3] = &unk_1E6BD2DF0;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_106;
  v5[3] = &unk_1E6BD2DA0;
  id v6 = *(id *)(a1 + 40);
  [a2 unwrapObject:v7 error:v5];
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = [v5 preferredAppID];
    id v7 = [v5 identityProviderID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3;
    v19[3] = &unk_1E6BD3A68;
    id v8 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v6;
    id v21 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_105;
    v15[3] = &unk_1E6BD2CD8;
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(a1 + 40);
    id v16 = v5;
    uint64_t v17 = v9;
    id v18 = v10;
    id v11 = v5;
    id v12 = v6;
    [v7 conditionallyUnwrapObject:v19 otherwise:v15];
  }
  else
  {
    uint64_t v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Account store returned no accounts", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  id v5 = [v3 newIdentityProviderFetchOperationBlock];
  id v6 = ((void (**)(void, id))v5)[2](v5, v4);

  if (v6)
  {
    id v7 = v6;
    [v7 start];
    [v7 waitUntilFinished];
    id v8 = [v7 result];

    uint64_t v9 = [v8 forceUnwrapObject];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_4;
    v13[3] = &unk_1E6BD3A40;
    id v15 = a1[6];
    id v14 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_5;
    v11[3] = &unk_1E6BD2DA0;
    id v12 = a1[6];
    [v9 unwrapObject:v13 error:v11];
  }
  else
  {
    int v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3_cold_1(v10);
    }

    [a1[4] setCachedIdentityProvider:0];
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), 0);
}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_105(uint64_t a1)
{
  id v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_105_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  [*(id *)(a1 + 40) setCachedIdentityProvider:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_106_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchIdentityProviderAppBundleIdFromDeveloperSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke;
  v8[3] = &unk_1E6BD3AB8;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  [(VSDeveloperSettingsFetchOperation *)v5 setCompletionBlock:v8];
  uint64_t v7 = [(VSIdentityProviderInfoCenter *)self privateQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained result];
  id v4 = [v3 forceUnwrapObject];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_2;
  v7[3] = &unk_1E6BD3A90;
  id v8 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3;
  v5[3] = &unk_1E6BD2DA0;
  id v6 = *(id *)(a1 + 32);
  [v4 unwrapObject:v7 error:v5];
}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 setTopBoxBundleIdentifier];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_value:(id)a3 withDefault:(id)a4
{
  if (a3) {
    return a3;
  }
  else {
    return a4;
  }
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSIdentityProvider)cachedIdentityProvider
{
  return self->_cachedIdentityProvider;
}

- (void)setCachedIdentityProvider:(id)a3
{
}

- (NSString)cachedDesignatedAppBundleIdentifier
{
  return self->_cachedDesignatedAppBundleIdentifier;
}

- (void)setCachedDesignatedAppBundleIdentifier:(id)a3
{
}

- (BOOL)cachedIsSetTopBox
{
  return self->_cachedIsSetTopBox;
}

- (void)setCachedIsSetTopBox:(BOOL)a3
{
  self->_cachedIsSetTopBox = a3;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)ignoredFirstNotification
{
  return self->_ignoredFirstNotification;
}

- (void)setIgnoredFirstNotification:(BOOL)a3
{
  self->_ignoredFirstNotification = a3;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (void)setCurrentError:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (id)newIdentityProviderFetchAllOperationBlock
{
  return self->_newIdentityProviderFetchAllOperationBlock;
}

- (void)setNewIdentityProviderFetchAllOperationBlock:(id)a3
{
}

- (id)newIdentityProviderFetchOperationBlock
{
  return self->_newIdentityProviderFetchOperationBlock;
}

- (void)setNewIdentityProviderFetchOperationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_newIdentityProviderFetchOperationBlock, 0);
  objc_storeStrong(&self->_newIdentityProviderFetchAllOperationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_cachedDesignatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedIdentityProvider, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

void __36__VSIdentityProviderInfoCenter_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Failed to load interface framework: %@", v2, v3, v4, v5, v6);
}

- (void)enqueueIdentityProviderAppsQueryWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error loading UI framework for apps query: %@", v2, v3, v4, v5, v6);
}

void __79__VSIdentityProviderInfoCenter_enqueueIdentityProviderAppsQueryWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching identity providers for apps query: %@", v2, v3, v4, v5, v6);
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching STB profile %@", v2, v3, v4, v5, v6);
}

void __41__VSIdentityProviderInfoCenter__refresh___block_invoke_88_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching bundle ID %@", v2, v3, v4, v5, v6);
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Could not fetch identity provider.", v1, 2u);
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_105_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__VSIdentityProviderInfoCenter_fetchAccountAndIdentityProvider___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Account store returned error %@", v2, v3, v4, v5, v6);
}

void __86__VSIdentityProviderInfoCenter_fetchIdentityProviderAppBundleIdFromDeveloperSettings___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching developer settings %@", v2, v3, v4, v5, v6);
}

@end