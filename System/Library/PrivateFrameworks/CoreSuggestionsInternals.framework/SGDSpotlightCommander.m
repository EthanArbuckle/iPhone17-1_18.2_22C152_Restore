@interface SGDSpotlightCommander
+ (id)sharedInstance;
- (BOOL)_locked;
- (BOOL)_unlocked;
- (SGDSpotlightCommander)init;
- (id)_protectionClasses;
- (id)_reimportQueryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 requestId:(unint64_t)a6;
- (id)queryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 contentTypes:(id)a6;
- (void)_attemptToProcessRequests;
- (void)_executeReimportOfIdentifiers:(id)a3;
- (void)_issueCommand:(id)a3;
- (void)_registerForLockStateChange;
- (void)_reimportFromBundleId:(id)a3 protectionClasses:(id)a4 identifiers:(id)a5;
- (void)_unregisterForLockStateChange;
- (void)requestReimportForHistoricalDataRequest:(id)a3;
- (void)requestReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6;
@end

@implementation SGDSpotlightCommander

- (id)queryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 contentTypes:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v48 = v12;
  id v49 = v11;
  if ([v9 length])
  {
    v13 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v14 = [&unk_1F25366C8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(&unk_1F25366C8);
          }
          uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1CB79B230]();
          v20 = (void *)[[NSString alloc] initWithFormat:@" (%@ == \"*%@*\"cwdt) ", v18, v9];
          [v13 addObject:v20];
        }
        uint64_t v15 = [&unk_1F25366C8 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v15);
    }
    id v21 = [NSString alloc];
    v22 = objc_msgSend(v13, "_pas_componentsJoinedByString:", @" || ");
    v23 = (__CFString *)[v21 initWithFormat:@"(%@) ", v22];

    id v12 = v48;
    id v11 = v49;
  }
  else
  {
    v23 = &stru_1F24EEF20;
  }
  v24 = objc_opt_new();
  if (v10)
  {
    id v25 = [NSString alloc];
    v26 = [v24 stringFromDate:v10];
    v46 = (__CFString *)[v25 initWithFormat:@"$time.iso(%@)", v26];

    if (v11)
    {
LABEL_13:
      id v27 = [NSString alloc];
      v28 = [v24 stringFromDate:v11];
      v29 = (__CFString *)[v27 initWithFormat:@"$time.iso(%@)", v28];

      goto LABEL_16;
    }
  }
  else
  {
    v46 = @"$time.this_year(-1)";
    if (v11) {
      goto LABEL_13;
    }
  }
  v29 = @"$time.today(1)";
LABEL_16:
  v47 = v24;
  if (v12)
  {
    if ([v12 count])
    {
      id v45 = v10;
      v30 = objc_opt_new();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v31 = v12;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v51 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = (void *)[[NSString alloc] initWithFormat:@" (kMDItemContentType == '%@') ", *(void *)(*((void *)&v50 + 1) + 8 * j)];
            [v30 addObject:v36];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v33);
      }

      id v37 = [NSString alloc];
      v38 = objc_msgSend(v30, "_pas_componentsJoinedByString:", @" || ");
      v39 = (__CFString *)[v37 initWithFormat:@"(%@) ", v38];

      id v10 = v45;
      id v12 = v48;
      id v11 = v49;
    }
    else
    {
      v39 = &stru_1F24EEF20;
    }
  }
  else
  {
    v39 = &stru_1F24EEF20;
  }
  id v40 = [NSString alloc];
  if ([(__CFString *)v23 length]) {
    v41 = @"&&";
  }
  else {
    v41 = &stru_1F24EEF20;
  }
  if ([(__CFString *)v39 length]) {
    v42 = @"&&";
  }
  else {
    v42 = &stru_1F24EEF20;
  }
  v43 = (void *)[v40 initWithFormat:@"%@ %@ InRange(kMDItemContentCreationDate,%@,%@) %@ %@", v23, v41, v46, v29, v42, v39];

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_deviceStateToken, 0);
}

