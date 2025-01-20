@interface _UIPageViewControllerContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
@end

@implementation _UIPageViewControllerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPageViewControllerContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPageViewControllerContentView", @"canBecomeFocused", "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)canBecomeFocused
{
  v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIPageViewControllerContentViewAccessibility;
  char v4 = [(_UIPageViewControllerContentViewAccessibility *)&v3 canBecomeFocused];
  if ([(_UIPageViewControllerContentViewAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])return 0; {
  else
  }
    return v4 & 1;
}

@end