@interface CFBundleCopyInfoDictionaryInDirectoryWithVersion
@end

@implementation CFBundleCopyInfoDictionaryInDirectoryWithVersion

BOOL ___CFBundleCopyInfoDictionaryInDirectoryWithVersion_block_invoke(uint64_t a1, CFStringRef theString)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    CFIndex Length = CFStringGetLength(theString);
    if (Length == *(void *)(a1 + 48))
    {
      v7.length = Length;
      v7.location = 0;
      if (CFStringCompareWithOptions(theString, @"Info-iphoneos.plist", v7, 9uLL) == kCFCompareEqualTo) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFURLCreateWithString((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFStringRef *)(a1 + 56), *(CFURLRef *)(a1 + 64));
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    CFIndex v5 = CFStringGetLength(theString);
    if (v5 == *(void *)(a1 + 72))
    {
      v8.length = v5;
      v8.location = 0;
      if (CFStringCompareWithOptions(theString, @"Info.plist", v8, 9uLL) == kCFCompareEqualTo) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFURLCreateWithString((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFStringRef *)(a1 + 80), *(CFURLRef *)(a1 + 64));
      }
    }
  }
  return !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
      || !*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

@end