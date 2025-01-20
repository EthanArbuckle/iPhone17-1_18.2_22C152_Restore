@interface CopyPredictedSelectedRouteDescriptor
@end

@implementation CopyPredictedSelectedRouteDescriptor

uint64_t __routingContextResilientRemote_CopyPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 176);
  if (!v6) {
    return 4294954514;
  }
  return v6(a2, v3);
}

CFTypeRef __routingContext_CopyPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1)
{
  CFTypeRef result = FigPredictedRouting_CopySelectedRouteDescriptor(*(void *)(*(void *)(a1 + 40) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end