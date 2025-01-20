@interface DeadConnectionCallback
@end

@implementation DeadConnectionCallback

void __remoteXPCEndpointManagerClient_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  FigEndpointRPCCacheRemoveAllEndpoints(*(void *)(v2 + 32));
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v2 + 24));
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

@end