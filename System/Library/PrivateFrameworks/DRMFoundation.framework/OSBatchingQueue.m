@interface OSBatchingQueue
@end

@implementation OSBatchingQueue

uint64_t __87___OSBatchingQueue_initWithName_maxBatchingDelay_maxQueueDepth_queue_workItemsHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedExecuteWorkItems];
}

void __47___OSBatchingQueue_unprotectedExecuteWorkItems__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) workHandler];
  v2[2](v2, *(void *)(a1 + 48));
}

void __32___OSBatchingQueue_addWorkItem___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 >= *(void *)(v3 + 16))
  {
    [(id)v3 unprotectedExecuteWorkItems];
  }
  else if (v2 == 1)
  {
    v4 = *(NSObject **)(v3 + 56);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(v3 + 8) * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(void *)(a1 + 32) + 8) / 10.0 * 1000000000.0));
    v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    dispatch_resume(v6);
  }
}

@end