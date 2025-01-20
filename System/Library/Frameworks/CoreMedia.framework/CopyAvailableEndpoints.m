@interface CopyAvailableEndpoints
@end

@implementation CopyAvailableEndpoints

uint64_t __remoteXPCEndpointManager_CopyAvailableEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)FigEndpointRPCCacheApplyObjectDeltas(*(void *)(*(void *)(a1 + 48) + 32), *(xpc_object_t *)(a1 + 56), *(xpc_object_t *)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t result = FigEndpointRPCCacheCopyAvailableObjects(*(void *)(*(void *)(a1 + 48) + 32), (__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end