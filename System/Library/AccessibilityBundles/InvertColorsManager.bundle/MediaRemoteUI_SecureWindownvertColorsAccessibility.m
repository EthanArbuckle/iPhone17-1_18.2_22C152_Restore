@interface MediaRemoteUI_SecureWindownvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation MediaRemoteUI_SecureWindownvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaRemoteUI.SecureWindow";
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