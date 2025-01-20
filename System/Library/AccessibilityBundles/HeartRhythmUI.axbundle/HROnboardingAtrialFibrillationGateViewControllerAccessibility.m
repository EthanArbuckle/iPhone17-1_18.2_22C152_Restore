@interface HROnboardingAtrialFibrillationGateViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetupSelectionRow:(id)a3 expectedResult:(BOOL)a4;
@end

@implementation HROnboardingAtrialFibrillationGateViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HROnboardingAtrialFibrillationGateViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingAtrialFibrillationGateViewController", @"diagnosisYesRow", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingAtrialFibrillationGateViewController", @"diagnosisNoRow", "@", 0);
  [v3 validateClass:@"HROnboardingAtrialFibrillationGateViewController" hasInstanceVariable:@"_diagnosis" withType:"NSNumber"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingAtrialFibrillationGateViewControllerAccessibility;
  [(HROnboardingAtrialFibrillationGateViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HROnboardingAtrialFibrillationGateViewControllerAccessibility *)self safeUIViewForKey:@"diagnosisYesRow"];
  [(HROnboardingAtrialFibrillationGateViewControllerAccessibility *)self _axSetupSelectionRow:v3 expectedResult:1];

  v4 = [(HROnboardingAtrialFibrillationGateViewControllerAccessibility *)self safeUIViewForKey:@"diagnosisNoRow"];
  [(HROnboardingAtrialFibrillationGateViewControllerAccessibility *)self _axSetupSelectionRow:v4 expectedResult:0];
}

- (void)_axSetupSelectionRow:(id)a3 expectedResult:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    [v6 setIsAccessibilityElement:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke;
    v10[3] = &unk_265127200;
    objc_copyWeak(&v11, &from);
    [v6 _setAccessibilityLabelBlock:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke_2;
    v7[3] = &unk_265127228;
    objc_copyWeak(&v8, &location);
    BOOL v9 = a4;
    [v6 _setAccessibilityTraitsBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

id __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = UIAXStringForAllChildren();

  return v2;
}

uint64_t __101__HROnboardingAtrialFibrillationGateViewControllerAccessibility__axSetupSelectionRow_expectedResult___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"_diagnosis"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (v4 && *(unsigned __int8 *)(a1 + 40) == [v4 BOOLValue]) {
    v5 |= *MEMORY[0x263F1CF38];
  }

  return v5;
}

@end