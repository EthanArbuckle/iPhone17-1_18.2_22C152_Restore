@interface EKUIAvailabilityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetup;
- (void)layout;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EKUIAvailabilityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIAvailabilityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKUIAvailabilityViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIAvailabilityViewController", @"freeSpanViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKUIAvailabilityViewController", @"participantList", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  [(EKUIAvailabilityViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EKUIAvailabilityViewControllerAccessibility *)self _accessibilitySetup];
}

- (void)_accessibilitySetup
{
  char v6 = 0;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__EKUIAvailabilityViewControllerAccessibility__accessibilitySetup__block_invoke;
  v5[3] = &unk_26511E320;
  v5[4] = self;
  [v4 _setAccessibilityElementsBlock:v5];
}

id __66__EKUIAvailabilityViewControllerAccessibility__accessibilitySetup__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeArrayForKey:@"freeSpanViews"];
  objc_super v3 = (void *)[v2 mutableCopy];

  v4 = [*(id *)(a1 + 32) safeValueForKey:@"participantList"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  [(EKUIAvailabilityViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(EKUIAvailabilityViewControllerAccessibility *)self _accessibilitySetup];
}

- (void)layout
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  [(EKUIAvailabilityViewControllerAccessibility *)&v5 layout];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  objc_super v4 = [(EKUIAvailabilityViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  UIAccessibilityPostNotification(v3, v4);
}

@end