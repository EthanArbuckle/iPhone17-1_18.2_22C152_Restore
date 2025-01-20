@interface FPDSpotlightDaemonClient
- (FPDExtensionManager)extensionManager;
- (FPDSpotlightDaemonClient)initWithExtensionManager:(id)a3;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
@end

@implementation FPDSpotlightDaemonClient

- (FPDSpotlightDaemonClient)initWithExtensionManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPDSpotlightDaemonClient;
  v6 = [(FPDSpotlightDaemonClient *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionManager, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("reindex-queue", v8);
    reindexQueue = v7->_reindexQueue;
    v7->_reindexQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_queue_t v9 = (void (**)(void))a5;
  if ([a4 isEqualToString:*MEMORY[0x1E4F28358]])
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1D744C000, v10, OS_LOG_TYPE_INFO, "[INFO] Received call to reindex all items for bundle ID %@", buf, 0xCu);
    }

    reindexQueue = self->_reindexQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke;
    block[3] = &unk_1E6A73E38;
    block[4] = self;
    id v13 = v8;
    v14 = v9;
    dispatch_async(reindexQueue, block);
  }
  else
  {
    v9[2](v9);
  }
}

void __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  [*(id *)(*(void *)(a1 + 32) + 16) defaultProviderWithTopLevelBundleIdentifier:*(void *)(a1 + 40)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v22 = long long v33 = 0u;
  v3 = [v22 domainsByID];
  v4 = [v3 allValues];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    id v8 = v26;
    v23 = v2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        dispatch_group_enter(v2);
        v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = v7;
          uint64_t v13 = *(void *)(a1 + 40);
          [v10 identifier];
          uint64_t v14 = v6;
          id v16 = v15 = v8;
          uint64_t v17 = objc_msgSend(v16, "fp_obfuscatedFilename");
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v13;
          uint64_t v7 = v12;
          __int16 v36 = 2114;
          v37 = v17;
          _os_log_impl(&dword_1D744C000, v11, OS_LOG_TYPE_INFO, "[INFO] Started running reindex-all for bundleID %{public}@ with domain %{public}@", buf, 0x16u);

          id v8 = v15;
          uint64_t v6 = v14;
          v2 = v23;
        }

        v18 = [v10 defaultBackend];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v26[0] = __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke_1;
        v26[1] = &unk_1E6A73530;
        id v27 = *(id *)(a1 + 40);
        v28 = v10;
        v29 = v2;
        [v18 reindexAllItemsWithDropReason:5 completionHandler:v25];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v6);
  }

  v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v20;
    _os_log_impl(&dword_1D744C000, v19, OS_LOG_TYPE_INFO, "[INFO] Completing call to reindex all items for bundle ID %@", buf, 0xCu);
  }

  v21 = dispatch_get_global_queue(0, 0);
  dispatch_group_notify(v2, v21, *(dispatch_block_t *)(a1 + 48));
}

