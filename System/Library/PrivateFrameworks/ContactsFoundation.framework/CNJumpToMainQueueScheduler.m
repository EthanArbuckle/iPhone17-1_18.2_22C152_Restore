@interface CNJumpToMainQueueScheduler
@end

@implementation CNJumpToMainQueueScheduler

void __61___CNJumpToMainQueueScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71___CNJumpToMainQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72___CNJumpToMainQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end