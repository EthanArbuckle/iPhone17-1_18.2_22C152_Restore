@interface CalCancelableDispatchBlock
- (CalCancelableDispatchBlock)initWithBlock:(id)a3 inQueue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)block;
- (void)cancel;
- (void)performAfterDelay:(double)a3;
- (void)performAsync;
- (void)setBlock:(id)a3;
@end

@implementation CalCancelableDispatchBlock

- (CalCancelableDispatchBlock)initWithBlock:(id)a3 inQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CalCancelableDispatchBlock.m", 25, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CalCancelableDispatchBlock.m", 26, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)CalCancelableDispatchBlock;
  v10 = [(CalCancelableDispatchBlock *)&v19 init];
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__CalCancelableDispatchBlock_initWithBlock_inQueue___block_invoke;
    block[3] = &unk_1E56CDCF8;
    id v18 = v7;
    v11 = v10;
    v17 = v11;
    dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, block);
    [v11 setBlock:v12];

    objc_storeStrong(v11 + 2, a4);
  }

  return v10;
}

uint64_t __52__CalCancelableDispatchBlock_initWithBlock_inQueue___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 setBlock:0];
}

- (void)performAsync
{
  queue = [(CalCancelableDispatchBlock *)self queue];
  v3 = [(CalCancelableDispatchBlock *)self block];
  dispatch_async(queue, v3);
}

- (void)performAfterDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = [(CalCancelableDispatchBlock *)self queue];
  v5 = [(CalCancelableDispatchBlock *)self block];
  dispatch_after(v4, queue, v5);
}

- (void)cancel
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "[CalCancelableDispatchBlock cancel] called after block was already canceled", v1, 2u);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end