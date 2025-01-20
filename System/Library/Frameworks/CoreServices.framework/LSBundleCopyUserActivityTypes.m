@interface LSBundleCopyUserActivityTypes
@end

@implementation LSBundleCopyUserActivityTypes

void ___LSBundleCopyUserActivityTypes_block_invoke(uint64_t a1)
{
  v2 = (const void *)_CSStringCopyCFString();
  if (v2)
  {
    v3 = v2;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), v2);
    CFRelease(v3);
  }
}

@end