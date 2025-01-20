@interface PKNavigationDashboardPassViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation PKNavigationDashboardPassViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKNavigationDashboardPassViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKNavigationDashboardPassViewController" hasProperty:@"dashboardVC" withType:"@"];
  [v3 validateClass:@"PKDashboardPassViewController" isKindOfClass:@"UIViewController"];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(PKNavigationDashboardPassViewControllerAccessibility *)self safeValueForKey:@"_dashboardVC"];
  id v3 = v2;
  if (v2)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return v3 != 0;
}

void __82__PKNavigationDashboardPassViewControllerAccessibility_accessibilityPerformEscape__block_invoke()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

@end