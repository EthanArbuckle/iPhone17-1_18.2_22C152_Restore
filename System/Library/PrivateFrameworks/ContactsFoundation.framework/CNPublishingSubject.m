@interface CNPublishingSubject
- (CNCancelable)upstreamToken;
- (CNObservable)observable;
- (CNObservableContractEnforcement)enforcement;
- (CNPublishingSubject)init;
- (CNPublishingSubject)initWithObservable:(id)a3;
- (NSMutableArray)observers;
- (id)_allObservers;
- (id)subscribe:(id)a3;
- (void)_addObserver:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_subscribeToObservableIfNecessary;
- (void)cleanUpAfterTermination;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
- (void)setUpstreamToken:(id)a3;
@end

@implementation CNPublishingSubject

- (CNPublishingSubject)init
{
  return [(CNPublishingSubject *)self initWithObservable:0];
}

- (CNPublishingSubject)initWithObservable:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNPublishingSubject;
  v6 = [(CNPublishingSubject *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v7->_observers;
    v7->_observers = v8;

    v10 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v7->_enforcement;
    v7->_enforcement = v10;

    v12 = v7;
  }

  return v7;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  [(CNPublishingSubject *)self _addObserver:v4];
  [(CNPublishingSubject *)self _subscribeToObservableIfNecessary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__CNPublishingSubject_subscribe___block_invoke;
  v8[3] = &unk_1E569F310;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = +[CNCancelationToken tokenWithCancelationBlock:v8];

  return v6;
}

uint64_t __33__CNPublishingSubject_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_addObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)_removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (id)_allObservers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1C978] arrayWithArray:v2->_observers];
  objc_sync_exit(v2);

  return v3;
}

- (void)_subscribeToObservableIfNecessary
{
  v2 = self;
  objc_sync_enter(v2);
  upstreamToken = v2->_upstreamToken;
  objc_sync_exit(v2);

  if (!upstreamToken)
  {
    uint64_t v4 = [(CNObservable *)v2->_observable subscribe:v2];
    id v5 = v2->_upstreamToken;
    v2->_upstreamToken = (CNCancelable *)v4;
    MEMORY[0x1F41817F8](v4, v5);
  }
}

- (void)observerDidReceiveResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[CNObservableContractEnforcement shouldSwizzleNilResults];
  if (!v4 && v5)
  {
    v6 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v6);
    }

    v7 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v7);
    }

    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8 = [(CNPublishingSubject *)self enforcement];
  [v8 observerDidReceiveResult:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(CNPublishingSubject *)self _allObservers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) observerDidReceiveResult:v4];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)observerDidComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(CNPublishingSubject *)self enforcement];
  [v3 observerDidComplete];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(CNPublishingSubject *)self _allObservers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) observerDidComplete];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(CNPublishingSubject *)self cleanUpAfterTermination];
}

- (void)observerDidFailWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNPublishingSubject *)self enforcement];
  [v5 observerDidFailWithError:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(CNPublishingSubject *)self _allObservers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) observerDidFailWithError:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(CNPublishingSubject *)self cleanUpAfterTermination];
}

- (void)cleanUpAfterTermination
{
  [(CNCancelable *)self->_upstreamToken cancel];
  upstreamToken = self->_upstreamToken;
  self->_upstreamToken = 0;
}

- (CNObservable)observable
{
  return self->_observable;
}

- (CNCancelable)upstreamToken
{
  return self->_upstreamToken;
}

- (void)setUpstreamToken:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_upstreamToken, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

@end