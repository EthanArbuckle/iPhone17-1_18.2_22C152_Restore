@interface _CNCombineLatestObservable
- (CNScheduler)resultScheduler;
- (NSArray)observables;
- (NSMutableArray)results;
- (NSMutableArray)tokens;
- (NSMutableIndexSet)activeObservableIndexes;
- (NSMutableIndexSet)silentObservableIndexes;
- (_CNCombineLatestObservable)initWithObservables:(id)a3;
- (_CNCombineLatestObservable)initWithObservables:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5;
- (id)subscribe:(id)a3;
- (void)observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 forObserver:(id)a5;
- (void)observableAtIndex:(unint64_t)a3 didReceiveResult:(id)a4 forObserver:(id)a5;
- (void)observableAtIndexDidComplete:(unint64_t)a3 forObserver:(id)a4;
- (void)performWithResourceLock:(id)a3;
@end

@implementation _CNCombineLatestObservable

- (_CNCombineLatestObservable)initWithObservables:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_CNCombineLatestObservable;
  v11 = [(_CNCombineLatestObservable *)&v28 init];
  if (v11)
  {
    v12 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_47);
    uint64_t v13 = [v12 copy];
    observables = v11->_observables;
    v11->_observables = (NSArray *)v13;

    v15 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_5_0);
    uint64_t v16 = [v15 mutableCopy];
    results = v11->_results;
    v11->_results = (NSMutableArray *)v16;

    v18 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_8_1);
    uint64_t v19 = [v18 mutableCopy];
    tokens = v11->_tokens;
    v11->_tokens = (NSMutableArray *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    silentObservableIndexes = v11->_silentObservableIndexes;
    v11->_silentObservableIndexes = (NSMutableIndexSet *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    activeObservableIndexes = v11->_activeObservableIndexes;
    v11->_activeObservableIndexes = (NSMutableIndexSet *)v23;

    v25 = v9;
    if (!v9) {
      v25 = (void *)[v10 newSerialSchedulerWithName:@"com.apple.contacts.reactive.combine-latest.results"];
    }
    objc_storeStrong((id *)&v11->_resultScheduler, v25);
    if (!v9) {

    }
    v26 = v11;
  }

  return v11;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_CNCombineLatestObservableCancelationToken);
  objc_initWeak(&location, self);
  v6 = [(_CNCombineLatestObservable *)self observables];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40___CNCombineLatestObservable_subscribe___block_invoke;
  v12[3] = &unk_1E56A1370;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v13 = v7;
  v14 = self;
  id v8 = v5;
  v15 = v8;
  [v6 enumerateObjectsUsingBlock:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_6;
  v11[3] = &unk_1E569F9D8;
  v11[4] = self;
  [(CNCancelationToken *)v8 addCancelationBlock:v11];
  id v9 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

- (NSArray)observables
{
  return self->_observables;
}

- (void)observableAtIndex:(unint64_t)a3 didReceiveResult:(id)a4 forObserver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke;
  v12[3] = &unk_1E56A0A60;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(_CNCombineLatestObservable *)self performWithResourceLock:v12];
}

- (void)performWithResourceLock:(id)a3
{
  v5 = (void (**)(void))a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5[2]();
  objc_sync_exit(v4);
}

- (NSMutableIndexSet)silentObservableIndexes
{
  return self->_silentObservableIndexes;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (CNScheduler)resultScheduler
{
  return self->_resultScheduler;
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (NSMutableIndexSet)activeObservableIndexes
{
  return self->_activeObservableIndexes;
}

- (_CNCombineLatestObservable)initWithObservables:(id)a3
{
  id v4 = a3;
  v5 = +[CNSchedulerProvider defaultProvider];
  v6 = [(_CNCombineLatestObservable *)self initWithObservables:v4 resultScheduler:0 schedulerProvider:v5];

  return v6;
}

- (void)observableAtIndexDidComplete:(unint64_t)a3 forObserver:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke;
  v8[3] = &unk_1E56A1348;
  id v9 = v6;
  unint64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(_CNCombineLatestObservable *)self performWithResourceLock:v8];
}

- (void)observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 forObserver:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke;
  v12[3] = &unk_1E56A0A60;
  void v12[4] = self;
  id v13 = v9;
  id v14 = v8;
  unint64_t v15 = a3;
  id v10 = v8;
  id v11 = v9;
  [(_CNCombineLatestObservable *)self performWithResourceLock:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultScheduler, 0);
  objc_storeStrong((id *)&self->_silentObservableIndexes, 0);
  objc_storeStrong((id *)&self->_activeObservableIndexes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_observables, 0);
}

@end