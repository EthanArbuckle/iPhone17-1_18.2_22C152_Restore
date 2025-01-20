@interface CNTUCallProviderManager
- (BOOL)hasDefaultCallProvider;
- (BOOL)isActionType:(id)a3 supportedByProvider:(id)a4;
- (BOOL)isFirstPartyCallProvider:(id)a3;
- (CNLaunchServices)launchServices;
- (CNTUCallProviderManager)init;
- (NSArray)otherThirdPartyCallProvidersCache;
- (NSArray)thirdPartyDefaultAppCallProvidersCache;
- (NSDictionary)defaultCallingAppsBundleIdentifierScorerCache;
- (NSDictionary)defaultVideoAppsBundleIdentifierScorer;
- (NSDictionary)defaultVideoAppsBundleIdentifierScorerCache;
- (NSNumber)hasDefaultCallProviderCache;
- (NSSet)defaultCallingAppsBundleIdentifiersCache;
- (TUCallProviderManager)callProviderManager;
- (id)defaultVideoAppsBundleIdentifierScorerImpl;
- (id)hasDefaultCallProviderImpl;
- (id)observableForCallProvidersChangedWithSchedulerProvider:(id)a3;
- (id)otherThirdPartyCallProviders;
- (id)otherThirdPartyCallProvidersImpl;
- (id)providerManagerQueue;
- (id)thirdPartyCallProviderWithBundleIdentifier:(id)a3;
- (id)thirdPartyCallProvidersForActionType:(id)a3;
- (id)thirdPartyDefaultAppCallProviders;
- (id)thirdPartyDefaultAppCallProvidersImpl;
- (void)createDefaultCallingAppsBundleIdentifierScorer:(id)a3;
- (void)emptyDefaultAppsCaches;
- (void)setCallProviderManager:(id)a3;
- (void)setDefaultCallingAppsBundleIdentifierScorerCache:(id)a3;
- (void)setDefaultCallingAppsBundleIdentifiersCache:(id)a3;
- (void)setDefaultVideoAppsBundleIdentifierScorerCache:(id)a3;
- (void)setHasDefaultCallProviderCache:(id)a3;
- (void)setLaunchServices:(id)a3;
- (void)setOtherThirdPartyCallProvidersCache:(id)a3;
- (void)setThirdPartyDefaultAppCallProvidersCache:(id)a3;
@end

@implementation CNTUCallProviderManager

- (CNTUCallProviderManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNTUCallProviderManager;
  v2 = [(CNTUCallProviderManager *)&v11 init];
  if (v2)
  {
    v3 = (TUCallProviderManager *)objc_alloc_init(getTUCallProviderManagerClass_0());
    callProviderManager = v2->_callProviderManager;
    v2->_callProviderManager = v3;

    id v5 = objc_alloc(MEMORY[0x263F335F0]);
    id v6 = objc_alloc_init(MEMORY[0x263EFEAD8]);
    uint64_t v7 = [v5 initWithAdapter:v6];
    launchServices = v2->_launchServices;
    v2->_launchServices = (CNLaunchServices *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)thirdPartyDefaultAppCallProviders
{
  v2 = cn_objectResultWithObjectLock();
  return v2;
}

id __60__CNTUCallProviderManager_thirdPartyDefaultAppCallProviders__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    uint64_t v4 = [v2 thirdPartyDefaultAppCallProvidersImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  return v3;
}

- (id)thirdPartyDefaultAppCallProvidersImpl
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = [(CNTUCallProviderManager *)self callProviderManager];
  uint64_t v4 = [v3 sortedProviders];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__CNTUCallProviderManager_thirdPartyDefaultAppCallProvidersImpl__block_invoke;
  v9[3] = &unk_264018A08;
  v9[4] = self;
  v9[5] = &v10;
  uint64_t v5 = objc_msgSend(v4, "_cn_filter:", v9);

  id v6 = [MEMORY[0x263EFFA08] setWithArray:v11[5]];
  [(CNTUCallProviderManager *)self setDefaultCallingAppsBundleIdentifiersCache:v6];

  [(CNTUCallProviderManager *)self createDefaultCallingAppsBundleIdentifierScorer:v11[5]];
  uint64_t v7 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_48);

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __64__CNTUCallProviderManager_thirdPartyDefaultAppCallProvidersImpl__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  uint64_t v5 = [v3 bundleIdentifier];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = [v3 bundleIdentifier];
    [v6 addObject:v7];

    uint64_t v8 = [*(id *)(a1 + 32) isFirstPartyCallProvider:v3] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

CNTUCallProvider *__64__CNTUCallProviderManager_thirdPartyDefaultAppCallProvidersImpl__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNTUCallProvider alloc] initWithCallProvider:v2];

  [(CNTUCallProvider *)v3 setIsEligibleDefaultApp:1];
  return v3;
}

