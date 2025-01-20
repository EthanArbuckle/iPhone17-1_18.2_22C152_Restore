@interface LSBundleDisplayNameContextGetIndex
@end

@implementation LSBundleDisplayNameContextGetIndex

uint64_t ___LSBundleDisplayNameContextGetIndex_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a5 = 1;
  }
  return result;
}

@end