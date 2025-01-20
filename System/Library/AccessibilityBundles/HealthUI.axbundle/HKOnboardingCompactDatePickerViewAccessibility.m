@interface HKOnboardingCompactDatePickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setUpInitialLabel:(id)a3;
@end

@implementation HKOnboardingCompactDatePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKOnboardingCompactDatePickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKOnboardingCompactDatePickerView" hasInstanceVariable:@"_initialTextLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKOnboardingCompactDatePickerView", @"_setUpInitialLabel:", "v", "@", 0);
}

- (void)_setUpInitialLabel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKOnboardingCompactDatePickerViewAccessibility;
  [(HKOnboardingCompactDatePickerViewAccessibility *)&v10 _setUpInitialLabel:v4];
  LOBYTE(location) = 0;
  objc_opt_class();
  v5 = [(HKOnboardingCompactDatePickerViewAccessibility *)self safeUIViewForKey:@"_initialTextLabel"];
  v6 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HKOnboardingCompactDatePickerViewAccessibility__setUpInitialLabel___block_invoke;
  v7[3] = &unk_265125EC0;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityFrameBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

double __69__HKOnboardingCompactDatePickerViewAccessibility__setUpInitialLabel___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 bounds];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained bounds];
  objc_msgSend(v2, "sizeThatFits:", v4, v6);

  id v7 = objc_loadWeakRetained(v1);
  [v7 bounds];

  id v8 = objc_loadWeakRetained(v1);
  UIAccessibilityFrameForBounds();
  double v10 = v9;

  return v10;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)HKOnboardingCompactDatePickerViewAccessibility;
  [(HKOnboardingCompactDatePickerViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

@end