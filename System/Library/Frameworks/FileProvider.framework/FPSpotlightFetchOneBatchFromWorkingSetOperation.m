@interface FPSpotlightFetchOneBatchFromWorkingSetOperation
- (BOOL)hasMore;
- (FPSpotlightFetchOneBatchFromWorkingSetOperation)initWithIndexer:(id)a3 queue:(id)a4;
- (NSArray)deletedItemIDs;
- (NSArray)updatedItems;
- (NSData)nextAnchor;
- (NSError)error;
- (id)observerItemID;
- (void)_indexOneChangesBatchFromChangeToken:(id)a3;
- (void)_indexOnePageFromPage:(id)a3;
- (void)handleInsertedItems:(id)a3 deletedItems:(id)a4 needsMoreWork:(BOOL)a5 state:(id)a6 error:(id)a7;
- (void)main;
- (void)setDeletedItemIDs:(id)a3;
- (void)setError:(id)a3;
- (void)setHasMore:(BOOL)a3;
- (void)setNextAnchor:(id)a3;
- (void)setUpdatedItems:(id)a3;
@end

@implementation FPSpotlightFetchOneBatchFromWorkingSetOperation

- (NSData)nextAnchor
{
  return self->_nextAnchor;
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (BOOL)hasMore
{
  return self->_hasMore;
}

- (NSArray)deletedItemIDs
{
  return self->_deletedItemIDs;
}

- (FPSpotlightFetchOneBatchFromWorkingSetOperation)initWithIndexer:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPSpotlightFetchOneBatchFromWorkingSetOperation;
  v8 = [(FPOperation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_indexer, v6);
    v10 = [v6 domainContext];
    objc_storeWeak((id *)&v9->_domainContext, v10);

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_domainContext);
    if (!WeakRetained) {
      -[FPSpotlightFetchOneBatchFromWorkingSetOperation initWithIndexer:queue:]();
    }

    [(FPOperation *)v9 setCallbackQueue:v7];
  }

  return v9;
}

