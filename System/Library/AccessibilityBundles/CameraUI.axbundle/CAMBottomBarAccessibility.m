@interface CAMBottomBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation CAMBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMBottomBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  if (AXDeviceIsPad() & 1) != 0 || (AXDeviceIsTallPhoneIdiom()) {
    return 0;
  }
  if (!AXDeviceIsPhone()) {
    return 1;
  }
  v4 = [(CAMBottomBarAccessibility *)self _accessibilityWindow];
  v5 = [v4 window];
  v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  return (unint64_t)(v7 - 1) < 2;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end