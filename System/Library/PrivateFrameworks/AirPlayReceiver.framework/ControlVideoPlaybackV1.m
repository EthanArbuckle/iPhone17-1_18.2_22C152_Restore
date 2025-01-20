@interface ControlVideoPlaybackV1
@end

@implementation ControlVideoPlaybackV1

uint64_t __sharedUI_ControlVideoPlaybackV1_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_Perform(**(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(uint64_t **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end