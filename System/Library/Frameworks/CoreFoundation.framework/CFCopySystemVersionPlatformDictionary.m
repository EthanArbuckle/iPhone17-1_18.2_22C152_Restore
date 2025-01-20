@interface CFCopySystemVersionPlatformDictionary
@end

@implementation CFCopySystemVersionPlatformDictionary

void ___CFCopySystemVersionPlatformDictionary_block_invoke()
{
  CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, @"/System/Library/CoreServices/.SystemVersionPlatform.plist");
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  if (!v1) {
    v1 = (void *)_CFCopySystemVersionDictionary();
  }
  _CFCopySystemVersionPlatformDictionary_result = (uint64_t)v1;
}

@end