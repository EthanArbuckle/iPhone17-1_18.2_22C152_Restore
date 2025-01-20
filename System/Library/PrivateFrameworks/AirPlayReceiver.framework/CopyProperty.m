@interface CopyProperty
@end

@implementation CopyProperty

NSObject **__sharedUI_CopyProperty_block_invoke(uint64_t a1)
{
  result = AirPlayReceiverUI_CopyProperty(**(void **)(a1 + 48), *(void *)(a1 + 56), 0, (int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  **(void **)(a1 + 40) = result;
  return result;
}

@end