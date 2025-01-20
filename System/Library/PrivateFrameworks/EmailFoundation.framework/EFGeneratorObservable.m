@interface EFGeneratorObservable
@end

@implementation EFGeneratorObservable

void __57___EFGeneratorObservable__scheduleNextResultForObserver___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) isCanceled] & 1) == 0
    && ([*(id *)(a1 + 32) _isFinished] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:");
    [*(id *)(a1 + 32) _updateState];
    [*(id *)(a1 + 32) _scheduleNextResultForObserver:*(void *)(a1 + 40)];
  }
}

@end