@interface CNQueueScheduler
@end

@implementation CNQueueScheduler

uint64_t __61___CNQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) cancel];
}

uint64_t __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end