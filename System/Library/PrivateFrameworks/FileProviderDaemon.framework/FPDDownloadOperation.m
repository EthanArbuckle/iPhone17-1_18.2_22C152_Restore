@interface FPDDownloadOperation
+ (BOOL)_validateInfo:(id)a3;
- (FPDDownloadOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5;
- (void)_finishedDownloadingLocator:(id)a3 withError:(id)a4;
- (void)_setupCreatedItemForRoot:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)sendPastUpdatesToClient:(id)a3;
@end

@implementation FPDDownloadOperation

+ (BOOL)_validateInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FPDDownloadOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[FPDDownloadOperation _validateInfo:v8])
  {
    v21.receiver = self;
    v21.super_class = (Class)FPDDownloadOperation;
    v11 = [(FPDActionOperation *)&v21 initWithActionInfo:v8 request:v9 server:v10];
    if (v11)
    {
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("FileProvider.download-operation", v12);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v13;

      v15 = [FPDCoordinator alloc];
      v16 = [(FPDActionOperation *)v11 manager];
      uint64_t v17 = [(FPDCoordinator *)v15 initWithExtensionManager:v16 callbackQueue:v11->_queue];
      coordinator = v11->_coordinator;
      v11->_coordinator = (FPDCoordinator *)v17;
    }
    self = v11;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v8);

  [(FPDActionOperation *)self setError:v6];
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadOperation finishWithResult:error:](self, v9);
  }

  v10.receiver = self;
  v10.super_class = (Class)FPDDownloadOperation;
  [(FPDActionOperation *)&v10 finishWithResult:v7 error:v6];
}

- (void)sendPastUpdatesToClient:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v4 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t section = __fp_create_section();
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadOperation sendPastUpdatesToClient:]();
  }

  if ([(FPOperation *)self isFinished])
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDDownloadOperation sendPastUpdatesToClient:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    [(FPDActionOperation *)self unregisterClientsAfterCompletion];
  }
  else
  {
    if ([(FPDActionOperation *)self hasFinishedPreflight])
    {
      [v34 remoteOperationProgressesAreReady];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v14 = [(FPDActionOperation *)self createdItemByRoot];
      v15 = [v14 allKeys];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v36;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * v18);
            v20 = [(FPDActionOperation *)self createdItemByRoot];
            objc_super v21 = [v20 objectForKeyedSubscript:v19];

            v22 = [(FPDActionOperation *)self completedRoots];
            int v23 = [v22 containsObject:v19];

            v24 = [(FPDActionOperation *)self errorsByRoot];
            v25 = [v24 objectForKeyedSubscript:v19];

            if (v23)
            {
              [v34 remoteOperationCompletedRoot:v19 resultingItem:v21 error:v25 completion:&__block_literal_global_9];
            }
            else if (v21)
            {
              [v34 remoteOperationCreatedRoot:v19 resultingItem:v21 completion:&__block_literal_global_7];
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v16);
      }
    }
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDDownloadOperation sendPastUpdatesToClient:](v26, v27, v28, v29, v30, v31, v32, v33);
    }

    [v34 remoteOperationFinishedSendingPastUpdates];
  }
  __fp_leave_section_Debug();
}

- (void)_setupCreatedItemForRoot:(id)a3
{
  id v4 = a3;
  v5 = [(FPOperation *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) createdItemByRoot];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_8;
  v6[3] = &unk_1E6A749B8;
  v5 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v5 forAllClients:v6];
}

uint64_t __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 remoteOperationCreatedRoot:*(void *)(a1 + 32) resultingItem:*(void *)(a1 + 32) completion:&__block_literal_global_10];
}

- (void)_finishedDownloadingLocator:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke;
  block[3] = &unk_1E6A73418;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke(id *a1)
{
  v2 = a1 + 4;
  id v3 = a1[4];
  id v4 = fp_current_or_default_log();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_2((uint64_t)a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_1((uint64_t)a1, v5);
  }

  id v6 = [a1[6] completedRoots];
  [v6 addObject:a1[5]];

  id v7 = a1[4];
  id v8 = [a1[6] errorsByRoot];
  [v8 setObject:v7 forKeyedSubscript:a1[5]];

  id v9 = [a1[6] createdItemByRoot];
  id v10 = [v9 objectForKeyedSubscript:a1[5]];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_12;
  v13[3] = &unk_1E6A74178;
  id v11 = a1[6];
  id v14 = a1[5];
  id v15 = v10;
  id v16 = a1[4];
  id v12 = v10;
  [v11 forAllClients:v13];
}

uint64_t __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_12(void *a1, void *a2)
{
  return [a2 remoteOperationCompletedRoot:a1[4] resultingItem:a1[5] error:a1[6] completion:&__block_literal_global_14];
}

- (void)main
{
  id v4 = @"no";
  if (a1) {
    id v4 = @"yes";
  }
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] download-operation: Request to download %lu roots; recursively ? %@",
    buf,
    0x16u);
}

void __28__FPDDownloadOperation_main__block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v8 = a4;
  [v6 _finishedDownloadingLocator:v7 withError:a3];
  v8[2](v8);

  id v9 = a1[6];
  dispatch_group_leave(v9);
}

uint64_t __28__FPDDownloadOperation_main__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasFinishedPreflight:1];
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __28__FPDDownloadOperation_main__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) forAllClients:&__block_literal_global_23];
}

