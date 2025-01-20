@interface BNPresentableQueue
+ (void)initialize;
- (BNPresentableQueueDelegate)delegate;
- (BOOL)isSuspended;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4;
- (NSSet)activeSuspensionReasons;
- (NSString)penderIdentifier;
- (id)_pullPresentablesPassingTest:(id)a3;
- (id)peekPresentable;
- (id)pullPresentablesWithIdentification:(id)a3;
- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPenderIdentifier:(id)a3;
@end

@implementation BNPresentableQueue

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (void)enqueuePresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    if (!v10->_postingContextQueue)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      postingContextQueue = v10->_postingContextQueue;
      v10->_postingContextQueue = v11;
    }
    v13 = [[BNPostingContext alloc] initWithPresentable:v8 presentationOptions:a4 userInfo:v9];
    v14 = (id)BNLogPending;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      penderIdentifier = v10->_penderIdentifier;
      id v16 = [(BNPostingContext *)v13 pendingIdentifier];
      v17 = BNEffectivePresentableDescription(v8);
      int v21 = 138543874;
      v22 = penderIdentifier;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pending presentable: (%{public}@) %{public}@", (uint8_t *)&v21, 0x20u);
    }
    [(NSMutableArray *)v10->_postingContextQueue addObject:v13];
    v18 = (id)BNLogPending;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v10->_penderIdentifier;
      v20 = [(NSMutableArray *)v10->_postingContextQueue bs_map:&__block_literal_global_1];
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2114;
      id v24 = v20;
      _os_log_impl(&dword_1BEC04000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Currently pended presentables: %{public}@", (uint8_t *)&v21, 0x16u);
    }
    objc_sync_exit(v10);
  }
}

id __62__BNPresentableQueue_enqueuePresentable_withOptions_userInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  v4 = [v3 pendingIdentifier];
  v5 = [v3 presentable];

  v6 = BNEffectivePresentableDescription(v5);
  v7 = [v2 stringWithFormat:@"(%@) %@", v4, v6];

  return v7;
}

- (id)peekPresentable
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = self;
  objc_sync_enter(v3);
  v4 = [(NSMutableArray *)v3->_postingContextQueue firstObject];
  if (v4)
  {
    v5 = [(NSMapTable *)v3->_postingContextsToDequeuePromises objectForKey:v4];
    if (v5)
    {
      v6 = (id)BNLogPending;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        penderIdentifier = v3->_penderIdentifier;
        id v8 = [v4 pendingIdentifier];
        id v9 = [v4 presentable];
        v10 = BNEffectivePresentableDescription(v9);
        *(_DWORD *)buf = 138543874;
        v31 = penderIdentifier;
        __int16 v32 = 2114;
        id v33 = v8;
        __int16 v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Have existing dequeue promise for presentable: (%{public}@) %{public}@", buf, 0x20u);
      }
    }
    else
    {
      objc_initWeak(&location, v3);
      v13 = [BNPendingDequeuePromise alloc];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      __int16 v25 = __37__BNPresentableQueue_peekPresentable__block_invoke;
      v26 = &unk_1E63B9740;
      objc_copyWeak(v28, &location);
      v28[1] = (id)a2;
      uint64_t v27 = v3;
      v5 = [(BNPendingDequeuePromise *)v13 initWithPostingContext:v4 dequeueBlock:&v23];
      if (!v3->_postingContextsToDequeuePromises)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28E10]);
        uint64_t v15 = objc_msgSend(v14, "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0, v23, v24, v25, v26);
        postingContextsToDequeuePromises = v3->_postingContextsToDequeuePromises;
        v3->_postingContextsToDequeuePromises = (NSMapTable *)v15;
      }
      v17 = (id)BNLogPending;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v3->_penderIdentifier;
        id v19 = [v4 pendingIdentifier];
        v20 = [v4 presentable];
        int v21 = BNEffectivePresentableDescription(v20);
        *(_DWORD *)buf = 138543874;
        v31 = v18;
        __int16 v32 = 2114;
        id v33 = v19;
        __int16 v34 = 2114;
        v35 = v21;
        _os_log_impl(&dword_1BEC04000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) Adding new dequeue promise for presentable: (%{public}@) %{public}@", buf, 0x20u);
      }
      [(NSMapTable *)v3->_postingContextsToDequeuePromises setObject:v5 forKey:v4];
      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v11 = BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v3->_penderIdentifier;
      *(_DWORD *)buf = 138543362;
      v31 = v12;
      _os_log_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) No pending presentables", buf, 0xCu);
    }
    v5 = 0;
  }

  objc_sync_exit(v3);
  return v5;
}

