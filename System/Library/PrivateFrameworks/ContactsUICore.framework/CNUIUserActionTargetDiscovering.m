@interface CNUIUserActionTargetDiscovering
+ (BOOL)isSkypeAvailableWithEnvironment:(id)a3;
+ (BOOL)shouldIgnoreApplicationProxy:(id)a3;
+ (id)applicationProxiesForIntent:(id)a3 applicationWorkspace:(id)a4;
+ (id)os_log;
- (CNCapabilities)capabilities;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (CNMCProfileConnection)profileConnection;
- (CNSchedulerProvider)highLatencySchedulerProvider;
- (CNSchedulerProvider)schedulerProvider;
- (CNTUCallProviderManager)callProviderManager;
- (CNUIUserActionTargetDiscovering)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 profileConnection:(id)a5 schedulerProvider:(id)a6 highLatencySchedulerProvider:(id)a7 capabilities:(id)a8;
- (CNUIUserActionTargetDiscoveryCache)cache;
- (NSDictionary)defaultMessagingAppsBundleIdentifierScorerCache;
- (id)_targetsForActionType:(id)a3;
- (id)observableForTargetsChangedForActionType:(id)a3 schedulerProvider:(id)a4;
- (id)targetForTextWithMessages;
- (id)targetForTextWithSkype;
- (id)targetForVideoWithFaceTime;
- (id)targetForVideoWithSkype;
- (id)targetForVoiceWithFaceTime;
- (id)targetForVoiceWithSkype;
- (id)targetForVoiceWithTelephony;
- (id)targetsForActionType:(id)a3;
- (id)targetsForDirections;
- (id)targetsForEmail;
- (id)targetsForPay;
- (id)targetsForSendMessageIntent;
- (id)targetsForStartAudioCallIntent;
- (id)targetsForStartVideoCallIntent;
- (id)targetsForText;
- (id)targetsForTextWithDefaultMessagingApps;
- (id)targetsForVideo;
- (id)targetsForVideoWithThirdPartyCallProviders;
- (id)targetsForVoice;
- (id)targetsForVoiceWithThirdPartyCallProviders;
- (id)thirdPartyTargetsForActionTypes:(id)a3;
- (id)thirdPartyTargetsForBundleIdentifier:(id)a3;
- (void)createDefaultMessagingAppsBundleIdentifierScorer:(id)a3;
- (void)dealloc;
- (void)emptyDefaultAppsCaches;
- (void)resetTargetsForActionType:(id)a3;
- (void)setDefaultMessagingAppsBundleIdentifierScorerCache:(id)a3;
@end

@implementation CNUIUserActionTargetDiscovering

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1) {
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_61);
  }
  v2 = (void *)os_log_cn_once_object_1_0;
  return v2;
}

uint64_t __41__CNUIUserActionTargetDiscovering_os_log__block_invoke()
{
  os_log_cn_once_object_1_0 = (uint64_t)os_log_create("com.apple.contacts", "target-discovery");
  return MEMORY[0x270F9A758]();
}

- (CNUIUserActionTargetDiscovering)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 profileConnection:(id)a5 schedulerProvider:(id)a6 highLatencySchedulerProvider:(id)a7 capabilities:(id)a8
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CNUIUserActionTargetDiscovering;
  v18 = [(CNUIUserActionTargetDiscovering *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_applicationWorkspace, a3);
    objc_storeStrong((id *)&v19->_callProviderManager, a4);
    objc_storeStrong((id *)&v19->_capabilities, a8);
    objc_storeStrong((id *)&v19->_highLatencySchedulerProvider, a7);
    objc_storeStrong((id *)&v19->_profileConnection, a5);
    objc_storeStrong((id *)&v19->_schedulerProvider, a6);
    v20 = [CNUIUserActionTargetDiscoveryCache alloc];
    v21 = (void *)[v15 newSynchronousSerialSchedulerWithName:@"com.apple.contacts.ContactsUICore.CNUIUserActionTargetDiscoveringResourceLock"];
    uint64_t v22 = [(CNCache *)v20 initWithResourceScheduler:v21];
    cache = v19->_cache;
    v19->_cache = (CNUIUserActionTargetDiscoveryCache *)v22;

    v24 = v19;
  }

  return v19;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(CNUIUserActionTargetDiscovering *)v4 cache];
  v6 = [v5 allObjects];
  v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_19_0);
  [v3 setArray:v7];

  v8 = [(CNUIUserActionTargetDiscovering *)v4 cache];
  [v8 removeAllObjects];

  objc_sync_exit(v4);
  objc_msgSend(v3, "_cn_each:", *MEMORY[0x263F33480]);

  v9.receiver = v4;
  v9.super_class = (Class)CNUIUserActionTargetDiscovering;
  [(CNUIUserActionTargetDiscovering *)&v9 dealloc];
}