void __94__FPDSpotlightDaemonClient_reindexAllItemsForBundleID_protectionClass_acknowledgementHandler___block_invoke_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) identifier];
    uint64_t v5 = objc_msgSend(v4, "fp_obfuscatedFilename");
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    dispatch_queue_t v9 = v5;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] Finished running reindex-all for bundleID %{public}@ with domain %{public}@", (uint8_t *)&v6, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(void))a6;
  if ([a5 isEqualToString:*MEMORY[0x1E4F28358]])
  {
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = [v10 count];
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_INFO, "[INFO] Received call to reindex %lu items for bundle ID %@", buf, 0x16u);
    }

    reindexQueue = self->_reindexQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
    v15[3] = &unk_1E6A738F0;
    id v16 = v10;
    uint64_t v17 = self;
    id v18 = v11;
    v19 = v12;
    dispatch_async(reindexQueue, v15);
  }
  else
  {
    v12[2](v12);
  }
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v37 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v47 = 0;
        id v48 = 0;
        [MEMORY[0x1E4F25D30] getDomainIdentifier:&v48 andIdentifier:&v47 fromCoreSpotlightIdentifier:v8];
        id v9 = v48;
        id v10 = v47;
        id v11 = v10;
        if (v9)
        {
          if (v10)
          {
            uint64_t v12 = [v2 objectForKeyedSubscript:v9];
            if (!v12) {
              uint64_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v12 addObject:v8];
            [v2 setObject:v12 forKeyedSubscript:v9];
          }
          else
          {
            uint64_t v12 = fp_current_or_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_cold_1(v58, &v59, v12);
            }
          }
        }
        else
        {
          uint64_t v12 = fp_current_or_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v54 = v8;
            _os_log_error_impl(&dword_1D744C000, v12, OS_LOG_TYPE_ERROR, "[ERROR] Error converting CS identifier %@ to FP domain during reindex", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v5);
  }

  uint64_t v13 = dispatch_group_create();
  uint64_t v14 = (id *)v37;
  __int16 v36 = [*(id *)(*(void *)(v37 + 40) + 16) defaultProviderWithTopLevelBundleIdentifier:*(void *)(v37 + 48)];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = v2;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v38 = *(void *)v44;
    *(void *)&long long v17 = 138543618;
    long long v35 = v17;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, v35);
        if ([v21 count])
        {
          __int16 v22 = v13;
          dispatch_group_enter(v13);
          id v23 = [v36 domainsByID];
          uint64_t v24 = [v23 objectForKeyedSubscript:v20];

          v25 = fp_current_or_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = *(void *)(v37 + 48);
            id v27 = [v24 identifier];
            v28 = objc_msgSend(v27, "fp_obfuscatedFilename");
            *(_DWORD *)buf = v35;
            uint64_t v54 = v26;
            uint64_t v14 = (id *)v37;
            __int16 v55 = 2114;
            v56 = v28;
            _os_log_impl(&dword_1D744C000, v25, OS_LOG_TYPE_INFO, "[INFO] Started running reindex items for bundleID %{public}@ with domain %{public}@", buf, 0x16u);
          }
          v29 = [v24 defaultBackend];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6;
          v39[3] = &unk_1E6A73530;
          id v40 = v24;
          id v41 = v14[6];
          uint64_t v13 = v22;
          v42 = v22;
          id v30 = v24;
          [v29 reindexItemsWithIndexReason:7 identifiers:v21 completionHandler:v39];
        }
      }
      uint64_t v18 = [v15 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v18);
  }

  long long v31 = fp_current_or_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = [v14[4] count];
    id v33 = v14[6];
    *(_DWORD *)buf = 134218242;
    uint64_t v54 = v32;
    __int16 v55 = 2112;
    v56 = v33;
    _os_log_impl(&dword_1D744C000, v31, OS_LOG_TYPE_INFO, "[INFO] Completing call to reindex %lu items for bundle ID %@", buf, 0x16u);
  }

  v34 = dispatch_get_global_queue(0, 0);
  dispatch_group_notify(v13, v34, v14[7]);
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6_cold_1((uint64_t)a1, v3, v5);
    }

    uint64_t v6 = [a1[4] defaultBackend];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_7;
    v10[3] = &unk_1E6A73530;
    id v11 = a1[5];
    id v12 = a1[4];
    id v13 = a1[6];
    [v6 reindexAllItemsWithDropReason:4 completionHandler:v10];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = a1[5];
      uint64_t v8 = [a1[4] identifier];
      id v9 = objc_msgSend(v8, "fp_obfuscatedFilename");
      *(_DWORD *)buf = 138543618;
      id v15 = v7;
      __int16 v16 = 2114;
      long long v17 = v9;
      _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] Finished running reindex items for bundleID %{public}@ with domain %{public}@", buf, 0x16u);
    }
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) identifier];
    uint64_t v5 = objc_msgSend(v4, "fp_obfuscatedFilename");
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_INFO, "[INFO] Finished running fallback reindex-all for bundleID %{public}@ with domain %{public}@", (uint8_t *)&v6, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v9 = a8;
  FPNotSupportedError();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a8 + 2))(v9, 0, v10);
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a8;
  reindexQueue = self->_reindexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  block[3] = &unk_1E6A76218;
  id v23 = v14;
  int64_t v24 = a7;
  id v20 = v13;
  id v21 = v12;
  __int16 v22 = self;
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(reindexQueue, block);
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 64);
  if (*(void *)(a1 + 64))
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_3(v2, v3);
    }
  }
  id v22 = 0;
  id v23 = 0;
  [MEMORY[0x1E4F25D30] getDomainIdentifier:&v23 andIdentifier:&v22 fromCoreSpotlightIdentifier:*(void *)(a1 + 32)];
  id v4 = v23;
  id v5 = v22;
  int v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || !*(void *)(a1 + 40))
  {
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_1();
    }

    __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    __int16 v8 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 16), "defaultProviderWithTopLevelBundleIdentifier:");
    uint64_t v21 = 0;
    id v9 = [v8 domainForIdentifier:v4 reason:&v21];
    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F25D30]);
      id v11 = [v8 identifier];
      id v12 = (void *)[v10 initWithProviderID:v11 domainIdentifier:v4 itemIdentifier:v6];

      id v13 = [v9 defaultBackend];
      id v14 = [MEMORY[0x1E4F29268] currentConnection];
      id v15 = +[FPDRequest requestForXPCConnection:v14];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_11;
      v19[3] = &unk_1E6A761F0;
      id v20 = *(id *)(a1 + 56);
      [v13 URLForItemID:v12 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:0 forBookmarkResolution:0 request:v15 completionHandler:v19];
    }
    else
    {
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_2();
      }

      uint64_t v18 = *(void *)(a1 + 56);
      id v12 = FPProviderNotFoundError();
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v12);
    }
  }
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a3 url];
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_reindexQueue, 0);
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] Error converting CS identifier %@ to FP identifier during reindex", buf, 0xCu);
}

void __104__FPDSpotlightDaemonClient_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_6_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) identifier];
  int v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Error reindexing specific items for domain %@, falling back to reindex all %@", (uint8_t *)&v7, 0x16u);
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] Spotlight provideFileForURL failed to get fp item identifiers %@ for bundle %@");
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] Providing url for bundle id %@, missing domain for identifier %@");
}

void __126__FPDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Options are not supported in FileProvider %ld", (uint8_t *)&v3, 0xCu);
}

@end