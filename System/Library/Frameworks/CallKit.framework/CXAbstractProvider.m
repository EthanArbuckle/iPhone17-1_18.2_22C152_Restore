@interface CXAbstractProvider
- (CXAbstractProvider)init;
- (CXAbstractProviderDelegate)delegate;
- (CXActionDelegateInternal)internalActionDelegate;
- (NSArray)pendingTransactions;
- (NSMutableArray)mutablePendingTransactions;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_pendingActionWithUUID:(id)a3;
- (id)connectionInterruptionHandler;
- (void)_performDelegateCallback:(id)a3;
- (void)_syncSetDelegate:(id)a3 queue:(id)a4;
- (void)_updatePendingTransactions;
- (void)actionCompleted:(id)a3;
- (void)handleConnectionInterruptionForProvider:(id)a3;
- (void)invalidate;
- (void)performDelegateCallback:(id)a3;
- (void)provider:(id)a3 commitTransaction:(id)a4;
- (void)provider:(id)a3 handleTimeoutForAction:(id)a4;
- (void)sendDidBeginForProvider:(id)a3;
- (void)setConnectionInterruptionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setInternalActionDelegate:(id)a3;
@end

@implementation CXAbstractProvider

- (CXAbstractProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CXAbstractProvider;
  v2 = [(CXAbstractProvider *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.callkit.callprovider", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    mutablePendingTransactions = v2->_mutablePendingTransactions;
    v2->_mutablePendingTransactions = (NSMutableArray *)v6;
  }
  return v2;
}

- (void)actionCompleted:(id)a3
{
  id v4 = a3;
  v5 = [(CXAbstractProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CXAbstractProvider_actionCompleted___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__CXAbstractProvider_actionCompleted___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    int v15 = 138412546;
    v16 = v3;
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that action %@ completed", (uint8_t *)&v15, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) UUID];
  v7 = [v5 _pendingActionWithUUID:v6];

  if (v7 && ([v7 isComplete] & 1) == 0)
  {
    [*(id *)(a1 + 40) updateCopy:v7 withZone:0];
    v12 = [*(id *)(a1 + 32) internalActionDelegate];
    v13 = [v12 hostProtocolDelegate];
    v14 = (void *)[v7 copy];
    [v13 actionCompleted:v14 completionHandler:&__block_literal_global_2];

    [*(id *)(a1 + 32) _updatePendingTransactions];
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [*(id *)(a1 + 40) UUID];
      v10 = [v9 UUIDString];
      v11 = [*(id *)(a1 + 32) mutablePendingTransactions];
      int v15 = 138412546;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] No incomplete pending action could be found with UUID %@. All pending transactions: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXAbstractProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CXAbstractProvider_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __40__CXAbstractProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)_syncSetDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXAbstractProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CXAbstractProvider__syncSetDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __45__CXAbstractProvider__syncSetDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate provider %@ (this is a no-op)", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)pendingTransactions
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = [(CXAbstractProvider *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CXAbstractProvider_pendingTransactions__block_invoke;
  v6[3] = &unk_1E5CADEA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __41__CXAbstractProvider_pendingTransactions__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v6 = [*(id *)(a1 + 32) mutablePendingTransactions];
  uint64_t v3 = [v2 initWithArray:v6 copyItems:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_updatePendingTransactions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CXAbstractProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CXAbstractProvider *)self mutablePendingTransactions];
  v5 = (void *)[v4 copy];

  id v6 = [(CXAbstractProvider *)self mutablePendingTransactions];
  [v6 removeAllObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    *(void *)&long long v9 = 138412290;
    long long v15 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isComplete", v15, (void)v16))
        {
          v14 = CXDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v13;
            _os_log_impl(&dword_1A6E3A000, v14, OS_LOG_TYPE_DEFAULT, "Removing transaction from list of pending transactions because it is now complete: %@", buf, 0xCu);
          }
        }
        else
        {
          v14 = [(CXAbstractProvider *)self mutablePendingTransactions];
          [v14 addObject:v13];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)_pendingActionWithUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CXAbstractProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(CXAbstractProvider *)self mutablePendingTransactions];
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v9 actions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          id v13 = 0;
          uint64_t v14 = *(void *)v23;
LABEL_8:
          uint64_t v15 = 0;
          long long v16 = v13;
          while (1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v10);
            }
            id v13 = *(id *)(*((void *)&v22 + 1) + 8 * v15);

            long long v17 = [v13 UUID];
            char v18 = [v17 isEqual:v4];

            if (v18) {
              break;
            }
            ++v15;
            long long v16 = v13;
            if (v12 == v15)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v12) {
                goto LABEL_8;
              }

              goto LABEL_15;
            }
          }

          if (v13) {
            goto LABEL_20;
          }
        }
        else
        {
LABEL_15:
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }
  id v13 = 0;
