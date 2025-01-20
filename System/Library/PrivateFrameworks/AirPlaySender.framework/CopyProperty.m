@interface CopyProperty
@end

@implementation CopyProperty

CFArrayRef __screenstream_CopyProperty_block_invoke(uint64_t a1)
{
  CFArrayRef result = CFArrayCreateCopy(*(CFAllocatorRef *)(a1 + 40), *(CFArrayRef *)(*(void *)(a1 + 48) + 1144));
  **(void **)(a1 + 32) = result;
  return result;
}

@end