@interface QLAsynchronousBlockOperation
- (QLAsynchronousBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation QLAsynchronousBlockOperation

- (QLAsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLAsynchronousBlockOperation;
  v5 = [(QLAsynchronousBlockOperation *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id block = v5->_block;
    v5->_id block = v6;

    v8 = v5;
  }

  return v5;
}

- (void)main
{
  if ([(QLAsynchronousBlockOperation *)self isCancelled])
  {
    [(QLAsynchronousOperation *)self finish];
  }
  else
  {
    id block = (void (**)(id, void *))self->_block;
    if (block)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __36__QLAsynchronousBlockOperation_main__block_invoke;
      v5[3] = &unk_2642F5430;
      v5[4] = self;
      block[2](block, v5);
      id v4 = self->_block;
      self->_id block = 0;
    }
  }
}

uint64_t __36__QLAsynchronousBlockOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end