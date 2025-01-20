@interface ASContactsManager
- (ASContactsManager)initWithIsWatch:(BOOL)a3;
- (NSSet)contacts;
- (NSSet)legacyContacts;
- (NSSet)placeholderContacts;
- (NSSet)secureCloudContacts;
- (id)_contactStoreContactWithIdentifier:(id)a3;
- (id)_findMatchingContactStoreContactForDestinations:(id)a3;
- (id)_queue_allContacts;
- (id)_queue_contactsForCloudType:(unint64_t)a3;
- (id)contactMatchingCriteriaBlock:(id)a3;
- (id)contactWithDestinations:(id)a3;
- (id)contactWithUUID:(id)a3;
- (id)createContactWithDestinations:(id)a3;
- (id)createContactWithDestinations:(id)a3 relationshipIdentifier:(id)a4;
- (id)placeholderContactWithUUID:(id)a3;
- (id)savePlaceholderContact:(id)a3;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)_persistContacts:(id)a3;
- (void)_queue_notifyObservers;
- (void)_setContacts:(id)a3 waitForTransaction:(BOOL)a4;
- (void)_waitForTransaction;
- (void)addObserver:(id)a3;
- (void)loadCachedContacts;
- (void)removeAllPlaceholderContacts;
- (void)removeObserver:(id)a3;
- (void)removePlaceholderContactWithToken:(id)a3;
- (void)saveContact:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContactsUsingTransaction:(id)a3;
@end

@implementation ASContactsManager

void __29__ASContactsManager_contacts__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_allContacts");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (ASSecureCloudEnabled())
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v8 copyItems:1];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  else
  {
    v4 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_3);
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v4 copyItems:1];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __40__ASContactsManager_placeholderContacts__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = _TopPlaceholderContactInPlaceholderArray(*(void **)(*((void *)&v11 + 1) + 8 * v6));
        if (v7)
        {
          uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setByAddingObject:v7];
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (NSSet)placeholderContacts
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  long long v11 = __Block_byref_object_dispose__2;
  id v12 = [MEMORY[0x263EFFA08] set];
  contactsQueue = self->_contactsQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ASContactsManager_placeholderContacts__block_invoke;
  v6[3] = &unk_2652161B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(contactsQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (NSSet)contacts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  contactsQueue = self->_contactsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__ASContactsManager_contacts__block_invoke;
  v5[3] = &unk_2652161B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(contactsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)_queue_allContacts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contactsQueue);
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(NSMutableDictionary *)self->_contactsByUUID allValues];
  uint64_t v5 = [v3 setWithArray:v4];

  return v5;
}

- (ASContactsManager)initWithIsWatch:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)ASContactsManager;
  id v3 = [(ASContactsManager *)&v23 init];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEA68]);
    uint64_t v5 = (void *)tcc_identity_create();
    [v4 setAssumedIdentity:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v4];
    contactStore = v3->_contactStore;
    v3->_contactStore = (CNContactStore *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    contactsByUUID = v3->_contactsByUUID;
    v3->_contactsByUUID = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    placeholderContactsByUUID = v3->_placeholderContactsByUUID;
    v3->_placeholderContactsByUUID = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v12;

    uint64_t v14 = HKCreateConcurrentDispatchQueue();
    contactsQueue = v3->_contactsQueue;
    v3->_contactsQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = HKCreateConcurrentDispatchQueue();
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = HKCreateSerialDispatchQueue();
    persistQueue = v3->_persistQueue;
    v3->_persistQueue = (OS_dispatch_queue *)v18;

    dispatch_group_t v20 = dispatch_group_create();
    contactsTransactionBarrier = v3->_contactsTransactionBarrier;
    v3->_contactsTransactionBarrier = (OS_dispatch_group *)v20;
  }
  return v3;
}

- (void)loadCachedContacts
{
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ContactsManager loading cached contacts", buf, 2u);
  }
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ASContactsManager_loadCachedContacts__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_barrier_sync(contactsQueue, block);
}

