@interface HOTitleDescriptionAlertActionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HOTitleDescriptionAlertActionViewControllerAccessibility)initWithTitle:(id)a3 titleColor:(id)a4 description:(id)a5 descriptionColor:(id)a6;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HOTitleDescriptionAlertActionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HOTitleDescriptionAlertActionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HOTitleDescriptionAlertActionViewController" hasInstanceVariable:@"_titleDescriptionView" withType:"HOTitleDescriptionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HOTitleDescriptionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HOTitleDescriptionView", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HOTitleDescriptionAlertActionViewController", @"initWithTitle:titleColor:description:descriptionColor:", "@", "@", "@", "@", "@", 0);
}

- (HOTitleDescriptionAlertActionViewControllerAccessibility)initWithTitle:(id)a3 titleColor:(id)a4 description:(id)a5 descriptionColor:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)HOTitleDescriptionAlertActionViewControllerAccessibility;
  v6 = [(HOTitleDescriptionAlertActionViewControllerAccessibility *)&v9 initWithTitle:a3 titleColor:a4 description:a5 descriptionColor:a6];
  v7 = v6;
  if (v6) {
    [(HOTitleDescriptionAlertActionViewControllerAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)HOTitleDescriptionAlertActionViewControllerAccessibility;
  [(HOTitleDescriptionAlertActionViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HOTitleDescriptionAlertActionViewControllerAccessibility *)self safeValueForKey:@"_titleDescriptionView"];
  [v3 setIsAccessibilityElement:1];
  v4 = [v3 safeValueForKey:@"titleLabel"];
  v5 = [v3 safeValueForKey:@"descriptionLabel"];
  v6 = __AXStringForVariables();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, @"__AXStringForVariablesSentinel");

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end