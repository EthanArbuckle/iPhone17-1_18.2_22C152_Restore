@interface QLPreviewItemStore
- (BOOL)hasLoadedItemsMatching:(id)a3;
- (BOOL)isArchive;
- (QLPreviewItemProvider)itemProvider;
- (QLPreviewItemStore)init;
- (QLPreviewItemStore)initWithItemsOfDirectoryAtURL:(id)a3;
- (QLPreviewItemStore)initWithPreviewItems:(id)a3;
- (QLPreviewItemStoreDelegate)delegate;
- (_NSRange)possibleRange;
- (id)loadedItemsMatching:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)indexOfPreviewItem:(id)a3;
- (unint64_t)numberOfItems;
- (void)clearCache;
- (void)clearItems;
- (void)dealloc;
- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)reloadWithNumberOfPreviewItems:(unint64_t)a3;
- (void)resolvedPreviewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setItemProvider:(id)a3;
@end

@implementation QLPreviewItemStore

- (QLPreviewItemStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLPreviewItemStore;
  v2 = [(QLPreviewItemStore *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (QLPreviewItemStore)initWithPreviewItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)QLPreviewItemStore;
  v5 = [(QLPreviewItemStore *)&v20 init];
  objc_super v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(MEMORY[0x263F62978], "itemWithPreviewItem:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  v13 = [[QLDataSource alloc] initWithPreviewItems:v6];
  internalItemProvider = v5->_internalItemProvider;
  v5->_internalItemProvider = v13;

  [(QLPreviewItemStore *)v5 setItemProvider:v5->_internalItemProvider];
  -[QLPreviewItemStore reloadWithNumberOfPreviewItems:](v5, "reloadWithNumberOfPreviewItems:", [v7 count]);

  return v5;
}

- (QLPreviewItemStore)initWithItemsOfDirectoryAtURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QLPreviewItemStore;
  uint64_t v22 = [(QLPreviewItemStore *)&v30 init];
  v23 = v4;
  v5 = [v4 url];
  int v20 = [v5 startAccessingSecurityScopedResource];
  objc_super v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [MEMORY[0x263EFF8C0] array];
  v21 = v6;
  uint64_t v8 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:v7 options:22 errorHandler:&__block_literal_global_4];

  v24 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x21D45F500](v5);
        if (v14) {
          MEMORY[0x21D45F4F0](v13, v14);
        }
        v15 = [MEMORY[0x263F054E0] wrapperWithSecurityScopedURL:v13];
        long long v16 = (void *)[objc_alloc(MEMORY[0x263F62978]) initWithURLSandboxWrapper:v15];
        long long v17 = [v13 relativePath];
        [v16 setRelativePath:v17];

        if (+[QLPreviewController canPreviewItem:v16]) {
          [v24 addObject:v16];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  if (v20) {
    [v5 stopAccessingSecurityScopedResource];
  }
  [v24 sortUsingComparator:&__block_literal_global_41];
  v22->_isArchive = 1;
  long long v18 = [(QLPreviewItemStore *)v22 initWithPreviewItems:v24];

  return v18;
}

uint64_t __52__QLPreviewItemStore_initWithItemsOfDirectoryAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  objc_super v6 = (NSObject **)MEMORY[0x263F62940];
  id v7 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Error while enumerating directory containing unarchived entries at URL: %@ #PreviewItemStore", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

uint64_t __52__QLPreviewItemStore_initWithItemsOfDirectoryAtURL___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 previewItemTitle];
  objc_super v6 = [v4 previewItemTitle];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)reloadWithNumberOfPreviewItems:(unint64_t)a3
{
  self->_possibleRange.location = 0;
  self->_possibleRange.length = a3;
  [(QLPreviewItemStore *)self clearCache];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)QLPreviewItemStore;
  [(QLPreviewItemStore *)&v4 dealloc];
}

- (void)clearItems
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_cache;
  uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setItem:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)clearCache
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_possibleRange.length
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider), WeakRetained, WeakRetained))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = self->_cache;
    uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "invalidate", (void)v12);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    long long v9 = [MEMORY[0x263F08A88] strongObjectsPointerArray];
    cache = self->_cache;
    self->_cache = v9;

    [(NSPointerArray *)self->_cache setCount:[(QLPreviewItemStore *)self numberOfItems]];
  }
  else
  {
    uint64_t v11 = self->_cache;
    self->_cache = 0;
  }
}

- (unint64_t)numberOfItems
{
  [(QLPreviewItemStore *)self possibleRange];
  return v2;
}