void __39__ASContactsManager_loadCachedContacts__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  id v3 = (os_log_t *)MEMORY[0x263F23AE0];
  if (v2)
  {
    ASLoggingInitialize();
    id v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      __39__ASContactsManager_loadCachedContacts__block_invoke_cold_1(v4);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  }
  ASLoggingInitialize();
  uint64_t v5 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ContactsManager deleting legacy contacts", buf, 2u);
  }
  ASDeleteDeprecatedContactsCache();
  ASReadContactsFromDiskCache();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    id v28 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x24C557C30]();
        long long v13 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v14 = [v11 UUID];
        [v13 setObject:v11 forKeyedSubscript:v14];

        v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v11 linkedContactStoreIdentifier];
        v17 = [v15 _contactStoreContactWithIdentifier:v16];

        if (v17)
        {
          uint64_t v18 = ASShortNameForContactStoreContact();
          [v11 setShortName:v18];

          v19 = ASFullNameForContactStoreContact();
          [v11 setFullName:v19];
        }
        ASLoggingInitialize();
        os_log_t v20 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
        {
          v21 = v20;
          [v11 UUID];
          objc_super v23 = v22 = v3;
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = (uint64_t)v23;
          __int16 v35 = 2112;
          v36 = v11;
          _os_log_debug_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEBUG, "ContactsManager initialized cached contact: %{public}@ - %@", buf, 0x16u);

          id v3 = v22;
          id v6 = v28;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }

  ASLoggingInitialize();
  os_log_t v24 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(void **)(*(void *)(a1 + 32) + 16);
    v26 = v24;
    uint64_t v27 = [v25 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v27;
    _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "ContactsManager loaded %lu cached contacts", buf, 0xCu);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ASContactsManager_addObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __33__ASContactsManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ASContactsManager_removeObserver___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __36__ASContactsManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

BOOL __29__ASContactsManager_contacts__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cloudType] == 0;
}

- (NSSet)legacyContacts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  contactsQueue = self->_contactsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__ASContactsManager_legacyContacts__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(contactsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __35__ASContactsManager_legacyContacts__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_contactsForCloudType:", 0);
  return MEMORY[0x270F9A758]();
}

- (NSSet)secureCloudContacts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  contactsQueue = self->_contactsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ASContactsManager_secureCloudContacts__block_invoke;
  v5[3] = &unk_265215FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(contactsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __40__ASContactsManager_secureCloudContacts__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_contactsForCloudType:", 1);
  return MEMORY[0x270F9A758]();
}

- (id)_queue_contactsForCloudType:(unint64_t)a3
{
  id v4 = [(ASContactsManager *)self _queue_allContacts];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ASContactsManager__queue_contactsForCloudType___block_invoke;
  v8[3] = &__block_descriptor_40_e19_B16__0__ASContact_8l;
  v8[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "hk_filter:", v8);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v5 copyItems:1];

  return v6;
}

BOOL __49__ASContactsManager__queue_contactsForCloudType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cloudType] == *(void *)(a1 + 32);
}

- (void)setContacts:(id)a3
{
}

- (id)contactWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ASContactsManager_contactWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(contactsQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__ASContactsManager_contactWithUUID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)placeholderContactWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ASContactsManager_placeholderContactWithUUID___block_invoke;
  block[3] = &unk_265216070;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(contactsQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__ASContactsManager_placeholderContactWithUUID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = _TopPlaceholderContactInPlaceholderArray(v5);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)contactMatchingCriteriaBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ASContactsManager_contactMatchingCriteriaBlock___block_invoke;
  block[3] = &unk_265216598;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  dispatch_sync(contactsQueue, block);
  id v7 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__ASContactsManager_contactMatchingCriteriaBlock___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 16), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((*(unsigned int (**)(void))(a1[5] + 16))())
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)contactWithDestinations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASContactsManager *)self contacts];
  id v6 = ASFindContactWithDestinationsInContacts(v4, v5);

  return v6;
}

