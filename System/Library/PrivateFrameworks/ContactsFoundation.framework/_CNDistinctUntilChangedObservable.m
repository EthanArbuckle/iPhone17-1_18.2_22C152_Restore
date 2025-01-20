@interface _CNDistinctUntilChangedObservable
- (BOOL)_resultIsDistinctFromLastResult:(id)a3;
- (_CNDistinctUntilChangedObservable)initWithObservable:(id)a3;
- (id)subscribe:(id)a3;
@end

@implementation _CNDistinctUntilChangedObservable

- (BOOL)_resultIsDistinctFromLastResult:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  char v7 = [v5 isEqual:v6->_lastObservedResult];
  if ((v7 & 1) == 0) {
    objc_storeStrong(&v6->_lastObservedResult, a3);
  }
  objc_sync_exit(v6);

  return v7 ^ 1;
}

- (_CNDistinctUntilChangedObservable)initWithObservable:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNDistinctUntilChangedObservable;
  v6 = [(_CNDistinctUntilChangedObservable *)&v10 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = v7;
  }

  return v7;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(_CNDistinctUntilChangedObservableCancelationToken);
  observable = self->_observable;
  uint64_t v7 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke;
  v17[3] = &unk_1E56A2158;
  objc_copyWeak(&v19, &location);
  id v18 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_2;
  v15[3] = &unk_1E569F9D8;
  id v16 = v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_3;
  v13[3] = &unk_1E569FBD8;
  id v8 = v16;
  id v14 = v8;
  v9 = +[CNObserver blockObserverOfClass:v7 withResultBlock:v17 completionBlock:v15 failureBlock:v13];
  objc_super v10 = [(CNObservable *)observable subscribe:v9];

  [(CNCancelationToken *)v5 addCancelable:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_4;
  v12[3] = &unk_1E569F9D8;
  v12[4] = self;
  [(CNCancelationToken *)v5 addCancelationBlock:v12];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastObservedResult, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

@end