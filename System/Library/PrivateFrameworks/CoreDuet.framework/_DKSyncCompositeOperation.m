@interface _DKSyncCompositeOperation
- (BOOL)isAsynchronous;
- (BOOL)isReady;
- (NSMutableArray)errors;
- (_DKSyncCompositeOperation)init;
- (_DKSyncCompositeOperation)initWithParent:(id)a3;
- (void)_shutdownOperation;
- (void)cancel;
- (void)childOperation:(id)a3 didEndWithErrors:(id)a4;
- (void)childOperationWasAdded:(id)a3;
- (void)dealloc;
- (void)endOperation;
- (void)setReadyToStart:(BOOL)a3;
@end

@implementation _DKSyncCompositeOperation

- (_DKSyncCompositeOperation)init
{
  return [(_DKSyncCompositeOperation *)self initWithParent:0];
}

- (_DKSyncCompositeOperation)initWithParent:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_DKSyncCompositeOperation;
  v5 = [(_DKSyncOperation *)&v23 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    children = v6->_children;
    v6->_children = (NSHashTable *)v7;

    uint64_t v9 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableArray *)v9;

    if (v4)
    {
      objc_storeWeak((id *)&v6->_parent, v4);
      [v4 childOperationWasAdded:v6];
      v11 = +[_CDObservationCenter sharedInstance];
      v12 = +[_DKSyncSerializer underlyingQueue];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __44___DKSyncCompositeOperation_initWithParent___block_invoke;
      v20 = &unk_1E560ECF8;
      id v13 = v4;
      id v21 = v13;
      v14 = v6;
      v22 = v14;
      [v11 addObserver:v14 name:@"_DKSyncOperationStateDidChangeNotification" sender:v13 queue:v12 usingBlock:&v17];

      if (objc_msgSend(v13, "isCancelled", v17, v18, v19, v20))
      {
        [(_DKSyncCompositeOperation *)v14 cancel];
      }
      else
      {
        if ([v13 isExecuting]) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = [v13 isFinished];
        }
        [(_DKSyncCompositeOperation *)v14 setReadyToStart:v15];
      }
    }
    else
    {
      [(_DKSyncCompositeOperation *)v6 setReadyToStart:1];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(_DKSyncCompositeOperation *)self _shutdownOperation];
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCompositeOperation;
  [(_DKSyncOperation *)&v3 dealloc];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setReadyToStart:(BOOL)a3
{
  [(_DKSyncCompositeOperation *)self willChangeValueForKey:@"isReady"];
  atomic_store(a3, (unsigned __int8 *)&self->_isReadyToStart);
  [(_DKSyncCompositeOperation *)self didChangeValueForKey:@"isReady"];
}

- (BOOL)isReady
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isReadyToStart);
  v6.receiver = self;
  v6.super_class = (Class)_DKSyncCompositeOperation;
  if ([(_DKSyncCompositeOperation *)&v6 isReady]) {
    BOOL v4 = (v3 & 1) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return [(_DKSyncCompositeOperation *)self isCancelled];
  }
  else {
    return 1;
  }
}

- (void)childOperationWasAdded:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_children addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)childOperation:(id)a3 didEndWithErrors:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_children removeObject:v6];

  NSUInteger v7 = [(NSHashTable *)self->_children count];
  if ([v9 count])
  {
    v8 = [(_DKSyncCompositeOperation *)self errors];
    [v8 addObjectsFromArray:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (!v7
    && [(_DKSyncCompositeOperation *)self isAsynchronous]
    && ([(_DKSyncCompositeOperation *)self isCancelled] & 1) == 0)
  {
    [(_DKSyncCompositeOperation *)self endOperation];
  }
}

- (void)_shutdownOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    objc_storeWeak((id *)&self->_parent, 0);
    os_unfair_lock_unlock(p_lock);
    BOOL v4 = +[_CDObservationCenter sharedInstance];
    [v4 removeObserver:self name:@"_DKSyncOperationStateDidChangeNotification" sender:WeakRetained];
    id v5 = [(_DKSyncCompositeOperation *)self errors];
    [WeakRetained childOperation:self didEndWithErrors:v5];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)endOperation
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCompositeOperation;
  [(_DKSyncOperation *)&v3 endOperation];
  [(_DKSyncCompositeOperation *)self _shutdownOperation];
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_DKSyncCompositeOperation;
  [(_DKSyncCompositeOperation *)&v13 cancel];
  os_unfair_lock_lock(&self->_lock);
  objc_super v3 = (void *)[(NSHashTable *)self->_children copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "cancel", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(_DKSyncCompositeOperation *)self _shutdownOperation];
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end