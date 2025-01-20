@interface FMMainThreadScheduler
@end

@implementation FMMainThreadScheduler

uint64_t __49___FMMainThreadScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

@end