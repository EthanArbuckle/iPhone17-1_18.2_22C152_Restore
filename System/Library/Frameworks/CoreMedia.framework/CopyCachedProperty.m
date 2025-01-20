@interface CopyCachedProperty
@end

@implementation CopyCachedProperty

CFTypeRef __remoteXPCEndpointManager_CopyCachedProperty_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 24), *(const void **)(a1 + 48));
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

@end