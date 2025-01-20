@interface SSScreenshotsWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation SSScreenshotsWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSScreenshotsWindow";
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