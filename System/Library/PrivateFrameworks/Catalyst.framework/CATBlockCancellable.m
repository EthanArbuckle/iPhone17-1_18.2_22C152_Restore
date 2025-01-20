@interface CATBlockCancellable
- (CATBlockCancellable)init;
- (CATBlockCancellable)initWithCancellables:(id)a3;
- (CATBlockCancellable)initWithCancellationBlock:(id)a3;
- (id)cancellationBlock;
- (void)cancel;
- (void)setCancellationBlock:(id)a3;
@end

@implementation CATBlockCancellable

- (CATBlockCancellable)init
{
  return [(CATBlockCancellable *)self initWithCancellables:MEMORY[0x263EFFA68]];
}

- (CATBlockCancellable)initWithCancellables:(id)a3
{
  v4 = (void *)[a3 copy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__CATBlockCancellable_initWithCancellables___block_invoke;
  v8[3] = &unk_2641DBE60;
  id v9 = v4;
  id v5 = v4;
  v6 = [(CATBlockCancellable *)self initWithCancellationBlock:v8];

  return v6;
}

uint64_t __44__CATBlockCancellable_initWithCancellables___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cat_forEach:", &__block_literal_global_15);
}

uint64_t __44__CATBlockCancellable_initWithCancellables___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (CATBlockCancellable)initWithCancellationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATBlockCancellable;
  id v5 = [(CATBlockCancellable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x216693330](v4);
    id cancellationBlock = v5->_cancellationBlock;
    v5->_id cancellationBlock = (id)v6;
  }
  return v5;
}

- (void)cancel
{
  v3 = [(CATBlockCancellable *)self cancellationBlock];

  if (v3)
  {
    id v4 = [(CATBlockCancellable *)self cancellationBlock];
    [(CATBlockCancellable *)self setCancellationBlock:0];
    v4[2]();
  }
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end