- (id)createContactWithDestinations:(id)a3
{
  id v4 = a3;
  ASLoggingInitialize();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEBUG)) {
    -[ASContactsManager createContactWithDestinations:]();
  }
  id v6 = [(ASContactsManager *)self _findMatchingContactStoreContactForDestinations:v4];
  id v7 = _DestinationsForContactStoreContact(v6);
  long long v8 = ASSanitizedContactDestinations();
  long long v9 = [v8 setByAddingObjectsFromSet:v7];

  id v10 = objc_alloc_init(MEMORY[0x263F23BC0]);
  long long v11 = [v6 identifier];
  [v10 setLinkedContactStoreIdentifier:v11];

  [v10 setDestinations:v9];
  uint64_t v12 = ASFullNameForContactStoreContact();
  [v10 setFullName:v12];

  uint64_t v13 = ASShortNameForContactStoreContact();
  [v10 setShortName:v13];

  ASLoggingInitialize();
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    -[ASContactsManager createContactWithDestinations:]();
  }

  return v10;
}

- (void)saveContact:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 UUID];

  if (v5)
  {
    [(ASContactsManager *)self _waitForTransaction];
    ASLoggingInitialize();
    id v6 = (os_log_t *)MEMORY[0x263F23AE0];
    id v7 = (void *)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = v7;
      long long v9 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "ContactsManager saving contact: %{public}@ - %@", buf, 0x16u);
    }
    ASLoggingInitialize();
    os_log_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = v10;
      uint64_t v12 = [v4 relationshipStorage];
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "ContactsManager saving contact with storage %@", buf, 0xCu);
    }
    contactsQueue = self->_contactsQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__ASContactsManager_saveContact___block_invoke;
    v14[3] = &unk_2652157C8;
    v14[4] = self;
    id v15 = v4;
    dispatch_barrier_sync(contactsQueue, v14);
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      -[ASContactsManager saveContact:]();
    }
  }
}

void __33__ASContactsManager_saveContact___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) UUID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
  objc_msgSend(*(id *)(a1 + 32), "_queue_allContacts");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _persistContacts:v5];
}

- (void)setContactsUsingTransaction:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(ASContactsManager *)self _beginTransaction];
  v4[2](v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(ASContactsManager *)self _setContacts:v5 waitForTransaction:0];
  [(ASContactsManager *)self _endTransaction];
}

- (id)savePlaceholderContact:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 UUID];
  id v6 = [MEMORY[0x263F08C38] UUID];
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AE0];
  long long v8 = *MEMORY[0x263F23AE0];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      v22 = v5;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "ContactsManager saving placeholder contact (token=%{public}@): %{public}@ - %@", buf, 0x20u);
    }
    contactsQueue = self->_contactsQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__ASContactsManager_savePlaceholderContact___block_invoke;
    v14[3] = &unk_2652160E8;
    id v10 = v6;
    id v15 = v10;
    id v16 = v4;
    id v17 = self;
    id v18 = v5;
    dispatch_barrier_sync(contactsQueue, v14);
    long long v11 = v18;
    id v12 = v10;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[ASContactsManager savePlaceholderContact:]();
  }

  return v6;
}

void __44__ASContactsManager_savePlaceholderContact___block_invoke(uint64_t a1)
{
  id v8 = (id)objc_opt_new();
  [v8 setToken:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [v8 setContact:v2];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:*(void *)(a1 + 56)];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 arrayByAddingObject:v8];

  [*(id *)(*(void *)(a1 + 48) + 24) setObject:v7 forKeyedSubscript:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 48), "_queue_notifyObservers");
}

- (void)removePlaceholderContactWithToken:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ContactsManager removing placeholder contact with token %{public}@", buf, 0xCu);
  }
  contactsQueue = self->_contactsQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke;
  v8[3] = &unk_2652157C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_barrier_sync(contactsQueue, v8);
}

