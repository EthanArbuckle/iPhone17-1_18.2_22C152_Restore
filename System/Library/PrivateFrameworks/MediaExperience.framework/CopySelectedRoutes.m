@interface CopySelectedRoutes
@end

@implementation CopySelectedRoutes

uint64_t __routingContext_CopySelectedRoutes_block_invoke(void *a1)
{
  uint64_t result = FigRoutingManagerCopyPickedEndpointsForRoutingContext(*(void *)(a1[6] + 8), (void *)(*(void *)(a1[5] + 8) + 24));
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end