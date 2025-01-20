@interface _EFGeneratorObservable
- (BOOL)_isFinished;
- (_EFGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8;
- (id)subscribe:(id)a3;
- (void)_scheduleNextResultForObserver:(id)a3;
- (void)_updateState;
@end

@implementation _EFGeneratorObservable

- (id)subscribe:(id)a3
{
  [(_EFGeneratorObservable *)self _scheduleNextResultForObserver:a3];
  v4 = objc_alloc_init(EFCancelationToken);
  [(EFCancelationToken *)v4 addCancelable:self->_cancelable];
  return v4;
}

- (void)_scheduleNextResultForObserver:(id)a3
{
  id v4 = a3;
  if ([(_EFGeneratorObservable *)self _isFinished])
  {
    [v4 observerDidComplete];
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __57___EFGeneratorObservable__scheduleNextResultForObserver___block_invoke;
    v12 = &unk_1E6121B90;
    v13 = self;
    id v14 = v4;
    v5 = _Block_copy(&v9);
    delayForState = (void (**)(id, id))self->_delayForState;
    scheduler = self->_scheduler;
    if (delayForState)
    {
      delayForState[2](delayForState, self->_state);
      id v8 = (id)-[EFScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v5, v9, v10, v11, v12, v13);
    }
    else
    {
      -[EFScheduler performBlock:](self->_scheduler, "performBlock:", v5, v9, v10, v11, v12, v13);
    }
  }
}

- (BOOL)_isFinished
{
  return (*((uint64_t (**)(id, id))self->_condition + 2))(self->_condition, self->_state) ^ 1;
}

- (_EFGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)_EFGeneratorObservable;
  v20 = [(_EFGeneratorObservable *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scheduler, a8);
    v22 = objc_alloc_init(EFCancelationToken);
    cancelable = v21->_cancelable;
    v21->_cancelable = v22;

    uint64_t v24 = [v14 copyWithZone:0];
    id state = v21->_state;
    v21->_id state = (id)v24;

    v26 = _Block_copy(v15);
    id condition = v21->_condition;
    v21->_id condition = v26;

    v28 = _Block_copy(v16);
    id nextStateForState = v21->_nextStateForState;
    v21->_id nextStateForState = v28;

    v30 = _Block_copy(v17);
    id resultFromState = v21->_resultFromState;
    v21->_id resultFromState = v30;

    v32 = _Block_copy(v18);
    id delayForState = v21->_delayForState;
    v21->_id delayForState = v32;
  }
  return v21;
}

- (void)_updateState
{
  v3 = (*((void (**)(void))self->_nextStateForState + 2))();
  id state = self->_state;
  self->_id state = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayForState, 0);
  objc_storeStrong(&self->_resultFromState, 0);
  objc_storeStrong(&self->_nextStateForState, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end