@interface CNCoalescingSchedulerDecorator
- (CNCoalescingSchedulerDecorator)initWithScheduler:(id)a3 coalescingWindow:(double)a4;
- (CNScheduler)scheduler;
- (CNStack)delayedBlocks;
- (double)coalescingWindow;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (unint64_t)getAndIncrementState;
- (unint64_t)state;
- (void)flushDelayedBlock;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)removeDelayedBlock:(id)a3;
- (void)setDelayedBlocks:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CNCoalescingSchedulerDecorator

- (CNCoalescingSchedulerDecorator)initWithScheduler:(id)a3 coalescingWindow:(double)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNCoalescingSchedulerDecorator;
  v8 = [(CNCoalescingSchedulerDecorator *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scheduler, a3);
    v9->_coalescingWindow = a4;
    v9->_state = 0;
    v10 = objc_alloc_init(CNStack);
    delayedBlocks = v9->_delayedBlocks;
    v9->_delayedBlocks = v10;

    v12 = v9;
  }

  return v9;
}

- (unint64_t)getAndIncrementState
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(CNCoalescingSchedulerDecorator *)v2 state])
  {
    unint64_t v3 = 1;
  }
  else
  {
    [(CNCoalescingSchedulerDecorator *)v2 setState:1];
    unint64_t v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)flushDelayedBlock
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(CNCoalescingSchedulerDecorator *)v2 delayedBlocks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(CNCoalescingSchedulerDecorator *)v2 delayedBlocks];
    v6 = [v5 pop];

    id v7 = [(CNCoalescingSchedulerDecorator *)v2 delayedBlocks];
    id v8 = (id)[v7 popAll];

    v9 = [(CNCoalescingSchedulerDecorator *)v2 scheduler];
    [(CNCoalescingSchedulerDecorator *)v2 coalescingWindow];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__CNCoalescingSchedulerDecorator_flushDelayedBlock__block_invoke;
    v11[3] = &unk_1E569F9D8;
    v11[4] = v2;
    id v10 = (id)objc_msgSend(v9, "afterDelay:performBlock:", v11);
  }
  else
  {
    [(CNCoalescingSchedulerDecorator *)v2 setState:0];
    v6 = 0;
  }
  objc_sync_exit(v2);

  if (v6) {
    v6[2](v6);
  }
}

uint64_t __51__CNCoalescingSchedulerDecorator_flushDelayedBlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushDelayedBlock];
}

- (void)removeDelayedBlock:(id)a3
{
  id aBlock = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(CNCoalescingSchedulerDecorator *)v4 delayedBlocks];
  v6 = _Block_copy(aBlock);
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CNCoalescingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E569FE70;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CNCoalescingSchedulerDecorator *)self performCancelableBlock:v7];
}

void __47__CNCoalescingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) scheduler];
  [v2 performBlock:*(void *)(a1 + 40)];
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CNCoalescingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E56A1980;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v7 = v6;
  id v8 = [(CNCoalescingSchedulerDecorator *)self performCancelableBlock:v9];
}

void __64__CNCoalescingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) scheduler];
  [v2 performBlock:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 48)];
}

- (id)performCancelableBlock:(id)a3
{
  return [(CNCoalescingSchedulerDecorator *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(CNCancelationToken);
  unint64_t v8 = [(CNCoalescingSchedulerDecorator *)self getAndIncrementState];
  if (v8 == 1)
  {
    id v10 = self;
    objc_sync_enter(v10);
    objc_initWeak(&location, v10);
    objc_initWeak(&from, v7);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_2;
    v21[3] = &unk_1E56A19A8;
    objc_copyWeak(&v23, &location);
    objc_copyWeak(v24, &from);
    id v22 = v6;
    v24[1] = (id)a4;
    v13 = (void *)[v21 copy];
    objc_super v14 = [(CNCoalescingSchedulerDecorator *)v10 delayedBlocks];
    v15 = _Block_copy(v13);
    [v14 push:v15];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_3;
    v18[3] = &unk_1E56A0FD0;
    objc_copyWeak(&v20, &location);
    id v16 = v13;
    id v19 = v16;
    [(CNCancelationToken *)v7 addCancelationBlock:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_sync_exit(v10);
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    v9 = [(CNCoalescingSchedulerDecorator *)self scheduler];
    id v10 = [v9 performCancelableBlock:v6 qualityOfService:a4];

    unint64_t v11 = [(CNCoalescingSchedulerDecorator *)self scheduler];
    [(CNCoalescingSchedulerDecorator *)self coalescingWindow];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
    v27[3] = &unk_1E569F9D8;
    v27[4] = self;
    v12 = objc_msgSend(v11, "afterDelay:performBlock:", v27);

    [(CNCancelationToken *)v7 addCancelable:v10];
    [(CNCancelationToken *)v7 addCancelable:v12];
  }
LABEL_6:

  return v7;
}

uint64_t __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushDelayedBlock];
}

void __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (([v2 isCanceled] & 1) == 0)
  {
    unint64_t v3 = [WeakRetained scheduler];
    id v4 = [v3 performCancelableBlock:*(void *)(a1 + 32) qualityOfService:*(void *)(a1 + 56)];

    [v2 addCancelable:v4];
  }
}

void __74__CNCoalescingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeDelayedBlock:*(void *)(a1 + 32)];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CNCoalescingSchedulerDecorator *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CNCoalescingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E569FA00;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 afterDelay:v11 performBlock:a3];

  return v9;
}

uint64_t __58__CNCoalescingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlock:*(void *)(a1 + 40)];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(CNCoalescingSchedulerDecorator *)self scheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__CNCoalescingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E56A19D0;
  v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a5;
  id v10 = v8;
  unint64_t v11 = [v9 afterDelay:v13 performBlock:a5 qualityOfService:a3];

  return v11;
}

uint64_t __75__CNCoalescingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlock:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 48)];
}

- (double)timestamp
{
  id v2 = [(CNCoalescingSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (double)coalescingWindow
{
  return self->_coalescingWindow;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CNStack)delayedBlocks
{
  return self->_delayedBlocks;
}

- (void)setDelayedBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedBlocks, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end