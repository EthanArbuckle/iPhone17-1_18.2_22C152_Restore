@interface CNContactChangesNotifier
+ (CNContactChangesObserverProxy)createProxyForObserver:(void *)a3 keysToFetch:;
+ (id)os_log;
+ (id)sharedNotifier;
+ (id)workQueue_createFetchersFromRegisteredObservers:(id)a3;
- (BOOL)resourceLock_removeProxiesForIdentifier:(void *)a3 passingTest:;
- (CNContactChangesNotifier)init;
- (CNContactChangesNotifier)initWithContactStore:(id)a3 downstreamScheduler:(id)a4 schedulerProvider:(id)a5;
- (void)contactStoreDidChange:(id)a3;
- (void)registerObserver:(id)a3 forContact:(id)a4;
- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5;
- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5 completionHandler:(id)a6;
- (void)registerProxy:(void *)a3 identifier:;
- (void)removeEntriesWithoutObservers;
- (void)removeProxiesForObserver:(void *)a3 forContact:(void *)a4 completionHandler:;
- (void)timerDidEmitEvent:(id)a3;
- (void)unregisterObserver:(id)a3 forContact:(id)a4;
- (void)unregisterObserver:(id)a3 forContact:(id)a4 completionHandler:(id)a5;
- (void)workQueue_updateObservers;
- (void)workQueue_updateObserving;
@end

@implementation CNContactChangesNotifier

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_3;
  v5[3] = &unk_1E56B7DC0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:](v4, a2, v5);
}

- (BOOL)resourceLock_removeProxiesForIdentifier:(void *)a3 passingTest:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(void **)(a1 + 56);
    id v7 = a3;
    v8 = [v6 objectsForKey:v5];
    v9 = objc_msgSend(v8, "_cn_partition:", v7);

    v10 = [v9 second];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [v8 count];
    BOOL v13 = v11 == v12;
    BOOL v14 = v11 != v12;
    if (v13)
    {
      objc_opt_class();
      v17 = +[CNContactChangesNotifier os_log]();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:](v8, v17);
      }
    }
    else
    {
      uint64_t v15 = [v10 count];
      v16 = *(void **)(a1 + 56);
      if (v15) {
        [v16 setObjects:v10 forKey:v5];
      }
      else {
        [v16 removeObjectsForKey:v5];
      }
      v17 = [v9 first];
      [v17 _cn_each:&__block_literal_global_45];
      objc_opt_class();
      v18 = +[CNContactChangesNotifier os_log]();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:](v17, v10, v18);
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_1_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_97);
  }
  v0 = (void *)os_log_cn_once_object_1_1;

  return v0;
}

- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5
{
}

void __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke_2(uint64_t a1)
{
}

- (void)unregisterObserver:(id)a3 forContact:(id)a4
{
}

uint64_t __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    v3 = *(void **)(v2 + 56);
  }
  else {
    v3 = 0;
  }
  [v3 addObject:a1[5] forKey:a1[6]];
  uint64_t v4 = a1[4];
  if (v4) {
    id v5 = *(void **)(v4 + 24);
  }
  else {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke_2;
  v7[3] = &unk_1E56B4530;
  v7[4] = a1[4];
  return [v5 performBlock:v7 qualityOfService:2];
}

- (CNContactChangesNotifier)initWithContactStore:(id)a3 downstreamScheduler:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNContactChangesNotifier;
  uint64_t v12 = [(CNContactChangesNotifier *)&v24 init];
  BOOL v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    uint64_t v14 = [v11 newSerialSchedulerWithName:@"com.apple.Contacts.CNContactChangesNotifier.workQueue"];
    workQueue = v13->_workQueue;
    v13->_workQueue = (CNScheduler *)v14;

    objc_storeStrong((id *)&v13->_downstream, a4);
    uint64_t v16 = [v11 newSynchronousSerialSchedulerWithName:@"com.apple.Contacts.CNContactChangesNotifier.resourceLock"];
    resourceLock = v13->_resourceLock;
    v13->_resourceLock = (CNScheduler *)v16;

    uint64_t v18 = [MEMORY[0x1E4F5A460] multiDictionary];
    registeredObservers = v13->_registeredObservers;
    v13->_registeredObservers = (CNMutableMultiDictionary *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F5A370]) initWithDelay:0 options:v13 delegate:1.0];
    entryCompactionTimer = v13->_entryCompactionTimer;
    v13->_entryCompactionTimer = (CNCoalescingTimer *)v20;

    v22 = v13;
  }

  return v13;
}

