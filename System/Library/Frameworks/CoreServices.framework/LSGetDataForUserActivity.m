@interface LSGetDataForUserActivity
@end

@implementation LSGetDataForUserActivity

void ___LSGetDataForUserActivity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  v9 = *v6;
  *v6 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end