uint64_t __42__CNUIUserActionTargetDiscovering_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 second];
}

- (id)targetsForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(CNUIUserActionTargetDiscovering *)v6 cache];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __56__CNUIUserActionTargetDiscovering_targetsForActionType___block_invoke;
  id v15 = &unk_264019158;
  id v16 = v6;
  id v8 = v5;
  id v17 = v8;
  objc_super v9 = [v7 objectForKey:v4 onCacheMiss:&v12];

  v10 = objc_msgSend(v9, "first", v12, v13, v14, v15, v16);

  objc_sync_exit(v6);
  return v10;
}

id __56__CNUIUserActionTargetDiscovering_targetsForActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _targetsForActionType:a2];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F33650]) initWithSchedulerProvider:*(void *)(a1 + 40)];
  v5 = [v3 subscribe:v4];
  v6 = +[CNPair pairWithFirst:v4 second:v5];

  return v6;
}

- (id)observableForTargetsChangedForActionType:(id)a3 schedulerProvider:(id)a4
{
  v23[3] = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  if (v6 | *MEMORY[0x263EFDEF8]
    && (objc_msgSend((id)v6, "isEqual:") & 1) == 0
    && v6 | *MEMORY[0x263EFDF38]
    && (objc_msgSend((id)v6, "isEqual:") & 1) == 0
    && v6 | *MEMORY[0x263EFDF18]
    && !objc_msgSend((id)v6, "isEqual:"))
  {
    v18 = [MEMORY[0x263F33608] emptyObservable];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F33608];
    objc_super v9 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
    v10 = [v9 observableForApplicationsChangedWithSchedulerProvider:v7];
    v23[0] = v10;
    v11 = [(CNUIUserActionTargetDiscovering *)self callProviderManager];
    uint64_t v12 = [v11 observableForCallProvidersChangedWithSchedulerProvider:v7];
    v23[1] = v12;
    uint64_t v13 = [(CNUIUserActionTargetDiscovering *)self profileConnection];
    v14 = [v13 observableForManagedConfigChanged];
    v23[2] = v14;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
    v20 = self;
    v16 = id v15 = (void *)v6;
    id v17 = [v8 merge:v16 schedulerProvider:v7];

    unint64_t v6 = (unint64_t)v15;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __94__CNUIUserActionTargetDiscovering_observableForTargetsChangedForActionType_schedulerProvider___block_invoke;
    v21[3] = &unk_264017920;
    v21[4] = v20;
    id v22 = v15;
    v18 = [v17 doOnNext:v21];
  }
  return v18;
}

uint64_t __94__CNUIUserActionTargetDiscovering_observableForTargetsChangedForActionType_schedulerProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetTargetsForActionType:*(void *)(a1 + 40)];
}

- (void)resetTargetsForActionType:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  unint64_t v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CNUIUserActionTargetDiscovering resetTargetsForActionType:]((uint64_t)v4, v6);
  }

  id v7 = [(CNUIUserActionTargetDiscovering *)v5 cache];
  id v8 = [v7 objectForKeyedSubscript:v4];
  objc_super v9 = [v8 second];

  v10 = [(CNUIUserActionTargetDiscovering *)v5 cache];
  [v10 setObject:0 forKeyedSubscript:v4];

  objc_sync_exit(v5);
  [v9 cancel];
}

