@interface CXTransactionManager
- (CXTransactionManager)init;
- (CXTransactionManager)initWithQueue:(id)a3;
- (CXTransactionManagerDelegate)delegate;
- (NSMutableSet)outstandingTransactionGroups;
- (OS_dispatch_queue)queue;
- (id)description;
- (void)_setUpTimeoutForActionIfNecessary:(id)a3 callSource:(id)a4;
- (void)_timeoutReachedForAction:(id)a3 callSource:(id)a4;
- (void)addOutstandingTransactionGroup:(id)a3;
- (void)failOutstandingActionsForCallWithUUID:(id)a3;
- (void)failOutstandingActionsForChannelWithUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutstandingTransactionGroups:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateWithCompletedAction:(id)a3;
@end

@implementation CXTransactionManager

- (CXTransactionManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXTransactionManager;
  v6 = [(CXTransactionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    outstandingTransactionGroups = v7->_outstandingTransactionGroups;
    v7->_outstandingTransactionGroups = (NSMutableSet *)v8;
  }
  return v7;
}

- (CXTransactionManager)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CXTransactionManager *)self outstandingTransactionGroups];
  v6 = [v3 stringWithFormat:@"<%@ %p outstandingTransactionGroups=%@>", v4, self, v5];

  return v6;
}

- (void)addOutstandingTransactionGroup:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXTransactionManager *)self queue];
  dispatch_assert_queue_barrier(v5);

  v6 = [(CXTransactionManager *)self outstandingTransactionGroups];
  [v6 addObject:v4];

  v7 = [MEMORY[0x1E4F1C9C8] date];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = v4;
  obuint64_t j = [v4 callSources];
  uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v10 = [v19 transactionForCallSource:v9];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        objc_super v11 = [v10 actions];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              [v16 setCommitDate:v7];
              [(CXTransactionManager *)self _setUpTimeoutForActionIfNecessary:v16 callSource:v9];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
}

- (void)updateWithCompletedAction:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXTransactionManager *)self queue];
  dispatch_assert_queue_barrier(v5);

  v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "completedAction: %@", buf, 0xCu);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = self;
  obuint64_t j = [(CXTransactionManager *)self outstandingTransactionGroups];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v26 = v8;
        uint64_t v9 = [v8 allActions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
LABEL_10:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
            v15 = [v14 UUID];
            v16 = [v4 UUID];
            char v17 = [v15 isEqual:v16];

            if (v17) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v11) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }
          [v4 updateCopy:v14 withZone:0];
          id v18 = v26;

          if (!v18) {
            continue;
          }

          if ([v18 isComplete])
          {
            long long v21 = [(CXTransactionManager *)v22 outstandingTransactionGroups];
            [v21 removeObject:v18];

            v19 = [(CXTransactionManager *)v22 delegate];
            [v19 transactionManager:v22 transactionGroupCompleted:v18];
            goto LABEL_25;
          }
          goto LABEL_26;
        }
LABEL_16:
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  v19 = CXDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(CXTransactionManager *)v22 outstandingTransactionGroups];
    *(_DWORD *)buf = 138412290;
    id v38 = v20;
    _os_log_impl(&dword_1A6E3A000, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find transaction group with completed action. All transactions groups: %@", buf, 0xCu);
  }
  id v18 = 0;
LABEL_25:

LABEL_26:
}

- (void)failOutstandingActionsForCallWithUUID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXTransactionManager *)self queue];
  dispatch_assert_queue_barrier(v5);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = [(CXTransactionManager *)self outstandingTransactionGroups];
  v7 = (void *)[v6 copy];

  obuint64_t j = v7;
  uint64_t v22 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = [v9 allActions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
                char v17 = [v16 callUUID];
                int v18 = [v17 isEqual:v4];

                if (v18)
                {
                  v19 = CXDefaultLog();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v33 = v16;
                    _os_log_impl(&dword_1A6E3A000, v19, OS_LOG_TYPE_DEFAULT, "Failing action by system request: %@", buf, 0xCu);
                  }

                  [v16 updateAsFailedWithReason:3];
                  [(CXTransactionManager *)self updateWithCompletedAction:v16];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v22);
  }
}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXTransactionManager *)self queue];
  dispatch_assert_queue_barrier(v5);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = [(CXTransactionManager *)self outstandingTransactionGroups];
  v7 = (void *)[v6 copy];

  obuint64_t j = v7;
  uint64_t v22 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = [v9 allActions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
                char v17 = [v16 channelUUID];
                int v18 = [v17 isEqual:v4];

                if (v18)
                {
                  v19 = CXDefaultLog();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v33 = v16;
                    _os_log_impl(&dword_1A6E3A000, v19, OS_LOG_TYPE_DEFAULT, "Failing action by system request: %@", buf, 0xCu);
                  }

                  [v16 updateAsFailedWithReason:3];
                  [(CXTransactionManager *)self updateWithCompletedAction:v16];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v22);
  }
}

- (void)_setUpTimeoutForActionIfNecessary:(id)a3 callSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 shouldTimeout])
  {
    [(id)objc_opt_class() timeout];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    uint64_t v10 = [(CXTransactionManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CXTransactionManager__setUpTimeoutForActionIfNecessary_callSource___block_invoke;
    block[3] = &unk_1E5CADD08;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, block);
    dispatch_after(v9, v10, v11);
  }
}

uint64_t __69__CXTransactionManager__setUpTimeoutForActionIfNecessary_callSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutReachedForAction:*(void *)(a1 + 40) callSource:*(void *)(a1 + 48)];
}

- (void)_timeoutReachedForAction:(id)a3 callSource:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isComplete] & 1) == 0)
  {
    double v8 = CXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Timeout reached for incomplete action %@ and call source %@", (uint8_t *)&v10, 0x16u);
    }

    [v6 updateAsFailedWithReason:2];
    dispatch_time_t v9 = [(CXTransactionManager *)self delegate];
    [v9 transactionManager:self actionTimedOut:v6 forCallSource:v7];

    [(CXTransactionManager *)self updateWithCompletedAction:v6];
  }
}

- (CXTransactionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXTransactionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)outstandingTransactionGroups
{
  return self->_outstandingTransactionGroups;
}

- (void)setOutstandingTransactionGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTransactionGroups, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end