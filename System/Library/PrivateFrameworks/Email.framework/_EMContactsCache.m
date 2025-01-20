@interface _EMContactsCache
- (CNContactStore)store;
- (EFLazyCache)addressesCache;
- (EFLazyCache)namesCache;
- (_EMContactsCache)initWithStore:(id)a3;
- (id)_contactsForKey:(id)a3 cache:(id)a4 keysToFetch:(id)a5 predicateBlock:(id)a6 error:(id *)a7;
- (id)allContactEmailAddressesWithError:(id *)a3;
- (id)contactsForEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (id)contactsForName:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (void)_contactsChanged:(id)a3;
@end

@implementation _EMContactsCache

- (EFLazyCache)addressesCache
{
  return self->_addressesCache;
}

- (id)allContactEmailAddressesWithError:(id *)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id obja = [(_EMContactsCache *)self store];
  v4 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v37[0] = *MEMORY[0x1E4F1ADC8];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v6 = [obja unifiedContactsMatchingPredicate:v4 keysToFetch:v5 error:a3];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v6;
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v9 = [v8 emailAddresses];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = [*(id *)(*((void *)&v27 + 1) + 8 * j) value];
              v14 = [v7 objectForKeyedSubscript:v13];
              if (v14)
              {
                v15 = [v8 identifier];
                [v14 addObject:v15];
              }
              else
              {
                id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
                v17 = [v8 identifier];
                v14 = objc_msgSend(v16, "initWithObjects:", v17, 0);

                [v7 setObject:v14 forKeyedSubscript:v13];
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v10);
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke;
  v26[3] = &unk_1E63E2D68;
  v26[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v26];
  v18 = [v7 allKeys];

  return v18;
}

- (CNContactStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (CNContactStore *)WeakRetained;
}

- (_EMContactsCache)initWithStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EMContactsCache;
  v5 = [(_EMContactsCache *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_store, v4);
    id v7 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    addressesCache = v6->_addressesCache;
    v6->_addressesCache = v7;

    v9 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    namesCache = v6->_namesCache;
    v6->_namesCache = v9;

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__contactsChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v6;
}

- (id)contactsForEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(_EMContactsCache *)self addressesCache];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62___EMContactsCache_contactsForEmailAddress_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E63E2CF0;
  id v11 = v8;
  id v15 = v11;
  v12 = [(_EMContactsCache *)self _contactsForKey:v11 cache:v10 keysToFetch:v9 predicateBlock:v14 error:a5];

  return v12;
}

- (id)contactsForName:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(_EMContactsCache *)self namesCache];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___EMContactsCache_contactsForName_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E63E2CF0;
  id v11 = v8;
  id v15 = v11;
  v12 = [(_EMContactsCache *)self _contactsForKey:v11 cache:v10 keysToFetch:v9 predicateBlock:v14 error:a5];

  return v12;
}

- (id)_contactsForKey:(id)a3 cache:(id)a4 keysToFetch:(id)a5 predicateBlock:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__0;
  long long v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75___EMContactsCache__contactsForKey_cache_keysToFetch_predicateBlock_error___block_invoke;
  v24[3] = &unk_1E63E2D18;
  id v14 = v13;
  id v26 = v14;
  long long v27 = &v29;
  v24[4] = self;
  id v15 = v12;
  id v25 = v15;
  long long v28 = &v35;
  id v16 = [a4 objectForKey:a3 generator:v24];
  v17 = v30;
  v18 = (void *)v30[5];
  if (v18)
  {
    if (a7)
    {
      *a7 = 0;
      v18 = (void *)v17[5];
    }
    id v19 = v18;
  }
  else
  {
    v21 = (void *)v36[5];
    if (v21)
    {
      id v19 = 0;
      if (a7) {
        *a7 = v21;
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v16];
      uint64_t v23 = [(_EMContactsCache *)self store];
      id v19 = [v23 unifiedContactsMatchingPredicate:v22 keysToFetch:v15 error:a7];
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (void)_contactsChanged:(id)a3
{
  [(EFLazyCache *)self->_addressesCache removeAllObjects];
  namesCache = self->_namesCache;
  [(EFLazyCache *)namesCache removeAllObjects];
}

- (EFLazyCache)namesCache
{
  return self->_namesCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namesCache, 0);
  objc_storeStrong((id *)&self->_addressesCache, 0);
  objc_destroyWeak((id *)&self->_store);
}

@end