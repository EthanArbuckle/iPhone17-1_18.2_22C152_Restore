@interface HUGridCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsActiveGridCell;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupportGesturesAttributes;
- (id)_axServiceStateString;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axOpenQuickControls;
@end

@implementation HUGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCell", @"primaryState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCell", @"item", "@", 0);
  [v3 validateClass:@"HUGridCell" hasInstanceVariable:@"_rearranging" withType:"BOOL"];
  [v3 validateClass:@"HUGridStatusCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"HUGridCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"HFAbstractControlStatusItem"];
  [v3 validateClass:@"HUGridServicePlaceholderCell"];
  [v3 validateClass:@"HUGridHomeCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridCellAccessibility;
  v2 = [(HUGridCellAccessibility *)&v7 accessibilityLabel];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    UIAXStringForAllChildren();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityValue
{
  if ([(HUGridCellAccessibility *)self _axIsActiveGridCell])
  {
    id v3 = [(HUGridCellAccessibility *)self _axServiceStateString];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HUGridCellAccessibility;
    id v3 = [(HUGridCellAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (id)_axServiceStateString
{
  uint64_t v2 = [(HUGridCellAccessibility *)self safeUnsignedIntegerForKey:@"primaryState"];
  if (v2 == 1)
  {
    id v3 = @"service.cell.state.off";
    goto LABEL_5;
  }
  if (v2 == 2)
  {
    id v3 = @"service.cell.state.on";
LABEL_5:
    id v4 = accessibilityHomeUILocalizedString(v3);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)accessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  if ([(HUGridCellAccessibility *)self _axIsActiveGridCell])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    id v4 = accessibilityHomeUILocalizedString(@"grid.cell.open.controls");
    objc_super v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axOpenQuickControls];

    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HUGridCellAccessibility;
    v6 = [(HUGridCellAccessibility *)&v8 accessibilityCustomActions];
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridCellAccessibility;
  unint64_t v3 = [(HUGridCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(HUGridCellAccessibility *)self safeBoolForKey:@"_rearranging"];
  uint64_t v5 = *MEMORY[0x263F81398];
  if (!v4) {
    uint64_t v5 = *MEMORY[0x263F1CEE8];
  }
  return v5 | v3;
}

- (id)accessibilityHint
{
  if ([(HUGridCellAccessibility *)self safeBoolForKey:@"_rearranging"])
  {
    unint64_t v3 = accessibilityHomeUILocalizedString(@"grid.cell.reorder.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HUGridCellAccessibility;
    unint64_t v3 = [(HUGridCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (void)_axOpenQuickControls
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:AXOpenControlsNotification object:self];
}

- (id)_accessibilitySupportGesturesAttributes
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = @"AXSupportedGestureTypeKey";
  v5[1] = @"AXOrbGestureMode";
  v6[0] = &unk_26F6D2A08;
  v6[1] = &unk_26F6D2A20;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v3;
}

- (BOOL)_axIsActiveGridCell
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  int v4 = [v3 contentView];
  objc_super v5 = [v4 gestureRecognizers];
  int v6 = objc_msgSend(v5, "ax_containsObjectUsingBlock:", &__block_literal_global_6);

  MEMORY[0x2456509F0](@"HUGridStatusCell");
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [(HUGridCellAccessibility *)self safeValueForKey:@"item"];
    MEMORY[0x2456509F0](@"HFAbstractControlStatusItem");
    char isKindOfClass = objc_opt_isKindOfClass();

    char v9 = isKindOfClass & v6;
  }
  else
  {
    MEMORY[0x2456509F0](@"HUGridServicePlaceholderCell");
    char v10 = objc_opt_isKindOfClass();
    MEMORY[0x2456509F0](@"HUGridHomeCell");
    char v11 = objc_opt_isKindOfClass();
    if (v6) {
      char v9 = (v10 | v11) ^ 1;
    }
    else {
      char v9 = 0;
    }
  }
  return v9 & 1;
}

uint64_t __46__HUGridCellAccessibility__axIsActiveGridCell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end