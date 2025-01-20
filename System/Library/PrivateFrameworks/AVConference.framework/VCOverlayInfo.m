@interface VCOverlayInfo
@end

@implementation VCOverlayInfo

CFTypeRef ___VCOverlayInfo_copyOverlayInfoForToken_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(**(CFDictionaryRef **)(a1 + 40), *(const void **)(a1 + 48));
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

@end