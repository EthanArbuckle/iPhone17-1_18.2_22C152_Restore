@interface CNBufferedObserver
@end

@implementation CNBufferedObserver

uint64_t __48___CNBufferedObserver_observerDidReceiveResult___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) observerDidReceiveResult:*(void *)(a1 + 40)];
}

uint64_t __42___CNBufferedObserver_observerDidComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) observerDidComplete];
}

uint64_t __48___CNBufferedObserver_observerDidFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) observerDidFailWithError:*(void *)(a1 + 40)];
}

@end