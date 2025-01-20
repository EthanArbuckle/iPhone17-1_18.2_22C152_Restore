@interface CNJumpToMainRunLoopScheduler
@end

@implementation CNJumpToMainRunLoopScheduler

void __73___CNJumpToMainRunLoopScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63___CNJumpToMainRunLoopScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

@end