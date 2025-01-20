@interface AMSUIDynamicViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AMSUIDynamicViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMSUIDynamicViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIDynamicViewControllerAccessibility;
  [(AMSUIDynamicViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(AMSUIDynamicViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = [v3 safeValueForKey:@"rightBarButtonItem"];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_0];
}

id __85__AMSUIDynamicViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityLocalizedString(@"close.button");
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIDynamicViewControllerAccessibility;
  [(AMSUIDynamicViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(AMSUIDynamicViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end