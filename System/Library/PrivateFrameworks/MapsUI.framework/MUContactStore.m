@interface MUContactStore
- (BOOL)_calculateIfContainerIsGuardianRestricted;
- (BOOL)hasContactAccess;
- (BOOL)isGuardianRestrictedCNContainer;
- (CNContactStore)cnContactStore;
- (MUContactStore)init;
- (void)_contactStoreDidChange;
- (void)_invokeObservers;
- (void)fetchContactForPickerDisplayUsingContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)fetchStoredContactForMatchingMapItem:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)fetchUnifiedContactForIdentifier:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeMapsDataFromContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation MUContactStore

- (MUContactStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)MUContactStore;
  v2 = [(MUContactStore *)&v11 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = geo_isolater_create_with_format();
    propertyIsolator = v2->_propertyIsolator;
    v2->_propertyIsolator = (geo_isolater *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1EE41D958 queue:0];
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__contactStoreDidChange name:*MEMORY[0x1E4F1AF80] object:0];

    [(MUContactStore *)v2 _contactStoreDidChange];
  }
  return v2;
}

- (void)_contactStoreDidChange
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MUContactStore__contactStoreDidChange__block_invoke;
  v4[3] = &unk_1E574F3A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__MUContactStore__contactStoreDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _calculateIfContainerIsGuardianRestricted];
    geo_isolate_sync();
  }
}

uint64_t __40__MUContactStore__contactStoreDidChange__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isGuardianRestrictedCNContainer
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __49__MUContactStore_isGuardianRestrictedCNContainer__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)_invokeObservers
{
  objc_initWeak(&location, self);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MUContactStore__invokeObservers__block_invoke;
  v4[3] = &unk_1E57502B0;
  objc_copyWeak(&v5, &location);
  [(GEOObserverHashTable *)observers enumerateObserversWithGroup:0 visitor:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__MUContactStore__invokeObservers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [v4 contactStoreDidChange:WeakRetained];
  }
}

- (void)fetchUnifiedContactForIdentifier:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke;
  block[3] = &unk_1E574ECF8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained cnContactStore];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [MEMORY[0x1E4F1B8F8] descriptorForAllComparatorKeys];
    v19[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v18 = 0;
    id v8 = [v4 unifiedContactWithIdentifier:v5 keysToFetch:v7 error:&v18];
    id v9 = v18;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke_2;
    v14[3] = &unk_1E574ECA8;
    id v10 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v16 = v9;
    id v17 = v11;
    id v15 = v8;
    id v12 = v9;
    id v13 = v8;
    dispatch_async(v10, v14);
  }
}

uint64_t __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CNContactStore)cnContactStore
{
  cnContactStore = self->_cnContactStore;
  if (!cnContactStore)
  {
    id v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v5 = self->_cnContactStore;
    self->_cnContactStore = v4;

    cnContactStore = self->_cnContactStore;
  }
  return cnContactStore;
}

- (void)removeMapsDataFromContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[a3 mutableCopy];
  [v10 setMapsData:0];
  if ([(MUContactStore *)self hasContactAccess])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E574ECF8;
    objc_copyWeak(&v20, &location);
    id v17 = v10;
    id v18 = v8;
    id v19 = v9;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke;
    v22[3] = &unk_1E57502D8;
    id v23 = v10;
    id v24 = v9;
    id v14 = v10;
    id v15 = v9;
    dispatch_async(v8, v22);
  }
}

uint64_t __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    [v3 updateContact:*(void *)(a1 + 32)];
    id v4 = [WeakRetained cnContactStore];
    id v12 = 0;
    [v4 executeSaveRequest:v3 error:&v12];
    id v5 = v12;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_3;
    v8[3] = &unk_1E574ECA8;
    uint64_t v6 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    char v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 48);
    v2(v3, 0);
  }
  else
  {
    id v5 = (id)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (void)fetchContactForPickerDisplayUsingContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v29[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  int v13 = [v8 areKeysAvailable:v12];

  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke;
    block[3] = &unk_1E57502D8;
    id v27 = v8;
    id v28 = v10;
    id v14 = v10;
    id v15 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_2;
    v19[3] = &unk_1E5750300;
    objc_copyWeak(&v24, &location);
    v19[4] = self;
    id v20 = v8;
    id v21 = v11;
    v22 = v9;
    id v23 = v10;
    id v17 = v10;
    id v18 = v8;
    dispatch_async(queue, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) cnContactStore];
    id v4 = [*(id *)(a1 + 40) identifier];
    v19[0] = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v18 = 0;
    uint64_t v6 = [v3 unifiedContactWithIdentifier:v4 keysToFetch:v5 error:&v18];
    id v7 = v18;

    id v8 = *(NSObject **)(a1 + 56);
    if (v7)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_4;
      v11[3] = &unk_1E574ECA8;
      id v9 = &v14;
      id v14 = *(id *)(a1 + 64);
      id v10 = &v12;
      id v12 = *(id *)(a1 + 40);
      id v13 = v7;
      dispatch_async(v8, v11);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_3;
      block[3] = &unk_1E57502D8;
      id v9 = &v17;
      id v17 = *(id *)(a1 + 64);
      id v10 = &v16;
      id v16 = v6;
      dispatch_async(v8, block);
    }
  }
}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchStoredContactForMatchingMapItem:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1B908];
  id v11 = a3;
  id v12 = [v10 alloc];
  uint64_t v13 = *MEMORY[0x1E4F1AFA8];
  v29[0] = *MEMORY[0x1E4F1AE90];
  v29[1] = v13;
  void v29[2] = *MEMORY[0x1E4F1AED8];
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  id v15 = (void *)[v12 initWithKeysToFetch:v14];

  id v16 = (void *)MEMORY[0x1E4F1B8F8];
  id v17 = [v11 _mapsDataString];

  id v18 = [v16 predicateForContactMatchingMapString:v17];
  [v15 setPredicate:v18];

  [v15 setSortOrder:1];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke;
  block[3] = &unk_1E574ECF8;
  objc_copyWeak(&v27, &location);
  id v24 = v15;
  id v25 = v8;
  id v26 = v9;
  id v20 = v9;
  id v21 = v8;
  id v22 = v15;
  dispatch_async(queue, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained cnContactStore];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__5;
    v15[4] = __Block_byref_object_dispose__5;
    id v16 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    v13[4] = v15;
    id v14 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_61;
    v13[3] = &unk_1E5750328;
    [v4 enumerateContactsWithFetchRequest:v5 error:&v14 usingBlock:v13];
    id v6 = v14;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E5750350;
    id v7 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = v15;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, block);

    _Block_object_dispose(v15, 8);
  }
}

void __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_61(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
  *a3 = 1;
}

uint64_t __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (BOOL)hasContactAccess
{
  return objc_msgSend(MEMORY[0x1E4F1B980], "_mapkit_isAuthorized");
}

- (BOOL)_calculateIfContainerIsGuardianRestricted
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MUContactStore *)self cnContactStore];
  id v4 = [v3 defaultContainerIdentifier];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1B9B0];
    v13[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v7 = [v5 predicateForContainersWithIdentifiers:v6];

    id v8 = [(MUContactStore *)self cnContactStore];
    id v9 = [v8 containersMatchingPredicate:v7 error:0];

    if ([v9 count] == 1)
    {
      id v10 = [v9 firstObject];
      char v11 = [v10 isGuardianRestricted];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyIsolator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cnContactStore, 0);
}

@end