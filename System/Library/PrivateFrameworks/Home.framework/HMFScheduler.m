@interface HMFScheduler
@end

@implementation HMFScheduler

void __53__HMFScheduler_NAScheduler__afterDelay_performBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  if (WeakRetained) {
    id v4 = (id)[WeakRetained performBlock:v3];
  }
  else {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

uint64_t __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end