- (id)otherThirdPartyCallProviders
{
  id v2 = cn_objectResultWithObjectLock();
  return v2;
}

id __55__CNTUCallProviderManager_otherThirdPartyCallProviders__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[4];
  if (!v3)
  {
    uint64_t v4 = [v2 otherThirdPartyCallProvidersImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  return v3;
}

- (id)otherThirdPartyCallProvidersImpl
{
  id v3 = [(CNTUCallProviderManager *)self callProviderManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CNTUCallProviderManager_otherThirdPartyCallProvidersImpl__block_invoke;
  v7[3] = &unk_264018A50;
  v7[4] = self;
  uint64_t v4 = [v3 providersPassingTest:v7];

  uint64_t v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_24_0);

  return v5;
}

uint64_t __59__CNTUCallProviderManager_otherThirdPartyCallProvidersImpl__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E8];
  uint64_t v5 = [v3 bundleIdentifier];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) defaultCallingAppsBundleIdentifiersCache];
    uint64_t v7 = [v3 bundleIdentifier];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

CNTUCallProvider *__59__CNTUCallProviderManager_otherThirdPartyCallProvidersImpl__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNTUCallProvider alloc] initWithCallProvider:v2];

  return v3;
}

- (void)createDefaultCallingAppsBundleIdentifierScorer:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CNTUCallProviderManager_createDefaultCallingAppsBundleIdentifierScorer___block_invoke;
  v8[3] = &unk_264018A78;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  [(CNTUCallProviderManager *)self setDefaultCallingAppsBundleIdentifierScorerCache:v7];
}

void __74__CNTUCallProviderManager_createDefaultCallingAppsBundleIdentifierScorer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = NSNumber;
  uint64_t v5 = a3 + 1;
  id v6 = a2;
  id v7 = [v4 numberWithUnsignedInteger:v5];
  [v3 setObject:v7 forKey:v6];
}

- (NSDictionary)defaultVideoAppsBundleIdentifierScorer
{
  id v2 = cn_objectResultWithObjectLock();
  return (NSDictionary *)v2;
}

