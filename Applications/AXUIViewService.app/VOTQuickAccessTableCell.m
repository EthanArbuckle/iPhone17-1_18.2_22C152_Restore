@interface VOTQuickAccessTableCell
- (BOOL)_accessibilityShouldClearChildren;
- (VOTQuickAccessTableCellAccessibility)cellAccessibility;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setCellAccessibility:(id)a3;
@end

@implementation VOTQuickAccessTableCell

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
  v7.receiver = self;
  v7.super_class = (Class)VOTQuickAccessTableCell;
  unint64_t v3 = [(VOTQuickAccessTableCell *)&v7 accessibilityTraits];
  v4 = [(VOTQuickAccessTableCell *)self cellAccessibility];
  unint64_t v5 = (unint64_t)[v4 accessibilityTraits] | v3;

  return v5;
}

- (void)accessibilityDecrement
{
  id v2 = [(VOTQuickAccessTableCell *)self cellAccessibility];
  [v2 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v2 = [(VOTQuickAccessTableCell *)self cellAccessibility];
  [v2 accessibilityIncrement];
}

- (BOOL)_accessibilityShouldClearChildren
{
  id v2 = [(VOTQuickAccessTableCell *)self cellAccessibility];
  unsigned __int8 v3 = [v2 _accessibilityShouldClearChildren];

  return v3;
}

- (id)accessibilityCustomActions
{
  id v2 = [(VOTQuickAccessTableCell *)self cellAccessibility];
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