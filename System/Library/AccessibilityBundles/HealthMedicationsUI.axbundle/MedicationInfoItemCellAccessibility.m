@interface MedicationInfoItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MedicationInfoItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationInfoItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthMedicationsUI.MedicationInfoItemCell" hasSwiftField:@"nameLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationInfoItemCell" hasSwiftField:@"strengthLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationInfoItemCell" hasSwiftField:@"ingredientsLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationInfoItemCell" hasSwiftField:@"medmojiView" withSwiftType:"MedicationView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MedicationInfoItemCellAccessibility *)self safeSwiftValueForKey:@"nameLabel"];
  v4 = [(MedicationInfoItemCellAccessibility *)self safeSwiftValueForKey:@"strengthLabel"];
  v7 = [(MedicationInfoItemCellAccessibility *)self safeSwiftValueForKey:@"ingredientsLabel"];
  v5 = __AXStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  v2 = [(MedicationInfoItemCellAccessibility *)self safeSwiftValueForKey:@"medmojiView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end