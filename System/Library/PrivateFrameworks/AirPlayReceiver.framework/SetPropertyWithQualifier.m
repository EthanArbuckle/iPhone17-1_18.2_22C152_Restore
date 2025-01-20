@interface SetPropertyWithQualifier
@end

@implementation SetPropertyWithQualifier

uint64_t __sharedUI_SetPropertyWithQualifier_block_invoke(uint64_t a1)
{
  uint64_t result = AirPlayReceiverUI_SetProperty(**(void **)(a1 + 40), *(CFStringRef *)(a1 + 48), *(void *)(a1 + 56), *(const void **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end