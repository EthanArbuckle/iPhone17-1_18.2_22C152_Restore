@interface CNBufferingObservable
@end

@implementation CNBufferingObservable

void __36___CNBufferingObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 results];
  v6 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v5, "_cn_addObject:orPlaceholder:", v4, v6);

  id v9 = [*(id *)(a1 + 32) strategy];
  v7 = *(void **)(a1 + 32);
  v8 = [v7 results];
  [v9 buffer:v7 didReceiveResults:v8 forObserver:*(void *)(a1 + 40)];
}

uint64_t __36___CNBufferingObservable_subscribe___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) results];
  uint64_t v3 = [v2 count];

  if (v3) {
    [*(id *)(a1 + 32) sendBufferedResultsToObserver:*(void *)(a1 + 40)];
  }
  id v4 = *(void **)(a1 + 40);

  return [v4 observerDidComplete];
}

uint64_t __36___CNBufferingObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

@end