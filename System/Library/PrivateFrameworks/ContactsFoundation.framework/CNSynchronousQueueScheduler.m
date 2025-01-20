@interface CNSynchronousQueueScheduler
@end

@implementation CNSynchronousQueueScheduler

void __72___CNSynchronousQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73___CNSynchronousQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]([MEMORY[0x1E4F29060] sleepForTimeInterval:*(double *)(a1 + 40)]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end