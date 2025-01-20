@interface _UIInterfaceActionGroupHeaderScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldBeScannedIfAncestorCanScroll;
- (BOOL)isAccessibilityElement;
@end

@implementation _UIInterfaceActionGroupHeaderScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIInterfaceActionGroupHeaderScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  v5 = self;
  SEL v4 = a2;
  if (UIAccessibilityIsSwitchControlRunning()) {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIInterfaceActionGroupHeaderScrollViewAccessibility;
  return [(_UIInterfaceActionGroupHeaderScrollViewAccessibility *)&v3 isAccessibilityElement];
}

- (BOOL)_accessibilityShouldBeScannedIfAncestorCanScroll
{
  return 1;
}

@end