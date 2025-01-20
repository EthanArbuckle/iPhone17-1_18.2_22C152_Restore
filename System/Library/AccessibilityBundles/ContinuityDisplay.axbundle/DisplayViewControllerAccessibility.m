@interface DisplayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation DisplayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ContinuityDisplay.DisplayViewController";
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
  v5.super_class = (Class)DisplayViewControllerAccessibility;
  [(DisplayViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(DisplayViewControllerAccessibility *)self safeValueForKey:@"displayView"];
  v4 = accessibilityLocalizedString(@"display.view.label");
  [v3 setAccessibilityLabel:v4];

  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE0]];
}

@end