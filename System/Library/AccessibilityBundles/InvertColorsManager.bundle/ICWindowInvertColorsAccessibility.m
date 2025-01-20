@interface ICWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation ICWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ICWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 rootViewController];
  AXSafeClassFromString();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end