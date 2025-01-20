@interface MedicationCategoryTipCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axTipCellButtons;
- (id)_axTipMedicationViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MedicationCategoryTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationCategoryTipCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthMedicationsUI.MedicationCategoryTipCell" hasSwiftField:@"item" withSwiftType:"Optional<SectionedDataSourceItem>"];
  [v3 validateSwiftStruct:@"HealthMedicationsUI.MedicationsCategoryTipItem" hasSwiftField:@"titleText" withSwiftType:"String"];
  [v3 validateSwiftStruct:@"HealthMedicationsUI.MedicationsCategoryTipItem" hasSwiftField:@"bodyText" withSwiftType:"String"];
  [v3 validateClass:@"HealthMedicationsExperience.MedicationView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MedicationCategoryTipCellAccessibility *)self safeSwiftValueForKey:@"item"];
  id v3 = [v2 safeSwiftValueForKey:@"titleText"];
  v6 = [v2 safeSwiftValueForKey:@"bodyText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(MedicationCategoryTipCellAccessibility *)self _axTipMedicationViews];
  id v3 = UIAXStringForAllChildren();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MedicationCategoryTipCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MedicationCategoryTipCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_axTipCellButtons
{
  return (id)[(MedicationCategoryTipCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
}

uint64_t __59__MedicationCategoryTipCellAccessibility__axTipCellButtons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 accessibilityElementsHidden] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_axTipMedicationViews
{
  return (id)[(MedicationCategoryTipCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_295];
}

uint64_t __63__MedicationCategoryTipCellAccessibility__axTipMedicationViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Healthmedicati_8.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end