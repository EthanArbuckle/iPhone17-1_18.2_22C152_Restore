@interface BroadwayActivationStartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BroadwayActivationStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BroadwayActivationStartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BroadwayActivationStartViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"BroadwayActivationStartViewController" hasInstanceVariable:@"_dismissButton" withType:"UIButton"];
  [v3 validateClass:@"BroadwayActivationStartViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationStartViewControllerAccessibility;
  [(BroadwayActivationStartViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(BroadwayActivationStartViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __69__BroadwayActivationStartViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_titleLabel"];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)BroadwayActivationStartViewControllerAccessibility;
  [(BroadwayActivationStartViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BroadwayActivationStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  objc_super v4 = accessibilityLocalizedString(@"dismiss.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(BroadwayActivationStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  [v5 _accessibilitySetUserTestingIsCancelButton:1];

  v6 = [(BroadwayActivationStartViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end