- (void)removeProxiesForObserver:(void *)a3 forContact:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(void **)(a1 + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke;
    v11[3] = &unk_1E56B7E10;
    id v12 = v8;
    uint64_t v13 = a1;
    id v14 = v7;
    id v15 = v9;
    [v10 performBlock:v11];
  }
}

- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    char v14 = [v11 hasBeenPersisted];
    if (v10)
    {
      if (v14)
      {
        +[CNContactChangesNotifier createProxyForObserver:keysToFetch:]((uint64_t)CNContactChangesNotifier, v10, v12);
        id v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v11 identifier];
        -[CNContactChangesNotifier registerProxy:identifier:]((uint64_t)self, v15, v16);

        v17 = [v11 snapshot];
        -[CNContactChangesObserverProxy setContactSnapshot:]((uint64_t)v15, v17);

        char v18 = [v11 isUnified];
        if (v15) {
          v15[8] = v18;
        }
        if (v13)
        {
          if (self) {
            self = (CNContactChangesNotifier *)self->_downstream;
          }
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke_2;
          v19[3] = &unk_1E56B5CA8;
          id v20 = v13;
          [(CNContactChangesNotifier *)self performBlock:v19];
        }
LABEL_14:

        goto LABEL_15;
      }
    }
  }
  if (v13)
  {
    if (self) {
      self = (CNContactChangesNotifier *)self->_downstream;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke;
    v21[3] = &unk_1E56B5CA8;
    v22 = v13;
    [(CNContactChangesNotifier *)self performBlock:v21];
    id v15 = v22;
    goto LABEL_14;
  }
LABEL_15:
}

- (void)registerProxy:(void *)a3 identifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(void **)(a1 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke;
    v8[3] = &unk_1E56B4508;
    v8[4] = a1;
    id v9 = v5;
    id v10 = v6;
    [v7 performBlock:v8];
  }
}

- (void)workQueue_updateObserving
{
  if (a1)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0;
    id v2 = *(id *)(a1 + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__CNContactChangesNotifier_workQueue_updateObserving__block_invoke;
    v5[3] = &unk_1E56B3F48;
    void v5[4] = a1;
    v5[5] = &v6;
    [v2 performBlock:v5];

    if (v7[3])
    {
      if (!*(unsigned char *)(a1 + 8))
      {
        v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v3 addObserver:a1 selector:sel_contactStoreDidChange_ name:@"CNContactStoreDidChangeNotification" object:0];
        char v4 = 1;
LABEL_7:

        *(unsigned char *)(a1 + 8) = v4;
      }
    }
    else if (*(unsigned char *)(a1 + 8))
    {
      v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 removeObserver:a1 name:@"CNContactStoreDidChangeNotification" object:0];
      char v4 = 0;
      goto LABEL_7;
    }
    _Block_object_dispose(&v6, 8);
  }
}

+ (CNContactChangesObserverProxy)createProxyForObserver:(void *)a3 keysToFetch:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = objc_alloc_init(CNContactChangesObserverProxy);
  id v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_observer, v4);
  }
  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v7, v5);

  return v7;
}

- (void)unregisterObserver:(id)a3 forContact:(id)a4 completionHandler:(id)a5
{
}

