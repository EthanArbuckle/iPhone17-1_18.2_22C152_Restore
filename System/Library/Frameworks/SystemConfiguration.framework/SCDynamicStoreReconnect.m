@interface SCDynamicStoreReconnect
@end

@implementation SCDynamicStoreReconnect

uint64_t ____SCDynamicStoreReconnect_block_invoke(uint64_t a1)
{
  uint64_t result = __SCDynamicStoreAddSession(*(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end