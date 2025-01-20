@interface AXAssertionCoordinator
- (AXAssertionCoordinator)initWithIdentifier:(id)a3 delegate:(id)a4;
- (AXAssertionCoordinatorDelegate)delegate;
- (NSHashTable)assertions;
- (NSString)identifier;
- (OS_dispatch_queue)assertionQueue;
- (id)acquireAssertionWithReason:(id)a3;
- (void)_startTrackingPoorMansAssertion:(id)a3;
- (void)_stopTrackingPoorMansAssertion:(id)a3;
- (void)dealloc;
- (void)setAssertionQueue:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AXAssertionCoordinator

- (AXAssertionCoordinator)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXAssertionCoordinator;
  v8 = [(AXAssertionCoordinator *)&v11 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("AXAssertionCoordinator-AssertionQueue", 0);
    [(AXAssertionCoordinator *)v8 setAssertionQueue:v9];

    [(AXAssertionCoordinator *)v8 setDelegate:v7];
    [(AXAssertionCoordinator *)v8 setIdentifier:v6];
  }

  return v8;
}

- (id)acquireAssertionWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v6 = [(AXAssertionCoordinator *)self identifier];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __53__AXAssertionCoordinator_acquireAssertionWithReason___block_invoke;
  v12 = &unk_1E55869E8;
  objc_copyWeak(&v13, &location);
  id v7 = (void *)[v5 initWithIdentifier:v6 forReason:v4 invalidationBlock:&v9];

  -[AXAssertionCoordinator _startTrackingPoorMansAssertion:](self, "_startTrackingPoorMansAssertion:", v7, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __53__AXAssertionCoordinator_acquireAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _stopTrackingPoorMansAssertion:v3];
}

- (void)_startTrackingPoorMansAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 reason];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "AXAssertionCoordinator: Now start tracking assertion for reason: %@", buf, 0xCu);
  }
  id v7 = [(AXAssertionCoordinator *)self assertionQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__AXAssertionCoordinator__startTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E5586470;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __58__AXAssertionCoordinator__startTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assertions];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) assertions];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [*(id *)(a1 + 32) setAssertions:v5];
  }
  id v6 = [*(id *)(a1 + 32) assertions];
  [v6 addObject:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 assertionCoordinator:*(void *)(a1 + 32) assertionsDidBecomeActive:1];
  }
}

- (void)_stopTrackingPoorMansAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 reason];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "AXAssertionCoordinator: Stop tracking assertion for reason: %@", buf, 0xCu);
  }
  id v7 = [(AXAssertionCoordinator *)self assertionQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__AXAssertionCoordinator__stopTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E5586470;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __57__AXAssertionCoordinator__stopTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assertions];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) assertions];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) assertions];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 assertionCoordinator:*(void *)(a1 + 32) assertionsDidBecomeActive:0];
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [(AXAssertionCoordinator *)self assertionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AXAssertionCoordinator_dealloc__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)AXAssertionCoordinator;
  [(AXAssertionCoordinator *)&v4 dealloc];
}

void __33__AXAssertionCoordinator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) assertions];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v4 = objc_msgSend(*(id *)(a1 + 32), "assertions", 0);
    id v5 = [v4 allObjects];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) invalidate];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (AXAssertionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAssertionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (void)setAssertionQueue:(id)a3
{
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end