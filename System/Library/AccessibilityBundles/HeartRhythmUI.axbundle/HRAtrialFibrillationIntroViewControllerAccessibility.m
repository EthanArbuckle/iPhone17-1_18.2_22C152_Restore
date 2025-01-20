@interface HRAtrialFibrillationIntroViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setUpUI;
@end

@implementation HRAtrialFibrillationIntroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HRAtrialFibrillationIntroViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRAtrialFibrillationIntroViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRAtrialFibrillationIntroViewController", @"setUpUI", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)HRAtrialFibrillationIntroViewControllerAccessibility;
  [(HRAtrialFibrillationIntroViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(HRAtrialFibrillationIntroViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
}

- (void)setUpUI
{
  v3.receiver = self;
  v3.super_class = (Class)HRAtrialFibrillationIntroViewControllerAccessibility;
  [(HRAtrialFibrillationIntroViewControllerAccessibility *)&v3 setUpUI];
  [(HRAtrialFibrillationIntroViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end