@interface VOTQuickAccessTableCellAccessibility
- (BOOL)_accessibilityShouldClearChildren;
- (PSTableCell)cell;
- (VOTQuickAccessTableCellAccessibility)initWithWeakCell:(id)a3;
- (id)_settingsItem;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setCell:(id)a3;
@end

@implementation VOTQuickAccessTableCellAccessibility

- (VOTQuickAccessTableCellAccessibility)initWithWeakCell:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VOTQuickAccessTableCellAccessibility;
  v5 = [(VOTQuickAccessTableCellAccessibility *)&v8 init];
  v6 = v5;
  if (v5) {
    [(VOTQuickAccessTableCellAccessibility *)v5 setCell:v4];
  }

  return v6;
}

- (id)_settingsItem
{
  v2 = [(VOTQuickAccessTableCellAccessibility *)self cell];
  v3 = [v2 specifier];

  id v4 = [v3 propertyForKey:@"VOSSettingsItem"];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityDecrement
{
  v3 = [(VOTQuickAccessTableCellAccessibility *)self cell];
  id v7 = [v3 specifier];

  id v4 = +[VOSSettingsHelper sharedInstance];
  v5 = [(VOTQuickAccessTableCellAccessibility *)self _settingsItem];
  [v4 setNextValueForItem:v5 inDirection:0];

  v6 = [(VOTQuickAccessTableCellAccessibility *)self cell];
  [v6 reloadWithSpecifier:v7 animated:0];
}

- (void)accessibilityIncrement
{
  v3 = [(VOTQuickAccessTableCellAccessibility *)self cell];
  id v7 = [v3 specifier];

  id v4 = +[VOSSettingsHelper sharedInstance];
  v5 = [(VOTQuickAccessTableCellAccessibility *)self _settingsItem];
  [v4 setNextValueForItem:v5 inDirection:1];

  v6 = [(VOTQuickAccessTableCellAccessibility *)self cell];
  [v6 reloadWithSpecifier:v7 animated:0];
}

- (BOOL)_accessibilityShouldClearChildren
{
  return 0;
}

- (PSTableCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);

  return (PSTableCell *)WeakRetained;
}

- (void)setCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end