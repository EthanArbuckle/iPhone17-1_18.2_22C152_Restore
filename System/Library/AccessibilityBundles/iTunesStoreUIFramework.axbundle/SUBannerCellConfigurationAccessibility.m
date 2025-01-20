@interface SUBannerCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLanguage;
- (id)accessibilityTableViewCellText;
@end

@implementation SUBannerCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUBannerCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityTableViewCellText
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 hasSuffix:@"AppStore"];

  if (v4) {
    v5 = @"featured.app";
  }
  else {
    v5 = @"featured.album";
  }
  v6 = accessibilityLocalizedString(v5);

  return v6;
}

- (id)accessibilityLanguage
{
  return (id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_accessibilityContentLanguage"];
}

@end