@interface FMFinishPromiseWithFuture
@end

@implementation FMFinishPromiseWithFuture

uint64_t ___FMFinishPromiseWithFuture_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t ___FMFinishPromiseWithFuture_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

@end