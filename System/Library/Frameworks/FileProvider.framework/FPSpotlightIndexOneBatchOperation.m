@interface FPSpotlightIndexOneBatchOperation
- (BOOL)passExpectedState;
- (FPSpotlightIndexOneBatchOperation)initWithIndexer:(id)a3 isInitialIndexing:(BOOL)a4 isOutOfBandIndexing:(BOOL)a5 queue:(id)a6;
- (NSArray)deletedItemIDs;
- (NSArray)updatedItems;
- (NSData)nextAnchor;
- (NSError)fetchError;
- (id)canIndexFromCurrentState;
- (int64_t)indexReason;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setCanIndexFromCurrentState:(id)a3;
- (void)setDeletedItemIDs:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setIndexReason:(int64_t)a3;
- (void)setNextAnchor:(id)a3;
- (void)setPassExpectedState:(BOOL)a3;
- (void)setUpdatedItems:(id)a3;
@end

@implementation FPSpotlightIndexOneBatchOperation

- (void)setUpdatedItems:(id)a3
{
}

- (void)setPassExpectedState:(BOOL)a3
{
  self->_passExpectedState = a3;
}

- (void)setNextAnchor:(id)a3
{
}

- (void)setFetchError:(id)a3
{
}

- (void)setDeletedItemIDs:(id)a3
{
}

