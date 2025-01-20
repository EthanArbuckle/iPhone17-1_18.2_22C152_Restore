@interface GetAirPlayVideoPlaying
@end

@implementation GetAirPlayVideoPlaying

uint64_t __routingSessionManagerResilientRemote_GetAirPlayVideoPlaying_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 48);
  if (!v6) {
    return 4294954514;
  }

  return v6(a2, v3);
}

@end