@interface CopyRoute
@end

@implementation CopyRoute

uint64_t __routingContextResilientRemote_CopyRoute_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  if (!v6) {
    return 4294954514;
  }
  return v6(a2, v3);
}

void __routingContext_CopyRoute_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef cf = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigRoutingManagerCopyPickedEndpointForRoutingContext(*(void *)(DerivedStorage + 8), &cf);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    **(void **)(a1 + 48) = cf;
  }
}

@end