void __53__CNContactChangesNotifier_workQueue_updateObserving__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[7];
  }
  v3 = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  objc_super v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) identifier];
    v27[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      id v5 = (void *)v5[7];
    }
    v3 = v5;
    uint64_t v4 = [v3 allKeys];
  }
  uint64_t v6 = (void *)v4;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_2;
  v20[3] = &unk_1E56B7DE8;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  v22 = &v23;
  v20[4] = v7;
  id v21 = v8;
  objc_msgSend(v6, "_cn_each:", v20);
  if (*((unsigned char *)v24 + 24))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      uint64_t v9 = (void *)v9[3];
    }
    id v10 = v9;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_4;
    v19[3] = &unk_1E56B4530;
    void v19[4] = *(void *)(a1 + 40);
    [v10 performBlock:v19 qualityOfService:2];

    if (*(void *)(a1 + 56))
    {
      id v11 = *(void **)(a1 + 40);
      if (v11) {
        id v11 = (void *)v11[4];
      }
      id v12 = v11;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_5;
      v17[3] = &unk_1E56B5CA8;
      id v18 = *(id *)(a1 + 56);
      [v12 performBlock:v17];
    }
  }
  else if (*(void *)(a1 + 56))
  {
    id v13 = *(void **)(a1 + 40);
    if (v13) {
      id v13 = (void *)v13[4];
    }
    char v14 = v13;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_6;
    v15[3] = &unk_1E56B5CA8;
    id v16 = *(id *)(a1 + 56);
    [v14 performBlock:v15];
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __34__CNContactChangesNotifier_os_log__block_invoke()
{
  os_log_cn_once_object_1_1 = (uint64_t)os_log_create("com.apple.contacts", "notifications");

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedNotifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CNContactChangesNotifier_sharedNotifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNotifier_cn_once_token_0 != -1) {
    dispatch_once(&sharedNotifier_cn_once_token_0, block);
  }
  id v2 = (void *)sharedNotifier_cn_once_object_0;

  return v2;
}

uint64_t __42__CNContactChangesNotifier_sharedNotifier__block_invoke(uint64_t a1)
{
  sharedNotifier_cn_once_object_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CNContactChangesNotifier)init
{
  v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  uint64_t v4 = objc_alloc_init(CNContactStore);
  id v5 = [v3 mainThreadScheduler];
  uint64_t v6 = [(CNContactChangesNotifier *)self initWithContactStore:v4 downstreamScheduler:v5 schedulerProvider:v3];

  return v6;
}

- (void)registerObserver:(id)a3 forContact:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 availableKeyDescriptor];
  v10[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(CNContactChangesNotifier *)self registerObserver:v7 forContact:v6 keysToFetch:v9];
}

void __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28588];
  v5[0] = @"contact and observer can't be nil and contact needs to be persisted";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = +[CNErrorFactory errorWithCode:1002 userInfo:v2];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

uint64_t __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 16));
  if (!WeakRetained) {
    return 1;
  }
  BOOL v4 = WeakRetained == *(id *)(a1 + 32);

  return v4;
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_4(uint64_t a1)
{
}

uint64_t __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_6(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F28588];
  v5[0] = @"The observer to be unregistered hasn't been found.";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = +[CNErrorFactory errorWithCode:1003 userInfo:v2];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

id __80__CNContactChangesNotifier_resourceLock_removeProxiesForIdentifier_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return objc_storeWeak((id *)(a2 + 16), 0);
  }
  return result;
}

- (void)removeEntriesWithoutObservers
{
  objc_opt_class();
  v3 = +[CNContactChangesNotifier os_log]();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1909E3000, v3, OS_LOG_TYPE_INFO, "Scheduling removal of entries without observers", v4, 2u);
  }

  [(CNCoalescingTimer *)self->_entryCompactionTimer handleEvent];
}

- (void)timerDidEmitEvent:(id)a3
{
  objc_opt_class();
  uint64_t v4 = +[CNContactChangesNotifier os_log]();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_INFO, "Will remove entries without observers", buf, 2u);
  }

  -[CNContactChangesNotifier removeProxiesForObserver:forContact:completionHandler:]((uint64_t)self, 0, 0, 0);
  objc_opt_class();
  id v5 = +[CNContactChangesNotifier os_log]();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Did remove entries without observers", v6, 2u);
  }
}

