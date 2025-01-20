@interface CopyPropertyForQualifier
@end

@implementation CopyPropertyForQualifier

NSObject **__sharedUI_CopyPropertyForQualifier_block_invoke(uint64_t a1)
{
  result = AirPlayReceiverUI_CopyProperty(**(void **)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), (int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  **(void **)(a1 + 40) = result;
  return result;
}

@end