@interface CSDNDBedtimeGreetingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CSDNDBedtimeGreetingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSDNDBedtimeGreetingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSDNDBedtimeGreetingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSModalView", @"_secondaryActionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSDNDBedtimeGreetingViewController", @"handleSecondaryActionForView:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CSDNDBedtimeGreetingViewControllerAccessibility;
  [(CSDNDBedtimeGreetingViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CSDNDBedtimeGreetingViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = [v3 safeValueForKey:@"_secondaryActionButton"];
  objc_initWeak(&location, v3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_26511B748;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityActivateBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 handleSecondaryActionForView:WeakRetained];
}

@end