@interface _CNAmbObservable
- (_CNAmbObservable)init;
- (_CNAmbObservable)initWithObservables:(id)a3;
- (id)subscribe:(id)a3;
- (void)cancelRemainingObservables;
- (void)observerWillRelayEvent:(id)a3;
@end

@implementation _CNAmbObservable

- (_CNAmbObservable)init
{
  return [(_CNAmbObservable *)self initWithObservables:MEMORY[0x1E4F1CBF0]];
}

- (_CNAmbObservable)initWithObservables:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNAmbObservable;
  v5 = [(_CNAmbObservable *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    observables = v5->_observables;
    v5->_observables = (NSArray *)v6;

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v4, "count"));
    tokensByObserver = v5->_tokensByObserver;
    v5->_tokensByObserver = (NSMapTable *)v8;

    v5->_winnerDeclared = 0;
    v10 = v5;
  }

  return v5;
}

- (id)subscribe:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_observables count])
  {
    v5 = +[CNObservable emptyObservable];
    goto LABEL_5;
  }
  if ([(NSArray *)self->_observables count] == 1)
  {
    v5 = [(NSArray *)self->_observables firstObject];
LABEL_5:
    uint64_t v6 = v5;
    v7 = [v5 subscribe:v4];

    goto LABEL_14;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_observables;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [[_CNAmbObserver alloc] initWithObserver:v4 delegate:self];
        v15 = [v13 subscribe:v14];
        [(NSMapTable *)self->_tokensByObserver setObject:v15 forKey:v14];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __30___CNAmbObservable_subscribe___block_invoke;
  v17[3] = &unk_1E569F9D8;
  v17[4] = self;
  v7 = +[CNCancelationToken tokenWithCancelationBlock:v17];
LABEL_14:

  return v7;
}

- (void)observerWillRelayEvent:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_winnerDeclared)
  {
    objc_sync_exit(v4);
  }
  else
  {
    [v5 declareWinner];
    [(NSMapTable *)v4->_tokensByObserver removeObjectForKey:v5];
    v4->_winnerDeclared = 1;
    objc_sync_exit(v4);

    [(_CNAmbObservable *)v4 cancelRemainingObservables];
  }
}

- (void)cancelRemainingObservables
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_tokensByObserver objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByObserver, 0);

  objc_storeStrong((id *)&self->_observables, 0);
}

@end