- (void)_issueCommand:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_sync_enter(v6);
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: issuing command to spotlight: %@", (uint8_t *)&v8, 0xCu);
    }

    [v6 _issueCommand:v3 completionHandler:&__block_literal_global_36068];
    objc_sync_exit(v6);
  }
  else
  {
    v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error: unable to get spotlight index to issue reimport command to", (uint8_t *)&v8, 2u);
    }
  }
}

void __39__SGDSpotlightCommander__issueCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error during CS issueCommand: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([v4 length])
  {
    v7 = [[NSString alloc] initWithData:v4 encoding:4];
    int v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport command issued: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport command issued", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_reimportFromBundleId:(id)a3 protectionClasses:(id)a4 identifiers:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 count])
  {
    id v10 = [NSString alloc];
    uint64_t v11 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
    id v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_1F24EEF20;
    }
    uint64_t v14 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @",");
    uint64_t v15 = (void *)[v10 initWithFormat:@"job:%@:%@:%d:%d:%@", v16, v13, 1, 2, v14];

    [(SGDSpotlightCommander *)self _issueCommand:v15];
  }
}

- (void)_executeReimportOfIdentifiers:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5DC28];
  id v5 = a3;
  v6 = [(SGDSpotlightCommander *)self _protectionClasses];
  v7 = [v5 objectForKeyedSubscript:v4];
  id v8 = [v7 allObjects];
  [(SGDSpotlightCommander *)self _reimportFromBundleId:v4 protectionClasses:v6 identifiers:v8];

  uint64_t v9 = *MEMORY[0x1E4F5DC38];
  id v12 = [(SGDSpotlightCommander *)self _protectionClasses];
  id v10 = [v5 objectForKeyedSubscript:v9];

  uint64_t v11 = [v10 allObjects];
  [(SGDSpotlightCommander *)self _reimportFromBundleId:v9 protectionClasses:v12 identifiers:v11];
}

- (id)_reimportQueryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 requestId:(unint64_t)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v9 = a4;
  id v29 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-31536000.0];
  id v27 = v9;
  uint64_t v11 = [v9 laterDate:v10];
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = (uint64_t)v28;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)v11;
    __int16 v40 = 2112;
    id v41 = v29;
    _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimportForPersonHandle: %@ : %@ : %@", buf, 0x20u);
  }

  v13 = [(SGDSpotlightCommander *)self queryForPersonHandle:v28 startDate:v11 endDate:v29 contentTypes:&unk_1F2536C20];
  uint64_t v14 = objc_opt_new();
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  id v16 = objc_opt_new();
  [v16 setFetchAttributes:&unk_1F2536C38];
  [v16 setLowPriority:1];
  [v16 setReason:@"reason:SGDSpotlightCommander-1; code:6"];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v13 queryContext:v16];
  if ([MEMORY[0x1E4F93B10] isDeviceFormattedForProtection])
  {
    uint64_t v18 = [(SGDSpotlightCommander *)self _protectionClasses];
    [v17 setProtectionClasses:v18];
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke;
  v34[3] = &unk_1E65BFB68;
  id v19 = v14;
  id v35 = v19;
  [v17 setFoundItemsHandler:v34];
  id location = 0;
  objc_initWeak(&location, v17);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke_50;
  v30[3] = &unk_1E65BEA58;
  objc_copyWeak(&v32, &location);
  v20 = v15;
  id v31 = v20;
  [v17 setCompletionHandler:v30];
  [v17 start];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if ([(SGDSpotlightCommander *)self _unlocked])
  {
    id v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = [v19 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v37 = v25;
      __int16 v38 = 2048;
      unint64_t v39 = a6;
      _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: storing reimport items for %lu bundles for request %llu", buf, 0x16u);
    }

    [(SGSqlEntityStore *)self->_store storeReimportItems:v19 requestId:a6];
  }
  v22 = v31;
  id v23 = v19;

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v23;
}

