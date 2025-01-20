@interface NSURL(SwiftHelper)
- (CFURLRef)_EX_URLForBundleExecutable;
@end

@implementation NSURL(SwiftHelper)

- (CFURLRef)_EX_URLForBundleExecutable
{
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v1 = Unique;
    CFURLRef v2 = CFBundleCopyExecutableURL(Unique);
    CFRelease(v1);
  }
  else
  {
    CFURLRef v2 = 0;
  }

  return v2;
}

@end