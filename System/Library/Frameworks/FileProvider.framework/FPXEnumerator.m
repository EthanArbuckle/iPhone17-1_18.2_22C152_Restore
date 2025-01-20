@interface FPXEnumerator
- (FPItemID)observedItemID;
- (FPXEnumerator)initWithObservedItemID:(id)a3 domainContext:(id)a4 vendorEnumerator:(id)a5 nsFileProviderRequest:(id)a6 observer:(id)a7 isWorkingSetEnum:(BOOL)a8 queue:(id)a9;
- (FPXEnumeratorObserver)observer;
- (NSString)description;
- (id)vendorEnumerator;
- (void)_invalidate;
- (void)alternateContentsWereUpdatedAtURL:(id)a3 forItem:(id)a4;
- (void)currentSyncAnchorWithCompletion:(id)a3;
- (void)dealloc;
- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6;
- (void)forceAddFileURLsForItems:(id)a3;
- (void)forceItemUpdate:(id)a3;
- (void)invalidate;
- (void)invalidateVendorEnumeration;
@end

@implementation FPXEnumerator

- (FPXEnumerator)initWithObservedItemID:(id)a3 domainContext:(id)a4 vendorEnumerator:(id)a5 nsFileProviderRequest:(id)a6 observer:(id)a7 isWorkingSetEnum:(BOOL)a8 queue:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v59 = a7;
  id v19 = a7;
  id v20 = a9;
  v65.receiver = self;
  v65.super_class = (Class)FPXEnumerator;
  v21 = [(FPXEnumerator *)&v65 init];
  v22 = v21;
  if (v21)
  {
    id v57 = v17;
    id v58 = a3;
    id v55 = v20;
    id v56 = v18;
    id v54 = v15;
    objc_storeStrong((id *)&v21->_domainContext, a4);
    v23 = [(FPXDomainContext *)v22->_domainContext log];
    id v24 = fpfs_adopt_log(v23);

    v25 = [(FPXDomainContext *)v22->_domainContext domain];
    uint64_t v26 = [v25 personaIdentifier];
    if (v26)
    {
      v27 = (void *)v26;
      p_domainContext = (id *)&v22->_domainContext;
      [(FPXDomainContext *)v22->_domainContext domain];
      v28 = id v52 = v19;
      [v28 personaIdentifier];
      v29 = id v53 = v16;
      v30 = [MEMORY[0x1E4FB36F8] sharedManager];
      v31 = [v30 currentPersona];
      v32 = [v31 userPersonaUniqueString];
      char v33 = [v29 isEqualToString:v32];

      id v16 = v53;
      id v19 = v52;

      if ((v33 & 1) == 0)
      {
        v34 = NSString;
        v35 = [MEMORY[0x1E4FB36F8] sharedManager];
        v36 = [v35 currentPersona];
        v37 = [v36 userPersonaUniqueString];
        v38 = [MEMORY[0x1E4FB36F8] sharedManager];
        v39 = [v38 currentPersona];
        uint64_t v40 = [v39 uid];
        v41 = [*p_domainContext domain];
        v42 = [v41 personaIdentifier];
        v43 = [v34 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v37, v40, v42];

        v44 = fp_current_or_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          +[FPXExtensionContext principalClass]();
        }

        __assert_rtn("-[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 360, (const char *)[v43 UTF8String]);
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v22->_vendorEnumerator, a5);
    objc_storeStrong((id *)&v22->_nsFileProviderRequest, obj);
    v22->_isWorkingSetEnum = a8;
    objc_storeStrong((id *)&v22->_queue, a9);
    uint64_t v45 = [v16 log];
    log = v22->_log;
    v22->_log = (OS_os_log *)v45;

    id location = 0;
    objc_initWeak(&location, v22);
    id v18 = v56;
    id v17 = v57;
    id v20 = v55;
    if ([v19 conformsToProtocol:&unk_1EF6E6920])
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke;
      v62[3] = &unk_1E5AF3210;
      objc_copyWeak(&v63, &location);
      uint64_t v47 = [v19 remoteObjectProxyWithErrorHandler:v62];
      observer = v22->_observer;
      v22->_observer = (FPXEnumeratorObserver *)v47;

      objc_destroyWeak(&v63);
    }
    else
    {
      objc_storeStrong((id *)&v22->_observer, v59);
    }
    objc_storeStrong((id *)&v22->_observedItemID, v58);
    v49 = fp_current_or_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[FPXEnumerator initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:]();
    }

    objc_destroyWeak(&location);
    id v15 = v54;
  }

  return v22;
}

