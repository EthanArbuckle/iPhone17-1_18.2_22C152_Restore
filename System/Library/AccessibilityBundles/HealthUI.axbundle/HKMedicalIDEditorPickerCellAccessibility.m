@interface HKMedicalIDEditorPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (void)_showPicker;
@end

@implementation HKMedicalIDEditorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorPickerCell", @"_showPicker", "v", 0);
  [v3 validateClass:@"HKMedicalIDEditorPickerCell" conformsToProtocol:@"UIPickerViewDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorPickerCell", @"pickerView: titleForRow: forComponent:", "@", "@", "q", "q", 0);
  [v3 validateClass:@"HKMedicalIDEditorPickerCell" hasInstanceVariable:@"_picker" withType:"UIPickerView"];
  [v3 validateClass:@"HKMedicalIDEditorPickerCell" isKindOfClass:@"HKMedicalIDEditorCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorCell", @"inputTextField", "@", 0);
}

- (void)_showPicker
{
  char v7 = 0;
  id v3 = [(HKMedicalIDEditorPickerCellAccessibility *)self safeValueForKey:@"inputTextField"];
  v4 = __UIAccessibilitySafeClass();

  [v4 setAccessibilityValueChangesAreReplacements:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke;
  v6[3] = &unk_265125F38;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke_2;
  v5[3] = &unk_265125F60;
  v5[4] = self;
  AXMoveFocusToPicker(v6, v5);
}

id __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HKMedicalIDEditorPickerCellAccessibility;
  return objc_msgSendSuper2(&v2, sel__showPicker);
}

uint64_t __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeValueForKey:@"_picker"];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v6 = a3;
  AXPerformSafeBlock();
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  id v8 = [(HKMedicalIDEditorPickerCellAccessibility *)self safeValueForKey:@"_picker"];

  if (v8 == v6)
  {
    v9 = AXBloodTypeStringFromString(v7, v7);
    [v7 setAccessibilityLabel:v9];
  }

  return v7;
}

void __80__HKMedicalIDEditorPickerCellAccessibility_pickerView_titleForRow_forComponent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  v8.receiver = *(id *)(a1 + 40);
  v8.super_class = (Class)HKMedicalIDEditorPickerCellAccessibility;
  uint64_t v5 = objc_msgSendSuper2(&v8, sel_pickerView_titleForRow_forComponent_, v2, v3, v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end