@interface MedicationListItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MedicationListItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationListItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthMedicationsUI.MedicationListItemCell" hasSwiftField:@"primaryLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationListItemCell" hasSwiftField:@"itemsStackView" withSwiftType:"UIStackView"];
  [v3 validateClass:@"HealthMedicationsUI.MedicationListItemCell" hasSwiftField:@"pillImageView" withSwiftType:"MedicationView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  v4 = [(MedicationListItemCellAccessibility *)self safeUIViewForKey:@"itemsStackView"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [(MedicationListItemCellAccessibility *)self safeValueForKey:@"primaryLabel"];
  [v3 axSafelyAddObject:v6];

  v7 = UIAXStringForAllChildren();
  [v3 axSafelyAddObject:v7];

  v8 = [(MedicationListItemCellAccessibility *)self safeValueForKey:@"pillImageView"];
  [v3 axSafelyAddObject:v8];

  v9 = MEMORY[0x24564F350](v3);

  return v9;
}

@end