@interface _EFReplayObservable
- (_EFReplayObservable)initWithCount:(unint64_t)a3;
- (id)subscribe:(id)a3;
- (void)_unsubscribe:(id)a3;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _EFReplayObservable

- (_EFReplayObservable)initWithCount:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_EFReplayObservable;
  v4 = [(_EFReplayObservable *)&v12 init];
  if (v4)
  {
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v4->_lock;
    v4->_lock = v5;

    uint64_t v7 = +[EFQueue boundedQueueWithCapacity:a3];
    queue = v4->_queue;
    v4->_queue = (EFQueue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v4->_observers;
    v4->_observers = v9;
  }
  return v4;
}

- (id)subscribe:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(EFQueue *)self->_queue allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        [v4 observerDidReceiveResult:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  if (self->_error)
  {
    objc_msgSend(v4, "observerDidFailWithError:");
  }
  else if (self->_isStopped)
  {
    [v4 observerDidComplete];
  }
  if (self->_isStopped)
  {
    v9 = 0;
  }
  else
  {
    [(NSMutableArray *)self->_observers addObject:v4];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __33___EFReplayObservable_subscribe___block_invoke;
    v16 = &unk_1E6121B90;
    v17 = self;
    id v18 = v4;
    v9 = +[EFCancelationToken tokenWithCancelationBlock:&v13];
  }
  [(NSLock *)self->_lock unlock];
  if (v9) {
    v10 = v9;
  }
  else {
    v10 = objc_alloc_init(EFCancelationToken);
  }
  v11 = v10;

  return v11;
}

- (void)_unsubscribe:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  [(NSMutableArray *)self->_observers removeObject:v4];
  [(NSLock *)self->_lock unlock];
}

- (void)observerDidReceiveResult:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  if (!self->_isStopped)
  {
    [(EFQueue *)self->_queue enqueue:v4];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v5 = self->_observers;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "observerDidReceiveResult:", v4, (void)v9);
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (void)observerDidComplete
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (!self->_isStopped)
  {
    self->_isStopped = 1;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = self->_observers;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "observerDidComplete", (void)v7);
        }
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    [(NSMutableArray *)self->_observers removeAllObjects];
  }
  [(NSLock *)self->_lock unlock];
}

- (void)observerDidFailWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(NSLock *)self->_lock lock];
  if (!self->_isStopped)
  {
    self->_isStopped = 1;
    objc_storeStrong((id *)&self->_error, a3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "observerDidFailWithError:", v5, (void)v10);
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_observers removeAllObjects];
  }
  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end