uint64_t __28__FPDDownloadOperation_main__block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 remoteOperationProgressesAreReady];
}

void __28__FPDDownloadOperation_main__block_invoke_2_24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __28__FPDDownloadOperation_main__block_invoke_2_24_cold_1(a1, v3);
    }

    dispatch_group_t v4 = dispatch_group_create();
    uint64_t v5 = [*(id *)(a1 + 32) createdItemByRoot];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __28__FPDDownloadOperation_main__block_invoke_25;
    v11[3] = &unk_1E6A74A30;
    uint64_t v6 = *(void *)(a1 + 32);
    dispatch_group_t v12 = v4;
    uint64_t v13 = v6;
    uint64_t v7 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    uint64_t v8 = [*(id *)(a1 + 32) callbackQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__FPDDownloadOperation_main__block_invoke_35;
    v10[3] = &unk_1E6A736C0;
    uint64_t v9 = *(void *)(a1 + 32);
    v10[4] = WeakRetained;
    v10[5] = v9;
    dispatch_group_notify(v7, v8, v10);
  }
}

void __28__FPDDownloadOperation_main__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = a3;
  dispatch_group_enter(v6);
  LOBYTE(v6) = [v7 isProviderItem];

  if (v6)
  {
    uint64_t v8 = [v5 asFPItem];
    uint64_t v9 = [*(id *)(a1 + 40) manager];
    uint64_t v10 = [v8 itemID];
    id v11 = [v9 domainFromItemID:v10 reason:0];

    dispatch_group_t v12 = [v11 defaultBackend];
    LOBYTE(v10) = objc_opt_respondsToSelector();

    uint64_t v13 = [v11 defaultBackend];
    if (v10)
    {
      v29[0] = v8;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __28__FPDDownloadOperation_main__block_invoke_2_29;
      v26[3] = &unk_1E6A74458;
      id v15 = &v27;
      uint64_t v27 = v8;
      id v28 = *(id *)(a1 + 32);
      id v16 = v8;
      [v13 decorateItems:v14 completionHandler:v26];

      uint64_t v17 = v28;
    }
    else
    {
      uint64_t v18 = [v8 itemID];
      uint64_t v19 = [*(id *)(a1 + 40) request];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __28__FPDDownloadOperation_main__block_invoke_31;
      v22[3] = &unk_1E6A74A08;
      id v15 = (id *)v23;
      uint64_t v20 = *(void *)(a1 + 40);
      v23[0] = v8;
      v23[1] = v20;
      id v24 = v5;
      id v25 = *(id *)(a1 + 32);
      id v21 = v8;
      [v13 itemForItemID:v18 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:1 request:v19 completionHandler:v22];

      uint64_t v17 = v24;
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __28__FPDDownloadOperation_main__block_invoke_2_29(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __28__FPDDownloadOperation_main__block_invoke_2_29_cold_1(a1);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __28__FPDDownloadOperation_main__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = fp_current_or_default_log();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __28__FPDDownloadOperation_main__block_invoke_31_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __28__FPDDownloadOperation_main__block_invoke_31_cold_1(v5);
    }

    uint64_t v8 = [MEMORY[0x1E4F25CB8] locatorForItem:v5];
    uint64_t v9 = [*(id *)(a1 + 40) createdItemByRoot];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __28__FPDDownloadOperation_main__block_invoke_35(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 createdItemByRoot];
  [v2 completedWithResult:v3 error:0];

  dispatch_group_t v4 = *(void **)(*(void *)(a1 + 40) + 424);
  return [v4 stopAccessingAllURLs];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)finishWithResult:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_group_t v4 = [a1 createdItemByRoot];
  id v5 = [a1 errorsByRoot];
  id v6 = [a1 error];
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = v5;
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download operation finished with downloaded-roots:%@ errors-by-root:%@; %@",
    v9,
    0x20u);
}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendPastUpdatesToClient:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx download-op sending past updates to %@", v1, 0x16u);
}

void __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Calling client with created root %@", (uint8_t *)&v3, 0xCu);
}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Download root successfully completed: %@", (uint8_t *)&v3, 0xCu);
}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Download root %@ failed with error: %@", v6, 0x16u);
}

void __28__FPDDownloadOperation_main__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__FPDDownloadOperation_main__block_invoke_2_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [*(id *)(a1 + 32) createdItemByRoot];
  uint64_t v4 = [v3 allKeys];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-operation: Completed downloading roots %@", (uint8_t *)&v5, 0xCu);
}

void __28__FPDDownloadOperation_main__block_invoke_2_29_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) isDownloaded];
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5(&dword_1D744C000, v1, v2, "[DEBUG] Finished decorating item %@ isDownloaded ? %{BOOL}d", v3, v4, v5, v6, v7);
}

void __28__FPDDownloadOperation_main__block_invoke_31_cold_1(void *a1)
{
  [a1 isDownloaded];
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5(&dword_1D744C000, v1, v2, "[DEBUG] Finished fetching item %@ isDownloaded ? %{BOOL}d", v3, v4, v5, v6, v7);
}

void __28__FPDDownloadOperation_main__block_invoke_31_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Unable to fetch item %@, ignoring error: %@", v1, 0x16u);
}

@end