id __65__CNTUCallProviderManager_defaultVideoAppsBundleIdentifierScorer__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[7];
  if (!v3)
  {
    uint64_t v4 = [v2 defaultVideoAppsBundleIdentifierScorerImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  return v3;
}

- (id)defaultVideoAppsBundleIdentifierScorerImpl
{
  id v3 = [(CNTUCallProviderManager *)self callProviderManager];
  uint64_t v4 = [v3 defaultAppProvider];

  uint64_t v5 = [(CNTUCallProviderManager *)self defaultCallingAppsBundleIdentifierScorer];
  if (([v4 supportsAudioAndVideo] & 1) == 0)
  {

    id v6 = [(CNTUCallProviderManager *)self defaultCallingAppsBundleIdentifierScorer];
    uint64_t v5 = (void *)[v6 mutableCopy];

    [v5 setObject:&unk_26BFD9AD8 forKeyedSubscript:*MEMORY[0x263EFDEC0]];
  }

  return v5;
}

- (BOOL)hasDefaultCallProvider
{
  id v2 = cn_objectResultWithObjectLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

id __49__CNTUCallProviderManager_hasDefaultCallProvider__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[8];
  if (!v3)
  {
    uint64_t v4 = [v2 hasDefaultCallProviderImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  return v3;
}

- (id)hasDefaultCallProviderImpl
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_20B704000, v3, OS_LOG_TYPE_INFO, "CNTUCallProviderManager will fetch default calling app", (uint8_t *)&v10, 2u);
  }

  uint64_t v4 = NSNumber;
  uint64_t v5 = [(CNTUCallProviderManager *)self launchServices];
  id v6 = [v5 defaultApplicationForDefaultAppCategory:1];
  id v7 = [v4 numberWithInt:v6 != 0];

  uint64_t v8 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    objc_super v11 = v7;
    _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, "CNTUCallProviderManager did fetch default calling app, has default = %@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

- (id)providerManagerQueue
{
  if (providerManagerQueue_cn_once_token_4 != -1) {
    dispatch_once(&providerManagerQueue_cn_once_token_4, &__block_literal_global_32_1);
  }
  id v2 = (void *)providerManagerQueue_cn_once_object_4;
  return v2;
}

uint64_t __47__CNTUCallProviderManager_providerManagerQueue__block_invoke()
{
  providerManagerQueue_cn_once_object_4 = (uint64_t)dispatch_queue_create("com.apple.contacts.ContactsUICore.CNTUCallProviderManagerQueue", 0);
  return MEMORY[0x270F9A758]();
}

- (id)observableForCallProvidersChangedWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F33608];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke;
  v9[3] = &unk_264018AC8;
  id v10 = v4;
  objc_super v11 = self;
  id v6 = v4;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

CNCallProvidersChangedCancelationToken *__82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNCallProvidersChangedCancelationToken);
  uint64_t v5 = [CNTUCallProviderManagerDelegate alloc];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_2;
  v14[3] = &unk_264018AA0;
  id v15 = *(id *)(a1 + 32);
  id v16 = v3;
  id v6 = v3;
  id v7 = [(CNTUCallProviderManagerDelegate *)v5 initWithBlock:v14];
  uint64_t v8 = [*(id *)(a1 + 40) callProviderManager];
  id v9 = [*(id *)(a1 + 40) providerManagerQueue];
  [v8 addDelegate:v7 queue:v9];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_4;
  v12[3] = &unk_264018368;
  v12[4] = *(void *)(a1 + 40);
  v13 = v7;
  id v10 = v7;
  [(CNCancelationToken *)v4 addCancelationBlock:v12];

  return v4;
}

void __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) backgroundScheduler];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_3;
  v6[3] = &unk_264018368;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

void __82__CNTUCallProviderManager_observableForCallProvidersChangedWithSchedulerProvider___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callProviderManager];
  [v2 removeDelegate:*(void *)(a1 + 40)];
}

- (id)thirdPartyCallProvidersForActionType:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CNTUCallProviderManager *)self thirdPartyDefaultAppCallProviders];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke;
  v16[3] = &unk_264018AF0;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_msgSend(v5, "_cn_filter:", v16);

  id v8 = [(CNTUCallProviderManager *)self otherThirdPartyCallProviders];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke_2;
  v14[3] = &unk_264018AF0;
  void v14[4] = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = objc_msgSend(v8, "_cn_filter:", v14);

  v18[0] = v7;
  v18[1] = v10;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  uint64_t v12 = objc_msgSend(v11, "_cn_flatten");

  return v12;
}

uint64_t __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 callProvider];
  uint64_t v5 = [v2 isActionType:v3 supportedByProvider:v4];

  return v5;
}

uint64_t __64__CNTUCallProviderManager_thirdPartyCallProvidersForActionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 callProvider];
  uint64_t v5 = [v2 isActionType:v3 supportedByProvider:v4];

  return v5;
}