void __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke_cold_1();
  }

  [WeakRetained invalidate];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %@ %@>", objc_opt_class(), self, self->_domainContext, self->_observedItemID];
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: dealloc", v1, 0xCu);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [(FPXDomainContext *)self->_domainContext log];
  id v4 = fpfs_adopt_log(v3);

  v5 = [(FPXDomainContext *)self->_domainContext domain];
  uint64_t v6 = [v5 personaIdentifier];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(FPXDomainContext *)self->_domainContext domain];
    v9 = [v8 personaIdentifier];
    v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    v11 = [v10 currentPersona];
    v12 = [v11 userPersonaUniqueString];
    char v13 = [v9 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      v14 = NSString;
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];
      id v17 = [v16 userPersonaUniqueString];
      id v18 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v19 = [v18 currentPersona];
      uint64_t v20 = [v19 uid];
      v21 = [(FPXDomainContext *)self->_domainContext domain];
      v22 = [v21 personaIdentifier];
      v23 = [v14 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v17, v20, v22];

      id v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXEnumerator _invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 403, (const char *)[v23 UTF8String]);
    }
  }
  else
  {
  }
  v25 = [(FPXDomainContext *)self->_domainContext extensionContext];
  [v25 enumeratorWasInvalidated:self];

  [(FPXEnumerator *)self invalidateVendorEnumeration];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__FPXEnumerator_invalidate__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__FPXEnumerator_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateVendorEnumeration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_vendorEnumerator)
  {
    uint64_t section = __fp_create_section();
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      vendorEnumerator = v2->_vendorEnumerator;
      *(_DWORD *)buf = 134218498;
      uint64_t v8 = section;
      __int16 v9 = 2112;
      v10 = v2;
      __int16 v11 = 2112;
      v12 = vendorEnumerator;
      _os_log_debug_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: invalidating vendor enumeration: %@", buf, 0x20u);
    }

    [(NSFileProviderEnumerator *)v2->_vendorEnumerator invalidate];
    id v4 = v2->_vendorEnumerator;
    v2->_vendorEnumerator = 0;

    __fp_leave_section_Debug((uint64_t)&section);
  }
  objc_sync_exit(v2);
}

- (id)vendorEnumerator
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_vendorEnumerator;
  objc_sync_exit(v2);

  return v3;
}

- (void)forceItemUpdate:(id)a3
{
  id v4 = [(FPXDomainContext *)self->_domainContext itemFromVendorItem:a3];
  [(FPXEnumeratorObserver *)self->_observer didUpdateItem:v4];
}

