@interface CNGeneratorObservable
@end

@implementation CNGeneratorObservable

uint64_t __48___CNGeneratorObservable_sendResultsToObserver___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    do
    {
      if ([*(id *)(a1 + 32) isFinished]) {
        break;
      }
      [*(id *)(a1 + 32) sendCurrentStateToObserver:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) updateState];
    }
    while (![*(id *)(a1 + 32) isCanceled]);
  }
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    return [v3 observerDidComplete];
  }
  return result;
}

uint64_t __56___CNGeneratorObservable_scheduleNextResultForObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isFinished];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 32) sendCurrentStateToObserver:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) updateState];
      v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      return [v3 scheduleNextResultForObserver:v4];
    }
  }
  return result;
}

@end