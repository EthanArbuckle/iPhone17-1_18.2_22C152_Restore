@interface TrainerFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4;
@end

@implementation TrainerFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.TrainerFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.TrainerFilterCell", @"accessibilityApplyState:disabled:", "v", "B", "B", 0);
  [v3 validateClass:@"SeymourUI.TrainerFilterCell" isKindOfClass:@"UICollectionViewCell"];
}

- (id)accessibilityLabel
{
  return (id)[(TrainerFilterCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TrainerFilterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TrainerFilterCellAccessibility *)&v3 accessibilityTraits];
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
  v11.super_class = (Class)TrainerFilterCellAccessibility;
  -[TrainerFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      unint64_t v7 = [(TrainerFilterCellAccessibility *)self accessibilityTraits];
      [(TrainerFilterCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF20] | v7];
    }
    else
    {
      [(TrainerFilterCellAccessibility *)self setAccessibilityTraits:[(TrainerFilterCellAccessibility *)self accessibilityTraits] & ~*MEMORY[0x263F1CF20]];
      if (v5)
      {
        unint64_t v8 = [(TrainerFilterCellAccessibility *)self accessibilityTraits];
        unint64_t v9 = *MEMORY[0x263F1CF38] | v8;
LABEL_8:
        [(TrainerFilterCellAccessibility *)self setAccessibilityTraits:v9];
        return;
      }
    }
    uint64_t v10 = *MEMORY[0x263F1CF38];
    unint64_t v9 = [(TrainerFilterCellAccessibility *)self accessibilityTraits] & ~v10;
    goto LABEL_8;
  }
}

@end