void __88__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOneChangesBatchFromChangeToken___block_invoke(uint64_t a1, void *a2, void *a3, unsigned int a4, void *a5, void *a6, void *a7)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v46 = a3;
  id v49 = a5;
  id v44 = a6;
  id v50 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  objc_super v13 = [WeakRetained log];
  id v14 = fpfs_adopt_log(v13);

  v15 = [MEMORY[0x1E4FB36F8] sharedManager];
  v48 = [(FPSpotlightIndexState *)v15 currentPersona];

  id v52 = 0;
  v16 = [v48 userPersonaUniqueString];
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  v18 = [v17 domain];
  v19 = [v18 personaIdentifier];
  if (v16 == v19)
  {

LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  v15 = (FPSpotlightIndexState *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  v20 = [(FPSpotlightIndexState *)v15 domain];
  v21 = [v20 personaIdentifier];
  char v22 = [v16 isEqualToString:v21];

  if ((v22 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v51 = 0;
  v23 = (void *)[v48 copyCurrentPersonaContextWithError:&v51];
  id v24 = v51;
  id v25 = v52;
  id v52 = v23;

  if (v24)
  {
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v27 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  v15 = [v27 domain];
  v28 = [(FPSpotlightIndexState *)v15 personaIdentifier];
  v29 = [v48 generateAndRestorePersonaContextWithPersonaUniqueString:v28];

  if (v29)
  {
    v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v42 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
      v15 = [v42 domain];
      v43 = [(FPSpotlightIndexState *)v15 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v54 = v43;
      __int16 v55 = 2112;
      *(void *)v56 = v29;
      _os_log_error_impl(&dword_1A33AE000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  v31 = fp_current_or_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    int v39 = [v47 count];
    int v40 = [v46 count];
    objc_msgSend(NSString, "fp_hashForToken:", v49);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "fp_prettyDescription");
    v15 = (FPSpotlightIndexState *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    id v54 = v38;
    __int16 v55 = 1024;
    *(_DWORD *)v56 = v39;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = v40;
    __int16 v57 = 2112;
    id v58 = v41;
    __int16 v59 = 1024;
    unsigned int v60 = a4;
    __int16 v61 = 2112;
    v62 = v15;
    _os_log_debug_impl(&dword_1A33AE000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished enumerating changes %d updates, %d deletions, nextAnchor=%@ hasMore=%{BOOL}d, error=%@", buf, 0x32u);
  }
  v32 = *(void **)(a1 + 32);
  v33 = (void *)[v47 copy];
  v34 = (void *)[v46 copy];
  if (v49) {
    BOOL v35 = v50 == 0;
  }
  else {
    BOOL v35 = 0;
  }
  int v36 = v35;
  if (v35)
  {
    v15 = [[FPSpotlightIndexState alloc] initWithChangeToken:v49];
    v37 = [(FPSpotlightIndexState *)v15 dataRepresentation];
  }
  else
  {
    v37 = 0;
  }
  [v32 handleInsertedItems:v33 deletedItems:v34 needsMoreWork:a4 state:v37 error:v50];
  if (v36)
  {
  }
  _FPRestorePersona(&v52);
}

- (void)handleInsertedItems:(id)a3 deletedItems:(id)a4 needsMoreWork:(BOOL)a5 state:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  id v17 = [WeakRetained workloop];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__FPSpotlightFetchOneBatchFromWorkingSetOperation_handleInsertedItems_deletedItems_needsMoreWork_state_error___block_invoke;
  v22[3] = &unk_1E5AF4790;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  BOOL v27 = a5;
  id v26 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(v17, v22);
}

- (void)_indexOneChangesBatchFromChangeToken:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightFetchOneBatchFromWorkingSetOperation _indexOneChangesBatchFromChangeToken:]((uint64_t)self, (uint64_t)v32);
  }

  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  v31 = [v5 currentPersona];

  id v35 = 0;
  id v6 = [v31 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  v8 = [WeakRetained domain];
  v9 = [v8 personaIdentifier];
  if (v6 == v9)
  {

    id v21 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  v11 = [v10 domain];
  id v12 = [v11 personaIdentifier];
  char v13 = [v6 isEqualToString:v12];

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
  {
    id v21 = 0;
  }
  else
  {
    id v34 = 0;
    id v14 = (void *)[v31 copyCurrentPersonaContextWithError:&v34];
    id v15 = v34;
    id v16 = v35;
    id v35 = v14;

    if (v15)
    {
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
      }
    }
    id v18 = objc_loadWeakRetained((id *)&self->_domainContext);
    id v19 = [v18 domain];
    id v20 = [v19 personaIdentifier];
    id v21 = [v31 generateAndRestorePersonaContextWithPersonaUniqueString:v20];

    if (v21)
    {
      id WeakRetained = fp_current_or_default_log();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_loadWeakRetained((id *)&self->_domainContext);
        id v23 = [v22 domain];
        id v24 = [v23 personaIdentifier];
        *(_DWORD *)buf = 138412546;
        v37 = v24;
        __int16 v38 = 2112;
        int v39 = v21;
        _os_log_error_impl(&dword_1A33AE000, WeakRetained, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
  }
LABEL_16:
  id v25 = [FPXChangesObserver alloc];
  id v26 = [(FPSpotlightFetchOneBatchFromWorkingSetOperation *)self observerItemID];
  id v27 = objc_loadWeakRetained((id *)&self->_domainContext);
  v28 = [(FPXChangesObserver *)v25 initWithObservedItemID:v26 domainContext:v27 previousChangeToken:v32 nsFileProviderRequest:0];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __88__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOneChangesBatchFromChangeToken___block_invoke;
  v33[3] = &unk_1E5AF4808;
  v33[4] = self;
  [(FPXChangesObserver *)v28 setFinishedBlock:v33];
  id v29 = objc_loadWeakRetained((id *)&self->_indexer);
  v30 = [v29 vendorEnumerator];
  [v30 enumerateChangesForObserver:v28 fromSyncAnchor:v32];

  _FPRestorePersona(&v35);
}

- (id)observerItemID
{
  v3 = [FPItemID alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  v5 = [WeakRetained providerDomain];
  id v6 = [v5 identifier];
  id v7 = [(FPItemID *)v3 initWithProviderDomainID:v6 itemIdentifier:@"NSFileProviderWorkingSetContainerItemIdentifier"];

  return v7;
}

- (void)main
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_8();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

uint64_t __110__FPSpotlightFetchOneBatchFromWorkingSetOperation_handleInsertedItems_deletedItems_needsMoreWork_state_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 336), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 344), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), *(id *)(a1 + 56));
  *(unsigned char *)(*(void *)(a1 + 32) + 328) = *(unsigned char *)(a1 + 72);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), *(id *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);

  return [v2 completedWithResult:0 error:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_nextAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_destroyWeak((id *)&self->_domainContext);

  objc_destroyWeak((id *)&self->_indexer);
}

- (void)_indexOnePageFromPage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  os_log_type_t v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v29 = [v4 currentPersona];

  id v33 = 0;
  v5 = [v29 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v7 = [WeakRetained domain];
  v8 = [v7 personaIdentifier];
  if (v5 == v8)
  {

LABEL_13:
    id v20 = 0;
    goto LABEL_14;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v10 = [v9 domain];
  v11 = [v10 personaIdentifier];
  char v12 = [v5 isEqualToString:v11];

  if ((v12 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v32 = 0;
  char v13 = (void *)[v29 copyCurrentPersonaContextWithError:&v32];
  id v14 = v32;
  id v15 = v33;
  id v33 = v13;

  if (v14)
  {
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v17 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v18 = [v17 domain];
  id v19 = [v18 personaIdentifier];
  id v20 = [v29 generateAndRestorePersonaContextWithPersonaUniqueString:v19];

  if (v20)
  {
    id v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v25 = objc_loadWeakRetained((id *)&self->_domainContext);
      id v26 = [v25 domain];
      id v27 = [v26 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v35 = v27;
      __int16 v36 = 2112;
      v37 = v20;
      _os_log_error_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  id v22 = objc_loadWeakRetained((id *)&self->_indexer);
  id v23 = [v22 vendorEnumerator];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke;
  v30[3] = &unk_1E5AF47E0;
  v30[4] = self;
  id v24 = v28;
  id v31 = v24;
  [v23 currentSyncAnchorWithCompletionHandler:v30];

  _FPRestorePersona(&v33);
}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 length];
  v5 = fp_current_or_default_log();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_cold_1(a1, (uint64_t)v3);
    }

    id v7 = [FPXItemsObserver alloc];
    v8 = [*(id *)(a1 + 32) observerItemID];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
    id v10 = [(FPXItemsObserver *)v7 initWithObservedItemID:v8 domainContext:WeakRetained nsFileProviderRequest:0];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_7;
    v17[3] = &unk_1E5AF47B8;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v18 = v11;
    uint64_t v19 = v12;
    id v20 = v3;
    [(FPXItemsObserver *)v10 setFinishedBlock:v17];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    id v14 = [v13 vendorEnumerator];
    [v14 enumerateItemsForObserver:v10 startingAtPage:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: didn't return a change token during working set indexing. Recents and search results will be disabled.", buf, 0xCu);
    }
    id v16 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:MEMORY[0x1E4F1CC08]];
    [v16 handleInsertedItems:MEMORY[0x1E4F1CBF0] deletedItems:MEMORY[0x1E4F1CBF0] needsMoreWork:0 state:0 error:v10];
  }
}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = [*(id *)(a1 + 32) isEqual:0] ^ 1;
  }
  id v17 = fp_current_or_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 304));
    int v24 = [v11 count];
    uint64_t v23 = objc_msgSend(NSString, "fp_hashForToken:", v12);
    *(_DWORD *)buf = 138413314;
    id v26 = WeakRetained;
    __int16 v27 = 1024;
    int v28 = v24;
    __int16 v29 = 2112;
    v30 = v23;
    __int16 v31 = 1024;
    int v32 = v16;
    __int16 v33 = 2112;
    id v34 = v15;
    _os_log_debug_impl(&dword_1A33AE000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished enumerating provider %d items, nextPage=%@ hasMore=%{BOOL}d, error=%@", buf, 0x2Cu);
  }
  id v18 = [[FPSpotlightIndexState alloc] initWithPage:v12 changeToken:*(void *)(a1 + 48)];
  uint64_t v19 = *(void **)(a1 + 40);
  id v20 = (void *)[v11 copy];
  id v21 = [(FPSpotlightIndexState *)v18 dataRepresentation];
  [v19 handleInsertedItems:v20 deletedItems:MEMORY[0x1E4F1CBF0] needsMoreWork:v16 state:v21 error:v15];
}