- (id)_targetsForActionType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263EFDF18]])
  {
    uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForText];
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EFDEF8]])
  {
    uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForVoice];
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForVideo];
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EFDF10]])
  {
    uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForEmail];
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EFDF20]])
  {
    uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForPay];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x263EFDF00]]) {
      [(CNUIUserActionTargetDiscovering *)self targetsForDirections];
    }
    else {
    uint64_t v5 = [MEMORY[0x263F33608] emptyObservable];
    }
  }
  unint64_t v6 = (void *)v5;

  return v6;
}

- (id)targetsForEmail
{
  v2 = (void *)MEMORY[0x263F33608];
  v3 = +[CNUIUserActionTarget targetForEmailWithMail];
  id v4 = [v2 observableWithResult:v3];

  return v4;
}

- (id)targetsForPay
{
  v2 = (void *)MEMORY[0x263F33608];
  v3 = +[CNUIUserActionTarget targetForPayWithWallet];
  id v4 = [v2 observableWithResult:v3];

  return v4;
}

- (id)targetsForDirections
{
  v2 = (void *)MEMORY[0x263F33608];
  v3 = +[CNUIUserActionTarget targetForDirections];
  id v4 = [v2 observableWithResult:v3];

  return v4;
}

- (id)targetsForVoice
{
  v27[2] = *MEMORY[0x263EF8340];
  v3 = [(CNUIUserActionTargetDiscovering *)self targetForVoiceWithTelephony];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetForVoiceWithFaceTime];
  [v4 addObject:v5];

  unint64_t v6 = [(CNUIUserActionTargetDiscovering *)self targetForVoiceWithSkype];
  [v4 addObject:v6];

  id v7 = [(CNUIUserActionTargetDiscovering *)self targetsForVoiceWithThirdPartyCallProviders];
  [v4 addObject:v7];

  id v8 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  objc_super v9 = [(CNUIUserActionTargetDiscovering *)self highLatencySchedulerProvider];
  v10 = (void *)MEMORY[0x263F33608];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke;
  v23 = &unk_2640191A8;
  id v24 = v9;
  id v25 = v4;
  id v26 = v8;
  id v11 = v8;
  id v12 = v4;
  id v13 = v9;
  v14 = [v10 observableWithBlock:&v20];
  id v15 = (void *)MEMORY[0x263F33608];
  v27[0] = v3;
  v27[1] = v14;
  id v16 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v27, 2, v20, v21, v22, v23);
  id v17 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  v18 = [v15 merge:v16 schedulerProvider:v17];

  return v18;
}

id __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] backgroundScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke_2;
  v8[3] = &unk_264019180;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = v3;
  id v5 = v3;
  unint64_t v6 = [v4 performCancelableBlock:v8 qualityOfService:2];

  return v6;
}

void __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33608];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  id v6 = a2;
  id v7 = [v3 merge:v4 schedulerProvider:v5];
  id v8 = [v7 subscribe:a1[6]];

  [v6 addCancelable:v8];
}

- (id)targetsForVideo
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(CNUIUserActionTargetDiscovering *)self targetForVideoWithFaceTime];
  [v3 addObject:v4];

  uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetForVideoWithSkype];
  [v3 addObject:v5];

  id v6 = [(CNUIUserActionTargetDiscovering *)self targetsForVideoWithThirdPartyCallProviders];
  [v3 addObject:v6];

  id v7 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  id v8 = [(CNUIUserActionTargetDiscovering *)self highLatencySchedulerProvider];
  id v9 = (void *)MEMORY[0x263F33608];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke;
  v15[3] = &unk_2640191A8;
  id v16 = v8;
  id v17 = v3;
  id v18 = v7;
  id v10 = v7;
  id v11 = v3;
  id v12 = v8;
  id v13 = [v9 observableWithBlock:v15];

  return v13;
}

id __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] backgroundScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke_2;
  v8[3] = &unk_264019180;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = v3;
  id v5 = v3;
  id v6 = [v4 performCancelableBlock:v8 qualityOfService:2];

  return v6;
}

