@interface _EFDistinctUntilChangedObservable
- (BOOL)_isLastResultDistinctFromResult:(id)a3;
- (_EFDistinctUntilChangedObservable)initWithObservable:(id)a3;
- (id)subscribe:(id)a3;
@end

@implementation _EFDistinctUntilChangedObservable

- (BOOL)_isLastResultDistinctFromResult:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_lock lock];
  char v6 = [v5 isEqual:self->_lastObservedResult];
  if ((v6 & 1) == 0) {
    objc_storeStrong(&self->_lastObservedResult, a3);
  }
  [(NSLock *)self->_lock unlock];

  return v6 ^ 1;
}

- (_EFDistinctUntilChangedObservable)initWithObservable:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EFDistinctUntilChangedObservable;
  char v6 = [(_EFDistinctUntilChangedObservable *)&v10 init];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v6->_lock;
    v6->_lock = v7;

    objc_storeStrong((id *)&v6->_observable, a3);
  }

  return v6;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  observable = self->_observable;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke;
  v17[3] = &unk_1E6121AA0;
  v17[4] = self;
  id v18 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_2;
  v15[3] = &unk_1E6121B40;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_3;
  v13 = &unk_1E6121B68;
  id v6 = v16;
  id v14 = v6;
  v7 = +[EFObserver observerWithResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  v8 = -[EFObservable subscribe:](observable, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_lastObservedResult, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end