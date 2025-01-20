@interface StepperViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupStepperButtons;
- (void)loadView;
@end

@implementation StepperViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StepperViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"StepperViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StepperViewController", @"_buttonForStepperButton:", "@", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)StepperViewControllerAccessibility;
  [(StepperViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(StepperViewControllerAccessibility *)self _axMarkupStepperButtons];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)StepperViewControllerAccessibility;
  [(StepperViewControllerAccessibility *)&v3 loadView];
  [(StepperViewControllerAccessibility *)self _axMarkupStepperButtons];
}

- (void)_axMarkupStepperButtons
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  id v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  v8 = self;
  AXPerformSafeBlock();
  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  v5 = accessibilityLocalizedString(@"decrease.font.size");
  objc_msgSend(v3, "setAccessibilityLabel:", v5, v7, 3221225472, __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke_2, &unk_265137020, v8, &v11, v9, 3221225472, __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke, &unk_265137020, self, &v11);

  v6 = accessibilityLocalizedString(@"increase.font.size");
  [v4 setAccessibilityLabel:v6];
}

uint64_t __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _buttonForStepperButton:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __61__StepperViewControllerAccessibility__axMarkupStepperButtons__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _buttonForStepperButton:0];

  return MEMORY[0x270F9A758]();
}

@end