void __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [v3 count];
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport query found %lu items", buf, 0xCu);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138412290;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "bundleID", v23);
        if (v12)
        {
          v13 = (void *)v12;
          uint64_t v14 = [v11 uniqueIdentifier];

          if (v14)
          {
            dispatch_semaphore_t v15 = [v11 bundleID];
            if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v15])
            {
              id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];

              if (!v16)
              {
                v17 = sgLogHandle();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v23;
                  uint64_t v29 = (uint64_t)v15;
                  _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: foundItemsHandler making new set for %@", buf, 0xCu);
                }

                uint64_t v18 = objc_opt_new();
                [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v15];
              }
              id v19 = sgLogHandle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v22 = [v11 uniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v29 = (uint64_t)v15;
                __int16 v30 = 2112;
                id v31 = v22;
                _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: foundItemsHandler: %@ - %@", buf, 0x16u);
              }
              v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
              id v21 = [v11 uniqueIdentifier];
              [v20 addObject:v21];
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }
}

void __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = sgLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [v3 userInfo];
        int v9 = 138412546;
        uint64_t v10 = (uint64_t)v3;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error: reimport search query error: %@: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [WeakRetained foundItemCount];
      int v9 = 134217984;
      uint64_t v10 = v7;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: total items to be reimported: %tu", (uint8_t *)&v9, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)_protectionClasses
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F28348];
  v6[0] = *MEMORY[0x1E4F28340];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F28378];
  v6[2] = *MEMORY[0x1E4F28358];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  return v4;
}

- (void)_attemptToProcessRequests
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SGDSpotlightCommander__attemptToProcessRequests__block_invoke;
  block[3] = &unk_1E65BEF88;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __50__SGDSpotlightCommander__attemptToProcessRequests__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _locked])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 _registerForLockStateChange];
    return;
  }
  uint64_t v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "SGDSpotlightCommander: attempting to process reimport requests", buf, 2u);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) loadUnqueriedReimportRequests];
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v33;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: found %lu unqueried reimport requests", buf, 0xCu);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        int v12 = [*(id *)(a1 + 32) _locked];
        uint64_t v13 = *(void **)(a1 + 32);
        if (v12)
        {
          [*(id *)(a1 + 32) _registerForLockStateChange];
          id v20 = v6;
          goto LABEL_35;
        }
        uint64_t v14 = [v11 personHandle];
        dispatch_semaphore_t v15 = [v11 startDate];
        id v16 = [v11 endDate];
        id v17 = (id)objc_msgSend(v13, "_reimportQueryForPersonHandle:startDate:endDate:requestId:", v14, v15, v16, objc_msgSend(v11, "requestId"));

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }

  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 16) loadUnexecutedReimportRequests];
  id v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [v18 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v34;
    _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: found %lu unexecuted reimport requests", buf, 0xCu);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v21) {
    goto LABEL_28;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v36;
  while (2)
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v36 != v23) {
        objc_enumerationMutation(v20);
      }
      long long v25 = *(void **)(*((void *)&v35 + 1) + 8 * v24);
      int v26 = objc_msgSend(*(id *)(a1 + 32), "_locked", (void)v35);
      long long v27 = *(id **)(a1 + 32);
      if (v26)
      {
        [v27 _registerForLockStateChange];
LABEL_33:

        goto LABEL_35;
      }
      id v28 = objc_msgSend(v27[2], "loadUnseenReimportItemsForRequest:", objc_msgSend(v25, "requestId"));
      int v29 = [*(id *)(a1 + 32) _locked];
      __int16 v30 = *(void **)(a1 + 32);
      if (v29)
      {
        [v30 _registerForLockStateChange];

        goto LABEL_33;
      }
      [v30 _executeReimportOfIdentifiers:v28];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "markReimportRequestAsExecutedWithRequestId:", objc_msgSend(v25, "requestId"));

      ++v24;
    }
    while (v22 != v24);
    uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_28:

  int v31 = [*(id *)(a1 + 32) _locked];
  id v32 = *(void **)(a1 + 32);
  if (v31) {
    [v32 _registerForLockStateChange];
  }
  else {
    [v32 _unregisterForLockStateChange];
  }