LABEL_20:

  return v13;
}

- (void)performDelegateCallback:(id)a3
{
  id v4 = a3;
  v5 = [(CXAbstractProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CXAbstractProvider_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__CXAbstractProvider_performDelegateCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDelegateCallback:*(void *)(a1 + 40)];
}

- (void)_performDelegateCallback:(id)a3
{
  id v4 = a3;
  v5 = [(CXAbstractProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CXAbstractProvider *)self delegateQueue];
  uint64_t v7 = v6;
  if (v6)
  {
    dispatch_async(v6, v4);
  }
  else
  {
    id v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to perform a delegate callback but no delegate queue exists", v9, 2u);
    }
  }
}

- (void)sendDidBeginForProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CXAbstractProvider_sendDidBeginForProvider___block_invoke;
  v6[3] = &unk_1E5CADC68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CXAbstractProvider *)self performDelegateCallback:v6];
}

void __46__CXAbstractProvider_sendDidBeginForProvider___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 providerDidBegin:*(void *)(a1 + 40)];
  }
}

- (void)handleConnectionInterruptionForProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CXAbstractProvider_handleConnectionInterruptionForProvider___block_invoke;
  v6[3] = &unk_1E5CADC68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CXAbstractProvider *)self performDelegateCallback:v6];
}

void __62__CXAbstractProvider_handleConnectionInterruptionForProvider___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerDidReset:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) connectionInterruptionHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) connectionInterruptionHandler];
    v4[2]();
  }
}

- (void)provider:(id)a3 commitTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXAbstractProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CXAbstractProvider_provider_commitTransaction___block_invoke;
  block[3] = &unk_1E5CADD08;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __49__CXAbstractProvider_provider_commitTransaction___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Received request to commit transaction %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [a1[4] actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v8++) setDelegate:a1[5]];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v9 = [a1[5] mutablePendingTransactions];
  id v10 = (void *)[a1[4] copy];
  [v9 addObject:v10];

  id v11 = a1[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__CXAbstractProvider_provider_commitTransaction___block_invoke_7;
  v12[3] = &unk_1E5CADD08;
  v12[4] = v11;
  id v13 = a1[6];
  id v14 = a1[4];
  [v11 _performDelegateCallback:v12];
}

void __49__CXAbstractProvider_provider_commitTransaction___block_invoke_7(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v2 provider:*(void *)(a1 + 40) executeTransaction:*(void *)(a1 + 48)] & 1) != 0)
  {
    id v3 = CXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Delegate indicated that the transaction was executed", buf, 2u);
    }
  }
  else
  {
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Delegate did not execute transaction. Performing actions individually", buf, 2u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = [*(id *)(a1 + 48) actions];
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v10 = CXDefaultLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v9;
            _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "Asking delegate to perform action %@", buf, 0xCu);
          }

          id v11 = [*(id *)(a1 + 32) internalActionDelegate];
          [v11 performAction:v9];
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)provider:(id)a3 handleTimeoutForAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CXAbstractProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke;
  block[3] = &unk_1E5CADD08;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Notified that action timed out: %@", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) UUID];
  id v6 = [v4 _pendingActionWithUUID:v5];
  [v6 updateAsFailedWithReason:2];

  id v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke_10;
  v8[3] = &unk_1E5CADD08;
  v8[4] = v7;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  [v7 _performDelegateCallback:v8];
}

void __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke_10(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = CXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A6E3A000, v3, OS_LOG_TYPE_DEFAULT, "Notifying delegate that action timed out: %@", (uint8_t *)&v5, 0xCu);
    }

    [v2 provider:*(void *)(a1 + 48) timedOutPerformingAction:*(void *)(a1 + 40)];
  }
}

- (id)connectionInterruptionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setConnectionInterruptionHandler:(id)a3
{
}

- (CXActionDelegateInternal)internalActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalActionDelegate);

  return (CXActionDelegateInternal *)WeakRetained;
}

- (void)setInternalActionDelegate:(id)a3
{
}

- (CXAbstractProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXAbstractProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)mutablePendingTransactions
{
  return self->_mutablePendingTransactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePendingTransactions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_internalActionDelegate);

  objc_storeStrong(&self->_connectionInterruptionHandler, 0);
}

@end