void __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__2;
  __int16 v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  uint64_t v3 = (void *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke_2;
  v28[3] = &unk_2652165C0;
  id v29 = v2;
  long long v30 = &v31;
  [v4 enumerateKeysAndObjectsUsingBlock:v28];
  if (v32[5])
  {
    ASLoggingInitialize();
    id v5 = (id)*MEMORY[0x263F23AE0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v32[5];
      id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v6];
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v6;
      __int16 v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ContactsManager found placeholder contact to remove %{public}@ - %@", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v32[5]];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      id v11 = (void *)MEMORY[0x263EFFA68];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "token", (void)v24);
          char v15 = [v14 isEqual:*v3];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v11 arrayByAddingObject:v13];

            id v11 = (void *)v16;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v9);
    }
    else
    {
      id v11 = (void *)MEMORY[0x263EFFA68];
    }

    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v11 forKeyedSubscript:v32[5]];
    objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
  }
  else
  {
    ASLoggingInitialize();
    id v17 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke_cold_1((uint64_t)v3, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  _Block_object_dispose(&v31, 8);
}

void __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "token", (void)v16);
        int v15 = [v14 isEqual:*(void *)(a1 + 32)];

        if (v15)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeAllPlaceholderContacts
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v3 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    placeholderContactsByUUID = self->_placeholderContactsByUUID;
    id v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = [(NSMutableDictionary *)placeholderContactsByUUID count];
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ContactsManager removing all placeholder contacts (%lu placeholder contacts)", buf, 0xCu);
  }
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ASContactsManager_removeAllPlaceholderContacts__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_barrier_sync(contactsQueue, block);
}

uint64_t __49__ASContactsManager_removeAllPlaceholderContacts__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_notifyObservers");
}

- (void)_setContacts:(id)a3 waitForTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v13 UUID];

        if (!v14)
        {
          ASLoggingInitialize();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
            -[ASContactsManager _setContacts:waitForTransaction:]();
          }

          goto LABEL_17;
        }
        int v15 = (void *)[v13 copy];
        long long v16 = [v13 UUID];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v4) {
    [(ASContactsManager *)self _waitForTransaction];
  }
  ASLoggingInitialize();
  long long v17 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = v17;
    uint64_t v19 = [v7 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v19;
    _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "ContactsManager saving %lu contacts", buf, 0xCu);
  }
  contactsQueue = self->_contactsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ASContactsManager__setContacts_waitForTransaction___block_invoke;
  block[3] = &unk_265216138;
  block[4] = self;
  id v22 = v7;
  id v23 = v8;
  dispatch_barrier_sync(contactsQueue, block);

LABEL_17:
}

void __53__ASContactsManager__setContacts_waitForTransaction___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allContacts");
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 32) _persistContacts:v2];
}

- (void)_beginTransaction
{
  [(ASContactsManager *)self _waitForTransaction];
  dispatch_group_enter((dispatch_group_t)self->_contactsTransactionBarrier);
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ContactsManager beginning transaction", v4, 2u);
  }
}

- (void)_endTransaction
{
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ContactsManager ending transaction", v4, 2u);
  }
  dispatch_group_leave((dispatch_group_t)self->_contactsTransactionBarrier);
}

- (void)_waitForTransaction
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ContactsManager error, transaction timed out", v1, 2u);
}

- (void)_persistContacts:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_persistQueue);
  persistQueue = self->_persistQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ASContactsManager__persistContacts___block_invoke;
  block[3] = &unk_2652157F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(persistQueue, block);
}

uint64_t __38__ASContactsManager__persistContacts___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v7 = 134217984;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ContactsManager persisting %lu contacts to disk", (uint8_t *)&v7, 0xCu);
  }
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    return ASWriteContactsToDiskCache(v5);
  }
  else {
    return ASDeleteContactsFromDiskCache();
  }
}

- (void)_queue_notifyObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contactsQueue);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ASContactsManager__queue_notifyObservers__block_invoke;
  block[3] = &unk_2652157F0;
  void block[4] = self;
  dispatch_sync(observerQueue, block);
}

