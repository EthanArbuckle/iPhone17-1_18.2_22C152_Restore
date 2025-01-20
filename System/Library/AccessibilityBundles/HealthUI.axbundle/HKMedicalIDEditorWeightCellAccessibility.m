@interface HKMedicalIDEditorWeightCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_showPicker;
@end

@implementation HKMedicalIDEditorWeightCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorWeightCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMedicalIDEditorWeightCell" hasInstanceVariable:@"_picker" withType:"UIPickerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorWeightCell", @"_showPicker", "v", 0);
  [v3 validateClass:@"HKMedicalIDEditorWeightCell" isKindOfClass:@"HKMedicalIDEditorCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorCell", @"inputTextField", "@", 0);
}

- (void)_showPicker
{
  char v7 = 0;
  id v3 = [(HKMedicalIDEditorWeightCellAccessibility *)self safeValueForKey:@"inputTextField"];
  v4 = __UIAccessibilitySafeClass();

  [v4 setAccessibilityValueChangesAreReplacements:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HKMedicalIDEditorWeightCellAccessibility__showPicker__block_invoke;
  v6[3] = &unk_265125F38;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HKMedicalIDEditorWeightCellAccessibility__showPicker__block_invoke_2;
  v5[3] = &unk_265125F60;
  v5[4] = self;
  AXMoveFocusToPicker(v6, v5);
}

id __55__HKMedicalIDEditorWeightCellAccessibility__showPicker__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HKMedicalIDEditorWeightCellAccessibility;
  return objc_msgSendSuper2(&v2, sel__showPicker);
}

uint64_t __55__HKMedicalIDEditorWeightCellAccessibility__showPicker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeValueForKey:@"_picker"];
}

@end