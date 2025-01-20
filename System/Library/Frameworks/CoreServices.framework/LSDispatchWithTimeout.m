@interface LSDispatchWithTimeout
@end

@implementation LSDispatchWithTimeout

uint64_t ___LSDispatchWithTimeout_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end