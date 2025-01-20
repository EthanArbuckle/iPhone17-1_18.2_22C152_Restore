@interface MRUFinishTaskAssertionManager
+ (id)sharedManager;
- (MRUFinishTaskAssertionManager)init;
- (MSVTimer)autoInvalidationTimer;
- (NSMapTable)tokenMap;
- (RBSAssertion)taskAssertion;
- (void)acquireForTaskToken:(id)a3 withReason:(id)a4 invalidationHandler:(id)a5;
- (void)dealloc;
- (void)releaseForTaskToken:(id)a3;
- (void)setAutoInvalidationTimer:(id)a3;
- (void)setTaskAssertion:(id)a3;
@end

@implementation MRUFinishTaskAssertionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_38);
  }
  v2 = (void *)sharedManager___shared;

  return v2;
}

void __46__MRUFinishTaskAssertionManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager___shared;
  sharedManager___shared = v0;
}

- (MRUFinishTaskAssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUFinishTaskAssertionManager;
  v2 = [(MRUFinishTaskAssertionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    tokenMap = v2->_tokenMap;
    v2->_tokenMap = (NSMapTable *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(RBSAssertion *)self->_taskAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRUFinishTaskAssertionManager;
  [(MRUFinishTaskAssertionManager *)&v3 dealloc];
}

- (void)acquireForTaskToken:(id)a3 withReason:(id)a4 invalidationHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v11 = [(MRUFinishTaskAssertionManager *)self tokenMap];
  v12 = _Block_copy(v10);
  [v11 setObject:v12 forKey:v8];

  v13 = MCLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "[MRUFinishTaskAssertionManager] Acquiring for token: %p with reason: %@", buf, 0x16u);
  }

  v14 = [(MRUFinishTaskAssertionManager *)self taskAssertion];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F96318]);
    v17 = [MEMORY[0x1E4F96478] currentProcess];
    v18 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
    v29 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v20 = (void *)[v16 initWithExplanation:@"MediaRemote UI pre-suspend cleanup." target:v17 attributes:v19];
    [(MRUFinishTaskAssertionManager *)self setTaskAssertion:v20];

    v21 = [(MRUFinishTaskAssertionManager *)self taskAssertion];
    id v28 = 0;
    [v21 acquireWithError:&v28];
    id v22 = v28;

    if (v22)
    {
      v23 = MCLogCategoryDefault();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v22;
        _os_log_impl(&dword_1AE7DF000, v23, OS_LOG_TYPE_ERROR, "[MRUFinishTaskAssertionManager] FinishTask assertion acquisition failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v24 = (void *)MEMORY[0x1E4F77A30];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84__MRUFinishTaskAssertionManager_acquireForTaskToken_withReason_invalidationHandler___block_invoke;
      v26[3] = &unk_1E5F0DA00;
      objc_copyWeak(&v27, (id *)buf);
      v25 = [v24 timerWithInterval:0 repeats:MEMORY[0x1E4F14428] queue:v26 block:5.0];
      [(MRUFinishTaskAssertionManager *)self setAutoInvalidationTimer:v25];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __84__MRUFinishTaskAssertionManager_acquireForTaskToken_withReason_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained tokenMap];
    if ([v3 count])
    {
      v4 = MCLogCategoryDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = [v3 keyEnumerator];
        objc_super v6 = [v5 allObjects];
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "[MRUFinishTaskAssertionManager] Task tokens after timeout: %@", buf, 0xCu);
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
            v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v12[2]();

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      [v7 removeAllObjects];
    }
    v13 = objc_msgSend(v2, "taskAssertion", (void)v14);
    [v13 invalidate];

    [v2 setTaskAssertion:0];
  }
}

- (void)releaseForTaskToken:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(MRUFinishTaskAssertionManager *)self tokenMap];
  objc_super v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = MCLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      id v14 = v4;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MRUFinishTaskAssertionManager] Releasing for token: %p", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v8 = [(MRUFinishTaskAssertionManager *)self tokenMap];
    [v8 removeObjectForKey:v4];

    uint64_t v9 = [(MRUFinishTaskAssertionManager *)self tokenMap];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      uint64_t v11 = [(MRUFinishTaskAssertionManager *)self autoInvalidationTimer];
      [v11 invalidate];

      [(MRUFinishTaskAssertionManager *)self setAutoInvalidationTimer:0];
      v12 = [(MRUFinishTaskAssertionManager *)self taskAssertion];
      [v12 invalidate];

      [(MRUFinishTaskAssertionManager *)self setTaskAssertion:0];
    }
  }
}

- (NSMapTable)tokenMap
{
  return self->_tokenMap;
}

- (RBSAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
}

- (MSVTimer)autoInvalidationTimer
{
  return self->_autoInvalidationTimer;
}

- (void)setAutoInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);

  objc_storeStrong((id *)&self->_tokenMap, 0);
}

@end