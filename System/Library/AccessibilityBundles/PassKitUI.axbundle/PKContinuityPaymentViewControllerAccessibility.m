@interface PKContinuityPaymentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKContinuityPaymentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKContinuityPaymentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKContinuityPaymentViewController", @"loadView", "v", 0);
  [v3 validateClass:@"PKContinuityPaymentViewController" hasInstanceVariable:@"_priceView" withType:"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  [(PKContinuityPaymentViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKContinuityPaymentViewControllerAccessibility *)self safeValueForKey:@"_priceView"];
  [v3 setAccessibilityIdentifier:kAXPriceViewIdentifier];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  [(PKContinuityPaymentViewControllerAccessibility *)&v3 loadView];
  [(PKContinuityPaymentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  [(PKContinuityPaymentViewControllerAccessibility *)&v3 viewDidAppear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__PKContinuityPaymentViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
  UIAccessibilityNotifications v2 = *MEMORY[0x263F812F8];
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"_priceView"];
  UIAccessibilityPostNotification(v2, v3);
}

@end