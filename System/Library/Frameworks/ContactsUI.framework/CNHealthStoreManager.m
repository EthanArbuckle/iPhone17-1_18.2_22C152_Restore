@interface CNHealthStoreManager
+ (BOOL)shouldShowEmergencyContacts;
+ (id)descriptorForRequiredKeys;
+ (id)emergencyContactMatchingContact:(id)a3;
+ (id)identifiersForContactMatchingEmergencyContacts:(id)a3 contactStore:(id)a4;
+ (id)log;
- (BOOL)isListeningToChanges;
- (BOOL)needsFetching;
- (CNHealthStoreManager)initWithEnvironment:(id)a3;
- (CNHealthStoreManager)initWithEnvironment:(id)a3 healthStore:(id)a4 medicalIDStore:(id)a5;
- (CNScheduler)stateLock;
- (CNScheduler)workQueue;
- (CNUIContactsEnvironment)environment;
- (HKHealthStore)healthStore;
- (HKMedicalIDStore)medicalIDStore;
- (NSMutableDictionary)medicalIDDataHandlers;
- (_HKMedicalIDData)medicalIDData;
- (id)createMedicalIDFromContact:(id)a3;
- (id)nts_lazyHealthStore;
- (id)nts_lazyMedicalIDStore;
- (id)registerMedicalIDDataHandler:(id)a3;
- (void)dealloc;
- (void)notifyHandlersWithMedicalIDData:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setIsListeningToChanges:(BOOL)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setMedicalIDStore:(id)a3;
- (void)setNeedsFetching:(BOOL)a3;
- (void)startListeningForChanges;
- (void)unregisterHandlerForToken:(id)a3;
- (void)updateAndDispatchMedicalIDData;
@end

@implementation CNHealthStoreManager

void __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 48) copy];
  v2 = _Block_copy(v4);
  v3 = [*(id *)(a1 + 32) medicalIDDataHandlers];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_302(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) medicalIDDataHandlers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)medicalIDDataHandlers
{
  return self->_medicalIDDataHandlers;
}

uint64_t __38__CNHealthStoreManager_medicalIDStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyMedicalIDStore");
}

+ (id)identifiersForContactMatchingEmergencyContacts:(id)a3 contactStore:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = *MEMORY[0x1E4F1AE08];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 nameContactIdentifier];

        if (v14)
        {
          v15 = [v13 nameContactIdentifier];
          uint64_t v28 = v11;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          v17 = [v23 unifiedContactWithIdentifier:v15 keysToFetch:v16 error:0];

          v18 = [v17 allLinkedIdentifiers];
          [v6 addObjectsFromArray:v18];

          v19 = [v13 nameContactIdentifier];
          LOBYTE(v16) = [v6 containsObject:v19];

          if ((v16 & 1) == 0)
          {
            v20 = [v13 nameContactIdentifier];
            [v6 addObject:v20];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  v21 = (void *)[v6 copy];

  return v21;
}

void __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsFetching:", objc_msgSend(*(id *)(a1 + 32), "isListeningToChanges") ^ 1);
  [*(id *)(a1 + 32) setMedicalIDData:*(void *)(a1 + 40)];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__31566;
  uint64_t v11 = __Block_byref_object_dispose__31567;
  id v12 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) stateLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_302;
  v6[3] = &unk_1E549A2F0;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v2 performBlock:v6];

  uint64_t v3 = (void *)v8[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_2;
  v4[3] = &unk_1E5498E70;
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];

  _Block_object_dispose(&v7, 8);
}

