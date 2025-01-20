@interface StartSession
@end

@implementation StartSession

uint64_t __sharedUI_StartSession_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_StartAudio(**(void **)(a1 + 40), *(CFDictionaryRef *)(a1 + 48), *(CFMutableDictionaryRef **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end