void __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33608];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  id v6 = a2;
  id v7 = [v3 merge:v4 schedulerProvider:v5];
  id v8 = [v7 subscribe:a1[6]];

  [v6 addCancelable:v8];
}

- (id)targetsForText
{
  v27[2] = *MEMORY[0x263EF8340];
  id v3 = [(CNUIUserActionTargetDiscovering *)self targetForTextWithMessages];
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(CNUIUserActionTargetDiscovering *)self targetsForTextWithDefaultMessagingApps];
  [v4 addObject:v5];

  id v6 = [(CNUIUserActionTargetDiscovering *)self targetForTextWithSkype];
  [v4 addObject:v6];

  id v7 = [(CNUIUserActionTargetDiscovering *)self targetsForSendMessageIntent];
  [v4 addObject:v7];

  id v8 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  id v9 = [(CNUIUserActionTargetDiscovering *)self highLatencySchedulerProvider];
  id v10 = (void *)MEMORY[0x263F33608];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke;
  v23 = &unk_2640191A8;
  id v24 = v9;
  id v25 = v4;
  id v26 = v8;
  id v11 = v8;
  id v12 = v4;
  id v13 = v9;
  v14 = [v10 observableWithBlock:&v20];
  id v15 = (void *)MEMORY[0x263F33608];
  v27[0] = v3;
  v27[1] = v14;
  id v16 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v27, 2, v20, v21, v22, v23);
  id v17 = [(CNUIUserActionTargetDiscovering *)self schedulerProvider];
  id v18 = [v15 merge:v16 schedulerProvider:v17];

  return v18;
}

id __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] backgroundScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke_2;
  v8[3] = &unk_264019180;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = v3;
  id v5 = v3;
  id v6 = [v4 performCancelableBlock:v8 qualityOfService:2];

  return v6;
}

void __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33608];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  id v6 = a2;
  id v7 = [v3 merge:v4 schedulerProvider:v5];
  id v8 = [v7 subscribe:a1[6]];

  [v6 addCancelable:v8];
}

- (id)targetForVoiceWithTelephony
{
  v2 = [(CNUIUserActionTargetDiscovering *)self capabilities];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__CNUIUserActionTargetDiscovering_targetForVoiceWithTelephony__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__62__CNUIUserActionTargetDiscovering_targetForVoiceWithTelephony__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) areTelephonyCallsSupported])
  {
    id v4 = +[CNUIUserActionTarget targetForVoiceWithTelephony];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForTextWithMessages
{
  v2 = [(CNUIUserActionTargetDiscovering *)self capabilities];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CNUIUserActionTargetDiscovering_targetForTextWithMessages__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__60__CNUIUserActionTargetDiscovering_targetForTextWithMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isiMessageSupported])
  {
    id v4 = +[CNUIUserActionTarget targetForTextWithMessages];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForVoiceWithFaceTime
{
  v2 = [(CNUIUserActionTargetDiscovering *)self capabilities];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CNUIUserActionTargetDiscovering_targetForVoiceWithFaceTime__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__61__CNUIUserActionTargetDiscovering_targetForVoiceWithFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isFaceTimeAudioSupported])
  {
    id v4 = +[CNUIUserActionTarget targetForVoiceWithFaceTime];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForVideoWithFaceTime
{
  v2 = [(CNUIUserActionTargetDiscovering *)self capabilities];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CNUIUserActionTargetDiscovering_targetForVideoWithFaceTime__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__61__CNUIUserActionTargetDiscovering_targetForVideoWithFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isFaceTimeVideoSupported])
  {
    id v4 = +[CNUIUserActionTarget targetForVideoWithFaceTime];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForVoiceWithSkype
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CNUIUserActionTargetDiscovering_targetForVoiceWithSkype__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__58__CNUIUserActionTargetDiscovering_targetForVoiceWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:*(void *)(a1 + 32)])
  {
    id v4 = +[CNUIUserActionTarget targetForVoiceWithSkype];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForVideoWithSkype
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CNUIUserActionTargetDiscovering_targetForVideoWithSkype__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__58__CNUIUserActionTargetDiscovering_targetForVideoWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:*(void *)(a1 + 32)])
  {
    id v4 = +[CNUIUserActionTarget targetForVideoWithSkype];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetForTextWithSkype
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CNUIUserActionTargetDiscovering_targetForTextWithSkype__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__57__CNUIUserActionTargetDiscovering_targetForTextWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:*(void *)(a1 + 32)])
  {
    id v4 = +[CNUIUserActionTarget targetForTextWithSkype];
    [v3 observerDidReceiveResult:v4];
  }
  [v3 observerDidComplete];
  uint64_t v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetsForVoiceWithThirdPartyCallProviders
{
  v2 = [(CNUIUserActionTargetDiscovering *)self callProviderManager];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) thirdPartyCallProvidersForActionType:*MEMORY[0x263EFDEF8]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke_2;
  v8[3] = &unk_2640191F8;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v8);

  [v5 observerDidComplete];
  id v6 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v6;
}