- (id)thirdPartyCallProviderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNTUCallProviderManager *)self thirdPartyDefaultAppCallProviders];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke;
  v14[3] = &unk_264018B18;
  id v6 = v4;
  id v15 = v6;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v14);

  id v8 = v7;
  id v9 = v8;
  if (!v8)
  {
    id v10 = [(CNTUCallProviderManager *)self otherThirdPartyCallProviders];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke_2;
    v12[3] = &unk_264018B18;
    id v13 = v6;
    id v9 = objc_msgSend(v10, "_cn_firstObjectPassingTest:", v12);
  }
  return v9;
}

uint64_t __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __70__CNTUCallProviderManager_thirdPartyCallProviderWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isFirstPartyCallProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isTelephonyProvider] & 1) != 0 || (objc_msgSend(v3, "isFaceTimeProvider"))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 identifier];
    if ([v5 isEqualToString:@"com.apple.telephonyutilities.callservicesd.TinCan"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [v3 identifier];
      char v4 = [v6 isEqualToString:@"com.apple.internal.suiuntool"];
    }
  }

  return v4;
}

- (BOOL)isActionType:(id)a3 supportedByProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x263EFDEF8]]
    && ([v6 supportsAudioOnly] & 1) != 0)
  {
    char v7 = 1;
  }
  else if ([v5 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    char v7 = [v6 supportsAudioAndVideo];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)emptyDefaultAppsCaches
{
}

void __49__CNTUCallProviderManager_emptyDefaultAppsCaches__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

void __49__CNTUCallProviderManager_emptyDefaultAppsCaches__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

void __49__CNTUCallProviderManager_emptyDefaultAppsCaches__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void)setCallProviderManager:(id)a3
{
}

- (CNLaunchServices)launchServices
{
  return self->_launchServices;
}

- (void)setLaunchServices:(id)a3
{
}

- (NSArray)thirdPartyDefaultAppCallProvidersCache
{
  return self->_thirdPartyDefaultAppCallProvidersCache;
}

- (void)setThirdPartyDefaultAppCallProvidersCache:(id)a3
{
}

- (NSArray)otherThirdPartyCallProvidersCache
{
  return self->_otherThirdPartyCallProvidersCache;
}

- (void)setOtherThirdPartyCallProvidersCache:(id)a3
{
}

- (NSSet)defaultCallingAppsBundleIdentifiersCache
{
  return self->_defaultCallingAppsBundleIdentifiersCache;
}

- (void)setDefaultCallingAppsBundleIdentifiersCache:(id)a3
{
}

- (NSDictionary)defaultCallingAppsBundleIdentifierScorerCache
{
  return self->_defaultCallingAppsBundleIdentifierScorerCache;
}

- (void)setDefaultCallingAppsBundleIdentifierScorerCache:(id)a3
{
}

- (NSDictionary)defaultVideoAppsBundleIdentifierScorerCache
{
  return self->_defaultVideoAppsBundleIdentifierScorerCache;
}

- (void)setDefaultVideoAppsBundleIdentifierScorerCache:(id)a3
{
}

- (NSNumber)hasDefaultCallProviderCache
{
  return self->_hasDefaultCallProviderCache;
}

- (void)setHasDefaultCallProviderCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasDefaultCallProviderCache, 0);
  objc_storeStrong((id *)&self->_defaultVideoAppsBundleIdentifierScorerCache, 0);
  objc_storeStrong((id *)&self->_defaultCallingAppsBundleIdentifierScorerCache, 0);
  objc_storeStrong((id *)&self->_defaultCallingAppsBundleIdentifiersCache, 0);
  objc_storeStrong((id *)&self->_otherThirdPartyCallProvidersCache, 0);
  objc_storeStrong((id *)&self->_thirdPartyDefaultAppCallProvidersCache, 0);
  objc_storeStrong((id *)&self->_launchServices, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

@end