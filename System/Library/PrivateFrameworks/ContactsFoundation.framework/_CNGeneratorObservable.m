@interface _CNGeneratorObservable
- (BOOL)isCanceled;
- (BOOL)isFinished;
- (_CNGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8;
- (id)subscribe:(id)a3;
- (void)scheduleNextResultForObserver:(id)a3;
- (void)sendCurrentStateToObserver:(id)a3;
- (void)sendResultsToObserver:(id)a3;
- (void)updateState;
@end

@implementation _CNGeneratorObservable

- (_CNGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)_CNGeneratorObservable;
  v20 = [(_CNGeneratorObservable *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    id state = v20->_state;
    v20->_id state = (id)v21;

    uint64_t v23 = [v15 copy];
    id condition = v20->_condition;
    v20->_id condition = (id)v23;

    uint64_t v25 = [v16 copy];
    id nextState = v20->_nextState;
    v20->_id nextState = (id)v25;

    uint64_t v27 = [v17 copy];
    id resultSelector = v20->_resultSelector;
    v20->_id resultSelector = (id)v27;

    uint64_t v29 = [v18 copy];
    id delay = v20->_delay;
    v20->_id delay = (id)v29;

    objc_storeStrong((id *)&v20->_scheduler, a8);
    v31 = objc_alloc_init(_CNGeneratorObservableCancelationToken);
    cancelable = v20->_cancelable;
    v20->_cancelable = &v31->super;

    v33 = v20;
  }

  return v20;
}

- (BOOL)isCanceled
{
  return [(CNCancelationToken *)self->_cancelable isCanceled];
}

- (BOOL)isFinished
{
  return (*((uint64_t (**)(id, id))self->_condition + 2))(self->_condition, self->_state) ^ 1;
}

- (void)updateState
{
  (*((void (**)(void))self->_nextState + 2))();
  self->_id state = (id)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (id)subscribe:(id)a3
{
  if (self->_delay) {
    [(_CNGeneratorObservable *)self scheduleNextResultForObserver:a3];
  }
  else {
    [(_CNGeneratorObservable *)self sendResultsToObserver:a3];
  }
  cancelable = self->_cancelable;

  return +[CNCancelationToken tokenWrappingCancelable:cancelable];
}

- (void)sendResultsToObserver:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___CNGeneratorObservable_sendResultsToObserver___block_invoke;
  v7[3] = &unk_1E569F310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CNScheduler *)scheduler performBlock:v7];
}

- (void)sendCurrentStateToObserver:(id)a3
{
  id resultSelector = self->_resultSelector;
  id state = self->_state;
  v5 = (void (*)(void *, id))resultSelector[2];
  id v6 = a3;
  v5(resultSelector, state);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 observerDidReceiveResult:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_delay, 0);
  objc_storeStrong(&self->_resultSelector, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_condition, 0);

  objc_storeStrong(&self->_state, 0);
}

- (void)scheduleNextResultForObserver:(id)a3
{
  id v4 = a3;
  if (![(_CNGeneratorObservable *)self isCanceled])
  {
    if ([(_CNGeneratorObservable *)self isFinished])
    {
      [v4 observerDidComplete];
    }
    else
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __56___CNGeneratorObservable_scheduleNextResultForObserver___block_invoke;
      id v14 = &unk_1E569F310;
      id v15 = self;
      id v16 = v4;
      v5 = _Block_copy(&v11);
      scheduler = self->_scheduler;
      (*((void (**)(id, id, uint64_t, uint64_t, uint64_t))self->_delay + 2))(self->_delay, self->_state, v7, v8, v9);
      id v10 = (id)-[CNScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v5, v11, v12, v13, v14, v15);
    }
  }
}

@end