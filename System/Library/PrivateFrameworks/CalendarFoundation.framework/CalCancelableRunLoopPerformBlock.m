@interface CalCancelableRunLoopPerformBlock
- (CalCancelableRunLoopPerformBlock)initWithBlock:(id)a3 inRunLoop:(id)a4;
- (NSRunLoop)runLoop;
- (id)block;
- (void)_performBlock:(id)a3;
- (void)cancel;
- (void)performAfterDelay:(double)a3;
- (void)setBlock:(id)a3;
@end

@implementation CalCancelableRunLoopPerformBlock

- (CalCancelableRunLoopPerformBlock)initWithBlock:(id)a3 inRunLoop:(id)a4
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
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CalCancelableRunLoopPerformBlock.m", 23, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"CalCancelableRunLoopPerformBlock.m", 24, @"Invalid parameter not satisfying: %@", @"runLoop != nil" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CalCancelableRunLoopPerformBlock;
  v10 = [(CalCancelableRunLoopPerformBlock *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_runLoop, a4);
    [(CalCancelableRunLoopPerformBlock *)v11 setBlock:v7];
  }

  return v11;
}

- (void)performAfterDelay:(double)a3
{
  v5 = [(CalCancelableRunLoopPerformBlock *)self runLoop];
  v6 = (__CFRunLoop *)[v5 getCFRunLoop];
  id v7 = (const void *)*MEMORY[0x1E4F1C3A0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CalCancelableRunLoopPerformBlock_performAfterDelay___block_invoke;
  v9[3] = &unk_1E56CDC60;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  CFRunLoopPerformBlock(v6, v7, v9);

  id v8 = [(CalCancelableRunLoopPerformBlock *)self runLoop];
  CFRunLoopWakeUp((CFRunLoopRef)[v8 getCFRunLoop]);
}

void __54__CalCancelableRunLoopPerformBlock_performAfterDelay___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) block];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    id v5 = [v3 block];
    v4 = (void *)MEMORY[0x192FD8850]();
    [v3 performSelector:sel__performBlock_ withObject:v4 afterDelay:*(double *)(a1 + 40)];
  }
}

- (void)cancel
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "[CalCancelableRunLoopPerformBlock cancel] called after block was already canceled", v1, 2u);
}

- (void)_performBlock:(id)a3
{
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
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
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_runLoop, 0);
}

@end