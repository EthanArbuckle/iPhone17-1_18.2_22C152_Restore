@interface ModalityPickerItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4;
@end

@implementation ModalityPickerItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ModalityPickerItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ModalityPickerItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ModalityPickerItemCellAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ModalityPickerItemCellAccessibility;
  -[ModalityPickerItemCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      unint64_t v7 = [(ModalityPickerItemCellAccessibility *)self accessibilityTraits];
      [(ModalityPickerItemCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF20] | v7];
    }
    else
    {
      [(ModalityPickerItemCellAccessibility *)self setAccessibilityTraits:[(ModalityPickerItemCellAccessibility *)self accessibilityTraits] & ~*MEMORY[0x263F1CF20]];
      if (v5)
      {
        unint64_t v8 = [(ModalityPickerItemCellAccessibility *)self accessibilityTraits];
        unint64_t v9 = *MEMORY[0x263F1CF38] | v8;
LABEL_8:
        [(ModalityPickerItemCellAccessibility *)self setAccessibilityTraits:v9];
        return;
      }
    }
    uint64_t v10 = *MEMORY[0x263F1CF38];
    unint64_t v9 = [(ModalityPickerItemCellAccessibility *)self accessibilityTraits] & ~v10;
    goto LABEL_8;
  }
}

@end