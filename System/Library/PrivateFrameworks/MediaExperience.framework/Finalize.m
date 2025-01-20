@interface Finalize
@end

@implementation Finalize

uint64_t __discoverer_Finalize_block_invoke()
{
  if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled()) {
    FigRouteDiscoveryManagerRemoveCachedDiscoverers();
  }
  return FigRouteDiscoveryManagerUpdateDiscoveryMode();
}

void __routingContextRemoteXPC_Finalize_block_invoke(uint64_t a1)
{
}

void __central_Finalize_block_invoke()
{
}

void __routingContext_Finalize_block_invoke(uint64_t a1)
{
  FigRoutingManagerUnregisterContext(*(void *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end