@interface FPDItemIterator
- (BOOL)_createEnumerator;
- (BOOL)_enumerateMoreItems;
- (BOOL)_shouldTraverseSubTree:(id)a3;
- (BOOL)done;
- (FPDItemIterator)initWithItem:(id)a3 provider:(id)a4;
- (NSString)prettyDescription;
- (id)_popItem;
- (id)error;
- (id)nextWithError:(id *)a3;
- (unint64_t)numFoldersPopped;
- (void)_createEnumerator;
- (void)_decorateItem:(id)a3;
- (void)_enumerateMoreItems;
- (void)_invalidateWithError:(id)a3;
- (void)_next;
- (void)_popFolder;
- (void)_pushFolder:(id)a3;
- (void)dealloc;
@end

@implementation FPDItemIterator

- (FPDItemIterator)initWithItem:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FPDItemIterator;
  v8 = [(FPDItemIterator *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v7);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("FileProvider.provider-iterator", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    remainingItemsByDepth = v9->_remainingItemsByDepth;
    v9->_remainingItemsByDepth = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    enumeratorByDepth = v9->_enumeratorByDepth;
    v9->_enumeratorByDepth = (NSMutableArray *)v15;

    v17 = v9->_enumeratorByDepth;
    v18 = objc_opt_new();
    [(NSMutableArray *)v17 addObject:v18];

    v19 = v9->_remainingItemsByDepth;
    v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    [(NSMutableArray *)v19 addObject:v20];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_provider);
    v22 = [v6 domainIdentifier];
    v23 = [WeakRetained domainForIdentifier:v22 reason:0];
    objc_storeWeak((id *)&v9->_domain, v23);

    id v24 = objc_loadWeakRetained((id *)&v9->_domain);
    v25 = [v24 session];
    [v25 registerLifetimeExtensionForObject:v9];
  }
  return v9;
}

- (void)_popFolder
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 64) lastObject];
  v4 = [v3 parentItem];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v5, "[DEBUG] iterator: popped %@", v6);
}

- (void)_pushFolder:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  [v7 setParentItem:v4];

  [v7 setEnumerator:0];
  [v7 setNextPage:0];
  [(NSMutableArray *)self->_enumeratorByDepth addObject:v7];
  remainingItemsByDepth = self->_remainingItemsByDepth;
  id v6 = objc_opt_new();
  [(NSMutableArray *)remainingItemsByDepth addObject:v6];
}

- (id)_popItem
{
  v3 = [(NSMutableArray *)self->_remainingItemsByDepth lastObject];
  id v4 = [v3 objectAtIndexedSubscript:0];

  uint64_t v5 = [(NSMutableArray *)self->_remainingItemsByDepth lastObject];
  [v5 removeObjectAtIndex:0];

  [(FPDItemIterator *)self _decorateItem:v4];
  return v4;
}

- (BOOL)_createEnumerator
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
  uint64_t v5 = [v4 parentItem];
  id v6 = [v5 providerItemID];
  [v3 setEnumeratedItemID:v6];

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__1;
  v49 = __Block_byref_object_dispose__1;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  id v44 = 0;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v3 enumeratedItemID];
    [(FPDItemIterator *)v8 _createEnumerator];
  }

  v9 = [v3 enumeratedItemID];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    objc_super v27 = [NSString stringWithFormat:@"[ASSERT] ‼️ only enumerating items is supported"];
    v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDItemIterator _createEnumerator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 127, (const char *)[v27 UTF8String]);
  }
  dispatch_queue_t v11 = [v3 enumeratedItemID];
  v12 = [v11 domainIdentifier];

  uint64_t v38 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v14 = [WeakRetained domainForIdentifier:v12 reason:&v38];

  if (!v14)
  {
    uint64_t v15 = FPProviderNotFoundError();
    v16 = (void *)v40[5];
    v40[5] = v15;
  }
  v17 = [v14 session];
  v18 = (void *)[v17 newFileProviderProxyWithTimeout:0 pid:180.0];
  v19 = [v18 synchronousRemoteObjectProxy];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __36__FPDItemIterator__createEnumerator__block_invoke;
  v32 = &unk_1E6A743E0;
  v36 = &v39;
  id v20 = v3;
  id v33 = v20;
  v37 = &v45;
  id v21 = v14;
  id v34 = v21;
  v35 = self;
  [v19 fetchAndStartEnumeratingWithSettings:v20 observer:self request:0 completionHandler:&v29];

  uint64_t v22 = v40[5];
  uint64_t v23 = v46[5];
  if (v22)
  {
    if (v23)
    {
LABEL_14:
      -[FPDItemIterator _invalidateWithError:](self, "_invalidateWithError:", v22, v29, v30, v31, v32, v33);
      BOOL v24 = 0;
      goto LABEL_15;
    }
LABEL_11:
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[FPDItemIterator _createEnumerator](v25);
    }

    uint64_t v22 = v40[5];
    goto LABEL_14;
  }
  if (!v23) {
    goto LABEL_11;
  }
  objc_msgSend(v4, "setEnumerator:", v46[5], v29, v30, v31, v32, v33);
  [v4 setNextPage:*MEMORY[0x1E4F25C48]];
  BOOL v24 = 1;