- (BOOL)hasLoadedItemsMatching:(id)a3
{
  uint64_t v4 = (uint64_t (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  if (WeakRetained && [(QLPreviewItemStore *)self numberOfItems])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = (void *)MEMORY[0x21D45F890]();
      uint64_t v8 = [(NSPointerArray *)self->_cache pointerAtIndex:v6];
      long long v9 = v8;
      if (v8)
      {
        long long v10 = [v8 item];
        int v11 = v4[2](v4, v10);

        if (v11) {
          break;
        }
      }

      if ([(QLPreviewItemStore *)self numberOfItems] <= ++v6) {
        goto LABEL_7;
      }
    }

    BOOL v12 = 1;
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)loadedItemsMatching:(id)a3
{
  uint64_t v4 = (uint64_t (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  if (WeakRetained)
  {
    uint64_t v6 = objc_opt_new();
    if ([(QLPreviewItemStore *)self numberOfItems])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = (void *)MEMORY[0x21D45F890]();
        long long v9 = [(NSPointerArray *)self->_cache pointerAtIndex:v7];
        long long v10 = v9;
        if (v9)
        {
          int v11 = [v9 item];
          int v12 = v4[2](v4, v11);

          if (v12)
          {
            long long v13 = [v10 item];
            [v6 addObject:v13];
          }
        }

        ++v7;
      }
      while ([(QLPreviewItemStore *)self numberOfItems] > v7);
    }
    long long v14 = (void *)[v6 copy];
  }
  else
  {
    long long v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  if (WeakRetained
    && (uint64_t v8 = WeakRetained,
        unint64_t v9 = [(QLPreviewItemStore *)self possibleRange],
        unint64_t v11 = v10,
        v8,
        a3 >= v9)
    && a3 - v9 < v11)
  {
    id v12 = v6;
    QLRunInMainThread();
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke(void *a1)
{
  unint64_t v2 = [*(id *)(a1[4] + 8) pointerAtIndex:a1[6]];
  if (v2)
  {
    id v3 = v2;
    [v2 addCompletionHandler:a1[5]];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    [v4 addCompletionHandler:a1[5]];
    [*(id *)(a1[4] + 8) replacePointerAtIndex:a1[6] withPointer:v4];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    uint64_t v6 = a1[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_2642F58D0;
    v7[4] = a1[4];
    id v3 = v4;
    id v8 = v3;
    [WeakRetained previewItemAtIndex:v6 withCompletionHandler:v7];
  }
}

void __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v8;
  id v7 = v5;
  QLRunInMainThread();
}

uint64_t __63__QLPreviewItemStore_previewItemAtIndex_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(*(id *)(a1 + 40), "setCanBeEdited:", objc_msgSend(v4, "itemStore:canEditItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
  }
  id v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(*(id *)(a1 + 40), "setEditingMode:", objc_msgSend(v7, "itemStore:editingModeForPreviewItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
  }
  if (![*(id *)(a1 + 40) editingMode])
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      unint64_t v10 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(*(id *)(a1 + 40), "setEditedFileBehavior:", objc_msgSend(v10, "itemStore:editedFileBehaviorForItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
    }
  }
  unint64_t v11 = [*(id *)(a1 + 32) delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    long long v13 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(*(id *)(a1 + 40), "setShouldPreventMachineReadableCodeDetection:", objc_msgSend(v13, "itemStore:canMachineReadableCodeBeDetectedInPreviewItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)) ^ 1);
  }
  long long v14 = [*(id *)(a1 + 32) delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    long long v16 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(*(id *)(a1 + 40), "setCanHandleEditedCopy:", objc_msgSend(v16, "itemStore:canHandleEditedCopyOfPreviewItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
  }
  uint64_t v17 = [*(id *)(a1 + 32) delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    long long v19 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(*(id *)(a1 + 40), "setCanBeShared:", objc_msgSend(v19, "itemStore:canShareItem:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
  }
  int v20 = [*(id *)(a1 + 40) fetcher];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v22 = *(void *)(a1 + 48);
    v23 = [*(id *)(a1 + 40) fetcher];
    [v23 setUrlProvider:v22];
  }
  uint64_t v24 = *(void *)(a1 + 40);
  v25 = *(void **)(a1 + 56);

  return [v25 setItem:v24];
}

- (void)resolvedPreviewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke;
  v8[3] = &unk_2642F6078;
  id v9 = v6;
  id v7 = v6;
  [(QLPreviewItemStore *)self previewItemAtIndex:a3 withCompletionHandler:v8];
}

void __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fetcher];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v7 = [v3 fetcher];
    id v8 = objc_opt_new();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_2642F6050;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    [v7 fetchContentWithAllowedOutputClasses:v6 inQueue:v8 updateBlock:0 completionBlock:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__QLPreviewItemStore_resolvedPreviewItemAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc(MEMORY[0x263F160E8]);
    uint64_t v4 = (void *)[v3 initWithURL:v5 sandboxType:*MEMORY[0x263EF8000]];
    [*(id *)(a1 + 32) setGeneratedURLHandler:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)indexOfPreviewItem:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewItemStore *)self numberOfItems])
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = objc_msgSend(-[NSPointerArray pointerAtIndex:](self->_cache, "pointerAtIndex:", v5), "item");
      int v7 = [v4 isEqual:v6];

      if (v7) {
        break;
      }
      if ([(QLPreviewItemStore *)self numberOfItems] <= ++v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__4;
  long long v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__QLPreviewItemStore_previewController_previewItemAtIndex___block_invoke;
  v12[3] = &unk_2642F60A0;
  long long v14 = &v15;
  id v8 = v7;
  long long v13 = v8;
  [(QLPreviewItemStore *)self previewItemAtIndex:a4 withCompletionHandler:v12];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v8, v9);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __59__QLPreviewItemStore_previewController_previewItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (QLPreviewItemProvider)itemProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  return (QLPreviewItemProvider *)WeakRetained;
}

- (void)setItemProvider:(id)a3
{
}

- (_NSRange)possibleRange
{
  objc_copyStruct(v4, &self->_possibleRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (QLPreviewItemStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QLPreviewItemStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isArchive
{
  return self->_isArchive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalItemProvider, 0);
  objc_destroyWeak((id *)&self->_itemProvider);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end