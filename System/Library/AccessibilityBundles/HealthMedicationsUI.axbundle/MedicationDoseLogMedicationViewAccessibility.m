@interface MedicationDoseLogMedicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axUpdateButtonTraits;
- (void)didTapRecord:(id)a3;
- (void)didTapSkip:(id)a3;
@end

@implementation MedicationDoseLogMedicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationDoseLogMedicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthMedicationsUI.MedicationDoseLogMedicationView" hasSwiftField:@"skippedButton" withSwiftType:"UIButton"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationDoseLogMedicationView" hasSwiftField:@"takenButton" withSwiftType:"UIButton"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationDoseLogMedicationView" hasSwiftField:@"viewModel" withSwiftType:"Optional<MedicationsDoseLogViewModel>"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationsDoseLogViewModel" hasSwiftField:@"status" withSwiftType:"HKMedicationDoseEventStatus"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthMedicationsUI.MedicationDoseLogMedicationView", @"didTapSkip:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthMedicationsUI.MedicationDoseLogMedicationView", @"didTapRecord:", "v", "@", 0);
}

- (void)didTapSkip:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MedicationDoseLogMedicationViewAccessibility;
  [(MedicationDoseLogMedicationViewAccessibility *)&v4 didTapSkip:a3];
  [(MedicationDoseLogMedicationViewAccessibility *)self _axUpdateButtonTraits];
}

- (void)didTapRecord:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MedicationDoseLogMedicationViewAccessibility;
  [(MedicationDoseLogMedicationViewAccessibility *)&v4 didTapRecord:a3];
  [(MedicationDoseLogMedicationViewAccessibility *)self _axUpdateButtonTraits];
}

- (void)_axUpdateButtonTraits
{
  id v11 = [(MedicationDoseLogMedicationViewAccessibility *)self safeSwiftValueForKey:@"skippedButton"];
  id v3 = [(MedicationDoseLogMedicationViewAccessibility *)self safeSwiftValueForKey:@"takenButton"];
  objc_super v4 = [(MedicationDoseLogMedicationViewAccessibility *)self safeSwiftValueForKey:@"viewModel"];
  v5 = [v4 safeSwiftValueForKey:@"status"];
  uint64_t v6 = _accessibilityConvertToStatus();

  if (v6 == 4)
  {
    uint64_t v10 = *MEMORY[0x263F1CEE8];
    [v11 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    uint64_t v7 = *MEMORY[0x263F1CF38] | v10;
  }
  else
  {
    if (v6 == 5)
    {
      uint64_t v7 = *MEMORY[0x263F1CEE8];
      uint64_t v8 = *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF38];
      v9 = v11;
    }
    else
    {
      uint64_t v7 = *MEMORY[0x263F1CEE8];
      v9 = v11;
      uint64_t v8 = *MEMORY[0x263F1CEE8];
    }
    [v9 setAccessibilityTraits:v8];
  }
  [v3 setAccessibilityTraits:v7];
}

@end