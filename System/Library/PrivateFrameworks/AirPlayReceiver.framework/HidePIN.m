@interface HidePIN
@end

@implementation HidePIN

uint64_t __sharedUI_HidePIN_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_EnsurePINHidden(**(void **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end