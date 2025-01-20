@interface SAUIElementViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadLayoutInformation;
- (void)_axShiftFocusToElementViewForPowerAlerts;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SAUIElementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SAUIElementViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SAUIElementViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIElementViewController", @"_elementView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"layoutMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIElementView", @"elementViewProvider", "@", 0);
  [v3 validateProtocol:@"SAUIElementViewProviding" hasRequiredInstanceMethod:@"minimalView"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadLayoutInformation
{
  char v13 = 0;
  objc_opt_class();
  id v3 = [(SAUIElementViewControllerAccessibility *)self safeUIViewForKey:@"_elementView"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  v5 = [v4 safeValueForKey:@"elementViewProvider"];
  v6 = [v5 safeUIViewForKey:@"minimalView"];
  int v7 = [(SAUIElementViewControllerAccessibility *)self safeIntForKey:@"layoutMode"];
  if (v6) {
    BOOL v8 = v7 == 1;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    v9 = @"minimal.view";
  }
  else {
    v9 = @"regular.view";
  }
  [v4 setAccessibilityIdentifier:v9];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__SAUIElementViewControllerAccessibility__accessibilityLoadLayoutInformation__block_invoke;
  v11[3] = &unk_26515C248;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __77__SAUIElementViewControllerAccessibility__accessibilityLoadLayoutInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityPrefetchPropertiesIfNecessary];
}

- (void)_axShiftFocusToElementViewForPowerAlerts
{
}

void __82__SAUIElementViewControllerAccessibility__axShiftFocusToElementViewForPowerAlerts__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) safeUIViewForKey:@"_elementView"];
  id v3 = __UIAccessibilityCastAsSafeCategory();

  v4 = [v3 safeValueForKey:@"elementViewProvider"];
  MEMORY[0x245665890](@"SBPowerAlertElement");
  if (objc_opt_isKindOfClass()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SAUIElementViewControllerAccessibility;
  [(SAUIElementViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(SAUIElementViewControllerAccessibility *)self _accessibilityLoadLayoutInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SAUIElementViewControllerAccessibility;
  [(SAUIElementViewControllerAccessibility *)&v3 viewDidLoad];
  [(SAUIElementViewControllerAccessibility *)self _axShiftFocusToElementViewForPowerAlerts];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIElementViewControllerAccessibility;
  -[SAUIElementViewControllerAccessibility viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(SAUIElementViewControllerAccessibility *)self _axShiftFocusToElementViewForPowerAlerts];
}

@end