- (void)contactStoreDidChange:(id)a3
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CNContactChangesNotifier_contactStoreDidChange___block_invoke;
  v4[3] = &unk_1E56B4530;
  v4[4] = self;
  [(CNScheduler *)workQueue performBlock:v4];
}

void __50__CNContactChangesNotifier_contactStoreDidChange___block_invoke(uint64_t a1)
{
}

- (void)workQueue_updateObservers
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v49 = *(id *)(a1 + 40);
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__25;
    v83 = __Block_byref_object_dispose__25;
    id v84 = 0;
    id v2 = *(id *)(a1 + 16);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke;
    v78[3] = &unk_1E56B3F48;
    v78[5] = &v79;
    uint64_t v53 = a1;
    v78[4] = a1;
    [v2 performBlock:v78];

    v3 = objc_msgSend((id)objc_opt_class(), "workQueue_createFetchersFromRegisteredObservers:", v80[5]);
    v50 = [MEMORY[0x1E4F1CA80] set];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v4)
    {
      uint64_t v51 = *(void *)v75;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v74 + 1) + 8 * v5);
          if (v6) {
            id v7 = *(void **)(v6 + 16);
          }
          else {
            id v7 = 0;
          }
          id v8 = v7;
          uint64_t v9 = [v8 allObjects];
          id v10 = +[CNContact predicateForContactsWithIdentifiers:v9];

          id v11 = [CNContactFetchRequest alloc];
          if (v6) {
            id v12 = *(void **)(v6 + 24);
          }
          else {
            id v12 = 0;
          }
          id v13 = v12;
          char v14 = [v13 allObjects];
          id v15 = [(CNContactFetchRequest *)v11 initWithKeysToFetch:v14];

          [(CNContactFetchRequest *)v15 setPredicate:v10];
          if (v6) {
            BOOL v16 = *(unsigned char *)(v6 + 8) != 0;
          }
          else {
            BOOL v16 = 0;
          }
          [(CNContactFetchRequest *)v15 setUnifyResults:v16];
          v17 = [MEMORY[0x1E4F1CA48] array];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          if (v6) {
            id v18 = *(void **)(v6 + 16);
          }
          else {
            id v18 = 0;
          }
          id v19 = v18;
          id v20 = [v19 allObjects];

          uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v87 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v71;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v71 != v22) {
                  objc_enumerationMutation(v20);
                }
                objc_super v24 = [(id)v80[5] objectsForKey:*(void *)(*((void *)&v70 + 1) + 8 * i)];
                if (v24) {
                  [v17 addObjectsFromArray:v24];
                }
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v87 count:16];
            }
            while (v21);
          }

          id v25 = *(id *)(v53 + 32);
          id v26 = *(id *)(v53 + 16);
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_62;
          v65[3] = &unk_1E56B7E58;
          id v27 = v17;
          id v66 = v27;
          id v67 = v50;
          id v28 = v25;
          id v68 = v28;
          id v29 = v26;
          id v69 = v29;
          [v49 enumerateContactsWithFetchRequest:v15 error:0 usingBlock:v65];

          ++v5;
        }
        while (v5 != v4);
        uint64_t v30 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
        uint64_t v4 = v30;
      }
      while (v30);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v31 = [(id)v80[5] allKeys];
    uint64_t v48 = [v31 countByEnumeratingWithState:&v61 objects:v86 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v62;
      v44 = v55;
      id v45 = v31;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v62 != v47) {
            objc_enumerationMutation(v45);
          }
          uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8 * j);
          if ((objc_msgSend(v50, "containsObject:", v32, v44) & 1) == 0)
          {
            v33 = [(id)v80[5] objectsForKey:v32];
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v34 = v33;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v85 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v58;
              do
              {
                uint64_t v37 = 0;
                do
                {
                  if (*(void *)v58 != v36) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8 * v37);
                  if (v38) {
                    id WeakRetained = objc_loadWeakRetained((id *)(v38 + 16));
                  }
                  else {
                    id WeakRetained = 0;
                  }
                  char v40 = objc_opt_respondsToSelector();

                  if (v40)
                  {
                    id v41 = *(id *)(v53 + 32);
                    v56[0] = MEMORY[0x1E4F143A8];
                    v56[1] = 3221225472;
                    v56[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_4;
                    v56[3] = &unk_1E56B4508;
                    v56[4] = v53;
                    v56[5] = v38;
                    v56[6] = v32;
                    [v41 performBlock:v56];
                  }
                  ++v37;
                }
                while (v35 != v37);
                uint64_t v42 = [v34 countByEnumeratingWithState:&v57 objects:v85 count:16];
                uint64_t v35 = v42;
              }
              while (v42);
            }

            id v43 = *(id *)(v53 + 16);
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v55[0] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_6;
            v55[1] = &unk_1E56B3DC8;
            v55[2] = v53;
            v55[3] = v32;
            [v43 performBlock:v54];
          }
        }
        v31 = v45;
        uint64_t v48 = [v45 countByEnumeratingWithState:&v61 objects:v86 count:16];
      }
      while (v48);
    }

    _Block_object_dispose(&v79, 8);
  }
}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[7];
  }
  uint64_t v6 = v2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    uint64_t v30 = a1;
    uint64_t v31 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * v8);
        uint64_t v5 = _block_invoke_0(v5, v3, (void *)v9);
        if (v5)
        {
          id v10 = *(void **)(a1 + 40);
          if (v9)
          {
            id v11 = *(id *)(v9 + 32);
            id v12 = [v11 identifier];
            [v10 addObject:v12];

            id v13 = v3;
            id v14 = *(id *)(v9 + 32);
            uint64_t v15 = *(void *)(v9 + 24);
          }
          else
          {
            id v28 = [0 identifier];
            [v10 addObject:v28];

            id v29 = v3;
            id v14 = 0;
            uint64_t v15 = 0;
          }
          if ([v14 areKeysAvailable:v15])
          {
            id v16 = v4;
            v17 = [v3 keyVector];
            id v18 = [v14 keyVector];
            if ([v17 isEqualToKeyVector:v18])
            {
              id v19 = v3;
            }
            else
            {
              if (v9) {
                id v20 = *(void **)(v9 + 24);
              }
              else {
                id v20 = 0;
              }
              id v21 = v20;
              id v19 = (id)[v3 copyWithPropertyKeys:v21];

              if (v9) {
                uint64_t v22 = *(void **)(v9 + 24);
              }
              else {
                uint64_t v22 = 0;
              }
              id v23 = v22;
              uint64_t v24 = [v14 copyWithPropertyKeys:v23];

              id v14 = (id)v24;
              a1 = v30;
            }
            char v25 = [v19 isEqual:v14];

            id v4 = v16;
            uint64_t v7 = v31;
            if ((v25 & 1) == 0)
            {
LABEL_19:
              id v26 = [v19 snapshot];
              -[CNContactChangesObserverProxy setContactSnapshot:](v9, v26);

              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_2;
              v33[3] = &unk_1E56B4508;
              id v27 = *(void **)(a1 + 48);
              id v34 = *(id *)(a1 + 56);
              uint64_t v35 = v9;
              id v19 = v19;
              id v36 = v19;
              [v27 performBlock:v33];
            }
            uint64_t v6 = v32;
            goto LABEL_21;
          }
          id v19 = v3;
          goto LABEL_19;
        }
