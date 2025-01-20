@interface UIStatusBarItemViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UIStatusBarItemViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  objc_opt_class();
  v3 = [(UIStatusBarItemViewInvertColorsAccessibility *)self safeValueForKey:@"foregroundStyle"];
  v4 = [v3 safeValueForKey:@"tintColor"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = +[UIColor whiteColor];
  LOBYTE(v4) = AXColorsProbablyEqual();

  return (char)v4;
}

@end