@interface FPDMoveOperation
+ (BOOL)_validateInfo:(id)a3;
- (FPDMoveOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5;
- (void)_t_unblockReader;
- (void)cancel;
- (void)cancelRoot:(id)a3;
- (void)dumpStateTo:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)sendPastUpdatesToClient:(id)a3;
@end

@implementation FPDMoveOperation

+ (BOOL)_validateInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FPDMoveOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[FPDMoveOperation _validateInfo:v8])
  {
    v23.receiver = self;
    v23.super_class = (Class)FPDMoveOperation;
    v11 = [(FPDActionOperation *)&v23 initWithActionInfo:v8 request:v9 server:v10];
    if (v11)
    {
      v12 = [FPDActionOperationQueue alloc];
      v13 = [(FPDActionOperation *)v11 info];
      uint64_t v14 = [(FPDActionOperationQueue *)v12 initWithMoveInfo:v13];
      queue = v11->_queue;
      v11->_queue = (FPDActionOperationQueue *)v14;

      v16 = [[FPDMoveWriter alloc] initWithOperation:v11 queue:v11->_queue];
      writer = v11->_writer;
      v11->_writer = v16;

      NSClassFromString(&cfstr_Fpdmovereader.isa);
      v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [[v18 alloc] initWithMoveWriter:v11->_writer operation:v11 queue:v11->_queue];
      reader = v11->_reader;
      v11->_reader = (FPDMoveReader *)v19;
    }
    self = v11;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)main
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┳%llx starting move operation!", v2, v3, v4, v5, v6);
}

void __24__FPDMoveOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained(v10);
    v13 = [v12 callbackQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __24__FPDMoveOperation_main__block_invoke_2;
    v14[3] = &unk_1E6A73F78;
    v17[1] = a3;
    v17[2] = a4;
    v17[3] = a5;
    id v15 = v9;
    objc_copyWeak(v17, v10);
    id v16 = WeakRetained;
    dispatch_async(v13, v14);

    objc_destroyWeak(v17);
  }
}

void __24__FPDMoveOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:*(void *)(a1 + 64) + 200 * *(void *)(a1 + 56) + *(void *)(a1 + 72)];
  [v2 setCancellable:1];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint8_t v6 = __24__FPDMoveOperation_main__block_invoke_3;
  v7 = &unk_1E6A73F50;
  id v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  [v2 setCancellationHandler:&v4];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "progressByRoot", v4, v5, v6, v7);
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];

  objc_destroyWeak(&v9);
}

void __24__FPDMoveOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __24__FPDMoveOperation_main__block_invoke_3_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelRoot:*(void *)(a1 + 32)];
}

void __24__FPDMoveOperation_main__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_2_8;
    block[3] = &unk_1E6A73FE8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __24__FPDMoveOperation_main__block_invoke_2_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasFinishedPreflight:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 forAllClients:&__block_literal_global_2];
}

uint64_t __24__FPDMoveOperation_main__block_invoke_3_9(uint64_t a1, void *a2)
{
  return [a2 remoteOperationProgressesAreReady];
}

void __24__FPDMoveOperation_main__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint8_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained startDownloadOfItem:v8 shouldMaterializeRecursively:a3 completionHandler:v7];
}

void __24__FPDMoveOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint8_t v6 = [WeakRetained callbackQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__FPDMoveOperation_main__block_invoke_6;
    v7[3] = &unk_1E6A736C0;
    id v8 = v3;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __24__FPDMoveOperation_main__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__FPDMoveOperation_main__block_invoke_6_cold_1(a1);
  }

  [*(id *)(a1 + 40) setHasFinishedPreflight:1];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 createdItemByRoot];
  [v3 completedWithResult:v4 error:*(void *)(a1 + 32)];
}

void __24__FPDMoveOperation_main__block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_2_14;
    block[3] = &unk_1E6A74088;
    block[4] = v7;
    id v10 = v5;
    uint64_t v11 = a3;
    dispatch_async(v8, block);
  }
}

void __24__FPDMoveOperation_main__block_invoke_2_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progressByRoot];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + *(void *)(a1 + 48));
}

void __24__FPDMoveOperation_main__block_invoke_3_16(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained callbackQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __24__FPDMoveOperation_main__block_invoke_4_17;
    v12[3] = &unk_1E6A740D8;
    v12[4] = v10;
    id v13 = v7;
    char v15 = a4;
    id v14 = v8;
    dispatch_async(v11, v12);
  }
}

void __24__FPDMoveOperation_main__block_invoke_4_17(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progressByRoot];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "size") * *(unsigned __int8 *)(a1 + 56)+ 200+ objc_msgSend(v3, "completedUnitCount"));
}

