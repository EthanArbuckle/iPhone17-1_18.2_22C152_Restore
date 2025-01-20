@interface FPSpotlightFetchClientStateOperation
+ (id)_currentIndexerVersion;
- (FPSpotlightFetchClientStateOperation)initWithIndexer:(id)a3 index:(id)a4 indexName:(id)a5 spotlightDomainIdentifier:(id)a6 reason:(id)a7 supportURL:(id)a8;
- (id)_clientStateCurrentVersionIfNeedReset;
- (id)operationDescription;
- (void)_fetchClientState;
- (void)_handleFetchedClientState:(id)a3 error:(id)a4;
- (void)_markClientStateResetDone;
- (void)main;
@end

@implementation FPSpotlightFetchClientStateOperation

- (FPSpotlightFetchClientStateOperation)initWithIndexer:(id)a3 index:(id)a4 indexName:(id)a5 spotlightDomainIdentifier:(id)a6 reason:(id)a7 supportURL:(id)a8
{
  id v14 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)FPSpotlightFetchClientStateOperation;
  v18 = [(FPOperation *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_indexer, v14);
    objc_storeStrong((id *)&v19->_index, a4);
    objc_storeStrong((id *)&v19->_indexName, a5);
    objc_storeStrong((id *)&v19->_spotlightDomainIdentifier, a6);
    objc_storeStrong((id *)&v19->_supportURL, a8);
    objc_storeStrong((id *)&v19->_reason, a7);
  }

  return v19;
}

void __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v36 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v6 = [WeakRetained log];
  id v7 = fpfs_adopt_log(v6);

  v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  v37 = [v8 currentPersona];

  id v41 = 0;
  v9 = [v37 userPersonaUniqueString];
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v11 = [v10 domain];
  v12 = [v11 personaIdentifier];
  if (v9 == v12)
  {

LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v14 = [v13 domain];
  id v15 = [v14 personaIdentifier];
  char v16 = [v9 isEqualToString:v15];

  if ((v16 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v40 = 0;
  id v17 = (void *)[v37 copyCurrentPersonaContextWithError:&v40];
  id v18 = v40;
  id v19 = v41;
  id v41 = v17;

  if (v18)
  {
    v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();
    }
  }
  id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v22 = [v21 domain];
  objc_super v23 = [v22 personaIdentifier];
  v24 = [v37 generateAndRestorePersonaContextWithPersonaUniqueString:v23];

  if (v24)
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v33 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      v34 = [v33 domain];
      v35 = [v34 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v43 = v35;
      __int16 v44 = 2112;
      v45 = v24;
      _os_log_error_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  v39 = *(void **)(a1 + 48);
  v26 = fp_current_or_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v31 = *(void **)(a1 + 32);
    v32 = objc_msgSend(v36, "fp_prettyDescription");
    *(_DWORD *)buf = 134218754;
    id v43 = v39;
    __int16 v44 = 2112;
    v45 = v31;
    __int16 v46 = 2112;
    double v47 = *(double *)&v38;
    __int16 v48 = 2112;
    v49 = v32;
    _os_log_debug_impl(&dword_1A33AE000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received spotlight client state %@, error: %@", buf, 0x2Au);
  }
  v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(void **)(*(void *)(a1 + 32) + 336);
    [*(id *)(a1 + 40) timeIntervalSinceNow];
    v29 = *(void **)(*(void *)(a1 + 32) + 312);
    *(_DWORD *)buf = 138413058;
    id v43 = v38;
    __int16 v44 = 2112;
    v45 = v28;
    __int16 v46 = 2048;
    double v47 = -v30;
    __int16 v48 = 2112;
    v49 = v29;
    _os_log_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fetched last stored state is:%@ (fetched because \"%@\") in %.3fs (in %@)", buf, 0x2Au);
  }

  [*(id *)(a1 + 32) _handleFetchedClientState:v38 error:v36];
  __fp_leave_section_Debug((uint64_t)&v39);

  _FPRestorePersona(&v41);
}

- (void)main
{
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┣%llx %@: fetching client state if needed");
}

- (void)_handleFetchedClientState:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v8)
  {
    id v19 = self;
    id v20 = v7;
    id v21 = 0;
LABEL_10:
    [(FPOperation *)v19 completedWithResult:v20 error:v21];
    goto LABEL_14;
  }
  id v10 = [v8 domain];
  v11 = getCSIndexErrorDomain();
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = [v9 domain];
    id v14 = getCSIndexErrorDomain();
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"FPSpotlightFetchClientStateOperation.m" lineNumber:127 description:@"unexpected error"];
    }
  }
  uint64_t v16 = [v9 code];
  id v17 = fp_current_or_default_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v16 == -1003)
  {
    if (v18) {
      -[FPSpotlightFetchClientStateOperation _handleFetchedClientState:error:](v9, v17);
    }

    id v19 = self;
    id v20 = 0;
    id v21 = v9;
    goto LABEL_10;
  }
  if (v18) {
    -[FPSpotlightFetchClientStateOperation _handleFetchedClientState:error:](v9, v17);
  }

  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  index = self->_index;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  v25 = [WeakRetained dropIndexDelegate];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke;
  v27[3] = &unk_1E5AF4698;
  id v28 = v9;
  v29 = self;
  +[FPSpotlightDropIndexOperation deleteSearchableItemsAndClearClientStateWithDomainIdentifier:spotlightDomainIdentifier index:index dropReason:7 delegate:v25 completionHandler:v27];

