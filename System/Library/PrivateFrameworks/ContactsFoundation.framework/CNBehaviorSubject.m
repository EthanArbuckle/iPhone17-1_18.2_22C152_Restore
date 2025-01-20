@interface CNBehaviorSubject
- (CNBehaviorSubject)initWithSeed:(id)a3 schedulerProvider:(id)a4;
- (CNObservableContractEnforcement)enforcement;
- (CNObservableEvent)mostRecentEvent;
- (CNSchedulerProvider)schedulerProvider;
- (NSLocking)resourceLock;
- (NSMutableArray)observers;
- (id)_addObserver:(id)a3;
- (id)resultWithResourceLock:(id)a3;
- (id)subscribe:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
- (void)performWithResourceLock:(id)a3;
- (void)setMostRecentEvent:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CNBehaviorSubject

- (CNBehaviorSubject)initWithSeed:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNBehaviorSubject;
  v8 = [(CNBehaviorSubject *)&v19 init];
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v8->_observers;
    v8->_observers = v9;

    uint64_t v11 = +[CNObservableEvent eventWithResult:v6];
    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = (CNObservableEvent *)v11;

    objc_storeStrong((id *)&v8->_schedulerProvider, a4);
    v13 = objc_alloc_init(CNUnfairLock);
    resourceLock = v8->_resourceLock;
    v8->_resourceLock = (NSLocking *)v13;

    v15 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v8->_enforcement;
    v8->_enforcement = v15;

    v17 = v8;
  }

  return v8;
}

- (id)resultWithResourceLock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CNBehaviorSubject_resultWithResourceLock___block_invoke;
  v8[3] = &unk_1E569F2E8;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CNBehaviorSubject *)self performWithResourceLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __44__CNBehaviorSubject_resultWithResourceLock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

- (void)performWithResourceLock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNBehaviorSubject *)self resourceLock];
  CNRunWithLock(v5, v4);
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [(CNBehaviorSubject *)self _addObserver:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__CNBehaviorSubject_subscribe___block_invoke;
  v9[3] = &unk_1E569F310;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[CNCancelationToken tokenWithCancelationBlock:v9];

  return v7;
}

uint64_t __31__CNBehaviorSubject_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (id)_addObserver:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__CNBehaviorSubject__addObserver___block_invoke;
  v8[3] = &unk_1E569F338;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(CNBehaviorSubject *)self resultWithResourceLock:v8];

  return v6;
}

id __34__CNBehaviorSubject__addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) schedulerProvider];
  id v4 = +[_CNBufferedObserver bufferObserver:v2 schedulerProvider:v3];

  id v5 = [*(id *)(a1 + 40) mostRecentEvent];
  [v5 dematerializeWithObserver:v4];

  [v4 resume];
  id v6 = [*(id *)(a1 + 40) observers];
  [v6 addObject:v4];

  return v4;
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CNBehaviorSubject__removeObserver___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNBehaviorSubject *)self performWithResourceLock:v6];
}

void __37__CNBehaviorSubject__removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)observerDidReceiveResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[CNObservableContractEnforcement shouldSwizzleNilResults];
  if (!v4 && v5)
  {
    id v6 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v6);
    }

    id v7 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v7);
    }

    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8 = [(CNBehaviorSubject *)self enforcement];
  [v8 observerDidReceiveResult:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__CNBehaviorSubject_observerDidReceiveResult___block_invoke;
  v19[3] = &unk_1E569F338;
  v19[4] = self;
  id v9 = v4;
  id v20 = v9;
  id v10 = [(CNBehaviorSubject *)self resultWithResourceLock:v19];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) observerDidReceiveResult:v9];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v12);
  }
}

id __46__CNBehaviorSubject_observerDidReceiveResult___block_invoke(uint64_t a1)
{
  id v2 = +[CNObservableEvent eventWithResult:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMostRecentEvent:v2];

  v3 = [*(id *)(a1 + 32) observers];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)observerDidComplete
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(CNBehaviorSubject *)self enforcement];
  [v3 observerDidComplete];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__CNBehaviorSubject_observerDidComplete__block_invoke;
  v13[3] = &unk_1E569F360;
  v13[4] = self;
  id v4 = [(CNBehaviorSubject *)self resultWithResourceLock:v13];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
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
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

id __40__CNBehaviorSubject_observerDidComplete__block_invoke(uint64_t a1)
{
  id v2 = +[CNObservableEvent completionEvent];
  [*(id *)(a1 + 32) setMostRecentEvent:v2];

  v3 = [*(id *)(a1 + 32) observers];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)observerDidFailWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNBehaviorSubject *)self enforcement];
  [v5 observerDidFailWithError:v4];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__CNBehaviorSubject_observerDidFailWithError___block_invoke;
  v16[3] = &unk_1E569F338;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = [(CNBehaviorSubject *)self resultWithResourceLock:v16];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) observerDidFailWithError:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v9);
  }
}

id __46__CNBehaviorSubject_observerDidFailWithError___block_invoke(uint64_t a1)
{
  id v2 = +[CNObservableEvent failureEventWithError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMostRecentEvent:v2];

  v3 = [*(id *)(a1 + 32) observers];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CNObservableEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (NSLocking)resourceLock
{
  return self->_resourceLock;
}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)observerDidReceiveResult:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v3 = 138543362;
  id v4 = v2;
  _os_log_error_impl(&dword_19091D000, a1, OS_LOG_TYPE_ERROR, "Call stack: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)observerDidReceiveResult:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "Swizzling a nil result", v1, 2u);
}

@end