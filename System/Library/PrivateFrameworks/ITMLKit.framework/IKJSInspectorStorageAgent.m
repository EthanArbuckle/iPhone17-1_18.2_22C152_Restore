@interface IKJSInspectorStorageAgent
- (IKJSInspectorController)controller;
- (IKJSInspectorStorageAgent)initWithInspectorController:(id)a3;
- (id)_storageForStorageId:(id)a3;
- (id)_storageIdForStorage:(id)a3;
- (void)_itemAdded:(id)a3;
- (void)_itemRemoved:(id)a3;
- (void)_itemUpdated:(id)a3;
- (void)_itemsCleared:(id)a3;
- (void)dealloc;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getDOMStorageItemsWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5;
- (void)removeDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6;
- (void)setDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6 value:(id)a7;
- (void)startListeningForStorageNotifications;
- (void)stopListeningForStorageNotifications;
@end

@implementation IKJSInspectorStorageAgent

- (IKJSInspectorStorageAgent)initWithInspectorController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKJSInspectorStorageAgent;
  v5 = [(IKJSInspectorStorageAgent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IKJSInspectorStorageAgent;
  [(IKJSInspectorStorageAgent *)&v4 dealloc];
}

- (void)startListeningForStorageNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__itemAdded_ name:@"IKJSStorageItemAddedNotification" object:0];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__itemUpdated_ name:@"IKJSStorageItemUpdatedNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__itemRemoved_ name:@"IKJSStorageItemRemovedNotification" object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__itemsCleared_ name:@"IKJSStorageItemsClearedNotification" object:0];
}

- (void)stopListeningForStorageNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)getDOMStorageItemsWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v22 = (void (**)(id, void *))a4;
  id v7 = a5;
  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  v21 = v7;
  v20 = [(IKJSInspectorStorageAgent *)self _storageForStorageId:v7];
  v9 = [v20 keysAndValues];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [v9 objectForKey:v14];
        v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = &stru_1F3E09950;
        }
        v18 = v17;

        v27[0] = v14;
        v27[1] = v18;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

        [v8 addObject:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
  v22[2](v22, v8);
}

- (void)setDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6 value:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  v13 = (void (**)(void))a4;
  id v14 = [(IKJSInspectorStorageAgent *)self _storageForStorageId:a5];
  [v14 setItem:v12 :v11];

  v13[2](v13);
}

- (void)removeDOMStorageItemWithErrorCallback:(id)a3 successCallback:(id)a4 storageId:(id)a5 key:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (void (**)(void))a4;
  id v11 = [(IKJSInspectorStorageAgent *)self _storageForStorageId:a5];
  [v11 removeItem:v9];

  v10[2](v10);
}

- (void)_itemAdded:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  id v6 = [v4 userInfo];
  objc_initWeak(&location, self);
  id v7 = [(IKJSInspectorStorageAgent *)self controller];
  objc_super v8 = [v7 appContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__IKJSInspectorStorageAgent__itemAdded___block_invoke;
  v11[3] = &unk_1E6DE49B0;
  objc_copyWeak(&v14, &location);
  id v9 = v5;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 evaluate:v11 completionBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __40__IKJSInspectorStorageAgent__itemAdded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained controller];
    id v4 = [v3 inspector];
    v5 = [v4 configuration];
    id v6 = [v5 domStorageEventDispatcher];

    id v7 = [v10 _storageIdForStorage:*(void *)(a1 + 32)];
    if (v7)
    {
      objc_super v8 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageKeyKey"];
      id v9 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageValueKey"];
      objc_msgSend(v6, "safe_domStorageItemAddedWithStorageId:key:newValue:", v7, v8, v9);
    }
    id WeakRetained = v10;
  }
}

