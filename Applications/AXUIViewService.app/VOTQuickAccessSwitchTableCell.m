@interface VOTQuickAccessSwitchTableCell
- (BOOL)_accessibilityShouldClearChildren;
- (VOTQuickAccessTableCellAccessibility)cellAccessibility;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setCellAccessibility:(id)a3;
@end

@implementation VOTQuickAccessSwitchTableCell

- (VOTQuickAccessTableCellAccessibility)cellAccessibility
{
  cellAccessibility = self->_cellAccessibility;
  if (!cellAccessibility)
  {
    v4 = [[VOTQuickAccessTableCellAccessibility alloc] initWithWeakCell:self];
    v5 = self->_cellAccessibility;
    self->_cellAccessibility = v4;

    cellAccessibility = self->_cellAccessibility;
  }

  return cellAccessibility;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)VOTQuickAccessSwitchTableCell;
  unint64_t v3 = [(VOTQuickAccessSwitchTableCell *)&v8 accessibilityTraits];
  v4 = [(VOTQuickAccessSwitchTableCell *)self cellAccessibility];
  unint64_t v5 = (unint64_t)[v4 accessibilityTraits];
  UIAccessibilityTraits v6 = (v5 | v3) & ~UIAccessibilityTraitAdjustable;

  return v6;
}

- (void)accessibilityDecrement
{
  id v2 = [(VOTQuickAccessSwitchTableCell *)self cellAccessibility];
  [v2 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v2 = [(VOTQuickAccessSwitchTableCell *)self cellAccessibility];
  [v2 accessibilityIncrement];
}

- (BOOL)_accessibilityShouldClearChildren
{
  id v2 = [(VOTQuickAccessSwitchTableCell *)self cellAccessibility];
  unsigned __int8 v3 = [v2 _accessibilityShouldClearChildren];

  return v3;
}

- (id)accessibilityCustomActions
{
  id v2 = [(VOTQuickAccessSwitchTableCell *)self cellAccessibility];
  unsigned __int8 v3 = [v2 accessibilityCustomActions];

  return v3;
}

- (void)setCellAccessibility:(id)a3
{
}

- (void).cxx_destruct
{
}

@end