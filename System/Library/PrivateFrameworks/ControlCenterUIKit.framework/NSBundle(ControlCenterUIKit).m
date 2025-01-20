@interface NSBundle(ControlCenterUIKit)
+ (id)ccui_bundleForModuleInstance:()ControlCenterUIKit;
- (id)ccui_displayName;
- (void)ccui_associateWithModuleInstance:()ControlCenterUIKit;
@end

@implementation NSBundle(ControlCenterUIKit)

+ (id)ccui_bundleForModuleInstance:()ControlCenterUIKit
{
  return objc_getAssociatedObject(object, "CCUIAssociatedBundle");
}

- (void)ccui_associateWithModuleInstance:()ControlCenterUIKit
{
}

- (id)ccui_displayName
{
  v2 = [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
  if (!v2)
  {
    v2 = [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
    if (!v2)
    {
      v2 = [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CFF0]];
      if (!v2)
      {
        v2 = [a1 bundleIdentifier];
      }
    }
  }
  return v2;
}

@end