- (void)_itemUpdated:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  id v6 = [v4 userInfo];
  objc_initWeak(&location, self);
  id v7 = [(IKJSInspectorStorageAgent *)self controller];
  objc_super v8 = [v7 appContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__IKJSInspectorStorageAgent__itemUpdated___block_invoke;
  v11[3] = &unk_1E6DE49B0;
  objc_copyWeak(&v14, &location);
  id v9 = v5;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 evaluate:v11 completionBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__IKJSInspectorStorageAgent__itemUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v3 = [WeakRetained controller];
    id v4 = [v3 inspector];
    v5 = [v4 configuration];
    id v6 = [v5 domStorageEventDispatcher];

    id v7 = [v11 _storageIdForStorage:*(void *)(a1 + 32)];
    if (v7)
    {
      objc_super v8 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageKeyKey"];
      id v9 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageOldValueKey"];
      id v10 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageValueKey"];
      objc_msgSend(v6, "safe_domStorageItemUpdatedWithStorageId:key:oldValue:newValue:", v7, v8, v9, v10);
    }
    id WeakRetained = v11;
  }
}

- (void)_itemRemoved:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  id v6 = [v4 userInfo];
  objc_initWeak(&location, self);
  id v7 = [(IKJSInspectorStorageAgent *)self controller];
  objc_super v8 = [v7 appContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__IKJSInspectorStorageAgent__itemRemoved___block_invoke;
  v11[3] = &unk_1E6DE49B0;
  objc_copyWeak(&v14, &location);
  id v9 = v5;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 evaluate:v11 completionBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__IKJSInspectorStorageAgent__itemRemoved___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [WeakRetained controller];
    id v4 = [v3 inspector];
    v5 = [v4 configuration];
    id v6 = [v5 domStorageEventDispatcher];

    id v7 = [v9 _storageIdForStorage:*(void *)(a1 + 32)];
    if (v7)
    {
      objc_super v8 = [*(id *)(a1 + 40) objectForKey:@"IKJSStorageKeyKey"];
      objc_msgSend(v6, "safe_domStorageItemRemovedWithStorageId:key:", v7, v8);
    }
    id WeakRetained = v9;
  }
}

- (void)_itemsCleared:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_initWeak(&location, self);
  id v6 = [(IKJSInspectorStorageAgent *)self controller];
  id v7 = [v6 appContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__IKJSInspectorStorageAgent__itemsCleared___block_invoke;
  v9[3] = &unk_1E6DE48E8;
  objc_copyWeak(&v11, &location);
  id v8 = v5;
  id v10 = v8;
  [v7 evaluate:v9 completionBlock:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__IKJSInspectorStorageAgent__itemsCleared___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = [WeakRetained controller];
    id v4 = [v3 inspector];
    v5 = [v4 configuration];
    id v6 = [v5 domStorageEventDispatcher];

    id v7 = [v8 _storageIdForStorage:*(void *)(a1 + 32)];
    if (v7) {
      objc_msgSend(v6, "safe_domStorageItemsClearedWithStorageId:", v7);
    }

    id WeakRetained = v8;
  }
}

- (id)_storageIdForStorage:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSInspectorStorageAgent *)self controller];
  id v6 = [v5 appContext];
  id v7 = [v6 jsContext];
  id v8 = [v7 objectForKeyedSubscript:@"localStorage"];
  id v9 = [v8 toObjectOfClass:objc_opt_class()];

  id v10 = [(IKJSInspectorStorageAgent *)self controller];
  id v11 = [v10 appContext];
  id v12 = [v11 jsContext];
  id v13 = [v12 objectForKeyedSubscript:@"sessionStorage"];
  id v14 = [v13 toObjectOfClass:objc_opt_class()];

  if (v9 == v4 || v14 == v4)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB6C90], "safe_initWithSecurityOrigin:isLocalStorage:", @"Page", v9 == v4);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_storageForStorageId:(id)a3
{
  int v4 = [a3 isLocalStorage];
  v5 = [(IKJSInspectorStorageAgent *)self controller];
  id v6 = [v5 appContext];
  id v7 = [v6 jsContext];
  id v8 = v7;
  if (v4) {
    id v9 = @"localStorage";
  }
  else {
    id v9 = @"sessionStorage";
  }
  id v10 = [v7 objectForKeyedSubscript:v9];

  id v11 = [v10 toObjectOfClass:objc_opt_class()];

  return v11;
}

- (IKJSInspectorController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKJSInspectorController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end