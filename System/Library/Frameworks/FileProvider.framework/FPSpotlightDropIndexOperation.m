@interface FPSpotlightDropIndexOperation
+ (void)deleteSearchableItemsAndClearClientStateWithDomainIdentifier:(id)a3 index:(id)a4 dropReason:(unint64_t)a5 delegate:(id)a6 completionHandler:(id)a7;
- (FPSpotlightDropIndexOperation)initWithIndexer:(id)a3 index:(id)a4 spotlightDomainIdentifier:(id)a5 dropReason:(unint64_t)a6 delegate:(id)a7;
- (id)operationDescription;
- (void)main;
@end

@implementation FPSpotlightDropIndexOperation

- (FPSpotlightDropIndexOperation)initWithIndexer:(id)a3 index:(id)a4 spotlightDomainIdentifier:(id)a5 dropReason:(unint64_t)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FPSpotlightDropIndexOperation;
  v16 = [(FPOperation *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_indexer, v12);
    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_index, a4);
    objc_storeStrong((id *)&v17->_spotlightDomainIdentifier, a5);
    v17->_dropReason = a6;
  }

  return v17;
}

- (id)operationDescription
{
  return FPHumanReadableDropReason(self->_dropReason);
}

+ (void)deleteSearchableItemsAndClearClientStateWithDomainIdentifier:(id)a3 index:(id)a4 dropReason:(unint64_t)a5 delegate:(id)a6 completionHandler:(id)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  uint64_t v15 = FPCSIndexReasonForFPIndexDropReason(a5);
  v26[0] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __138__FPSpotlightDropIndexOperation_deleteSearchableItemsAndClearClientStateWithDomainIdentifier_index_dropReason_delegate_completionHandler___block_invoke;
  v20[3] = &unk_1E5AF4620;
  id v23 = v13;
  unint64_t v24 = a5;
  id v21 = v12;
  id v22 = v11;
  uint64_t v25 = v15;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  [v17 deleteSearchableItemsWithDomainIdentifiers:v16 reason:v15 completionHandler:v20];
}

void __138__FPSpotlightDropIndexOperation_deleteSearchableItemsAndClearClientStateWithDomainIdentifier_index_dropReason_delegate_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    [*(id *)(a1 + 32) didDropIndexWithDropReason:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) beginIndexBatch];
    v4 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4F1C9B8] data];
    [v4 endIndexBatchWithExpectedClientState:0 newClientState:v5 reason:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)main
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a2, a3, "[ERROR] won't restore persona: %@", (uint8_t *)&v3);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v39 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  uint64_t v4 = [WeakRetained log];
  id v5 = fpfs_adopt_log(v4);

  v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  v38 = [v6 currentPersona];

  id v42 = 0;
  v7 = [v38 userPersonaUniqueString];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v9 = [v8 domain];
  v10 = [v9 personaIdentifier];
  if (v7 == v10)
  {

LABEL_13:
    id v23 = 0;
    goto LABEL_14;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v12 = [v11 domain];
  id v13 = [v12 personaIdentifier];
  char v14 = [v7 isEqualToString:v13];

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v41 = 0;
  uint64_t v15 = (void *)[v38 copyCurrentPersonaContextWithError:&v41];
  id v16 = v41;
  id v17 = v42;
  id v42 = v15;

  if (v16)
  {
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(FPSpotlightDropIndexOperation *)(uint64_t)v16 main];
    }
  }
  id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v21 = [v20 domain];
  id v22 = [v21 personaIdentifier];
  id v23 = [v38 generateAndRestorePersonaContextWithPersonaUniqueString:v22];

  if (v23)
  {
    unint64_t v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v35 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      v36 = [v35 domain];
      double v37 = [v36 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      double v44 = v37;
      __int16 v45 = 2112;
      v46 = v23;
      _os_log_error_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  if (v39)
  {
    uint64_t v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(v39, "fp_prettyDescription");
      __37__FPSpotlightDropIndexOperation_main__block_invoke_cold_1(v26, (uint64_t)buf, v25);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v39];
  }
  else
  {
    v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      double v29 = v28;
      v30 = FPHumanReadableDropReason(*(void *)(*(void *)(a1 + 32) + 336));
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 320);
      *(_DWORD *)buf = 134218498;
      double v44 = -v29;
      __int16 v45 = 2112;
      v46 = v30;
      __int16 v47 = 2112;
      uint64_t v48 = v31;
      _os_log_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] done deleting all searchable items in %.3fs (because \"%@\") in %@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 32) + 320) beginIndexBatch];
    v32 = *(void **)(*(void *)(a1 + 32) + 320);
    v33 = [MEMORY[0x1E4F1C9B8] data];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __37__FPSpotlightDropIndexOperation_main__block_invoke_4;
    v40[3] = &unk_1E5AF4648;
    uint64_t v34 = *(void *)(a1 + 48);
    v40[4] = *(void *)(a1 + 32);
    v40[5] = v34;
    [v32 endIndexBatchWithClientState:v33 completionHandler:v40];
  }
  _FPRestorePersona(&v42);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v5 = [WeakRetained log];
  id v6 = fpfs_adopt_log(v5);

  uint64_t v10 = *(void *)(a1 + 40);
  v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_2(&v10, v7);
  }

  if (v3)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v3, "fp_prettyDescription");
      __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_1(v9, (uint64_t)v11, v8);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v3];
  }
  else
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:0];
  }
  __fp_leave_section_Debug((uint64_t)&v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_indexer);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a3, (uint64_t)a3, "[ERROR] [spotlight] failed dropping all searchable items: %@", (uint8_t *)a2);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a3, (uint64_t)a3, "[ERROR] [spotlight] failed to reset client state: %@", (uint8_t *)a2);
}

void __37__FPSpotlightDropIndexOperation_main__block_invoke_4_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [spotlight] endIndexBatchWithClientState", (uint8_t *)&v3, 0xCu);
}

@end