- (void)main
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_indexer = &self->_indexer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  v5 = [WeakRetained log];
  id v6 = fpfs_adopt_log(v5);

  v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  v36 = [v7 currentPersona];

  id v39 = 0;
  v8 = [v36 userPersonaUniqueString];
  id v9 = objc_loadWeakRetained((id *)p_indexer);
  v10 = [v9 domain];
  v11 = [v10 personaIdentifier];
  if (v8 == v11)
  {

LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  id v12 = objc_loadWeakRetained((id *)p_indexer);
  v13 = [v12 domain];
  v14 = [v13 personaIdentifier];
  char v15 = [v8 isEqualToString:v14];

  if ((v15 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v38 = 0;
  v16 = (void *)[v36 copyCurrentPersonaContextWithError:&v38];
  id v17 = v38;
  id v18 = v39;
  id v39 = v16;

  if (v17)
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v20 = objc_loadWeakRetained((id *)p_indexer);
  v21 = [v20 domain];
  v22 = [v21 personaIdentifier];
  v23 = [v36 generateAndRestorePersonaContextWithPersonaUniqueString:v22];

  if (v23)
  {
    v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v33 = objc_loadWeakRetained((id *)p_indexer);
      v34 = [v33 domain];
      v35 = [v34 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      unint64_t v41 = (unint64_t)v35;
      __int16 v42 = 2112;
      v43 = v23;
      _os_log_error_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  unint64_t section = __fp_create_section();
  v26 = fp_current_or_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    id v29 = objc_loadWeakRetained((id *)p_indexer);
    uint64_t v30 = [v29 lastIndexState];
    v31 = (void *)v30;
    v32 = @"start";
    if (v30) {
      v32 = (__CFString *)v30;
    }
    *(_DWORD *)buf = 134218242;
    unint64_t v41 = section;
    __int16 v42 = 2112;
    v43 = v32;
    _os_log_debug_impl(&dword_1A33AE000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx starting spotlight batch fetch from %@", buf, 0x16u);
  }
  self->_logSection = section;
  id v27 = objc_loadWeakRetained((id *)p_indexer);
  v28 = [v27 workloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(v28, block);

  _FPRestorePersona(&v39);
}

- (void)setIndexReason:(int64_t)a3
{
  self->_indexReason = a3;
}

- (FPSpotlightIndexOneBatchOperation)initWithIndexer:(id)a3 isInitialIndexing:(BOOL)a4 isOutOfBandIndexing:(BOOL)a5 queue:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = a6;
  v8 = [v7 log];
  id v9 = fpfs_adopt_log(v8);

  v10 = [MEMORY[0x1E4FB36F8] sharedManager];
  v11 = [v10 currentPersona];

  id v41 = 0;
  id v12 = [v11 userPersonaUniqueString];
  v13 = [v7 domainContext];
  v14 = [v13 domain];
  char v15 = [v14 personaIdentifier];
  if (v12 == v15)
  {

LABEL_13:
    id v27 = 0;
    goto LABEL_14;
  }
  v16 = [v7 domainContext];
  id v17 = [v16 domain];
  id v18 = [v17 personaIdentifier];
  char v19 = [v12 isEqualToString:v18];

  if ((v19 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v40 = 0;
  id v20 = (void *)[v11 copyCurrentPersonaContextWithError:&v40];
  id v21 = v40;
  id v22 = v41;
  id v41 = v20;

  if (v21)
  {
    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  v24 = [v7 domainContext];
  v25 = [v24 domain];
  v26 = [v25 personaIdentifier];
  id v27 = [v11 generateAndRestorePersonaContextWithPersonaUniqueString:v26];

  if (v27)
  {
    v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = [v7 domainContext];
      id v33 = [v32 domain];
      v34 = [v33 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      v43 = v34;
      __int16 v44 = 2112;
      v45 = v27;
      _os_log_error_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  v39.receiver = self;
  v39.super_class = (Class)FPSpotlightIndexOneBatchOperation;
  id v29 = [(FPOperation *)&v39 init];
  uint64_t v30 = v29;
  if (v29)
  {
    objc_storeWeak((id *)&v29->_indexer, v7);
    v30->_isInitialIndexing = a4;
    v30->_isOutOfBandIndexing = a5;
    [(FPOperation *)v30 setCallbackQueue:v38];
    if (!a5)
    {
      if ([v7 isIndexing]) {
        __assert_rtn("-[FPSpotlightIndexOneBatchOperation initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:]", "FPSpotlightIndexOneBatchOperation.m", 227, "!indexer.isIndexing");
      }
      [v7 setIndexing:1];
    }
  }

  _FPRestorePersona(&v41);
  return v30;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  id v9 = WeakRetained;
  if (!self->_isOutOfBandIndexing && WeakRetained != 0) {
    [WeakRetained setIndexing:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)FPSpotlightIndexOneBatchOperation;
  [(FPOperation *)&v11 finishWithResult:v6 error:v7];
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v74 = 304;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v3 = [WeakRetained log];
  id v4 = fpfs_adopt_log(v3);

  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  v73 = [v5 currentPersona];

  id v87 = 0;
  id v6 = [v73 userPersonaUniqueString];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v8 = [v7 domain];
  id v9 = [v8 personaIdentifier];
  if (v6 == v9)
  {

LABEL_13:
    v72 = 0;
    goto LABEL_14;
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  objc_super v11 = [v10 domain];
  id v12 = [v11 personaIdentifier];
  char v13 = [v6 isEqualToString:v12];

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v86 = 0;
  v14 = (void *)[v73 copyCurrentPersonaContextWithError:&v86];
  id v15 = v86;
  id v16 = v87;
  id v87 = v14;

  if (v15)
  {
    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  char v19 = [v18 domain];
  id v20 = [v19 personaIdentifier];
  v72 = [v73 generateAndRestorePersonaContextWithPersonaUniqueString:v20];

  if (!v72) {
    goto LABEL_13;
  }
  id v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v68 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    v69 = [v68 domain];
    v70 = [v69 personaIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v89 = (uint64_t)v70;
    __int16 v90 = 2112;
    uint64_t v91 = (uint64_t)v72;
    _os_log_error_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
  }
LABEL_14:
  uint64_t v85 = 0;
  uint64_t v85 = *(void *)(*(void *)(a1 + 32) + 320);
  id v22 = fp_current_or_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v41 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    uint64_t v42 = [*(id *)(*(void *)(a1 + 32) + 336) count];
    uint64_t v43 = [*(id *)(*(void *)(a1 + 32) + 344) count];
    uint64_t v44 = *(void *)(a1 + 32);
    uint64_t v45 = *(void *)(v44 + 352);
    uint64_t v46 = objc_msgSend(*(id *)(v44 + 360), "fp_prettyDescription");
    *(_DWORD *)buf = 134219266;
    uint64_t v89 = v85;
    __int16 v90 = 2112;
    uint64_t v91 = (uint64_t)v41;
    __int16 v92 = 2048;
    uint64_t v93 = v42;
    __int16 v94 = 2048;
    uint64_t v95 = v43;
    __int16 v96 = 2112;
    uint64_t v97 = v45;
    __int16 v98 = 2112;
    v99 = v46;
    _os_log_debug_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received new batch (updated:%lu, deleted:%lu, changeToken:%@, error:%@)", buf, 0x3Eu);
  }
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    uint64_t v23 = *(void *)(a1 + 32);
    if (*(void *)(v23 + 360))
    {
      objc_msgSend((id)v23, "completedWithResult:error:", 0);
      goto LABEL_47;
    }
    id v71 = *(id *)(v23 + 352);
    uint64_t v24 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v24 + 313))
    {
      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_3();
      }

      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      uint64_t v27 = [v26 lastIndexState];

      id v71 = (id)v27;
    }
    else
    {
      id v28 = objc_loadWeakRetained((id *)(v24 + 304));
      id v29 = [v28 lastIndexState];
      int v30 = [v71 isEqualToData:v29];

      if (v30)
      {
        v31 = fp_current_or_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_1();
        }

        [*(id *)(a1 + 32) completedWithResult:0 error:0];
        goto LABEL_46;
      }
    }
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v33 = *(void *)(v32 + 376);
    if (v33
      && (id v34 = objc_loadWeakRetained((id *)(v32 + 304)),
          [v34 lastIndexState],
          v35 = objc_claimAutoreleasedReturnValue(),
          char v36 = (*(uint64_t (**)(uint64_t, void *))(v33 + 16))(v33, v35),
          v35,
          v34,
          uint64_t v32 = *(void *)(a1 + 32),
          (v36 & 1) == 0))
    {
      id v65 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1002 userInfo:0];
      [(id)v32 completedWithResult:0 error:v65];
    }
    else
    {
      if (*(unsigned char *)(v32 + 312))
      {
        v37 = fp_current_or_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_2();
        }

        uint64_t v32 = *(void *)(a1 + 32);
      }
      id v38 = objc_loadWeakRetained((id *)(v32 + 304));
      objc_super v39 = [v38 domain];
      if ([v39 isHidden])
      {
        char v40 = 1;
      }
      else
      {
        id v47 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
        v48 = [v47 domain];
        char v40 = [v48 isHiddenByUser];
      }
      v49 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "fp_map:", &__block_literal_global_39);
      v50 = (void *)[v49 mutableCopy];

      v51 = *(void **)(*(void *)(a1 + 32) + 336);
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2;
      v81[3] = &unk_1E5AF4850;
      char v84 = v40;
      id v52 = v50;
      uint64_t v53 = *(void *)(a1 + 32);
      id v82 = v52;
      uint64_t v83 = v53;
      v54 = objc_msgSend(v51, "fp_map:", v81);
      id v55 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      v56 = [v55 index];

      [v56 beginIndexBatch];
      [v56 indexSearchableItems:v54 completionHandler:0];
      objc_msgSend(v56, "deleteSearchableItemsWithIdentifiers:reason:completionHandler:", v52, objc_msgSend(*(id *)(a1 + 32), "indexReason"), 0);
      v57 = fp_current_or_default_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = [v54 count];
        uint64_t v59 = [v52 count];
        *(_DWORD *)buf = 134218754;
        uint64_t v89 = v58;
        __int16 v90 = 2048;
        uint64_t v91 = v59;
        __int16 v92 = 2112;
        uint64_t v93 = (uint64_t)v71;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v56;
        _os_log_impl(&dword_1A33AE000, v57, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] adding %ld and deleting %ld items state:%@ (in %@)", buf, 0x2Au);
      }

      v60 = [MEMORY[0x1E4F1C9C8] date];
      int v61 = [*(id *)(a1 + 32) passExpectedState];
      if (v61)
      {
        uint64_t v74 = (uint64_t)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
        v62 = [(id)v74 lastIndexState];
      }
      else
      {
        v62 = 0;
      }
      uint64_t v63 = objc_msgSend(*(id *)(a1 + 32), "indexReason", v71, v72);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_77;
      v75[3] = &unk_1E5AF48A0;
      v75[4] = *(void *)(a1 + 32);
      id v64 = v54;
      id v76 = v64;
      id v65 = v52;
      id v77 = v65;
      id v78 = v71;
      id v66 = v60;
      id v79 = v66;
      id v67 = v56;
      id v80 = v67;
      [v67 endIndexBatchWithExpectedClientState:v62 newClientState:v78 reason:v63 completionHandler:v75];
      if (v61)
      {
      }
    }

LABEL_46:
  }
LABEL_47:
  __fp_leave_section_Debug((uint64_t)&v85);

  _FPRestorePersona(&v87);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canIndexFromCurrentState, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_nextAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);

  objc_destroyWeak((id *)&self->_indexer);
}

uint64_t __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_73(uint64_t a1, void *a2)
{
  return [a2 coreSpotlightIdentifier];
}

id __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 toSearchableItem];
  if (*(unsigned char *)(a1 + 48)
    || ([v3 fileSystemFlags] & 8) != 0
    || ([v3 capabilities] & 0x2000000) != 0)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v4 uniqueIdentifier];
    [v5 addObject:v6];