void __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke(id *a1)
{
  if (!+[CNHealthStoreManager shouldShowEmergencyContacts])return; {
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  }
  uint64_t v3 = [WeakRetained stateLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke_2;
  v7[3] = &unk_1E549AFF8;
  v7[4] = WeakRetained;
  id v8 = a1[4];
  id v9 = a1[5];
  [v3 performBlock:v7];

  id v4 = [WeakRetained medicalIDData];
  if (v4)
  {

LABEL_5:
    id v5 = (void (**)(id, void *, id))a1[5];
    v6 = [WeakRetained medicalIDData];
    v5[2](v5, v6, a1[4]);

    goto LABEL_6;
  }
  if (([WeakRetained needsFetching] & 1) == 0) {
    goto LABEL_5;
  }
LABEL_6:
  if ([WeakRetained needsFetching]) {
    [WeakRetained updateAndDispatchMedicalIDData];
  }
}

- (BOOL)needsFetching
{
  return self->_needsFetching;
}

- (CNScheduler)stateLock
{
  return self->_stateLock;
}

- (void)setNeedsFetching:(BOOL)a3
{
  self->_needsFetching = a3;
}

- (void)setMedicalIDData:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (BOOL)isListeningToChanges
{
  return self->_isListeningToChanges;
}

+ (BOOL)shouldShowEmergencyContacts
{
  if (!CNUIIsContacts() && !CNUIIsMobilePhone()
    || ![(objc_class *)getHKHealthStoreClass() isHealthDataAvailable])
  {
    return 0;
  }
  Class HKMedicalIDViewControllerClass_31590 = getHKMedicalIDViewControllerClass_31590();

  return [(objc_class *)HKMedicalIDViewControllerClass_31590 isSupportedOnThisDevice];
}

- (void)startListeningForChanges
{
  [(CNHealthStoreManager *)self setIsListeningToChanges:1];
  objc_initWeak(&location, self);
  uint64_t v3 = [(CNHealthStoreManager *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CNHealthStoreManager_startListeningForChanges__block_invoke;
  v4[3] = &unk_1E549B670;
  void v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 performBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setIsListeningToChanges:(BOOL)a3
{
  self->_isListeningToChanges = a3;
}

- (void)notifyHandlersWithMedicalIDData:(id)a3
{
  id v4 = a3;
  id v5 = [(CNHealthStoreManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke;
  v7[3] = &unk_1E549BF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (id)registerMedicalIDDataHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  objc_initWeak(&location, self);
  id v6 = [(CNHealthStoreManager *)self workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke;
  v12[3] = &unk_1E5498E20;
  objc_copyWeak(&v15, &location);
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  [v6 performBlock:v12];

  id v9 = v14;
  id v10 = v7;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (void)updateAndDispatchMedicalIDData
{
  uint64_t v3 = [(CNHealthStoreManager *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke;
  v4[3] = &unk_1E549B488;
  void v4[4] = self;
  [v3 performBlock:v4];
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNHealthStoreManager)initWithEnvironment:(id)a3 healthStore:(id)a4 medicalIDStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNHealthStoreManager;
  id v12 = [(CNHealthStoreManager *)&v23 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v13->_healthStore, a4);
    objc_storeStrong((id *)&v13->_medicalIDStore, a5);
    id v14 = [v9 defaultSchedulerProvider];
    uint64_t v15 = [v14 newSerialSchedulerWithName:@"com.apple.Contacts.CNHealthStoreManager.workQueue"];
    workQueue = v13->_workQueue;
    v13->_workQueue = (CNScheduler *)v15;

    v13->_needsFetching = 1;
    v17 = [v9 defaultSchedulerProvider];
    uint64_t v18 = [v17 newSynchronousSerialSchedulerWithName:@"com.apple.Contacts.CNHealthStoreManager.stateLock"];
    stateLock = v13->_stateLock;
    v13->_stateLock = (CNScheduler *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    medicalIDDataHandlers = v13->_medicalIDDataHandlers;
    v13->_medicalIDDataHandlers = (NSMutableDictionary *)v20;
  }
  return v13;
}

- (CNHealthStoreManager)initWithEnvironment:(id)a3
{
  return [(CNHealthStoreManager *)self initWithEnvironment:a3 healthStore:0 medicalIDStore:0];
}

uint64_t __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, *(void *)(a1 + 32), a2);
}

- (id)nts_lazyMedicalIDStore
{
  medicalIDStore = self->_medicalIDStore;
  if (!medicalIDStore)
  {
    id v4 = [(CNHealthStoreManager *)self nts_lazyHealthStore];
    id v5 = (HKMedicalIDStore *)[objc_alloc(getHKMedicalIDStoreClass()) initWithHealthStore:self->_healthStore];
    id v6 = self->_medicalIDStore;
    self->_medicalIDStore = v5;

    medicalIDStore = self->_medicalIDStore;
  }

  return medicalIDStore;
}

- (id)nts_lazyHealthStore
{
  healthStore = self->_healthStore;
  if (!healthStore)
  {
    id v4 = (HKHealthStore *)objc_alloc_init(getHKHealthStoreClass());
    id v5 = self->_healthStore;
    self->_healthStore = v4;

    healthStore = self->_healthStore;
  }

  return healthStore;
}

void __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) medicalIDStore];
  uint64_t v3 = [v2 medicalIDSetUpStatus];

  if (v3 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 notifyHandlersWithMedicalIDData:0];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v5 = [*(id *)(a1 + 32) medicalIDStore];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke_2;
    v6[3] = &unk_1E5498E48;
    objc_copyWeak(&v7, &location);
    [v5 fetchMedicalIDDataWithCompletion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (HKMedicalIDStore)medicalIDStore
{
  uint64_t v2 = cn_objectResultWithObjectLock();

  return (HKMedicalIDStore *)v2;
}

void __48__CNHealthStoreManager_startListeningForChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = (const char *)getkHKMedicalIDDidChangeNotification();
  uint64_t v3 = (int *)(*(void *)(a1 + 32) + 8);
  id v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__CNHealthStoreManager_startListeningForChanges__block_invoke_2;
  handler[3] = &unk_1E5498E98;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  notify_register_dispatch(v2, v3, v4, handler);

  objc_destroyWeak(&v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_medicalIDDataHandlers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)setEnvironment:(id)a3
{
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setMedicalIDStore:(id)a3
{
}

- (void)setHealthStore:(id)a3
{
}

- (id)createMedicalIDFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNHealthStoreManager *)self healthStore];
  id v6 = [v5 createMedicalIDData];

  [v6 loadDataFromCNContact:v4];

  return v6;
}

void __48__CNHealthStoreManager_startListeningForChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAndDispatchMedicalIDData];
}

void __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained notifyHandlersWithMedicalIDData:v5];
  }
  else
  {
    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch Medical ID: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)unregisterHandlerForToken:(id)a3
{
  id v4 = a3;
  id v5 = [(CNHealthStoreManager *)self stateLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNHealthStoreManager_unregisterHandlerForToken___block_invoke;
  v7[3] = &unk_1E549BF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __50__CNHealthStoreManager_unregisterHandlerForToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) medicalIDDataHandlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (HKHealthStore)healthStore
{
  id v2 = cn_objectResultWithObjectLock();

  return (HKHealthStore *)v2;
}

uint64_t __35__CNHealthStoreManager_healthStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyHealthStore");
}

