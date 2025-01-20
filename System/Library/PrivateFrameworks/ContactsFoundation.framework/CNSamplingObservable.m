@interface CNSamplingObservable
@end

@implementation CNSamplingObservable

uint64_t __35___CNSamplingObservable_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendSampleToObserver:*(void *)(a1 + 40)];
}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) receiveResult:a2];
}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  [*(id *)(a1 + 40) sendSampleToObserver:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 48);

  return [v2 observerDidComplete];
}

void __35___CNSamplingObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancel];
  [*(id *)(a1 + 40) observerDidFailWithError:v4];
}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 40);

  return [v2 cancel];
}

@end