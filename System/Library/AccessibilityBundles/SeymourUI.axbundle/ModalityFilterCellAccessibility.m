@interface ModalityFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4;
@end

@implementation ModalityFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ModalityFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.ModalityFilterCell", @"accessibilityApplyState:disabled:", "v", "B", "B", 0);
  [v3 validateClass:@"SeymourUI.ModalityFilterCell" isKindOfClass:@"UICollectionViewCell"];
}

- (id)accessibilityLabel
{
  return (id)[(ModalityFilterCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ModalityFilterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ModalityFilterCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ModalityFilterCellAccessibility;
  -[ModalityFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      unint64_t v7 = [(ModalityFilterCellAccessibility *)self accessibilityTraits];
      [(ModalityFilterCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF20] | v7];
    }
    else
    {
      [(ModalityFilterCellAccessibility *)self setAccessibilityTraits:[(ModalityFilterCellAccessibility *)self accessibilityTraits] & ~*MEMORY[0x263F1CF20]];
      if (v5)
      {
        unint64_t v8 = [(ModalityFilterCellAccessibility *)self accessibilityTraits];
        unint64_t v9 = *MEMORY[0x263F1CF38] | v8;
LABEL_8:
        [(ModalityFilterCellAccessibility *)self setAccessibilityTraits:v9];
        return;
      }
    }
    uint64_t v10 = *MEMORY[0x263F1CF38];
    unint64_t v9 = [(ModalityFilterCellAccessibility *)self accessibilityTraits] & ~v10;
    goto LABEL_8;
  }
}

@end