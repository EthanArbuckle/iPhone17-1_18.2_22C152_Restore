@interface CopyCGImageAtTime
@end

@implementation CopyCGImageAtTime

CFTypeRef __surrogateAIG_CopyCGImageAtTime_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = surrogateAIG_EnsureSubGeneratorCreated(*(const void **)(a1 + 48));
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 56) + 24);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end