LABEL_15:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v24;
}

void __36__FPDItemIterator__createEnumerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v5)
  {
    if (!v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F25DA8]) initWithConnection:v5 protocol:&unk_1F2EF7328 orError:0 name:@"item iterator" requestPid:0];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
      id v11 = v8;

      v12 = [*(id *)(a1 + 40) session];
      [v12 registerLifetimeExtensionForObject:*(void *)(a1 + 48)];

      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __36__FPDItemIterator__createEnumerator__block_invoke_cold_1(a1, a1 + 56);
  }
LABEL_8:
}

- (BOOL)_enumerateMoreItems
{
  v3 = [(NSMutableArray *)self->_remainingItemsByDepth lastObject];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v16 = [NSString stringWithFormat:@"[ASSERT] ‼️ still have items to process"];
    v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDItemIterator _enumerateMoreItems]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 178, (const char *)[v16 UTF8String]);
  }
  if ([(NSMutableArray *)self->_enumeratorByDepth count] == 1) {
    return 0;
  }
  id v6 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
  uint64_t v7 = [v6 enumerator];

  if (!v7 && ![(FPDItemIterator *)self _createEnumerator]) {
    return 0;
  }
  v8 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
  uint64_t v9 = [v8 nextPage];

  if (v9)
  {
    BOOL v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(FPDItemIterator *)v8 _enumerateMoreItems];
    }

    id v11 = [v8 enumerator];
    v12 = v11;
    if (v11)
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__1;
      v36 = __Block_byref_object_dispose__1;
      id v37 = 0;
      uint64_t v26 = 0;
      objc_super v27 = &v26;
      uint64_t v28 = 0x3032000000;
      uint64_t v29 = __Block_byref_object_copy__1;
      uint64_t v30 = __Block_byref_object_dispose__1;
      id v31 = 0;
      uint64_t v13 = [v11 synchronousRemoteObjectProxy];
      uint64_t v14 = [v8 nextPage];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __38__FPDItemIterator__enumerateMoreItems__block_invoke;
      id v21 = &unk_1E6A74430;
      BOOL v24 = &v32;
      uint64_t v22 = self;
      id v23 = v8;
      v25 = &v26;
      [v13 enumerateItemsFromPage:v14 suggestedPageSize:200 reply:&v18];

      if (v33[5])
      {
        -[FPDItemIterator _invalidateWithError:](self, "_invalidateWithError:", v18, v19, v20, v21, v22);
        BOOL v5 = 0;
      }
      else
      {
        BOOL v5 = v27[5] != 0;
      }

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v32, 8);
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a6);
    v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_2();
    }
  }
  else
  {
    if (v11)
    {
      v17 = [*(id *)(*(void *)(a1 + 32) + 72) lastObject];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __38__FPDItemIterator__enumerateMoreItems__block_invoke_94;
      v20[3] = &unk_1E6A74408;
      id v21 = *(id *)(a1 + 40);
      uint64_t v18 = objc_msgSend(v11, "fp_filter:", v20);
      [v17 addObjectsFromArray:v18];
    }
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_1(v11);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    [*(id *)(a1 + 40) setNextPage:v12];
  }
}

uint64_t __38__FPDItemIterator__enumerateMoreItems__block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 parentItemID];
  BOOL v5 = [*(id *)(a1 + 32) parentItem];
  id v6 = [v5 providerItemID];
  if ([v4 isEqual:v6])
  {
    uint64_t v7 = [v3 providerItemID];
    v8 = [*(id *)(a1 + 32) parentItem];
    uint64_t v9 = [v8 providerItemID];
    uint64_t v10 = [v7 isEqual:v9] ^ 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_decorateItem:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDIterator *)self shouldDecorateItems]
    || [v4 isFolder]
    && [(FPDIterator *)self skipMaterializedTreeTraversal])
  {
    p_domain = &self->_domain;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    uint64_t v7 = [WeakRetained defaultBackend];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      uint64_t v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[FPDItemIterator _decorateItem:](v4);
      }

      id v11 = objc_loadWeakRetained((id *)p_domain);
      id v12 = [v11 defaultBackend];
      v18[0] = v4;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __33__FPDItemIterator__decorateItem___block_invoke;
      v15[3] = &unk_1E6A74458;
      id v16 = v4;
      v17 = v9;
      id v14 = v9;
      [v12 decorateItems:v13 completionHandler:v15];

      dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

