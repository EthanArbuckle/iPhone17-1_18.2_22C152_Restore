@interface CFBundleCopyLocTableProvenanceForDeviceAndPlatformVariants
@end

@implementation CFBundleCopyLocTableProvenanceForDeviceAndPlatformVariants

void ___CFBundleCopyLocTableProvenanceForDeviceAndPlatformVariants_block_invoke(uint64_t a1, CFStringRef theString)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v7.length = CFStringGetLength(theString) - v4;
  v7.location = v4;
  CFStringRef v5 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v7);
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v5)) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), v5, *(const void **)(a1 + 48));
  }

  CFRelease(v5);
}

@end