@interface BNBannerSceneComponentProviderSecureWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation BNBannerSceneComponentProviderSecureWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_BNBannerSceneComponentProviderSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  return 0;
}

@end