void __24__FPDMoveOperation_main__block_invoke_5_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_6_20;
    block[3] = &unk_1E6A73418;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void __24__FPDMoveOperation_main__block_invoke_6_20(id *a1)
{
  id v2 = a1[6];
  id v3 = [a1[4] createdItemByRoot];
  [v3 setObject:v2 forKeyedSubscript:a1[5]];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__FPDMoveOperation_main__block_invoke_7;
  v5[3] = &unk_1E6A74128;
  id v4 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  [v4 forAllClients:v5];
}

uint64_t __24__FPDMoveOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 remoteOperationCreatedRoot:*(void *)(a1 + 32) resultingItem:*(void *)(a1 + 40) completion:&__block_literal_global_22];
}

void __24__FPDMoveOperation_main__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained(v7);
    id v10 = [v9 callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_10;
    block[3] = &unk_1E6A73418;
    id v12 = v6;
    id v13 = v5;
    id v14 = WeakRetained;
    dispatch_async(v10, block);
  }
}

void __24__FPDMoveOperation_main__block_invoke_10(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 4;
  id v3 = a1[4];
  id v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __24__FPDMoveOperation_main__block_invoke_10_cold_2((uint64_t)a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __24__FPDMoveOperation_main__block_invoke_10_cold_1();
  }

  id v6 = [a1[6] progressByRoot];
  id v7 = [v6 objectForKeyedSubscript:a1[5]];

  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
  id v8 = [a1[6] completedRoots];
  [v8 addObject:a1[5]];

  id v9 = a1[4];
  id v10 = [a1[6] errorsByRoot];
  [v10 setObject:v9 forKeyedSubscript:a1[5]];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = [a1[6] progressCompletionsByRoot];
  id v12 = [v11 objectForKeyedSubscript:a1[5]];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v16++) + 16))();
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  v17 = [a1[6] progressCompletionsByRoot];
  v18 = [v17 objectForKeyedSubscript:a1[5]];
  [v18 removeAllObjects];

  uint64_t v19 = [a1[6] createdItemByRoot];
  v20 = [v19 objectForKeyedSubscript:a1[5]];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __24__FPDMoveOperation_main__block_invoke_24;
  v23[3] = &unk_1E6A74178;
  id v21 = a1[6];
  id v24 = a1[5];
  id v25 = v20;
  id v26 = a1[4];
  id v22 = v20;
  [v21 forAllClients:v23];
}

uint64_t __24__FPDMoveOperation_main__block_invoke_24(void *a1, void *a2)
{
  return [a2 remoteOperationCompletedRoot:a1[4] resultingItem:a1[5] error:a1[6] completion:&__block_literal_global_27];
}

void __24__FPDMoveOperation_main__block_invoke_3_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained callbackQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__FPDMoveOperation_main__block_invoke_4_30;
    v7[3] = &unk_1E6A736C0;
    id v8 = v3;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __24__FPDMoveOperation_main__block_invoke_4_30(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __24__FPDMoveOperation_main__block_invoke_4_30_cold_1(v2);
    }
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = [v4 createdItemByRoot];
  [v4 completedWithResult:v5 error:*(void *)(a1 + 32)];
}

- (void)sendPastUpdatesToClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v4 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t section = __fp_create_section();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDMoveOperation sendPastUpdatesToClient:]();
  }

  if ([(FPOperation *)self isFinished])
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveOperation sendPastUpdatesToClient:](v6);
    }

    [(FPDActionOperation *)self unregisterClientsAfterCompletion];
  }
  else
  {
    if ([(FPDActionOperation *)self hasFinishedPreflight])
    {
      [v19 remoteOperationProgressesAreReady];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = [(FPDActionOperation *)self progressByRoot];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
            id v12 = [(FPDActionOperation *)self createdItemByRoot];
            uint64_t v13 = [v12 objectForKeyedSubscript:v11];

            uint64_t v14 = [(FPDActionOperation *)self completedRoots];
            int v15 = [v14 containsObject:v11];

            uint64_t v16 = [(FPDActionOperation *)self errorsByRoot];
            v17 = [v16 objectForKeyedSubscript:v11];

            if (v15)
            {
              [v19 remoteOperationCompletedRoot:v11 resultingItem:v13 error:v17 completion:&__block_literal_global_32];
            }
            else if (v13)
            {
              [v19 remoteOperationCreatedRoot:v11 resultingItem:v13 completion:&__block_literal_global_34];
            }

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v8);
      }
    }
    v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveOperation sendPastUpdatesToClient:](v18);
    }

    [v19 remoteOperationFinishedSendingPastUpdates];
  }
  __fp_leave_section_Debug();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v8);

  [(FPDActionOperationQueue *)self->_queue cancel];
  [(FPDMoveReader *)self->_reader cancel];
  [(FPDMoveWriter *)self->_writer cancel];
  reader = self->_reader;
  self->_reader = 0;

  writer = self->_writer;
  self->_writer = 0;

  queue = self->_queue;
  self->_queue = 0;

  [(FPDActionOperation *)self setError:v6];
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FPDMoveOperation finishWithResult:error:](self, v12);
  }

  v13.receiver = self;
  v13.super_class = (Class)FPDMoveOperation;
  [(FPDActionOperation *)&v13 finishWithResult:v7 error:v6];
}