- (void)forceAddFileURLsForItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FPXDomainContext *)self->_domainContext v2Instance];
  uint64_t v6 = (void *)v5;
  if (self->_isWorkingSetEnum && v5 != 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "fileURL", (void)v17);

          if (!v14)
          {
            id v15 = [v13 itemIdentifier];
            id v16 = [v6 URLForItemWithPersistentIdentifier:v15];
            [v13 setFileURL:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  fp_dispatch_async_with_logs(queue, v7);
}

void __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
  v3 = [v2 personaIdentifier];
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
    uint64_t v5 = [v4 personaIdentifier];
    id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
    v7 = [v6 currentPersona];
    id v8 = [v7 userPersonaUniqueString];
    char v9 = [v5 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = NSString;
      uint64_t v11 = [MEMORY[0x1E4FB36F8] sharedManager];
      v12 = [v11 currentPersona];
      uint64_t v13 = [v12 userPersonaUniqueString];
      v14 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v15 = [v14 currentPersona];
      uint64_t v16 = [v15 uid];
      long long v17 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
      long long v18 = [v17 personaIdentifier];
      long long v19 = [v10 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v13, v16, v18];

      long long v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 462, (const char *)[v19 UTF8String]);
    }
  }
  else
  {
  }
  v21 = [*(id *)(a1 + 32) vendorEnumerator];
  if (v21)
  {
    if (objc_opt_respondsToSelector())
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke_175;
      v39[3] = &unk_1E5AF3238;
      uint64_t v22 = *(void **)(a1 + 40);
      v39[4] = *(void *)(a1 + 32);
      id v40 = v22;
      [v21 currentSyncAnchorWithCompletionHandler:v39];
    }
    else
    {
      v41 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
      v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v36 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
        uint64_t v37 = *(void *)(a1 + 32);
        uint64_t v30 = *MEMORY[0x1E4F281F8];
        v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
        *(_DWORD *)buf = 134219010;
        v43 = v36;
        __int16 v44 = 2112;
        uint64_t v45 = v37;
        __int16 v46 = 2080;
        uint64_t v47 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
        __int16 v48 = 2112;
        uint64_t v49 = 0;
        __int16 v50 = 2112;
        v51 = v38;
        _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      else
      {
        uint64_t v30 = *MEMORY[0x1E4F281F8];
      }

      uint64_t v31 = *(void *)(a1 + 40);
      v32 = [MEMORY[0x1E4F28C58] errorWithDomain:v30 code:3328 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v32);

      __fp_pop_log(&v41);
    }
  }
  else
  {
    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v43 = v24;
      _os_log_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    v41 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      char v33 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      v35 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
      *(_DWORD *)buf = 134219010;
      v43 = v33;
      __int16 v44 = 2112;
      uint64_t v45 = v34;
      __int16 v46 = 2080;
      uint64_t v47 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
      __int16 v48 = 2112;
      uint64_t v49 = 0;
      __int16 v50 = 2112;
      v51 = v35;
      _os_log_debug_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
    else
    {
      uint64_t v26 = *MEMORY[0x1E4F281F8];
    }

    uint64_t v27 = *(void *)(a1 + 40);
    v28 = [MEMORY[0x1E4F28C58] errorWithDomain:v26 code:260 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v28);

    __fp_pop_log(&v41);
  }
}