LABEL_14:
}

- (void)_fetchClientState
{
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┣%llx %@: fetching client state");
}

- (id)_clientStateCurrentVersionIfNeedReset
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_supportURL)
  {
    uint64_t v3 = +[FPSpotlightIndexer indexerPropertyOfClass:objc_opt_class() forKey:@"com.apple.fileproviderd.spotlight-indexer-current-version" supportURL:self->_supportURL];
  }
  else
  {
    uint64_t v3 = (uint64_t)CFPreferencesCopyAppValue(@"com.apple.fileproviderd.spotlight-indexer-current-version", (CFStringRef)self->_indexName);
  }
  v4 = (void *)v3;
  v5 = fp_current_or_default_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      indexName = self->_indexName;
      id v8 = [(id)objc_opt_class() _currentIndexerVersion];
      int v15 = 138413058;
      uint64_t v16 = @"com.apple.fileproviderd.spotlight-indexer-current-version";
      __int16 v17 = 2112;
      BOOL v18 = indexName;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] Fetched indexer version (%@ %@) %@ (current: %@)", (uint8_t *)&v15, 0x2Au);
    }
    v9 = [(id)objc_opt_class() _currentIndexerVersion];
    char v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    }
  }
  else
  {
    if (v6)
    {
      char v12 = self->_indexName;
      id v13 = [(id)objc_opt_class() _currentIndexerVersion];
      int v15 = 138412546;
      uint64_t v16 = (__CFString *)v12;
      __int16 v17 = 2112;
      BOOL v18 = v13;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] Failed to fetch indexer version for index %@ (current: %@)", (uint8_t *)&v15, 0x16u);
    }
    v11 = &unk_1EF6C3908;
  }

  return v11;
}

+ (id)_currentIndexerVersion
{
  return @"7";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_indexName, 0);
  objc_storeStrong((id *)&self->_index, 0);

  objc_destroyWeak((id *)&self->_indexer);
}

- (id)operationDescription
{
  return self->_reason;
}

- (void)_markClientStateResetDone
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] failed to synchronize user defaults for %@", v2);
}