- (void)cancelRoot:(id)a3
{
  id v4 = a3;
  id v5 = [(FPOperation *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__FPDMoveOperation_cancelRoot___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __31__FPDMoveOperation_cancelRoot___block_invoke(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__FPDMoveOperation_cancelRoot___block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 40) + 416) cancelRoot:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 40) + 424) cancelRoot:*(void *)(a1 + 32)];
}

- (void)cancel
{
  id v3 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FPDMoveOperation_cancel__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)FPDMoveOperation;
  [(FPDActionOperation *)&v4 cancel];
}

uint64_t __26__FPDMoveOperation_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) cancel];
  [*(id *)(*(void *)(a1 + 32) + 416) cancel];
  id v2 = *(void **)(*(void *)(a1 + 32) + 424);
  return [v2 cancel];
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  id v5 = [(FPOperation *)self callbackQueue];
  dispatch_activate(v5);

  id v6 = [(FPOperation *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__FPDMoveOperation_dumpStateTo___block_invoke;
  v8[3] = &unk_1E6A736C0;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __32__FPDMoveOperation_dumpStateTo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) write:@"************************\n"];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) info];
  [v2 write:@"move-info=[[%@]]\n\n", v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) clients];
  [v4 write:@"+ clients: %@\n\n", v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) progressByRoot];
  [v6 write:@"+ progress by root: %@\n\n", v7];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) createdItemByRoot];
  [v8 write:@"+ moved items by root: %@\n\n", v9];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) errorsByRoot];
  [v10 write:@"+ errors by root: %@\n", v11];

  id v12 = *(void **)(a1 + 32);
  objc_super v13 = [*(id *)(a1 + 40) completedRoots];
  [v12 write:@"+ completed roots: %@\n", v13];

  [*(id *)(a1 + 32) write:@"\n"];
  uint64_t v14 = [*(id *)(a1 + 40) error];

  if (v14)
  {
    [*(id *)(a1 + 32) startFgColor:1];
    int v15 = *(void **)(a1 + 32);
    uint64_t v16 = [*(id *)(a1 + 40) error];
    [v15 write:@"+ error: %@\n", v16];

    [*(id *)(a1 + 32) reset];
  }
  [*(id *)(*(void *)(a1 + 40) + 416) dumpStateTo:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 432) dumpStateTo:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 424) dumpStateTo:*(void *)(a1 + 32)];
  v17 = *(void **)(a1 + 32);
  return [v17 write:@"************************\n"];
}

- (void)_t_unblockReader
{
  id v3 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPDMoveOperation__t_unblockReader__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __36__FPDMoveOperation__t_unblockReader__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "_t_unblock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

void __24__FPDMoveOperation_main__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] root is being cancelled via its progress: %@", v2, v3, v4, v5, v6);
}

void __24__FPDMoveOperation_main__block_invoke_6_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] reader failed with error: %@", v4, v5, v6, v7, 2u);
}

void __24__FPDMoveOperation_main__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] root successfully completed: %@", v2, v3, v4, v5, v6);
}

void __24__FPDMoveOperation_main__block_invoke_10_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] root failed with error: %@; %@", v6, 0x16u);
}

void __24__FPDMoveOperation_main__block_invoke_4_30_cold_1(id *a1)
{
  uint64_t v1 = objc_msgSend(*a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] writer failed with error: %@", v4, v5, v6, v7, 2u);
}

- (void)sendPastUpdatesToClient:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] remote operation has already finished", v1, 2u);
}

- (void)sendPastUpdatesToClient:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] finished sending past updates", v1, 2u);
}

- (void)sendPastUpdatesToClient:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D744C000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx sending past updates to %@", v2, 0x16u);
}

- (void)finishWithResult:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 createdItemByRoot];
  uint64_t v5 = [a1 errorsByRoot];
  uint64_t v6 = [a1 error];
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = v5;
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move operation finished with moved-roots:%@ errors-by-root:%@; %@",
    v9,
    0x20u);
}

void __31__FPDMoveOperation_cancelRoot___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] cancelling root: %@", v2, v3, v4, v5, v6);
}

@end