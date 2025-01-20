@interface EMFSearchEngineBundleLoader
+ (BOOL)isLocaleSupported:(id)a3;
+ (id)assetBundleForLocale:(id)a3;
@end

@implementation EMFSearchEngineBundleLoader

+ (BOOL)isLocaleSupported:(id)a3
{
  if (a3) {
    return MEMORY[0x1F4113BC8](a3, a2);
  }
  else {
    return 0;
  }
}

+ (id)assetBundleForLocale:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 localeIdentifier];
    BundleForLocaleIdentifier = (__CFBundle *)CEMEMFSearchEngineCreateBundleForLocaleIdentifier();

    if (BundleForLocaleIdentifier)
    {
      CFURLRef v7 = CFBundleCopyBundleURL(BundleForLocaleIdentifier);
      CFRelease(BundleForLocaleIdentifier);
      BundleForLocaleIdentifier = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
    }
  }
  else
  {
    BundleForLocaleIdentifier = 0;
  }

  return BundleForLocaleIdentifier;
}

@end