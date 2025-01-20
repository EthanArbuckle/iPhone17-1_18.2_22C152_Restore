@interface HUUIPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityScrollStatus;
@end

@implementation HUUIPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UINavigationBar" hasInstanceVariable:@"_visualProvider" withType:"_UINavigationBarVisualProvider"];
  [v3 validateClass:@"_UINavigationBarVisualProviderModernIOS" isKindOfClass:@"_UINavigationBarVisualProvider"];
  [v3 validateClass:@"_UINavigationBarVisualProviderModernIOS" hasInstanceVariable:@"_largeTitleView" withType:"_UINavigationBarLargeTitleView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UINavigationBarLargeTitleView", @"layout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UINavigationBarLargeTitleViewLayout", @"titleLabel", "@", 0);
}

- (id)_accessibilityScrollStatus
{
  char v13 = 0;
  objc_opt_class();
  id v3 = [(HUUIPageViewControllerAccessibility *)self viewControllers];
  v4 = [v3 firstObject];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 navigationBar];
  v7 = [v6 safeValueForKeyPath:@"_visualProvider._largeTitleView.layout.titleLabel"];

  v8 = [v7 accessibilityLabel];
  if ([v8 length])
  {
    uint64_t v9 = [v7 accessibilityLabel];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUUIPageViewControllerAccessibility;
    uint64_t v9 = [(HUUIPageViewControllerAccessibility *)&v12 _accessibilityScrollStatus];
  }
  v10 = (void *)v9;

  return v10;
}

@end