void __37__BNPresentableQueue_peekPresentable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained[2] objectForKey:v3],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5[1] firstObject];

    if (v7 != v3)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"BNPresentableQueue.m", 90, @"Dequeueing posting context '%@' is not at the front of the queue: %@", v5[4], v3, v5[1] object file lineNumber description];
    }
    id v8 = (void *)BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v5[4];
      v10 = v8;
      v11 = [v3 pendingIdentifier];
      v12 = [v3 presentable];
      v13 = BNEffectivePresentableDescription(v12);
      *(_DWORD *)buf = 138543874;
      id v24 = v9;
      __int16 v25 = 2114;
      v26 = v11;
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1BEC04000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dequeueing presentable: (%{public}@) %{public}@", buf, 0x20u);
    }
    [v5[1] removeObjectAtIndex:0];
    [v5[2] removeObjectForKey:v3];
    id v14 = [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v3 pendingIdentifier];
      [v14 presentableQueue:v5 didDequeuePresentableWithPendingIdentifier:v15];
    }
  }
  else
  {
    id v16 = (void *)BNLogPending;
    if (os_log_type_enabled((os_log_t)BNLogPending, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v5[4];
      v18 = v16;
      id v19 = [v3 pendingIdentifier];
      v20 = [v3 presentable];
      int v21 = BNEffectivePresentableDescription(v20);
      *(_DWORD *)buf = 138543874;
      id v24 = v17;
      __int16 v25 = 2114;
      v26 = v19;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_1BEC04000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Not dequeueing presentable because promise for posting context already removed: (%{public}@) %{public}@", buf, 0x20u);
    }
    [v5[1] removeObject:v3];
  }
}

- (id)_pullPresentablesPassingTest:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned int (**)(id, void *))a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = (void *)[(NSMutableArray *)v5->_postingContextQueue copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
    id v30 = WeakRetained;
    v10 = 0;
    if (v8)
    {
      uint64_t v32 = *(void *)v35;
      *(void *)&long long v9 = 138543874;
      long long v29 = v9;
      id obj = v7;
      do
      {
        uint64_t v33 = v8;
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "presentable", v29);
          if (v4[2](v4, v13))
          {
            id v14 = (id)BNLogPending;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = v5;
              penderIdentifier = v5->_penderIdentifier;
              id v17 = [v12 pendingIdentifier];
              v18 = BNEffectivePresentableDescription(v13);
              *(_DWORD *)buf = v29;
              v39 = penderIdentifier;
              __int16 v40 = 2114;
              id v41 = v17;
              __int16 v42 = 2114;
              v43 = v18;
              _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pulling presentable: (%{public}@) %{public}@", buf, 0x20u);

              v5 = v15;
              id WeakRetained = v30;
            }
            [(NSMutableArray *)v5->_postingContextQueue removeObject:v12];
            [(NSMapTable *)v5->_postingContextsToDequeuePromises removeObjectForKey:v12];
            id v19 = v10;
            if (!v10) {
              id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v10 = v19;
            [v19 addObject:v13];
            if (objc_opt_respondsToSelector())
            {
              v20 = [v12 pendingIdentifier];
              [WeakRetained presentableQueue:v5 didDequeuePresentableWithPendingIdentifier:v20];
            }
          }
        }
        id v7 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v8);
    }

    int v21 = (id)BNLogPending;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v5;
      uint64_t v23 = v5->_penderIdentifier;
      id v24 = v22;
      __int16 v25 = [(NSMutableArray *)v22->_postingContextQueue bs_map:&__block_literal_global_19];
      *(_DWORD *)buf = 138543618;
      v39 = v23;
      __int16 v40 = 2114;
      id v41 = v25;
      _os_log_impl(&dword_1BEC04000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Currently pended presentables: %{public}@", buf, 0x16u);

      v5 = v24;
      id WeakRetained = v30;
    }

    objc_sync_exit(v5);
  }
  else
  {
    v10 = 0;
  }
  if (v10) {
    v26 = v10;
  }
  else {
    v26 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v27 = v26;

  return v27;
}

id __51__BNPresentableQueue__pullPresentablesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  v4 = [v3 pendingIdentifier];
  v5 = [v3 presentable];

  v6 = BNEffectivePresentableDescription(v5);
  id v7 = [v2 stringWithFormat:@"(%@) %@", v4, v6];

  return v7;
}

- (id)pullPresentablesWithIdentification:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__BNPresentableQueue_pullPresentablesWithIdentification___block_invoke;
  v8[3] = &unk_1E63B9768;
  id v9 = v4;
  id v5 = v4;
  v6 = [(BNPresentableQueue *)self _pullPresentablesPassingTest:v8];

  return v6;
}

uint64_t __57__BNPresentableQueue_pullPresentablesWithIdentification___block_invoke(uint64_t a1, void *a2)
{
  return BNIsPresentableIdentifiedByIdentification(a2, *(void **)(a1 + 32), 0);
}

- (BOOL)isSuspended
{
  return [(BNSuspensionController *)self->_suspensionController isSuspended];
}

- (NSSet)activeSuspensionReasons
{
  return [(BNSuspensionController *)self->_suspensionController activeSuspensionReasons];
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6 && v4 && !self->_suspensionController)
  {
    id v7 = objc_alloc_init(BNSuspensionController);
    suspensionController = self->_suspensionController;
    self->_suspensionController = v7;

    [(BNSuspensionController *)self->_suspensionController setIdentifier:self->_penderIdentifier];
  }
  BOOL v9 = [(BNSuspensionController *)self->_suspensionController setSuspended:v4 forReason:v6];
  if (v9 && ![(BNSuspensionController *)self->_suspensionController isSuspended])
  {
    v10 = self->_suspensionController;
    self->_suspensionController = 0;
  }
  return v9;
}

- (NSString)penderIdentifier
{
  return self->_penderIdentifier;
}

- (void)setPenderIdentifier:(id)a3
{
}

- (BNPresentableQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNPresentableQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_penderIdentifier, 0);
  objc_storeStrong((id *)&self->_suspensionController, 0);
  objc_storeStrong((id *)&self->_postingContextsToDequeuePromises, 0);
  objc_storeStrong((id *)&self->_postingContextQueue, 0);
}

@end