void __49__FPXEnumerator_currentSyncAnchorWithCompletion___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v7 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock(*(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    char v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPXEnumerator currentSyncAnchorWithCompletion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log(&v7);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke;
  v13[3] = &unk_1E5AF32B0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  fp_dispatch_async_with_logs(queue, v13);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v39 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
  id v3 = [*(id *)(*(void *)v2 + 8) domain];
  id v4 = [v3 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
    uint64_t v6 = [v5 personaIdentifier];
    v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      int64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
      long long v19 = [v18 personaIdentifier];
      long long v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 486, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v22 = objc_msgSend(NSString, "fp_hashForToken:", *(void *)(a1 + 40));
  v23 = [*(id *)(a1 + 32) vendorEnumerator];
  id v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = v25;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2114;
    uint64_t v45 = v22;
    _os_log_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: enumerate items on %@ from page %{public}@", buf, 0x20u);
  }

  if (v23)
  {
    uint64_t v26 = [[FPXItemsObserver alloc] initWithObservedItemID:*(void *)(*(void *)(a1 + 32) + 32) domainContext:*(void *)(*(void *)(a1 + 32) + 8) nsFileProviderRequest:*(void *)(*(void *)(a1 + 32) + 24)];
    [(FPXItemsObserver *)v26 setSuggestedPageSize:*(void *)(a1 + 56)];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_178;
    v35[3] = &unk_1E5AF3260;
    uint64_t v27 = *(void **)(a1 + 40);
    v35[4] = *(void *)(a1 + 32);
    id v36 = v27;
    id v38 = *(id *)(a1 + 48);
    id v37 = v22;
    [(FPXItemsObserver *)v26 setFinishedBlock:v35];
    if (objc_opt_respondsToSelector())
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_186;
      v31[3] = &unk_1E5AF3288;
      v31[4] = *(void *)(a1 + 32);
      id v34 = *(id *)(a1 + 48);
      v32 = v26;
      id v33 = *(id *)(a1 + 40);
      [v23 currentSyncAnchorWithCompletionHandler:v31];
    }
    else
    {
      [v23 enumerateItemsForObserver:v26 startingAtPage:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = v29;
      _os_log_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, FPXItemsObserver *))(v30 + 16))(v30, MEMORY[0x1E4F1CBF0], 0, 0, 0, v26);
  }

  __fp_pop_log(&v39);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_178(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v44 = a3;
  id v42 = a4;
  id v43 = a5;
  id v11 = a6;
  __int16 v50 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
  if (v11)
  {
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [*(id *)(a1 + 32) vendorEnumerator];
      id v14 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v52 = v13;
      __int16 v53 = 2114;
      id v54 = v14;
      __int16 v55 = 2112;
      *(void *)id v56 = v11;
      _os_log_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_INFO, "[INFO] item enumeration on %@ from page %{public}@ returned error %@", buf, 0x20u);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (![*(id *)(a1 + 40) isEqualToData:v44])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 41))
    {
LABEL_5:
      [*(id *)(a1 + 32) forceAddFileURLsForItems:v45];
      id v15 = [*(id *)(*(void *)(a1 + 32) + 8) internalErrorFromVendorError:v11 callerDescription:@"enumerateItemsFromPage"];
      int64_t v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v35 = *(void **)(a1 + 32);
        int v36 = [v45 count];
        *(_DWORD *)buf = 138413314;
        uint64_t v52 = v35;
        __int16 v53 = 2080;
        id v54 = "-[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:]_block_invoke";
        __int16 v55 = 1024;
        *(_DWORD *)id v56 = v36;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = v43;
        __int16 v57 = 2112;
        id v58 = v15;
        _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@, reply of %s %d, %@, %@", buf, 0x30u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_8;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v12 = v45;
    uint64_t v27 = [v12 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (!v27) {
      goto LABEL_4;
    }
    uint64_t v28 = *(void *)v47;
    uint64_t v41 = 138543618;
LABEL_18:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v47 != v28) {
        objc_enumerationMutation(v12);
      }
      uint64_t v30 = *(void **)(*((void *)&v46 + 1) + 8 * v29);
      uint64_t v31 = objc_msgSend(v30, "parentItemID", v41);
      if ([v31 isEqualToItemID:*(void *)(*(void *)(a1 + 32) + 32)]) {
        goto LABEL_25;
      }
      v32 = [v30 itemID];
      char v33 = [v32 isEqualToItemID:*(void *)(*(void *)(a1 + 32) + 32)];

      if ((v33 & 1) == 0) {
        break;
      }
LABEL_26:
      if (v27 == ++v29)
      {
        uint64_t v27 = [v12 countByEnumeratingWithState:&v46 objects:v59 count:16];
        if (!v27) {
          goto LABEL_4;
        }
        goto LABEL_18;
      }
    }
    uint64_t v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v34 = [*(id *)(a1 + 32) vendorEnumerator];
      *(_DWORD *)buf = v41;
      uint64_t v52 = v34;
      __int16 v53 = 2114;
      id v54 = (const char *)v30;
      _os_log_error_impl(&dword_1A33AE000, v31, OS_LOG_TYPE_ERROR, "[ERROR] Enumerator %{public}@ returned the %{public}@ item whose parent is not the expected one. This may reveal a bug in the provider implementation.", buf, 0x16u);
    }
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v17 = fp_current_or_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v37 = [*(id *)(a1 + 32) vendorEnumerator];
    id v38 = *(const char **)(a1 + 40);
    v39 = objc_msgSend(NSString, "fp_hashForToken:", v38);
    *(_DWORD *)buf = 138543874;
    uint64_t v52 = v37;
    __int16 v53 = 2114;
    id v54 = v38;
    __int16 v55 = 2114;
    *(void *)id v56 = v39;
    _os_log_error_impl(&dword_1A33AE000, v17, OS_LOG_TYPE_ERROR, "[ERROR] Enumerator %{public}@ was asked to enumerate from page %{public}@ (%{public}@), but returned the same page back. This is an implementation error in the enumerator.", buf, 0x20u);
  }
  fp_simulate_crash(@"Enumerator was asked to enumerate from a page, but returned the same page back. This is an implementation error in the enumerator.", v18, v19, v20, v21, v22, v23, v24, v40);
  uint64_t v25 = fp_current_or_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_178_cold_1(v25);
  }

  uint64_t v26 = *(void *)(a1 + 56);
  id v15 = FPPluginOperationFailedError(0);
  (*(void (**)(uint64_t, void, void, void, id, void *))(v26 + 16))(v26, MEMORY[0x1E4F1CBF0], 0, 0, v43, v15);
