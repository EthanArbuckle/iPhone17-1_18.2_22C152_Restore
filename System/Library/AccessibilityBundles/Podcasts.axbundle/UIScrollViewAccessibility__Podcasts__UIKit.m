@interface UIScrollViewAccessibility__Podcasts__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation UIScrollViewAccessibility__Podcasts__UIKit

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
  v3 = [(UIScrollViewAccessibility__Podcasts__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXHorizontalShelfView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewAccessibility__Podcasts__UIKit;
  return [(UIScrollViewAccessibility__Podcasts__UIKit *)&v6 _accessibilityOnlyComparesByXAxis];
}

@end