LABEL_35:
}

- (BOOL)_unlocked
{
  return [MEMORY[0x1E4F93B10] isUnlocked];
}

- (BOOL)_locked
{
  return [MEMORY[0x1E4F93B10] isUnlocked] ^ 1;
}

- (void)_unregisterForLockStateChange
{
  if (self->_deviceStateToken)
  {
    uint64_t v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: unregistering for lock state change", v5, 2u);
    }

    [MEMORY[0x1E4F93B10] unregisterForLockStateChangeNotifications:self->_deviceStateToken];
    id deviceStateToken = self->_deviceStateToken;
    self->_id deviceStateToken = 0;
  }
}

- (void)_registerForLockStateChange
{
  if (!self->_deviceStateToken)
  {
    uint64_t v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: registering for lock state change", (uint8_t *)location, 2u);
    }

    location[0] = 0;
    objc_initWeak(location, self);
    uint64_t v4 = (void *)MEMORY[0x1E4F93B10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SGDSpotlightCommander__registerForLockStateChange__block_invoke;
    v7[3] = &unk_1E65BEA30;
    objc_copyWeak(&v8, location);
    id v5 = [v4 registerForLockStateChangeNotifications:v7];
    id deviceStateToken = self->_deviceStateToken;
    self->_id deviceStateToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __52__SGDSpotlightCommander__registerForLockStateChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _attemptToProcessRequests];
}

- (void)requestReimportForHistoricalDataRequest:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SGDSpotlightCommander_requestReimportForHistoricalDataRequest___block_invoke;
  v7[3] = &unk_1E65BFD88;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __65__SGDSpotlightCommander_requestReimportForHistoricalDataRequest___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v3;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSpotlightCommander: got reimport request: %@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) loadUnqueriedReimportRequests];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      if (objc_msgSend(*(id *)(a1 + 32), "subsetOfHistoricalDataRequest:", v9, (void)v15)) {
        break;
      }
      uint64_t v10 = [*(id *)(a1 + 32) pluginIdentifier];
      __int16 v11 = [v9 pluginIdentifier];
      int v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        uint64_t v13 = sgLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v9;
          uint64_t v14 = "ignoring reimport request since plugin already has a pending request: %@";
LABEL_17:
          _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
        }
        goto LABEL_18;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    uint64_t v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v9;
      uint64_t v14 = "ignoring reimport request since it is subset of existing query: %@";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_12:

  [*(id *)(*(void *)(a1 + 40) + 16) storeReimportRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _attemptToProcessRequests];
LABEL_19:
}

- (void)requestReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v10 = (__CFString *)a3;
  __int16 v11 = +[FIAPHistoricalDataRequest historicalDataRequestWithPersonHandle:a4 startDate:a5 endDate:a6];
  id v13 = v11;
  if (v10) {
    int v12 = v10;
  }
  else {
    int v12 = @"unknown";
  }
  [v11 setPluginIdentifier:v12];

  [(SGDSpotlightCommander *)self requestReimportForHistoricalDataRequest:v13];
}

- (SGDSpotlightCommander)init
{
  v10.receiver = self;
  v10.super_class = (Class)SGDSpotlightCommander;
  uint64_t v2 = [(SGDSpotlightCommander *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[SGSqlEntityStore defaultStore];
    store = v2->_store;
    v2->_store = (SGSqlEntityStore *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)5u, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.suggestions.spotlightCommander.reimportRequests", v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

    [(SGDSpotlightCommander *)v2 _registerForLockStateChange];
    if ([(SGDSpotlightCommander *)v2 _unlocked]) {
      [(SGDSpotlightCommander *)v2 _attemptToProcessRequests];
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SGDSpotlightCommander_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_36153 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_36153, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_36154;
  return v2;
}

void __39__SGDSpotlightCommander_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_36154;
  sharedInstance__pasExprOnceResult_36154 = v1;
}

@end