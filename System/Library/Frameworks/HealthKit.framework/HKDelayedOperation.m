@interface HKDelayedOperation
@end

@implementation HKDelayedOperation

void __60___HKDelayedOperation_initWithMode_clock_queue_delay_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_executeBlockIfScheduled");
}

uint64_t __40___HKDelayedOperation_executeWithDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_executeBlockIfScheduled");
}

void __33___HKDelayedOperation_invalidate__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

@end