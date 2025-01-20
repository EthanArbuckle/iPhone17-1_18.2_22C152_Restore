@interface DNDSContactMonitor
- (BOOL)_fetchContactHistoryWithToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5;
- (DNDSContactMonitor)initWithContactStore:(id)a3 contactProvider:(id)a4;
- (id)_contactsWithCNContacts:(id)a3;
- (id)_lock_listenersByContactHistoryToken;
- (id)_lock_monitoredContactsByContactHistoryToken;
- (void)_contactStoreChanged:(id)a3;
- (void)_fetchContactsForMonitoredContacts:(id)a3 handler:(id)a4;
- (void)_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5;
- (void)_queue_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5;
- (void)_updateContactsWithIdentifiers;
- (void)_updateContactsWithoutIdentifiers;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
@end

@implementation DNDSContactMonitor

- (DNDSContactMonitor)initWithContactStore:(id)a3 contactProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DNDSContactMonitor;
  v9 = [(DNDSContactMonitor *)&v17 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.donotdisturb.server.ContactMonitor", v10);
    fetchQueue = v9->_fetchQueue;
    v9->_fetchQueue = (OS_dispatch_queue *)v11;

    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v9->_contactProvider, a4);
    uint64_t v13 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    listeners = v9->_listeners;
    v9->_listeners = (NSHashTable *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v9 selector:sel__contactStoreChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v9;
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_listeners addObject:v4];
  v5 = [v4 monitoredContacts];
  os_unfair_lock_unlock(&self->_lock);
  v6 = [v4 contactHistoryToken];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__DNDSContactMonitor_addListener___block_invoke;
  v8[3] = &unk_1E69739E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(DNDSContactMonitor *)self _fetchUpdatesWithContactHistoryToken:v6 monitoredContacts:v5 handler:v8];
}

void __34__DNDSContactMonitor_addListener___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 _contactsWithCNContacts:a2];
  [*(id *)(a1 + 40) contactMonitor:*(void *)(a1 + 32) didReceiveUpdatedContacts:v10 deletedContactIdentifiers:v9 withContactHistoryToken:v8];
}

- (void)removeListener:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_listeners removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)_contactsWithCNContacts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F5F5C0], "contactWithCNContact:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_contactStoreChanged:(id)a3
{
  fetchQueue = self->_fetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DNDSContactMonitor__contactStoreChanged___block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(fetchQueue, block);
}

uint64_t __43__DNDSContactMonitor__contactStoreChanged___block_invoke(uint64_t a1)
{
  v2 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Contacts store changed", v4, 2u);
  }
  [*(id *)(a1 + 32) _updateContactsWithIdentifiers];
  return [*(id *)(a1 + 32) _updateContactsWithoutIdentifiers];
}

- (void)_updateContactsWithIdentifiers
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  os_unfair_lock_lock(&self->_lock);
  id v3 = [(DNDSContactMonitor *)self _lock_listenersByContactHistoryToken];
  v18 = [(DNDSContactMonitor *)self _lock_monitoredContactsByContactHistoryToken];
  os_unfair_lock_unlock(&self->_lock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v19)
  {
    v16 = v22;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v6 = objc_msgSend(v18, "objectForKeyedSubscript:", v5, v16);
        uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              long long v14 = [v13 contactIdentifier];

              if (v14) {
                [v7 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v22[0] = __52__DNDSContactMonitor__updateContactsWithIdentifiers__block_invoke;
        v22[1] = &unk_1E6973A08;
        v22[2] = self;
        id v15 = obj;
        id v23 = v15;
        uint64_t v24 = v5;
        [(DNDSContactMonitor *)self _queue_fetchUpdatesWithContactHistoryToken:v5 monitoredContacts:v7 handler:v21];
      }
      uint64_t v19 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v19);
  }
}

void __52__DNDSContactMonitor__updateContactsWithIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) _contactsWithCNContacts:a2];
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) contactMonitor:*(void *)(a1 + 32) didReceiveUpdatedContacts:v9 deletedContactIdentifiers:v7 withContactHistoryToken:v8];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_updateContactsWithoutIdentifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  os_unfair_lock_lock(&self->_lock);
  id v3 = [(NSHashTable *)self->_listeners allObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v3;
  uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
        id v7 = [v5 monitoredContacts];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              uint64_t v13 = [v12 contactIdentifier];

              if (!v13)
              {
                uint64_t v14 = [(DNDSContactProviding *)self->_contactProvider contactForContact:v12];
                if (v14) {
                  [v6 setObject:v14 forKeyedSubscript:v12];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v9);
        }
        if ([v7 count]) {
          [v5 contactMonitor:self didReceiveUpdatedContactsForContactsWithoutIdentifiers:v6];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }
}

