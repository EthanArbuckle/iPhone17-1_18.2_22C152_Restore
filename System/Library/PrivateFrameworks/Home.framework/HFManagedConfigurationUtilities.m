@interface HFManagedConfigurationUtilities
+ (BOOL)isExplicitContentAllowed;
@end

@implementation HFManagedConfigurationUtilities

+ (BOOL)isExplicitContentAllowed
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F538B8]];

  return v3 == 1;
}

@end