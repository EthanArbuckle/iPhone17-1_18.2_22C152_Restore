@interface _CNOnEmptyObservable
- (BOOL)isObservableEmpty;
- (CNObservable)observable;
- (_CNOnEmptyObservable)initWithObservable:(id)a3 nextObservable:(id)a4;
- (id)subscribe:(id)a3;
- (id)subscribeNextObservable:(id)a3;
- (void)observableDidSendResult;
- (void)setObservable:(id)a3;
@end

@implementation _CNOnEmptyObservable

- (_CNOnEmptyObservable)initWithObservable:(id)a3 nextObservable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNOnEmptyObservable;
  v9 = [(_CNOnEmptyObservable *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_nextObservable, a4);
    v10->_observableIsEmpty = 1;
    v11 = v10;
  }

  return v10;
}

- (BOOL)isObservableEmpty
{
  return self->_observableIsEmpty;
}

- (id)subscribeNextObservable:(id)a3
{
  return [(CNObservable *)self->_nextObservable subscribe:a3];
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_CNOnEmptyObservableCNCancelationToken);
  v6 = self;
  objc_sync_enter(v6);
  id v7 = [(_CNOnEmptyObservable *)v6 observable];
  [(_CNOnEmptyObservable *)v6 setObservable:0];
  objc_sync_exit(v6);

  if (v7)
  {
    objc_initWeak(&location, v5);
    uint64_t v8 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __34___CNOnEmptyObservable_subscribe___block_invoke;
    v19[3] = &unk_1E56A0518;
    v19[4] = v6;
    id v20 = v4;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __34___CNOnEmptyObservable_subscribe___block_invoke_2;
    v16[3] = &unk_1E56A1CC0;
    v16[4] = v6;
    id v17 = v20;
    objc_copyWeak(&v18, &location);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __34___CNOnEmptyObservable_subscribe___block_invoke_3;
    v14[3] = &unk_1E569FBD8;
    id v15 = v17;
    v9 = +[CNObserver blockObserverOfClass:v8 withResultBlock:v19 completionBlock:v16 failureBlock:v14];
    v10 = [v7 subscribe:v9];

    [(CNCancelationToken *)v5 addCancelable:v10];
    v11 = v5;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = +[CNObservable emptyObservable];
    v11 = [v12 subscribe:v4];
  }

  return v11;
}

- (void)setObservable:(id)a3
{
}

- (CNObservable)observable
{
  return self->_observable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextObservable, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

- (void)observableDidSendResult
{
  self->_observableIsEmpty = 0;
}

@end