@interface HKMedicalIDEditorHeightCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_showPicker;
@end

@implementation HKMedicalIDEditorHeightCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorHeightCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMedicalIDEditorHeightCell" hasInstanceVariable:@"_picker" withType:"UIPickerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorHeightCell", @"_showPicker", "v", 0);
  [v3 validateClass:@"HKMedicalIDEditorHeightCell" isKindOfClass:@"HKMedicalIDEditorCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorCell", @"inputTextField", "@", 0);
}

- (void)_showPicker
{
  char v7 = 0;
  id v3 = [(HKMedicalIDEditorHeightCellAccessibility *)self safeValueForKey:@"inputTextField"];
  v4 = __UIAccessibilitySafeClass();

  [v4 setAccessibilityValueChangesAreReplacements:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke;
  v6[3] = &unk_265125F38;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke_2;
  v5[3] = &unk_265125F60;
  v5[4] = self;
  AXMoveFocusToPicker(v6, v5);
}

id __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HKMedicalIDEditorHeightCellAccessibility;
  return objc_msgSendSuper2(&v2, sel__showPicker);
}

uint64_t __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeValueForKey:@"_picker"];
}

@end