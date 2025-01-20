@interface StartScreenPresentation
@end

@implementation StartScreenPresentation

uint64_t __sharedUI_StartScreenPresentation_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_StartPresentation(**(void **)(a1 + 40), *(CFDictionaryRef *)(a1 + 48), *(__CFDictionary ***)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end