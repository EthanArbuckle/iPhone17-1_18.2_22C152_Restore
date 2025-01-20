@interface TabSwitcherAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TabSwitcherAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabSwitcher";
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
  v4.receiver = self;
  v4.super_class = (Class)TabSwitcherAccessibility;
  [(TabSwitcherAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(TabSwitcherAccessibility *)self safeValueForKey:@"tabOverviewDisplayItem"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end