@interface NCExpandedPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NCExpandedPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCExpandedPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFTouchPassThroughView"];
  [v3 validateClass:@"NCExpandedPlatterView" hasInstanceVariable:@"_notificationContentView" withType:"NCNotificationSeamlessContentView"];
  [v3 validateClass:@"NCExpandedPlatterView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCExpandedPlatterViewController", @"delegate", "@", 0);
  [v3 validateProtocol:@"NCExpandedPlatterViewControllerDelegate" hasOptionalInstanceMethod:@"expandedPlatterViewController:requestsDismissalWithReason:userInfo:"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)NCExpandedPlatterViewAccessibility;
  [(NCExpandedPlatterViewAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NCExpandedPlatterViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  [v3 setAccessibilityViewIsModal:1];
  v4 = [(NCExpandedPlatterViewAccessibility *)self safeValueForKey:@"_notificationContentView"];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v16.receiver = self;
    v16.super_class = (Class)NCExpandedPlatterViewAccessibility;
    v6 = [(NCExpandedPlatterViewAccessibility *)&v16 accessibilityCustomActions];
    [v5 axSafelyAddObjectsFromArray:v6];

    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"dismiss");
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v13 = &unk_2651616F8;
    objc_copyWeak(&v14, &location);
    v9 = (void *)[v7 initWithName:v8 actionHandler:&v10];

    objc_msgSend(v5, "axSafelyAddObject:", v9, v10, v11, v12, v13);
    [v4 setAccessibilityCustomActions:v5];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

uint64_t __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"SBFTouchPassThroughView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __80__NCExpandedPlatterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = __UIAccessibilityCastAsClass();

  id v5 = [MEMORY[0x263F1CB68] viewControllerForView:v4];
  v6 = [v5 safeValueForKey:@"_delegate"];
  id v7 = objc_loadWeakRetained(v2);
  [v6 expandedPlatterViewController:v7 requestsDismissalWithReason:@"dismissalReasonHomeAction" userInfo:0];
}

@end