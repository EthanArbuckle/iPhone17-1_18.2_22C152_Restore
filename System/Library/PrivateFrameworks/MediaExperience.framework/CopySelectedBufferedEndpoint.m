@interface CopySelectedBufferedEndpoint
@end

@implementation CopySelectedBufferedEndpoint

CFTypeRef __routingContext_CopySelectedBufferedEndpoint_block_invoke(uint64_t a1)
{
  CFTypeRef result = FigRoutingManagerCopySelectedBufferedEndpoint(*(const void **)(*(void *)(a1 + 40) + 8), *(const void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __routingContextResilientRemote_CopySelectedBufferedEndpoint_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 144);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

@end