void __33__FPDItemIterator__decorateItem___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33__FPDItemIterator__decorateItem___block_invoke_cold_1(a1);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)_shouldTraverseSubTree:(id)a3
{
  id v4 = a3;
  if ([(FPDIterator *)self skipMaterializedTreeTraversal]) {
    int v5 = [v4 isRecursivelyDownloaded] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }
  id v6 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
  uint64_t v7 = [v6 parentItem];
  char v8 = [v7 itemIdentifier];
  uint64_t v9 = [v4 itemIdentifier];
  if ([v8 isEqual:v9])
  {
    char v10 = 0;
  }
  else
  {
    id v11 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
    id v12 = [v11 parentItem];
    [v12 formerIdentifier];
    id v13 = v17 = v5;
    id v14 = [v4 itemIdentifier];
    char v15 = [v13 isEqual:v14];

    char v10 = v17 & ~v15;
  }

  return v10;
}

- (void)_next
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 72) count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, v3, "[DEBUG] iterator: fetching next item (remaining depths: %lld)", v4);
}

- (id)nextWithError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  uint64_t v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__1;
  id v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__FPDItemIterator_nextWithError___block_invoke;
  v8[3] = &unk_1E6A74480;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a2;
  dispatch_sync(queue, v8);
  uint64_t v5 = (void *)v16[5];
  if (a3 && !v5)
  {
    *a3 = (id) v10[5];
    uint64_t v5 = (void *)v16[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __33__FPDItemIterator_nextWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _next];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    if (!*(void *)(v2 + 32) && !*(unsigned char *)(v2 + 48))
    {
      uint64_t v7 = [NSString stringWithFormat:@"[ASSERT] ‼️ invalid state"];
      char v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDItemIterator nextWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDItemIterator.m", 352, (const char *)[v7 UTF8String]);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(MEMORY[0x1E4F25CB8], "locatorForItem:");
  }
  return MEMORY[0x1F41817F8]();
}

- (id)error
{
  return self->_error;
}

- (void)_invalidateWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_done)
  {
    if (v5)
    {
      uint64_t v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[FPDItemIterator _invalidateWithError:]((uint64_t)v5, (uint64_t)self);
      }
    }
    objc_storeStrong((id *)&self->_error, a3);
    current = self->_current;
    self->_current = 0;

    self->_done = 1;
    while (1)
    {
      char v8 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];

      if (!v8) {
        break;
      }
      uint64_t v9 = [(NSMutableArray *)self->_enumeratorByDepth lastObject];
      char v10 = [v9 enumerator];
      [v10 invalidate];

      [(NSMutableArray *)self->_enumeratorByDepth removeLastObject];
    }
    [(NSMutableArray *)self->_remainingItemsByDepth removeAllObjects];
    [(NSMutableArray *)self->_enumeratorByDepth removeAllObjects];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    id v12 = [WeakRetained session];
    [v12 unregisterLifetimeExtensionForObject:self];

    objc_storeWeak((id *)&self->_provider, 0);
  }
}

- (BOOL)done
{
  return self->_done;
}

- (unint64_t)numFoldersPopped
{
  return self->_numFoldersPoped;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FPDItemIterator_dealloc__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)FPDItemIterator;
  [(FPDItemIterator *)&v4 dealloc];
}

uint64_t __26__FPDItemIterator_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:0];
}

- (NSString)prettyDescription
{
  return (NSString *)[NSString stringWithFormat:@"background copy"];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_remainingItemsByDepth, 0);
  objc_storeStrong((id *)&self->_enumeratorByDepth, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_createEnumerator
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a3, (uint64_t)a3, "[DEBUG] iterator: creating enumerator for %@", (uint8_t *)a2);
}

void __36__FPDItemIterator__createEnumerator__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(*(void *)a2 + 8) + 40), "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] couldn't get enumerator for %@ from extension: %@", v5, v6, v7, v8, 2u);
}

- (void)_enumerateMoreItems
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 parentItem];
  uint64_t v5 = [v4 itemID];
  uint64_t v6 = [a1 nextPage];
  int v7 = 138412546;
  uint64_t v8 = v5;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] iterator: enumerating more items starting in %@ starting at %@", (uint8_t *)&v7, 0x16u);
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v1, v2, "[DEBUG] iterator: received %lld items and next page is %@", v3, v4, v5, v6, v7);
}

void __38__FPDItemIterator__enumerateMoreItems__block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] iterator: failed with %@", v2);
}

- (void)_decorateItem:(void *)a1 .cold.1(void *a1)
{
  [a1 isDownloaded];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v1, v2, "[DEBUG] Decorating item %@ isDownloaded ? %@", v3, v4, v5, v6, v7);
}

void __33__FPDItemIterator__decorateItem___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) isDownloaded];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v1, v2, "[DEBUG] Finished decorating item %@ isDownloaded ? %@", v3, v4, v5, v6, v7);
}

- (void)_invalidateWithError:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a2 + 64) firstObject];
  uint64_t v3 = [v2 parentItem];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v4, v5, "[ERROR] invalidating iterator of %@ with error: %@", v6, v7, v8, v9, 2u);
}

@end