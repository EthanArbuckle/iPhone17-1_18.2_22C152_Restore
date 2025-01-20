@interface _CNDistinctObservable
- (BOOL)_resultIsDistinct:(id)a3;
- (_CNDistinctObservable)initWithObservable:(id)a3;
- (id)subscribe:(id)a3;
@end

@implementation _CNDistinctObservable

- (_CNDistinctObservable)initWithObservable:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNDistinctObservable;
  v6 = [(_CNDistinctObservable *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    previouslyObservedResults = v7->_previouslyObservedResults;
    v7->_previouslyObservedResults = v8;

    v10 = v7;
  }

  return v7;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  observable = self->_observable;
  uint64_t v6 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35___CNDistinctObservable_subscribe___block_invoke;
  v18[3] = &unk_1E56A0518;
  v18[4] = self;
  id v19 = v4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35___CNDistinctObservable_subscribe___block_invoke_2;
  v16[3] = &unk_1E569F9D8;
  id v17 = v19;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __35___CNDistinctObservable_subscribe___block_invoke_3;
  v14 = &unk_1E569FBD8;
  id v15 = v17;
  id v7 = v17;
  v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v18 completionBlock:v16 failureBlock:&v11];
  v9 = -[CNObservable subscribe:](observable, "subscribe:", v8, v11, v12, v13, v14);

  return v9;
}

- (BOOL)_resultIsDistinct:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableSet *)v5->_previouslyObservedResults containsObject:v4];
  if ((v6 & 1) == 0) {
    [(NSMutableSet *)v5->_previouslyObservedResults addObject:v4];
  }
  objc_sync_exit(v5);

  return v6 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyObservedResults, 0);

  objc_storeStrong((id *)&self->_observable, 0);
}

@end