void __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CNUIUserActionTarget targetForVoiceWithCallProvider:a2];
  [v2 observerDidReceiveResult:v3];
}

- (id)targetsForVideoWithThirdPartyCallProviders
{
  v2 = [(CNUIUserActionTargetDiscovering *)self callProviderManager];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) thirdPartyCallProvidersForActionType:*MEMORY[0x263EFDF38]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke_2;
  v8[3] = &unk_2640191F8;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v8);

  [v5 observerDidComplete];
  id v6 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v6;
}

void __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CNUIUserActionTarget targetForVideoWithCallProvider:a2];
  [v2 observerDidReceiveResult:v3];
}

- (id)targetsForStartAudioCallIntent
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x263EFDEF8]);
  id v5 = +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:v4 applicationWorkspace:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke_2;
  v9[3] = &unk_264019220;
  id v10 = v3;
  id v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  [v6 observerDidComplete];
  id v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

void __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CNUIUserActionTarget targetForStartAudioCallIntentWithAppProxy:a2];
  [v2 observerDidReceiveResult:v3];
}

- (id)targetsForStartVideoCallIntent
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x263EFDF38]);
  id v5 = +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:v4 applicationWorkspace:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke_2;
  v9[3] = &unk_264019220;
  id v10 = v3;
  id v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  [v6 observerDidComplete];
  id v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

void __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CNUIUserActionTarget targetForStartVideoCallIntentWithAppProxy:a2];
  [v2 observerDidReceiveResult:v3];
}

- (id)targetsForSendMessageIntent
{
  v2 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v3 = (void *)MEMORY[0x263F33608];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke;
  v7[3] = &unk_2640191D0;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 observableWithBlock:v7];

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x263EFDF18]);
  id v5 = +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:v4 applicationWorkspace:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke_2;
  v9[3] = &unk_264019220;
  id v10 = v3;
  id v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  [v6 observerDidComplete];
  id v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

void __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CNUIUserActionTarget targetForSendMessageIntentWithAppProxy:a2];
  [v2 observerDidReceiveResult:v3];
}

- (id)targetsForTextWithDefaultMessagingApps
{
  id v3 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v4 = (void *)MEMORY[0x263F33608];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__CNUIUserActionTargetDiscovering_targetsForTextWithDefaultMessagingApps__block_invoke;
  v8[3] = &unk_264018AC8;
  id v9 = v3;
  id v10 = self;
  id v5 = v3;
  id v6 = [v4 observableWithBlock:v8];

  return v6;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__73__CNUIUserActionTargetDiscovering_targetsForTextWithDefaultMessagingApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [*(id *)(a1 + 32) applicationsAvailableForDefaultAppCategory:0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __73__CNUIUserActionTargetDiscovering_targetsForTextWithDefaultMessagingApps__block_invoke_35;
  id v11 = &unk_264019248;
  id v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  objc_msgSend(v4, "_cn_each:", &v8);

  objc_msgSend(*(id *)(a1 + 40), "createDefaultMessagingAppsBundleIdentifierScorer:", v15[5], v8, v9, v10, v11);
  [v5 observerDidComplete];
  id v6 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __73__CNUIUserActionTargetDiscovering_targetsForTextWithDefaultMessagingApps__block_invoke_35(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v8 bundleIdentifier];
  [v3 addObject:v4];

  id v5 = [v8 bundleIdentifier];
  LOBYTE(v4) = [v5 isEqualToString:*MEMORY[0x263EFDED8]];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[CNUIUserActionTarget targetForTextWithAvailableDefaultAppProxy:v8];
    [v6 observerDidReceiveResult:v7];
  }
}

