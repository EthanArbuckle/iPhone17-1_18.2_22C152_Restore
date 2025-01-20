@interface StopScreenPresentation
@end

@implementation StopScreenPresentation

uint64_t __sharedUI_StopScreenPresentation_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_StopPresentation(**(void **)(a1 + 40), *(const __CFDictionary **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end