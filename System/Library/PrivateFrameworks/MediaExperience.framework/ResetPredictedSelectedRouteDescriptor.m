@interface ResetPredictedSelectedRouteDescriptor
@end

@implementation ResetPredictedSelectedRouteDescriptor

uint64_t __routingContextResilientRemote_ResetPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(uint64_t (**)(uint64_t))(v4 + 184);
  if (!v5) {
    return 4294954514;
  }
  return v5(a2);
}

void __routingContext_ResetPredictedSelectedRouteDescriptor_block_invoke(uint64_t a1)
{
}

@end