void __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke_cold_1((id *)(a1 + 32), v4);
    }
  }
  [*(id *)(a1 + 40) completedWithResult:0 error:v3];
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v4 = [WeakRetained log];
  id v5 = fpfs_adopt_log(v4);

  BOOL v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  v34 = [v6 currentPersona];

  id v41 = 0;
  id v7 = [v34 userPersonaUniqueString];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v9 = [v8 domain];
  char v10 = [v9 personaIdentifier];
  if (v7 == v10)
  {

LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  char v12 = [v11 domain];
  id v13 = [v12 personaIdentifier];
  char v14 = [v7 isEqualToString:v13];

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v40 = 0;
  int v15 = (void *)[v34 copyCurrentPersonaContextWithError:&v40];
  id v16 = v40;
  id v17 = v41;
  id v41 = v15;

  if (v16)
  {
    BOOL v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();
    }
  }
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v20 = [v19 domain];
  __int16 v21 = [v20 personaIdentifier];
  id v22 = [v34 generateAndRestorePersonaContextWithPersonaUniqueString:v21];

  if (v22)
  {
    uint64_t v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v31 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      v32 = [v31 domain];
      id v33 = [v32 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v43 = v33;
      __int16 v44 = 2112;
      v45 = v22;
      _os_log_error_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  uint64_t v39 = *(void *)(a1 + 40);
  v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_2();
  }

  if (v35)
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(v35, "fp_prettyDescription");
      __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_1(v26, (uint64_t)buf, v25);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v35];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 312) beginIndexBatch];
    v27 = *(void **)(*(void *)(a1 + 32) + 312);
    id v28 = [MEMORY[0x1E4F1C9B8] data];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17;
    v36[3] = &unk_1E5AF4670;
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    id v37 = 0;
    uint64_t v38 = v30;
    v36[4] = v29;
    [v27 endIndexBatchWithClientState:v28 completionHandler:v36];
  }
  __fp_leave_section_Debug((uint64_t)&v39);

  _FPRestorePersona(&v41);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v4 = [WeakRetained log];
  id v5 = fpfs_adopt_log(v4);

  BOOL v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v31 = [v6 currentPersona];

  id v34 = 0;
  id v7 = [v31 userPersonaUniqueString];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  v9 = [v8 domain];
  char v10 = [v9 personaIdentifier];
  if (v7 == v10)
  {

LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  char v12 = [v11 domain];
  id v13 = [v12 personaIdentifier];
  char v14 = [v7 isEqualToString:v13];

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v33 = 0;
  int v15 = (void *)[v31 copyCurrentPersonaContextWithError:&v33];
  id v16 = v33;
  id v17 = v34;
  id v34 = v15;

  if (v16)
  {
    BOOL v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();
    }
  }
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  id v20 = [v19 domain];
  __int16 v21 = [v20 personaIdentifier];
  id v22 = [v31 generateAndRestorePersonaContextWithPersonaUniqueString:v21];

  if (v22)
  {
    uint64_t v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v27 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
      id v28 = [v27 domain];
      uint64_t v29 = [v28 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v36 = v29;
      __int16 v37 = 2112;
      uint64_t v38 = v22;
      _os_log_error_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  uint64_t v32 = *(void *)(a1 + 48);
  v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17_cold_2();
  }

  if (v30)
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
      __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17_cold_1(v26, (uint64_t)buf, v25);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) _markClientStateResetDone];
    [*(id *)(a1 + 32) _fetchClientState];
  }
  __fp_leave_section_Debug((uint64_t)&v32);

  _FPRestorePersona(&v34);
}

- (void)_handleFetchedClientState:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a2, v4, "[ERROR] failed fetching client state with xpc error (%@), retrying later.", v5);
}

- (void)_handleFetchedClientState:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a2, v4, "[ERROR] failed fetching client state, Starting index from scratch: %@", v5);
}

void __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(*a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a2, v4, "[ERROR] can't drop spotlight index: %@", v5);
}

void __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] won't restore persona: %@", v2);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a3, (uint64_t)a3, "[ERROR] failed to delete all fileproviderd searchable items: %@", (uint8_t *)a2);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx done resetting index", v1, 0xCu);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_1A33AE000, a3, (uint64_t)a3, "[ERROR] failed to reset client state: %@", (uint8_t *)a2);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_17_cold_2()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx done resetting client state", v1, 0xCu);
}

@end