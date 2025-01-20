@interface CopyCachedAssetTrackPropertyValue
@end

@implementation CopyCachedAssetTrackPropertyValue

CFTypeRef __remoteXPCAssetTrack_CopyCachedAssetTrackPropertyValue_block_invoke(uint64_t a1)
{
  value = 0;
  CFTypeRef result = (CFTypeRef)CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 40), *(const void **)(a1 + 48), (const void **)&value);
  if (result)
  {
    if (value == (void *)*MEMORY[0x1E4F1D260]) {
      CFTypeRef result = 0;
    }
    else {
      CFTypeRef result = CFRetain(value);
    }
    **(void **)(a1 + 56) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end