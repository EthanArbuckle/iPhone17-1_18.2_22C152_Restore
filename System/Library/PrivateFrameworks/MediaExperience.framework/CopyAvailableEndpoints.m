@interface CopyAvailableEndpoints
@end

@implementation CopyAvailableEndpoints

uint64_t __remoteXPCRouteDiscoverer_CopyAvailableEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 64) + 24);
  if (result)
  {
    uint64_t result = FigEndpointRPCCacheApplyObjectDeltas();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t result = FigEndpointRPCCacheCopyAvailableObjects();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    }
  }
  return result;
}

@end