LABEL_21:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_2(void *a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__25;
  uint64_t v8 = __Block_byref_object_dispose__25;
  id v9 = 0;
  id v2 = (void *)a1[4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_3;
  v3[3] = &unk_1E56B3F48;
  v3[4] = a1[5];
  v3[5] = &v4;
  [v2 performBlock:v3];
  [(id)v5[5] contactDidChange:a1[6]];
  _Block_object_dispose(&v4, 8);
}

uint64_t __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = WeakRetained;

  return MEMORY[0x1F41817F8]();
}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_4(void *a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__25;
  id v9 = __Block_byref_object_dispose__25;
  id v10 = 0;
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[2];
  }
  id v3 = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_5;
  v4[3] = &unk_1E56B3F48;
  v4[4] = a1[5];
  void v4[5] = &v5;
  [v3 performBlock:v4];

  [(id)v6[5] contactWithIdentifierWasDeleted:a1[6]];
  _Block_object_dispose(&v5, 8);
}

uint64_t __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = WeakRetained;

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[7];
  }
  return [v1 removeObjectsForKey:*(void *)(a1 + 40)];
}

+ (id)workQueue_createFetchersFromRegisteredObservers:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
  id v36 = v3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [v3 allKeys];
  uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v37)
  {
    uint64_t v34 = *(void *)v49;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v4;
        uint64_t v5 = *(void *)(*((void *)&v48 + 1) + 8 * v4);
        uint64_t v6 = [v36 objectsForKey:v5];
        uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          char v11 = 0;
          uint64_t v12 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v45 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              if (v14)
              {
                id v15 = *(id *)(v14 + 24);
                if (v15) {
                  [v7 addObjectsFromArray:v15];
                }
                LOBYTE(v14) = *(unsigned char *)(v14 + 8) != 0;
              }
              v11 |= v14;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v10);
        }
        else
        {
          char v11 = 0;
        }
        uint64_t v38 = v5;

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v16 = v35;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v41;
          while (2)
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v41 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * v20);
              if (v21) {
                uint64_t v22 = *(void **)(v21 + 24);
              }
              else {
                uint64_t v22 = 0;
              }
              id v23 = v22;
              if ([v23 isEqual:v7])
              {
                if (v21)
                {
                  char v24 = v11 ^ (*(unsigned char *)(v21 + 8) != 0);

                  if ((v24 & 1) == 0)
                  {
                    id v27 = *(void **)(v21 + 16);
                    goto LABEL_38;
                  }
                }
                else
                {

                  if ((v11 & 1) == 0)
                  {
                    id v27 = 0;
LABEL_38:
                    uint64_t v26 = v38;
                    id v28 = [v27 setByAddingObject:v38];
                    -[CNContactChangesFetcher setIdentifiers:](v21, v28);
                    id v29 = (CNContactChangesFetcher *)(id)v21;

                    if (v21) {
                      goto LABEL_42;
                    }
                    goto LABEL_39;
                  }
                }
              }
              else
              {
              }
              ++v20;
            }
            while (v18 != v20);
            uint64_t v25 = [v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
            uint64_t v18 = v25;
            if (v25) {
              continue;
            }
            break;
          }
        }

        uint64_t v26 = v38;
