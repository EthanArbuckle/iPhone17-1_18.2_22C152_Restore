@interface UIWindowCompassAppAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsIsDarkWindow;
@end

@implementation UIWindowCompassAppAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];
  NSClassFromString(@"CompassAppDelegate");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end