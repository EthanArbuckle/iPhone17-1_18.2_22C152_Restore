@interface SOAsynchronousBlockOperation
- (SOAsynchronousBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation SOAsynchronousBlockOperation

- (SOAsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAsynchronousBlockOperation;
  v5 = [(SOAsynchronousOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C7F7B0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)main
{
  v3 = [(SOAsynchronousBlockOperation *)self block];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SOAsynchronousBlockOperation_main__block_invoke;
  v4[3] = &unk_2645A2378;
  v4[4] = self;
  ((void (**)(void, void *))v3)[2](v3, v4);
}

uint64_t __36__SOAsynchronousBlockOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (id)block
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end