LABEL_5:
    id v7 = 0;
    goto LABEL_6;
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [v4 uniqueIdentifier];
  uint64_t v11 = [v9 indexOfObject:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 312))
  {
    id v12 = [v3 lastUsedDate];

    if (!v12)
    {
      char v13 = [v3 contentModificationDate];
      v14 = [v4 attributeSet];
      [v14 setLastUsedDate:v13];
    }
  }
  id v7 = v4;
LABEL_6:

  return v7;
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_78;
  block[3] = &unk_1E5AF4878;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_78(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v3 = [WeakRetained log];
  id v4 = fpfs_adopt_log(v3);

  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v47 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v9 = [v8 domain];
  id v10 = [v9 personaIdentifier];
  if (v7 == v10)
  {

LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v12 = [v11 domain];
  id v13 = [v12 personaIdentifier];
  char v14 = [v7 isEqualToString:v13];

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v46 = 0;
  id v15 = (void *)[v6 copyCurrentPersonaContextWithError:&v46];
  id v16 = v46;
  id v17 = v47;
  id v47 = v15;

  if (v16)
  {
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v20 = [v19 domain];
  id v21 = [v20 personaIdentifier];
  id v22 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v21];

  if (v22)
  {
    uint64_t v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      id v41 = [v40 domain];
      uint64_t v42 = [v41 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_error_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  uint64_t v45 = 0;
  uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 320);
  uint64_t v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    id v38 = *(void **)(*(void *)(a1 + 32) + 352);
    objc_super v39 = objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v53 = v38;
    *(_WORD *)v54 = 2112;
    *(void *)&v54[2] = v39;
    _os_log_debug_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: indexed batch for client state %@ with error: %@", buf, 0x2Au);
  }
  if (*(void *)(a1 + 40))
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
      __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_78_cold_1(v26, v57, v25);
    }
  }
  else
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [*(id *)(a1 + 48) count];
      uint64_t v28 = [*(id *)(a1 + 56) count];
      id v29 = *(void **)(a1 + 64);
      [*(id *)(a1 + 72) timeIntervalSinceNow];
      uint64_t v30 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v53 = v29;
      *(_WORD *)v54 = 2048;
      *(double *)&v54[2] = -v31;
      __int16 v55 = 2112;
      uint64_t v56 = v30;
      _os_log_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] added %ld and deleted %ld items state:%@ in %.3fs (in %@)", buf, 0x34u);
    }
  }

  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    uint64_t v32 = [*(id *)(a1 + 40) domain];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v33 = (id *)getCSIndexErrorDomainSymbolLoc_ptr_0;
    uint64_t v51 = getCSIndexErrorDomainSymbolLoc_ptr_0;
    if (!getCSIndexErrorDomainSymbolLoc_ptr_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCSIndexErrorDomainSymbolLoc_block_invoke_0;
      uint64_t v53 = &unk_1E5AF1950;
      *(void *)v54 = &v48;
      __getCSIndexErrorDomainSymbolLoc_block_invoke_0((uint64_t)buf);
      uint64_t v33 = (id *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v33)
    {
      uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v44 = [NSString stringWithUTF8String:"NSString *getCSIndexErrorDomain(void)"];
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"FPSpotlightIndexOneBatchOperation.m", 28, @"%s", dlerror());

      __break(1u);
    }
    id v34 = *v33;
    if ([v32 isEqualToString:v34])
    {
      BOOL v35 = [*(id *)(a1 + 40) code] == -1006;

      if (v35)
      {
        id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
        [v36 clearIndexState];
LABEL_30:

        [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
        goto LABEL_31;
      }
    }
    else
    {
    }
    id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
    [v36 learnNewIndexState:*(void *)(a1 + 64)];
    goto LABEL_30;
  }
LABEL_31:
  __fp_leave_section_Debug((uint64_t)&v45);

  _FPRestorePersona(&v47);
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (NSArray)deletedItemIDs
{
  return self->_deletedItemIDs;
}

- (BOOL)passExpectedState
{
  return self->_passExpectedState;
}

- (NSData)nextAnchor
{
  return self->_nextAnchor;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (int64_t)indexReason
{
  return self->_indexReason;
}

- (id)canIndexFromCurrentState
{
  return self->_canIndexFromCurrentState;
}

- (void)setCanIndexFromCurrentState:(id)a3
{
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] received the same token twice, stopping", v2, v3, v4, v5, v6);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] will swizzle last used date because indexer is in initial indexing state", v2, v3, v4, v5, v6);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] processing out-of-band update, keeping last index state", v2, v3, v4, v5, v6);
}

void __41__FPSpotlightIndexOneBatchOperation_main__block_invoke_2_78_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] [spotlight] can't index: %@", buf, 0xCu);
}

@end