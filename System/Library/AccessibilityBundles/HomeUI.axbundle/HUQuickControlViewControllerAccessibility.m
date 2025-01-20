@interface HUQuickControlViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlsContainerView;
- (id)accessibilityControlServiceName;
- (void)_accessibilityMoveToActiveControl;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HUQuickControlViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"activeControlView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFItem", @"latestResults", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFServiceNameComponents", @"serviceName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperViewAccessibility", @"_accessibilityFirstQuickControlElementForFocus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlColorViewAccessibility", @"_accessibilityFirstQuickControlElementForFocus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerViewController", @"controlContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"activeControlView", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlViewControllerAccessibility;
  [(HUQuickControlViewControllerAccessibility *)&v6 viewDidAppear:a3];
  v4 = [(HUQuickControlViewControllerAccessibility *)self _accessibilityControlsContainerView];
  v5 = [v4 safeValueForKey:@"activeControlView"];

  if ([v5 _accessibilityViewIsVisible]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v5);
  }
}

- (id)_accessibilityControlsContainerView
{
  v2 = [(HUQuickControlViewControllerAccessibility *)self safeValueForKey:@"parentViewController"];
  MEMORY[0x2456509F0](@"HUQuickControlContainerViewController");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"controlContainerView"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_accessibilityMoveToActiveControl
{
  v2 = [(HUQuickControlViewControllerAccessibility *)self _accessibilityControlsContainerView];
  id v3 = [v2 safeValueForKey:@"activeControlView"];

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  if (v5) {
    objc_super v6 = v5;
  }
  else {
    objc_super v6 = v4;
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v6);
}

uint64_t __78__HUQuickControlViewControllerAccessibility__accessibilityMoveToActiveControl__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _accessibilityFirstQuickControlElementForFocus];

  return MEMORY[0x270F9A758]();
}

- (id)accessibilityControlServiceName
{
  v2 = [(HUQuickControlViewControllerAccessibility *)self safeValueForKey:@"parentViewController"];
  id v3 = [v2 safeValueForKey:@"item"];

  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"latestResults"];
  id v5 = __UIAccessibilityCastAsClass();

  objc_super v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F47A20]];
  objc_opt_class();
  uint64_t v7 = [v6 safeValueForKey:@"serviceName"];
  v8 = __UIAccessibilityCastAsClass();

  return v8;
}

@end