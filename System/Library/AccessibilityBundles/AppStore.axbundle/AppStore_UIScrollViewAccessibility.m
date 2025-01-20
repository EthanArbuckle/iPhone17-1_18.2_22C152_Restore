@interface AppStore_UIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation AppStore_UIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  v3 = [(AppStore_UIScrollViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXHorizontalShelfView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AppStore_UIScrollViewAccessibility;
  return [(AppStore_UIScrollViewAccessibility *)&v6 _accessibilityOnlyComparesByXAxis];
}

@end