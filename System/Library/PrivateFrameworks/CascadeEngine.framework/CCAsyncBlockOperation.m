@interface CCAsyncBlockOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (CCAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3;
- (id)block;
- (void)start;
@end

@implementation CCAsyncBlockOperation

- (CCAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCAsyncBlockOperation;
  v5 = [(CCAsyncBlockOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v5->_executing = 0;
    v5->_finished = 0;
  }

  return v5;
}

- (void)start
{
  if (([(CCAsyncBlockOperation *)self isCancelled] & 1) == 0)
  {
    [(CCAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(CCAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"];
    v3 = [(CCAsyncBlockOperation *)self block];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__CCAsyncBlockOperation_start__block_invoke;
    v4[3] = &unk_265277CC0;
    v4[4] = self;
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
}

uint64_t __30__CCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 250) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 didChangeValueForKey:@"isFinished"];
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end