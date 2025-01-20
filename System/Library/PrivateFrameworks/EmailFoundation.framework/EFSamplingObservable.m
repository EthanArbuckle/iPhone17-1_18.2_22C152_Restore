@interface EFSamplingObservable
@end

@implementation EFSamplingObservable

void __35___EFSamplingObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) lock];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  [*(id *)(a1 + 32) unlock];
}

void __35___EFSamplingObservable_subscribe___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(a1 + 32) unlock];
  if (v4) {
    [*(id *)(a1 + 40) observerDidReceiveResult:v4];
  }
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 unlock];
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) observerDidComplete];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

void __35___EFSamplingObservable_subscribe___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) cancel];
  [*(id *)(a1 + 40) observerDidFailWithError:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  [*(id *)(a1 + 40) cancel];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

@end