void __55__FPSpotlightFetchOneBatchFromWorkingSetOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  uint64_t v4 = [WeakRetained log];
  id v5 = fpfs_adopt_log(v4);

  id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  v30 = [v6 currentPersona];

  id v32 = 0;
  id v7 = [v30 userPersonaUniqueString];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  id v9 = [v8 domain];
  id v10 = [v9 personaIdentifier];
  if (v7 == v10)
  {

LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  id v12 = [v11 domain];
  id v13 = [v12 personaIdentifier];
  char v14 = [v7 isEqualToString:v13];

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v31 = 0;
  id v15 = (void *)[v30 copyCurrentPersonaContextWithError:&v31];
  id v16 = v31;
  id v17 = v32;
  id v32 = v15;

  if (v16)
  {
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
  id v20 = [v19 domain];
  id v21 = [v20 personaIdentifier];
  id v22 = [v30 generateAndRestorePersonaContextWithPersonaUniqueString:v21];

  if (v22)
  {
    uint64_t v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 312));
      __int16 v27 = [v26 domain];
      int v28 = [v27 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v34 = v28;
      __int16 v35 = 2112;
      __int16 v36 = v22;
      _os_log_error_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  int v24 = *(void **)(a1 + 32);
  if (v29)
  {
    objc_msgSend(v24, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, 0);
  }
  else
  {
    id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"invalid index state");
    [v24 handleInsertedItems:MEMORY[0x1E4F1CBF0] deletedItems:MEMORY[0x1E4F1CBF0] needsMoreWork:1 state:0 error:v25];
  }
  _FPRestorePersona(&v32);
}

- (void)setUpdatedItems:(id)a3
{
}

- (void)setDeletedItemIDs:(id)a3
{
}

- (void)setNextAnchor:(id)a3
{
}

- (void)setHasMore:(BOOL)a3
{
  self->_hasMore = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)initWithIndexer:queue:.cold.1()
{
}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v5 = objc_msgSend(NSString, "fp_hashForToken:", a2);
  id v11 = objc_msgSend(NSString, "fp_hashForToken:", *(void *)(a1 + 40));
  OUTLINED_FUNCTION_3_8();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x20u);
}

- (void)_indexOneChangesBatchFromChangeToken:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 304));
  id v9 = objc_msgSend(NSString, "fp_hashForToken:", a2);
  OUTLINED_FUNCTION_3_8();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);
}

@end