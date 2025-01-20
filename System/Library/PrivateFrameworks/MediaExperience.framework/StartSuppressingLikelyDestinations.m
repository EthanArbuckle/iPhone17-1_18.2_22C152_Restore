@interface StartSuppressingLikelyDestinations
@end

@implementation StartSuppressingLikelyDestinations

uint64_t __routingSessionManagerResilientRemote_StartSuppressingLikelyDestinations_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(uint64_t (**)(uint64_t))(v4 + 80);
  if (!v5) {
    return 4294954514;
  }
  return v5(a2);
}

@end