- (void)_fetchContactsForMonitoredContacts:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * v13) contactIdentifier];
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  long long v15 = [v8 allObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke;
  v17[3] = &unk_1E6973A58;
  v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  [v15 enumerateBatchesOfSize:10 handler:v17];
}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  context = (void *)MEMORY[0x1D9430630]();
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_alloc(MEMORY[0x1E4F1B908]);
  id v9 = [MEMORY[0x1E4F5F5C0] keysToFetch];
  uint64_t v10 = (void *)[v8 initWithKeysToFetch:v9];

  uint64_t v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v4];
  [v10 setPredicate:v11];

  [v10 setUnifyResults:1];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
  id v35 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_2;
  v32[3] = &unk_1E6973A30;
  id v13 = v7;
  id v33 = v13;
  id v14 = v6;
  id v34 = v14;
  int v15 = [v12 enumerateContactsWithFetchRequest:v10 error:&v35 usingBlock:v32];
  id v16 = v35;
  uint64_t v17 = (void *)[v5 mutableCopy];
  [v17 minusSet:v14];
  id v18 = DNDSLogSettings;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = v18;
      uint64_t v20 = [v13 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1D3052000, v19, OS_LOG_TYPE_DEFAULT, "Fetched %{public}lld contacts", buf, 0xCu);
    }
    uint64_t v21 = *(void *)(a1 + 40);
    long long v22 = [v17 allObjects];
    long long v23 = [*(id *)(*(void *)(a1 + 32) + 8) currentHistoryToken];
    (*(void (**)(uint64_t, id, void *, void *))(v21 + 16))(v21, v13, v22, v23);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
      __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1((uint64_t)v16, v18, v24, v25, v26, v27, v28, v29);
    }
    *a3 = 1;
  }
}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v4 identifier];

  [v5 addObject:v6];
}

- (BOOL)_fetchContactHistoryWithToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void, void *, void *, void *))a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1B8E0]);
  [v11 setStartingToken:v8];
  uint64_t v12 = [MEMORY[0x1E4F5F5C0] keysToFetch];
  [v11 setAdditionalContactKeyDescriptors:v12];

  contactStore = self->_contactStore;
  id v59 = 0;
  id v14 = [(CNContactStore *)contactStore enumeratorForChangeHistoryFetchRequest:v11 error:&v59];
  id v15 = v59;
  if (v15)
  {
    id v16 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
      __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    v48 = v10;
    id v50 = v8;
    long long v23 = [MEMORY[0x1E4F1CA80] set];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v49 = v9;
    id v24 = v9;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          long long v30 = [v29 contactIdentifier];

          if (v30)
          {
            long long v31 = [v29 contactIdentifier];
            [v23 addObject:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v26);
    }

    long long v32 = [[DNDSContactMonitorChangeCollector alloc] initWithMonitoredContactIdentifiers:v23];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v33 = [v14 value];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * j) acceptEventVisitor:v32];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v35);
    }

    uint64_t v38 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = [(DNDSContactMonitorChangeCollector *)v32 updatedContacts];
      uint64_t v41 = [v40 count];
      v42 = [(DNDSContactMonitorChangeCollector *)v32 deletedContactIdentifiers];
      uint64_t v43 = [v42 count];
      *(_DWORD *)buf = 134349312;
      uint64_t v61 = v41;
      __int16 v62 = 2050;
      uint64_t v63 = v43;
      _os_log_impl(&dword_1D3052000, v39, OS_LOG_TYPE_DEFAULT, "Collected %{public}lld changed contacts and %{public}lld", buf, 0x16u);
    }
    v44 = [(DNDSContactMonitorChangeCollector *)v32 updatedContacts];
    v45 = [(DNDSContactMonitorChangeCollector *)v32 deletedContactIdentifiers];
    v46 = [v14 currentHistoryToken];
    uint64_t v10 = v48;
    v48[2](v48, v44, v45, v46);

    id v9 = v49;
    id v8 = v50;
  }

  return v15 == 0;
}

- (void)_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  fetchQueue = self->_fetchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__DNDSContactMonitor__fetchUpdatesWithContactHistoryToken_monitoredContacts_handler___block_invoke;
  v15[3] = &unk_1E6973A80;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(fetchQueue, v15);
}

uint64_t __85__DNDSContactMonitor__fetchUpdatesWithContactHistoryToken_monitoredContacts_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_queue_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  if ([v9 count])
  {
    id v11 = [MEMORY[0x1E4F1C9B8] data];
    int v12 = [v8 isEqualToData:v11];

    if (v12)
    {

      id v8 = 0;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1B8E0]);
    [v13 setStartingToken:v8];
    id v14 = [MEMORY[0x1E4F5F5C0] keysToFetch];
    [v13 setAdditionalContactKeyDescriptors:v14];

    contactStore = self->_contactStore;
    id v28 = 0;
    id v16 = [(CNContactStore *)contactStore countForFetchRequest:v13 error:&v28];
    id v17 = v28;
    if (v17)
    {
      id v18 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
        -[DNDSContactMonitor _queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:]((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      uint64_t v25 = [v16 value];
      uint64_t v26 = [v25 integerValue];

      uint64_t v27 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v30 = v26;
        _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "History contains %{public}lld events", buf, 0xCu);
      }
      if (v26 < 1
        || (unint64_t)v26 <= 9
        && [(DNDSContactMonitor *)self _fetchContactHistoryWithToken:v8 monitoredContacts:v9 handler:v10])
      {
        goto LABEL_8;
      }
    }
    [(DNDSContactMonitor *)self _fetchContactsForMonitoredContacts:v9 handler:v10];
LABEL_8:
  }
}

- (id)_lock_listenersByContactHistoryToken
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_listeners;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "contactHistoryToken", (void)v16);
        id v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1C9B8] data];
        }
        id v13 = v12;

        id v14 = [v3 objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v14 = [MEMORY[0x1E4F1CA48] array];
        }
        [v14 addObject:v9];
        [v3 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_lock_monitoredContactsByContactHistoryToken
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_listeners;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "contactHistoryToken", (void)v17);
        id v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1C9B8] data];
        }
        id v13 = v12;

        id v14 = [v3 objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v14 = [MEMORY[0x1E4F1CA80] set];
        }
        id v15 = [v9 monitoredContacts];
        [v14 unionSet:v15];

        [v3 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_contactProvider, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_fetchUpdatesWithContactHistoryToken:(uint64_t)a3 monitoredContacts:(uint64_t)a4 handler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end