@interface SecItemFetchDigests
@end

@implementation SecItemFetchDigests

uint64_t ___SecItemFetchDigests_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end