void __43__ASContactsManager__queue_notifyObservers__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v2 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
    id v4 = v2;
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v3 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "ContactsManager notifying %lu observer(s) of contacts update", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "contactsManagerDidUpdateContacts:", *(void *)(a1 + 32), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_findMatchingContactStoreContactForDestinations:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v20 = *(void *)v24;
    uint64_t v6 = *MEMORY[0x263EFDF80];
    uint64_t v7 = *MEMORY[0x263EFE070];
    *(void *)&long long v4 = 138412290;
    long long v18 = v4;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = ASContactStorePredicateForDestination();
        contactStore = self->_contactStore;
        long long v11 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
        v29[0] = v11;
        v29[1] = v6;
        v29[2] = v7;
        long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
        id v22 = 0;
        long long v13 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v9 keysToFetch:v12 error:&v22];
        id v14 = v22;

        if (v14)
        {
          ASLoggingInitialize();
          int v15 = *MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v28 = v9;
            _os_log_error_impl(&dword_2474C9000, v15, OS_LOG_TYPE_ERROR, "ContactsManager error looking for contacts matching predicate: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend(v13, "count", v18))
        {
          if ((unint64_t)[v13 count] >= 2)
          {
            ASLoggingInitialize();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
              -[ASContactsManager _findMatchingContactStoreContactForDestinations:]();
            }
          }
          uint64_t v16 = [v13 firstObject];

          goto LABEL_17;
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_17:

  return v16;
}

- (id)_contactStoreContactWithIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    contactStore = self->_contactStore;
    long long v4 = (void *)MEMORY[0x263EFEA20];
    id v5 = a3;
    uint64_t v6 = [v4 descriptorForRequiredKeysForStyle:0];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    uint64_t v8 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v5 keysToFetch:v7 error:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)createContactWithDestinations:(id)a3 relationshipIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v9 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "ContactsManager creating new contact with destinations: %@, identifier %@", (uint8_t *)&v24, 0x16u);
  }
  long long v10 = [(ASContactsManager *)self _findMatchingContactStoreContactForDestinations:v6];
  long long v11 = _DestinationsForContactStoreContact(v10);
  long long v12 = ASSanitizedContactDestinations();
  long long v13 = [v12 setByAddingObjectsFromSet:v11];

  id v14 = (void *)[objc_alloc(MEMORY[0x263F23BF0]) initWithIdentifier:v7 cloudType:0];
  id v15 = objc_alloc(MEMORY[0x263F23BF0]);
  uint64_t v16 = [MEMORY[0x263F08C38] UUID];
  uint64_t v17 = (void *)[v15 initWithIdentifier:v16 cloudType:0];

  long long v18 = (void *)[objc_alloc(MEMORY[0x263F23BC0]) initWithRelationship:v14 remoteRelationship:v17];
  uint64_t v19 = [v10 identifier];
  [v18 setLinkedContactStoreIdentifier:v19];

  [v18 setDestinations:v13];
  uint64_t v20 = ASFullNameForContactStoreContact();
  [v18 setFullName:v20];

  uint64_t v21 = ASShortNameForContactStoreContact();
  [v18 setShortName:v21];

  ASLoggingInitialize();
  id v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v18;
    _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "ContactsManager resulting contact: %@", (uint8_t *)&v24, 0xCu);
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsTransactionBarrier, 0);
  objc_storeStrong((id *)&self->_persistQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_contactsQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_placeholderContactsByUUID, 0);
  objc_storeStrong((id *)&self->_contactsByUUID, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __39__ASContactsManager_loadCachedContacts__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ContactsManager has some contacts that already exist in memory! Replacing with contacts from disk cache", v1, 2u);
}

- (void)createContactWithDestinations:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEBUG, "ContactsManager resulting contact: %@", v1, 0xCu);
}

- (void)createContactWithDestinations:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEBUG, "ContactsManager creating new contact with destinations: %@", v1, 0xCu);
}

- (void)saveContact:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "ContactsManager error saving contact, no UUID: %@", v2, v3, v4, v5, v6);
}

- (void)savePlaceholderContact:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "ContactsManager error saving placeholder contact, no UUID: %@", v2, v3, v4, v5, v6);
}

void __55__ASContactsManager_removePlaceholderContactWithToken___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setContacts:waitForTransaction:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "ContactsManager error setting contact, no UUID: %@", v2, v3, v4, v5, v6);
}

- (void)_findMatchingContactStoreContactForDestinations:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "ContactsManager multiple contacts matched destination: %@", v2, v3, v4, v5, v6);
}

@end