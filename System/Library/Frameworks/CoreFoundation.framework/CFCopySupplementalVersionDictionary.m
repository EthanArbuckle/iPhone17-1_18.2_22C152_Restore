@interface CFCopySupplementalVersionDictionary
@end

@implementation CFCopySupplementalVersionDictionary

void ___CFCopySupplementalVersionDictionary_block_invoke()
{
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, @"/System/Cryptexes/OS/System/Library/CoreServices/SystemVersion.plist");
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  if (!v1) {
    v1 = (void *)_CFCopySystemVersionDictionary();
  }
  _CFCopySupplementalVersionDictionary_result = (uint64_t)v1;
}

@end