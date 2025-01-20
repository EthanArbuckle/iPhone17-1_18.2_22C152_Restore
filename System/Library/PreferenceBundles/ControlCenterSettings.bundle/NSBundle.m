@interface NSBundle
+ (id)ccui_bundleForModuleInstance:(id)a3;
- (id)ccui_displayName;
- (void)ccui_associateWithModuleInstance:(id)a3;
@end

@implementation NSBundle

+ (id)ccui_bundleForModuleInstance:(id)a3
{
  return objc_getAssociatedObject(a3, "CCUIAssociatedBundle");
}

- (void)ccui_associateWithModuleInstance:(id)a3
{
}

- (id)ccui_displayName
{
  v3 = [(NSBundle *)self objectForInfoDictionaryKey:_kCFBundleDisplayNameKey];
  if (!v3)
  {
    v3 = [(NSBundle *)self objectForInfoDictionaryKey:kCFBundleNameKey];
    if (!v3)
    {
      v3 = [(NSBundle *)self objectForInfoDictionaryKey:kCFBundleExecutableKey];
      if (!v3)
      {
        v3 = [(NSBundle *)self bundleIdentifier];
      }
    }
  }

  return v3;
}

@end