@interface ShowMessage
@end

@implementation ShowMessage

uint64_t __sharedUI_ShowMessage_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_UpdateStatus(**(void **)(a1 + 40), *(_DWORD *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end