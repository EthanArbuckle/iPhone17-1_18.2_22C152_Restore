@interface StopSession
@end

@implementation StopSession

uint64_t __sharedUI_StopSession_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_StopAudio(**(void **)(a1 + 40), *(void *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end