- (void)createDefaultMessagingAppsBundleIdentifierScorer:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__CNUIUserActionTargetDiscovering_createDefaultMessagingAppsBundleIdentifierScorer___block_invoke;
  v8[3] = &unk_264018A78;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  [(CNUIUserActionTargetDiscovering *)self setDefaultMessagingAppsBundleIdentifierScorerCache:v7];
}

void __84__CNUIUserActionTargetDiscovering_createDefaultMessagingAppsBundleIdentifierScorer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = NSNumber;
  uint64_t v5 = a3 + 1;
  id v6 = a2;
  id v7 = [v4 numberWithUnsignedInteger:v5];
  [v3 setObject:v7 forKey:v6];
}

- (void)emptyDefaultAppsCaches
{
  [(CNUIUserActionTargetDiscovering *)self setDefaultMessagingAppsBundleIdentifierScorerCache:0];
  [(CNUIUserActionTargetDiscovering *)self resetTargetsForActionType:*MEMORY[0x263EFDF18]];
  [(CNUIUserActionTargetDiscovering *)self resetTargetsForActionType:*MEMORY[0x263EFDEF8]];
  uint64_t v3 = *MEMORY[0x263EFDF38];
  [(CNUIUserActionTargetDiscovering *)self resetTargetsForActionType:v3];
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 array];
  id v7 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke;
  id v17 = &unk_264019270;
  id v18 = v7;
  id v19 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend(v5, "_cn_each:", &v14);

  id v10 = (void *)MEMORY[0x263F335E0];
  id v11 = objc_msgSend(v8, "_cn_distinctObjects", v14, v15, v16, v17);
  id v12 = [v10 futureWithResult:v11];

  return v12;
}

void __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = sIntentForActionType_block_invoke(a1, a2);
  uint64_t v4 = +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:v3 applicationWorkspace:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke_2;
  v5[3] = &unk_264019220;
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_cn_each:", v5);
}

void __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [CNUIUserActionTarget alloc];
  id v8 = [v3 localizedName];
  id v5 = [v3 bundleIdentifier];
  id v6 = [v3 teamIdentifier];

  id v7 = [(CNUIUserActionTarget *)v4 initWithName:v8 bundleIdentifier:v5 teamIdentifier:v6];
  [v2 addObject:v7];
}

- (id)thirdPartyTargetsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  if (thirdPartyTargetsForBundleIdentifier__cn_once_token_3 != -1) {
    dispatch_once(&thirdPartyTargetsForBundleIdentifier__cn_once_token_3, &__block_literal_global_42);
  }
  id v6 = (id)thirdPartyTargetsForBundleIdentifier__cn_once_object_3;
  id v7 = [MEMORY[0x263EFF980] arrayWithArray:v6];
  id v8 = [(CNUIUserActionTargetDiscovering *)self callProviderManager];
  id v9 = [v8 thirdPartyCallProviderWithBundleIdentifier:v4];

  if ([v9 supportsAudio])
  {
    id v10 = +[CNUIUserActionTarget targetForVoiceWithCallProvider:v9];
    [v5 addObject:v10];

    [v7 removeObject:*MEMORY[0x263EFDEF8]];
  }
  if ([v9 supportsVideo])
  {
    id v11 = +[CNUIUserActionTarget targetForVideoWithCallProvider:v9];
    [v5 addObject:v11];

    [v7 removeObject:*MEMORY[0x263EFDF38]];
  }
  id v12 = [(CNUIUserActionTargetDiscovering *)self applicationWorkspace];
  id v13 = [v12 applicationForBundleIdentifier:v4];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke_2;
  uint64_t v21 = &unk_264019270;
  id v22 = v13;
  id v23 = v5;
  id v14 = v5;
  id v15 = v13;
  objc_msgSend(v7, "_cn_each:", &v18);
  uint64_t v16 = objc_msgSend(MEMORY[0x263F335E0], "futureWithResult:", v14, v18, v19, v20, v21);

  return v16;
}

