@interface FPParentProgress
@end

@implementation FPParentProgress

uint64_t __38___FPParentProgress_setProgressProxy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __38___FPParentProgress_setProgressProxy___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) pause];
}

uint64_t __38___FPParentProgress_setProgressProxy___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

@end