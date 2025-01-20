@interface CNReplaySubject
- (CNObservableContractEnforcement)enforcement;
- (CNReplaySubject)init;
- (CNReplaySubject)initWithCapacity:(unint64_t)a3 schedulerProvider:(id)a4;
- (CNReplaySubject)initWithQueue:(id)a3 schedulerProvider:(id)a4;
- (CNReplaySubject)initWithSchedulerProvider:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (NSLocking)resourceLock;
- (NSMutableArray)observers;
- (_CNObservableEventBufferingStrategy)recentEventStrategy;
- (id)resourceLock_removeAllObservers;
- (id)resourceLock_upToDateObserverFromObserver:(id)a3;
- (id)resultWithResourceLock:(id)a3;
- (id)subscribe:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
- (void)performWithResourceLock:(id)a3;
- (void)resourceLock_scheduleReplayToObserver:(id)a3;
- (void)resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:(id)a3;
- (void)setRecentEventStrategy:(id)a3;
@end

@implementation CNReplaySubject

- (void)observerDidReceiveResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
  v8 = [(CNReplaySubject *)self enforcement];
  [v8 observerDidReceiveResult:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__CNReplaySubject_observerDidReceiveResult___block_invoke;
  v19[3] = &unk_1E569F338;
  v19[4] = self;
  id v9 = v4;
  id v20 = v9;
  v10 = [(CNReplaySubject *)self resultWithResourceLock:v19];
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

- (id)resultWithResourceLock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNReplaySubject *)self resourceLock];
  v6 = CNResultWithLock(v5, v4);

  return v6;
}

- (NSLocking)resourceLock
{
  return self->_resourceLock;
}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

void __35__CNReplaySubject__removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)resourceLock_upToDateObserverFromObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNReplaySubject *)self schedulerProvider];
  v6 = +[_CNBufferedObserver bufferObserver:v4 schedulerProvider:v5];

  [(CNReplaySubject *)self resourceLock_scheduleReplayToObserver:v6];
  [v6 resume];

  return v6;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)resourceLock_scheduleReplayToObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [(CNReplaySubject *)self recentEventStrategy];
  v6 = [v5 allEvents];

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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) dematerializeWithObserver:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

CNCancelationToken *__29__CNReplaySubject_subscribe___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "resourceLock_upToDateObserverFromObserver:", *(void *)(a1 + 40));
  v3 = [*(id *)(a1 + 32) recentEventStrategy];
  int v4 = [v3 isSequenceTerminated];

  if (v4)
  {
    BOOL v5 = objc_alloc_init(CNCancelationToken);
  }
  else
  {
    v6 = [*(id *)(a1 + 32) observers];
    [v6 addObject:v2];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__CNReplaySubject_subscribe___block_invoke_2;
    v8[3] = &unk_1E569F310;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v2;
    BOOL v5 = +[CNCancelationToken tokenWithCancelationBlock:v8];
  }

  return v5;
}

id __44__CNReplaySubject_observerDidReceiveResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentEventStrategy];
  v3 = +[CNObservableEvent eventWithResult:*(void *)(a1 + 40)];
  [v2 addEvent:v3];

  int v4 = [*(id *)(a1 + 32) observers];
  BOOL v5 = (void *)[v4 copy];

  return v5;
}

- (_CNObservableEventBufferingStrategy)recentEventStrategy
{
  return self->_recentEventStrategy;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (CNReplaySubject)initWithCapacity:(unint64_t)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[CNQueue boundedQueueWithCapacity:a3];
  uint64_t v8 = [(CNReplaySubject *)self initWithQueue:v7 schedulerProvider:v6];

  return v8;
}

- (CNReplaySubject)initWithQueue:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNReplaySubject;
  uint64_t v8 = [(CNReplaySubject *)&v19 init];
  if (v8)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v8->_observers;
    v8->_observers = v9;

    uint64_t v11 = +[_CNObservableEventBufferingStrategy strategyWithQueue:v6];
    recentEventStrategy = v8->_recentEventStrategy;
    v8->_recentEventStrategy = (_CNObservableEventBufferingStrategy *)v11;

    objc_storeStrong((id *)&v8->_schedulerProvider, a4);
    long long v13 = objc_alloc_init(CNUnfairLock);
    resourceLock = v8->_resourceLock;
    v8->_resourceLock = (NSLocking *)v13;

    long long v15 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v8->_enforcement;
    v8->_enforcement = v15;

    long long v17 = v8;
  }

  return v8;
}

uint64_t __29__CNReplaySubject_subscribe___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CNReplaySubject__removeObserver___block_invoke;
  v6[3] = &unk_1E569F310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNReplaySubject *)self performWithResourceLock:v6];
}

- (void)performWithResourceLock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNReplaySubject *)self resourceLock];
  CNRunWithLock(v5, v4);
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__CNReplaySubject_subscribe___block_invoke;
  v8[3] = &unk_1E569F338;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(CNReplaySubject *)self resultWithResourceLock:v8];

  return v6;
}

- (CNReplaySubject)init
{
  v3 = +[CNSchedulerProvider defaultProvider];
  id v4 = [(CNReplaySubject *)self initWithSchedulerProvider:v3];

  return v4;
}

- (CNReplaySubject)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNQueue);
  id v6 = [(CNReplaySubject *)self initWithQueue:v5 schedulerProvider:v4];

  return v6;
}

- (id)resourceLock_removeAllObservers
{
  v3 = [(CNReplaySubject *)self observers];
  id v4 = (void *)[v3 copy];

  id v5 = [(CNReplaySubject *)self observers];
  [v5 removeAllObjects];

  return v4;
}

- (void)observerDidComplete
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(CNReplaySubject *)self enforcement];
  [v3 observerDidComplete];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__CNReplaySubject_observerDidComplete__block_invoke;
  v13[3] = &unk_1E569F360;
  v13[4] = self;
  id v4 = [(CNReplaySubject *)self resultWithResourceLock:v13];
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

id __38__CNReplaySubject_observerDidComplete__block_invoke(uint64_t a1)
{
  id v2 = +[CNObservableEvent completionEvent];
  v3 = objc_msgSend(*(id *)(a1 + 32), "resourceLock_removeAllObservers");
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:", v2);

  return v3;
}

- (void)observerDidFailWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNReplaySubject *)self enforcement];
  [v5 observerDidFailWithError:v4];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__CNReplaySubject_observerDidFailWithError___block_invoke;
  v16[3] = &unk_1E569F338;
  id v6 = v4;
  id v17 = v6;
  long long v18 = self;
  uint64_t v7 = [(CNReplaySubject *)self resultWithResourceLock:v16];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
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
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

id __44__CNReplaySubject_observerDidFailWithError___block_invoke(uint64_t a1)
{
  id v2 = +[CNObservableEvent failureEventWithError:*(void *)(a1 + 32)];
  v3 = objc_msgSend(*(id *)(a1 + 40), "resourceLock_removeAllObservers");
  objc_msgSend(*(id *)(a1 + 40), "resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:", v2);

  return v3;
}

- (void)resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNReplaySubject *)self recentEventStrategy];
  id v6 = [v5 allEvents];

  id v8 = [v6 arrayByAddingObject:v4];

  uint64_t v7 = +[_CNObservableEventBufferingStrategy strategyWithEvents:v8];
  [(CNReplaySubject *)self setRecentEventStrategy:v7];
}

- (void)setRecentEventStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_recentEventStrategy, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end