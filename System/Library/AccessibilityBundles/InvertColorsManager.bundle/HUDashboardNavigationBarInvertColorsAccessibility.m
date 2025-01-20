@interface HUDashboardNavigationBarInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation HUDashboardNavigationBarInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardNavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end