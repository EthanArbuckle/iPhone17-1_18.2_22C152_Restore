@interface HMFFuture
@end

@implementation HMFFuture

uint64_t __35__HMFFuture_HMDUtilities__naFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  [*(id *)(a1 + 32) finishWithResult:v3];

  return 1;
}

uint64_t __35__HMFFuture_HMDUtilities__naFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

@end