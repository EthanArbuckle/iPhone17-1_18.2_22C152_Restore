@interface CKNavbarCanvasViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)backButtonView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKNavbarCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNavbarCanvasViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavbarCanvasViewController", @"backButtonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavbarCanvasViewController", @"_buttonPressed:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKNavbarCanvasViewControllerAccessibility;
  [(CKNavbarCanvasViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKNavbarCanvasViewControllerAccessibility *)self safeValueForKey:@"detailsButton"];
  v4 = accessibilityLocalizedString(@"details.button");
  [v3 setAccessibilityLabel:v4];
}

- (id)backButtonView
{
  v10.receiver = self;
  v10.super_class = (Class)CKNavbarCanvasViewControllerAccessibility;
  id v3 = [(CKNavbarCanvasViewControllerAccessibility *)&v10 backButtonView];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke;
  v5[3] = &unk_265113570;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  [v3 _setAccessibilityActivateBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_copyWeak(&v4, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
  return 1;
}

void __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _buttonPressed:v2];
}

@end