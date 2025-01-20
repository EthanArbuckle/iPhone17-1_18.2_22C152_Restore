@interface ShowPIN
@end

@implementation ShowPIN

uint64_t __sharedUI_ShowPIN_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_EnsurePINVisible(**(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end