LABEL_8:

  __fp_pop_log(&v50);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) vendorEnumerator];

  if (v4)
  {
    [*(id *)(a1 + 40) verifyVendorToken:v3];
    [*(id *)(a1 + 40) setSyncAnchor:v3];
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_msgSend(NSString, "fp_hashForToken:", v3);
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] current change token is %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v7 = [*(id *)(a1 + 32) vendorEnumerator];
    [v7 enumerateItemsForObserver:*(void *)(a1 + 40) startingAtPage:*(void *)(a1 + 48)];
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v10 + 16))(v10, MEMORY[0x1E4F1CBF0], 0, 0, 0, v7);
  }
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke;
  v14[3] = &unk_1E5AF3300;
  id v16 = v11;
  int64_t v17 = a5;
  v14[4] = self;
  id v15 = v10;
  int64_t v18 = a4;
  id v12 = v10;
  id v13 = v11;
  [(FPXEnumerator *)self enumerateItemsFromPage:v12 suggestedPageSize:a4 reply:v14];
}

void __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v28 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
  if (v15)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v16 = [v11 count];
    uint64_t v17 = *(void *)(a1 + 56);
    if (v16 >= v17) {
      uint64_t v18 = *(void *)(a1 + 56);
    }
    else {
      uint64_t v18 = v16;
    }
    if (v17 <= 0) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v20 = objc_msgSend(v11, "subarrayWithRange:", 0, v19);
    uint64_t v21 = [v20 count];
    if (!v12 || *(id *)(a1 + 40) == v12 || (uint64_t v22 = v19 - v21, v22 < 1))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 64);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke_2;
      v25[3] = &unk_1E5AF32D8;
      id v27 = *(id *)(a1 + 48);
      id v26 = v20;
      [v23 enumerateItemsFromPage:v12 suggestedPageSize:v24 upTo:v22 reply:v25];
    }
  }
  __fp_pop_log(&v28);
}

void __69__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_upTo_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 arrayByAddingObjectsFromArray:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke;
  v14[3] = &unk_1E5AF3350;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v10;
  SEL v18 = a2;
  int64_t v19 = a4;
  id v12 = v10;
  id v13 = v9;
  fp_dispatch_async_with_logs(queue, v14);
}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    char v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"FPXEnumerator.m", 588, @"Invalid parameter not satisfying: %@", @"enumeratedFromToken" object file lineNumber description];
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 8) domain];
  uint64_t v3 = [v2 personaIdentifier];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 8) domain];
    id v6 = [v5 personaIdentifier];
    id v7 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v8 = [v7 currentPersona];
    id v9 = [v8 userPersonaUniqueString];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = NSString;
      id v12 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v13 = [v12 currentPersona];
      id v14 = [v13 userPersonaUniqueString];
      id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      uint64_t v16 = [v15 currentPersona];
      uint64_t v17 = [v16 uid];
      SEL v18 = [*(id *)(*(void *)(a1 + 40) + 8) domain];
      int64_t v19 = [v18 personaIdentifier];
      uint64_t v20 = [v11 stringWithFormat:@"unexpected persona %@ (%i) instead of expected %@", v14, v17, v19];

      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        +[FPXExtensionContext principalClass]();
      }

      __assert_rtn("-[FPXEnumerator enumerateChangesFromToken:suggestedBatchSize:reply:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 589, (const char *)[v20 UTF8String]);
    }
  }
  else
  {
  }
  uint64_t v22 = objc_msgSend(NSString, "fp_hashForToken:", *(void *)(a1 + 32));
  uint64_t v23 = [*(id *)(a1 + 40) vendorEnumerator];
  uint64_t v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v25;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2114;
    id v44 = v22;
    _os_log_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: enumerate changes on %@ from token %{public}@", buf, 0x20u);
  }

  if (v23)
  {
    id v26 = [[FPXChangesObserver alloc] initWithObservedItemID:*(void *)(*(void *)(a1 + 40) + 32) domainContext:*(void *)(*(void *)(a1 + 40) + 8) previousChangeToken:*(void *)(a1 + 32) nsFileProviderRequest:*(void *)(*(void *)(a1 + 40) + 24)];
    [(FPXChangesObserver *)v26 setSuggestedBatchSize:*(void *)(a1 + 64)];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_192;
    v34[3] = &unk_1E5AF3328;
    v34[4] = *(void *)(a1 + 40);
    id v27 = v23;
    id v35 = v27;
    id v36 = v22;
    id v37 = *(id *)(a1 + 32);
    id v38 = *(id *)(a1 + 48);
    [(FPXChangesObserver *)v26 setFinishedBlock:v34];
    if (objc_opt_respondsToSelector())
    {
      [v27 enumerateChangesForObserver:v26 fromSyncAnchor:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_cold_1(v31);
      }

      v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
      [(FPXChangesObserver *)v26 finishEnumeratingWithError:v32];
    }
  }
  else
  {
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v29;
      _os_log_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] request on invalidated enumerator: %@", buf, 0xCu);
    }

    uint64_t v30 = *(void *)(a1 + 48);
    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void, FPXChangesObserver *))(v30 + 16))(v30, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, 0, 0, v26);
  }
}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_192(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v27 = fpfs_adopt_log(*(void **)(*(void *)(a1 + 32) + 56));
  if (v17)
  {
    SEL v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      *(void *)char v33 = v17;
      _os_log_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_INFO, "[INFO] change enumeration on %@ from page %{public}@ returned error %@", buf, 0x20u);
    }
  }
  if (a4)
  {
    if ([v15 isEqual:*(void *)(a1 + 56)])
    {
      uint64_t v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_INFO, "[INFO] enumeration has more change, but the token is unchanged, discarding hasMoreChanges", buf, 2u);
      }

      a4 = 0;
    }
    else
    {
      a4 = 1;
    }
  }
  [*(id *)(a1 + 32) forceAddFileURLsForItems:v13];
  uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 8) internalErrorFromVendorError:v17 callerDescription:@"enumerateChangesFromToken"];
  uint64_t v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    int v26 = [v13 count];
    int v25 = [v14 count];
    *(_DWORD *)buf = 138413826;
    uint64_t v29 = v24;
    __int16 v30 = 2080;
    uint64_t v31 = "-[FPXEnumerator enumerateChangesFromToken:suggestedBatchSize:reply:]_block_invoke";
    __int16 v32 = 1024;
    *(_DWORD *)char v33 = v26;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v25;
    __int16 v34 = 1024;
    int v35 = a4;
    __int16 v36 = 2112;
    id v37 = v16;
    __int16 v38 = 2112;
    v39 = v22;
    _os_log_debug_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ipc: %@, reply of %s %d, %d, %{BOOL}d,%@,  %@", buf, 0x3Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  __fp_pop_log(&v27);
}