void __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke()
{
  v4[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFDF38];
  v4[0] = *MEMORY[0x263EFDEF8];
  v4[1] = v0;
  v4[2] = *MEMORY[0x263EFDF18];
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)thirdPartyTargetsForBundleIdentifier__cn_once_object_3;
  thirdPartyTargetsForBundleIdentifier__cn_once_object_3 = v2;
}

uint64_t __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v10 = a2;
  id v3 = [*(id *)(a1 + 32) activityTypes];
  id v4 = sIntentForActionType_block_invoke((uint64_t)v3, (void *)v10);
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    if (!(v10 | *MEMORY[0x263EFDEF8]) || objc_msgSend((id)v10, "isEqual:"))
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = +[CNUIUserActionTarget targetForStartAudioCallIntentWithAppProxy:*(void *)(a1 + 32)];
LABEL_11:
      id v8 = (void *)v7;
      [v6 addObject:v7];

      goto LABEL_12;
    }
    if (!(v10 | *MEMORY[0x263EFDF38]) || objc_msgSend((id)v10, "isEqual:"))
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = +[CNUIUserActionTarget targetForStartVideoCallIntentWithAppProxy:*(void *)(a1 + 32)];
      goto LABEL_11;
    }
    if (!(v10 | *MEMORY[0x263EFDF18]) || objc_msgSend((id)v10, "isEqual:"))
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = +[CNUIUserActionTarget targetForSendMessageIntentWithAppProxy:*(void *)(a1 + 32)];
      goto LABEL_11;
    }
  }
LABEL_12:
  return MEMORY[0x270F9A758]();
}

+ (id)applicationProxiesForIntent:(id)a3 applicationWorkspace:(id)a4
{
  int v5 = [a4 applicationsForUserActivityType:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__CNUIUserActionTargetDiscovering_applicationProxiesForIntent_applicationWorkspace___block_invoke;
  v8[3] = &__block_descriptor_40_e28_B16__0__CNApplicationProxy_8l;
  void v8[4] = a1;
  id v6 = objc_msgSend(v5, "_cn_filter:", v8);

  return v6;
}

uint64_t __84__CNUIUserActionTargetDiscovering_applicationProxiesForIntent_applicationWorkspace___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldIgnoreApplicationProxy:a2] ^ 1;
}

+ (BOOL)shouldIgnoreApplicationProxy:(id)a3
{
  id v3 = [a3 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.internal.suiuntool"];

  return v4;
}

+ (BOOL)isSkypeAvailableWithEnvironment:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263F33698] standardPreferences];
  int v5 = [v4 userHasOptedInToPreference:@"SkypeURLActions"];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F334B0];
    uint64_t v7 = [v3 applicationsAvailableForHandlingURLScheme:@"skype"];
    int v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (CNTUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNMCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (CNCapabilities)capabilities
{
  return self->_capabilities;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNSchedulerProvider)highLatencySchedulerProvider
{
  return self->_highLatencySchedulerProvider;
}

- (CNUIUserActionTargetDiscoveryCache)cache
{
  return self->_cache;
}

- (NSDictionary)defaultMessagingAppsBundleIdentifierScorerCache
{
  return self->_defaultMessagingAppsBundleIdentifierScorerCache;
}

- (void)setDefaultMessagingAppsBundleIdentifierScorerCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMessagingAppsBundleIdentifierScorerCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_highLatencySchedulerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
}

- (void)resetTargetsForActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "resetTargetsForActionType %{public}@", (uint8_t *)&v2, 0xCu);
}

@end