LABEL_39:
        id v29 = objc_alloc_init(CNContactChangesFetcher);
        uint64_t v30 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
        -[CNContactChangesFetcher setIdentifiers:]((uint64_t)v29, v30);

        -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v29, v7);
        if (v29) {
          v29->_unify = v11 & 1;
        }
        [v16 addObject:v29];
LABEL_42:

        uint64_t v4 = v39 + 1;
      }
      while (v39 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v37);
  }

  uint64_t v31 = (void *)[v35 copy];

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredObservers, 0);
  objc_storeStrong((id *)&self->_entryCompactionTimer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_resourceLock, 0);
}

- (void)resourceLock_removeProxiesForIdentifier:(NSObject *)a3 passingTest:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 count];
  if ([a1 count] == 1) {
    uint64_t v7 = @"entry";
  }
  else {
    uint64_t v7 = @"entries";
  }
  uint64_t v8 = [a2 count];
  int v10 = 134218754;
  if ([a2 count] == 1) {
    uint64_t v9 = @"entry";
  }
  else {
    uint64_t v9 = @"entries";
  }
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_debug_impl(&dword_1909E3000, a3, OS_LOG_TYPE_DEBUG, "Removing %lu %@, keeping %lu %@", (uint8_t *)&v10, 0x2Au);
}

- (void)resourceLock_removeProxiesForIdentifier:(void *)a1 passingTest:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1909E3000, a2, OS_LOG_TYPE_DEBUG, "No entries were removed (total: %lu)", (uint8_t *)&v3, 0xCu);
}

@end