- (void)dealloc
{
  notify_cancel(self->_healthNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CNHealthStoreManager;
  [(CNHealthStoreManager *)&v3 dealloc];
}

+ (id)emergencyContactMatchingContact:(id)a3
{
  objc_super v3 = [a3 allLinkedIdentifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CNHealthStoreManager_emergencyContactMatchingContact___block_invoke;
  v7[3] = &unk_1E5498DF8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)[v7 copy];

  return v5;
}

uint64_t __56__CNHealthStoreManager_emergencyContactMatchingContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameContactIdentifier];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 nameContactIdentifier];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4, &__block_literal_global_284);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_4;

  return v2;
}

void __49__CNHealthStoreManager_descriptorForRequiredKeys__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  id v4 = [(Class)get_HKMedicalIDDataClass[0]() contactKeysToLoadForMedicalID];
  v1 = [NSString stringWithUTF8String:"+[CNHealthStoreManager descriptorForRequiredKeys]_block_invoke"];
  uint64_t v2 = [v0 descriptorWithKeyDescriptors:v4 description:v1];
  id v3 = (void *)descriptorForRequiredKeys_cn_once_object_4;
  descriptorForRequiredKeys_cn_once_object_4 = v2;
}

+ (id)log
{
  if (log_cn_once_token_3[0] != -1) {
    dispatch_once(log_cn_once_token_3, &__block_literal_global_31603);
  }
  uint64_t v2 = (void *)log_cn_once_object_3;

  return v2;
}

void __27__CNHealthStoreManager_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNHealthStoreManager");
  v1 = (void *)log_cn_once_object_3;
  log_cn_once_object_3 = (uint64_t)v0;
}

@end