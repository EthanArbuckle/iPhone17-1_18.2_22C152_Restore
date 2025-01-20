@interface BroadwayActivationDoneViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BroadwayActivationDoneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BroadwayActivationDoneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BroadwayActivationDoneViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BroadwayActivationDoneViewController", @"viewWillAppear:", "v", "B", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationDoneViewControllerAccessibility;
  [(BroadwayActivationDoneViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(BroadwayActivationDoneViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __68__BroadwayActivationDoneViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_titleLabel"];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationDoneViewControllerAccessibility;
  [(BroadwayActivationDoneViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BroadwayActivationDoneViewControllerAccessibility *)self safeValueForKey:@"_cardNameLabel"];
  [v3 setIsAccessibilityElement:0];

  objc_super v4 = [(BroadwayActivationDoneViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end