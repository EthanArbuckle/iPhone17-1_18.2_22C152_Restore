@interface VSAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)cancel;
- (void)finishExecutionIfPossible;
- (void)start;
@end

@implementation VSAsyncOperation

- (void)finishExecutionIfPossible
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = (VSAsyncOperation *)"-[VSAsyncOperation finishExecutionIfPossible]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Finishing execution of operation %p.", (uint8_t *)&v6, 0xCu);
  }

  [(VSAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  [(VSAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  int v5 = 1;
  atomic_compare_exchange_strong(&self->_state, (unsigned int *)&v5, 2u);
  [(VSAsyncOperation *)self didChangeValueForKey:@"isFinished"];
  [(VSAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  unsigned int v2 = 1;
  atomic_compare_exchange_strong(&self->_state, &v2, v2);
  return v2 == 1;
}

- (BOOL)isFinished
{
  unsigned int v2 = 2;
  atomic_compare_exchange_strong(&self->_state, &v2, v2);
  return v2 == 2;
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([(VSAsyncOperation *)self isReady] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Operation cannot start before it's ready."];
  }
  [(VSAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  int v3 = 0;
  atomic_compare_exchange_strong(&self->_state, (unsigned int *)&v3, 1u);
  BOOL v4 = v3 == 0;
  [(VSAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  if (v4)
  {
    if ([(VSAsyncOperation *)self isCancelled])
    {
      [(VSAsyncOperation *)self finishExecutionIfPossible];
    }
    else
    {
      v7 = VSDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Will begin execution of %@", (uint8_t *)&v9, 0xCu);
      }

      [(VSAsyncOperation *)self executionDidBegin];
      uint64_t v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Did begin execution of %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    [v5 raise:v6 format:@"The -start method may only be called once."];
  }
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will cancel operation %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VSAsyncOperation;
  [(VSAsyncOperation *)&v5 cancel];
  BOOL v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Did cancel operation %@", buf, 0xCu);
  }
}

@end