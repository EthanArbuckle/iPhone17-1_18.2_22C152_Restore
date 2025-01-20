@interface FPMaterializedSetEnumerator
- (FPMaterializedSetEnumerator)initWithManager:(id)a3;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation FPMaterializedSetEnumerator

- (FPMaterializedSetEnumerator)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPMaterializedSetEnumerator;
  v6 = [(FPMaterializedSetEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
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
  v13[2] = __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v13[3] = &unk_1E5AF5C50;
  id v14 = v7;
  v15 = self;
  id v16 = v6;
  uint64_t v17 = v9;
  id v11 = v6;
  id v12 = v7;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v13];
}

void __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2;
  v6[3] = &unk_1E5AF5C28;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 enumerateMaterializedSetFromSyncAnchor:v3 suggestedBatchSize:v5 completionHandler:v6];
}

void __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v15 = a2;
  id v11 = a5;
  if (a7)
  {
    [*(id *)(a1 + 40) finishEnumeratingWithError:a7];
  }
  else
  {
    if ([v15 count])
    {
      id v12 = *(void **)(a1 + 40);
      v13 = objc_msgSend(v15, "fp_map:", &__block_literal_global_408);
      [v12 didEnumerateItems:v13];
    }
    if (a4) {
      id v14 = v11;
    }
    else {
      id v14 = 0;
    }
    [*(id *)(a1 + 40) finishEnumeratingUpToPage:v14];
  }
}

id __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_3(uint64_t a1, void *a2)
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
  v12[2] = __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_1E5AF5C50;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  uint64_t v16 = v8;
  id v10 = v6;
  id v11 = v7;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v12];
}

void __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2;
  v6[3] = &unk_1E5AF5C28;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 enumerateMaterializedSetFromSyncAnchor:v3 suggestedBatchSize:v5 completionHandler:v6];
}

void __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v18 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a7)
  {
    [*(id *)(a1 + 40) finishEnumeratingWithError:a7];
  }
  else
  {
    if ([v12 count])
    {
      id v14 = *(void **)(a1 + 40);
      id v15 = objc_msgSend(v12, "fp_map:", &__block_literal_global_414);
      [v14 didDeleteItemsWithIdentifiers:v15];
    }
    if ([v18 count])
    {
      uint64_t v16 = *(void **)(a1 + 40);
      uint64_t v17 = objc_msgSend(v18, "fp_map:", &__block_literal_global_416);
      [v16 didUpdateItems:v17];
    }
    [*(id *)(a1 + 40) finishEnumeratingChangesUpToSyncAnchor:v13 moreComing:a4];
  }
}

uint64_t __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_4(uint64_t a1, void *a2)
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
  v7[2] = __70__FPMaterializedSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF5C78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSFileProviderManager *)manager domainServicerWithCompletionHandler:v7];
}

uint64_t __70__FPMaterializedSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 currentMaterializedSetSyncAnchorWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end