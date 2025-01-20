@interface FPPendingSetEnumerator
- (BOOL)isMaximumSizeReached;
- (FPPendingSetEnumerator)initWithManager:(id)a3;
- (NSFileProviderDomainVersion)domainVersion;
- (double)refreshInterval;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation FPPendingSetEnumerator

- (FPPendingSetEnumerator)initWithManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPPendingSetEnumerator;
  v6 = [(FPPendingSetEnumerator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    domainVersion = v7->_domainVersion;
    v7->_domainVersion = 0;

    v7->_refreshInterval = 0.0;
    v7->_maximumSizeReached = 0;
  }

  return v7;
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToData:&_NSFileProviderInitialPageSortedByName] & 1) != 0
    || [v7 isEqualToData:&_NSFileProviderInitialPageSortedByDate])
  {
    uint64_t v8 = objc_opt_new();

    id v7 = (id)v8;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [v6 suggestedPageSize];
  }
  else {
    uint64_t v9 = 200;
  }
  manager = self->_manager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v13[3] = &unk_1E5AF5C50;
  id v14 = v7;
  v15 = self;
  id v16 = v6;
  uint64_t v17 = v9;
  id v11 = v6;
  id v12 = v7;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v13];
}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2;
  v6[3] = &unk_1E5AF5CA0;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 enumeratePendingSetFromSyncAnchor:v3 suggestedBatchSize:v5 completionHandler:v6];
}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, int a5, char a6, void *a7, void *a8, void *a9)
{
  id v16 = a2;
  id v17 = a7;
  id v18 = a9;
  if (v18)
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) finishEnumeratingWithError:v18];
  }
  else
  {
    uint64_t v20 = [a8 domainVersion];
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = *(void **)(v21 + 16);
    *(void *)(v21 + 16) = v20;

    *(double *)(*(void *)(a1 + 32) + 24) = a3;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = a6;
    if ([v16 count])
    {
      v23 = *(void **)(a1 + 40);
      v24 = objc_msgSend(v16, "fp_map:", &__block_literal_global_437);
      [v23 didEnumerateItems:v24];
    }
    if (a5) {
      id v25 = v17;
    }
    else {
      id v25 = 0;
    }
    [*(id *)(a1 + 40) finishEnumeratingUpToPage:v25];
  }
}

id __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_435(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 itemVersion];
  v4 = [v3 versionRewritingBeforeFirstSync];
  [v2 setItemVersion:v4];

  return v2;
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = [v6 suggestedBatchSize];
  }
  else {
    uint64_t v8 = 200;
  }
  manager = self->_manager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_1E5AF5C50;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  uint64_t v16 = v8;
  id v10 = v6;
  id v11 = v7;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v12];
}

void __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2;
  v6[3] = &unk_1E5AF5CA0;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 enumeratePendingSetFromSyncAnchor:v3 suggestedBatchSize:v5 completionHandler:v6];
}

void __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6, void *a7, void *a8, double a9)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a6;
  id v20 = a8;
  if (v20)
  {
    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) finishEnumeratingWithError:v20];
  }
  else
  {
    uint64_t v22 = [a7 domainVersion];
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 16);
    *(void *)(v23 + 16) = v22;

    *(double *)(*(void *)(a1 + 32) + 24) = a9;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = a5;
    if ([v18 count])
    {
      id v25 = *(void **)(a1 + 40);
      v26 = objc_msgSend(v18, "fp_map:", &__block_literal_global_441);
      [v25 didDeleteItemsWithIdentifiers:v26];
    }
    if ([v17 count])
    {
      v27 = *(void **)(a1 + 40);
      v28 = objc_msgSend(v17, "fp_map:", &__block_literal_global_444);
      [v27 didUpdateItems:v28];
    }
    [*(id *)(a1 + 40) finishEnumeratingChangesUpToSyncAnchor:v19 moreComing:a4];
  }
}

uint64_t __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_439(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2_442(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 itemVersion];
  v4 = [v3 versionRewritingBeforeFirstSync];
  [v2 setItemVersion:v4];

  return v2;
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF5C78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v7];
}

void __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5AF5CC8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 currentPendingSetSyncAnchorWithCompletionHandler:v4];
}

uint64_t __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, double a3)
{
  *(double *)(*(void *)(a1 + 32) + 24) = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (BOOL)isMaximumSizeReached
{
  return self->_maximumSizeReached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] Pending enumeration failed: %@", v2, v3, v4, v5, v6);
}

@end