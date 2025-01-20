@interface StartVideoPlaybackV1
@end

@implementation StartVideoPlaybackV1

uint64_t __sharedUI_StartVideoPlaybackV1_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_StartVideo(**(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(CFDictionaryRef *)(a1 + 64), *(CFMutableDictionaryRef **)(a1 + 72));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end