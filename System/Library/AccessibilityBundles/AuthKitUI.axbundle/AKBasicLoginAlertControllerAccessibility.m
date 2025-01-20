@interface AKBasicLoginAlertControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetAlertIdentifier;
- (void)jiggleAView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AKBasicLoginAlertControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKBasicLoginAlertController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AKBasicLoginAlertController" isKindOfClass:@"UIAlertController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKBasicLoginAlertController", @"jiggleAView", "v", 0);
}

- (void)_accessibilitySetAlertIdentifier
{
  uint64_t v2 = MEMORY[0x245642920](@"_UIAlertControllerView", a2);
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];
  v5 = [v4 _accessibilityViewAncestorIsKindOf:v2];

  [v5 setAccessibilityIdentifier:@"AuthKit Login"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  [(AKBasicLoginAlertControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(AKBasicLoginAlertControllerAccessibility *)self _accessibilitySetAlertIdentifier];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  [(AKBasicLoginAlertControllerAccessibility *)&v4 viewDidAppear:a3];
  [(AKBasicLoginAlertControllerAccessibility *)self _accessibilitySetAlertIdentifier];
}

- (void)jiggleAView
{
  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginAlertControllerAccessibility;
  [(AKBasicLoginAlertControllerAccessibility *)&v4 jiggleAView];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  objc_super v3 = accessibilityLocalizedString(@"incorrect.password");
  UIAccessibilityPostNotification(v2, v3);
}

@end