- (FPItemID)observedItemID
{
  return self->_observedItemID;
}

- (void)alternateContentsWereUpdatedAtURL:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[FPXEnumeratorAlternateContentsItem alloc] initWithOriginalDocumentItem:v7 alternateContentsURL:v6];

  id v9 = [(FPXDomainContext *)self->_domainContext itemFromVendorItem:v8];
  if (v9)
  {
    [(FPXEnumeratorObserver *)self->_observer didUpdateItem:v9];
  }
  else
  {
    char v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FPXEnumerator alternateContentsWereUpdatedAtURL:forItem:]();
    }
  }
}

- (FPXEnumeratorObserver)observer
{
  return (FPXEnumeratorObserver *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observedItemID, 0);
  objc_storeStrong((id *)&self->_nsFileProviderRequest, 0);
  objc_storeStrong((id *)&self->_vendorEnumerator, 0);

  objc_storeStrong((id *)&self->_domainContext, 0);
}

- (void)initWithObservedItemID:domainContext:vendorEnumerator:nsFileProviderRequest:observer:isWorkingSetEnum:queue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] %@: created with enumerator: %@");
}

void __125__FPXEnumerator_initWithObservedItemID_domainContext_vendorEnumerator_nsFileProviderRequest_observer_isWorkingSetEnum_queue___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] observer was invalidated, invalidating %@", v1, 0xCu);
}

void __64__FPXEnumerator_enumerateItemsFromPage_suggestedPageSize_reply___block_invoke_178_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[SIMCRASH] Enumerator was asked to enumerate from a page, but returned the same page back. This is an implementation error in the enumerator.", v1, 2u);
}

void __68__FPXEnumerator_enumerateChangesFromToken_suggestedBatchSize_reply___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ⚠️ vendor doesn't implement delta changes support", v1, 2u);
}

- (void)alternateContentsWereUpdatedAtURL:forItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] nil item for alternate contents URL: %@", v1, 0xCu);
}

@end