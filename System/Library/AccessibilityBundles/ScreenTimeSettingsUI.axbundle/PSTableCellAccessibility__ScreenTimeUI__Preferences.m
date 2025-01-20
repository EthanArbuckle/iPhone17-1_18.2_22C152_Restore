@interface PSTableCellAccessibility__ScreenTimeUI__Preferences
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsAlwaysAllowCell;
- (BOOL)_accessibilityIsSTUIExpandable;
- (BOOL)_accessibilityIsSTUIExpanded;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (id)_axSpecifier;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PSTableCellAccessibility__ScreenTimeUI__Preferences

+ (id)safeCategoryTargetClassName
{
  return @"PSTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityCellEditingControl", "@", 0);
  [v3 validateClass:@"PSIconMarginTableCell" isKindOfClass:@"PSTableCell"];
}

- (BOOL)_accessibilityIsAlwaysAllowCell
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 specifier];
  v4 = [v3 accessibilityIdentification];
  char v5 = [v4 isEqualToString:@"AXAlwaysAllowSpecifierIdentification"];

  return v5;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsAlwaysAllowCell])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  return [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v4 _accessibilitySupportsActivateAction];
}

- (BOOL)accessibilityActivate
{
  if (![(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsAlwaysAllowCell])goto LABEL_16; {
  LOBYTE(v35) = 0;
  }
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 editingStyle];
  if (v4 == 1)
  {
    LOBYTE(v35) = 0;
    objc_opt_class();
    v10 = [v3 _tableView];
    __UIAccessibilityCastAsClass();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    v11 = [v7 _swipeActionController];
    if ([v7 conformsToProtocol:&unk_26F7B0560])
    {
      v12 = [v3 _accessibilityIndexPath];
      if (v12)
      {
        v13 = [v7 swipeActionController:v11 trailingSwipeConfigurationForItemAtIndexPath:v12];
        v14 = [v13 actions];
        if ([v14 count] == 1)
        {
          v15 = [v13 actions];
          v16 = [v15 objectAtIndexedSubscript:0];
          uint64_t v17 = [v16 style];

          if (v17 == 1)
          {
            v18 = [v13 actions];
            v19 = [v18 objectAtIndexedSubscript:0];

            uint64_t v35 = 0;
            v36 = &v35;
            uint64_t v37 = 0x2020000000;
            char v38 = 0;
            uint64_t v22 = MEMORY[0x263EF8330];
            uint64_t v23 = 3221225472;
            v24 = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_2;
            v25 = &unk_26514C320;
            id v26 = v19;
            id v27 = v3;
            v28 = &v35;
            AXPerformSafeBlock();
            int v8 = *((unsigned __int8 *)v36 + 24);

            _Block_object_dispose(&v35, 8);
            goto LABEL_5;
          }
        }
        else
        {
        }
      }
    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
LABEL_15:

LABEL_16:
    v21.receiver = self;
    v21.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    return [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v21 accessibilityActivate];
  }
  objc_opt_class();
  char v5 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self safeValueForKey:@"_accessibilityCellEditingControl"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke;
  v32 = &unk_26514C2D0;
  id v7 = v6;
  id v33 = v7;
  v34 = &v35;
  AXPerformSafeBlock();
  int v8 = *((unsigned __int8 *)v36 + 24);

  _Block_object_dispose(&v35, 8);
LABEL_5:

  BOOL v9 = v8 != 0;
  return v9;
}

- (id)_privateAccessibilityCustomActions
{
  if ([(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsAlwaysAllowCell])
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    id v3 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v5 _privateAccessibilityCustomActions];
  }

  return v3;
}

- (id)accessibilityHint
{
  if (![(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsAlwaysAllowCell])goto LABEL_5; {
  char v9 = 0;
  }
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 editingStyle];

  if (v4 == 1)
  {
    objc_super v5 = @"remove.always.allowed.hint";
    goto LABEL_7;
  }
  if (v4 != 2)
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    v6 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v8 accessibilityHint];
    goto LABEL_8;
  }
  objc_super v5 = @"add.always.allowed.hint";
LABEL_7:
  v6 = accessibilityLocalizedString(v5);
LABEL_8:

  return v6;
}

- (id)_axSpecifier
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 specifier];

  objc_opt_class();
  uint64_t v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (BOOL)_accessibilityIsSTUIExpanded
{
  v2 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _axSpecifier];
  char v3 = [v2 _accessibilityIsExpandedSTUICell];

  return v3;
}

- (BOOL)_accessibilityIsSTUIExpandable
{
  v2 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _axSpecifier];
  char v3 = [v2 _accessibilityIsExpandableSTUICell];

  return v3;
}

- (id)accessibilityValue
{
  if ([(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsSTUIExpanded])
  {
    char v3 = @"time.selection.cell.expanded";
LABEL_5:
    uint64_t v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsSTUIExpandable])
  {
    char v3 = @"time.selection.cell.collapsed";
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  objc_super v5 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v8 accessibilityValue];
  v6 = __AXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell")&& (v11 = 0, objc_opt_class(), __UIAccessibilityCastAsClass(), char v3 = objc_claimAutoreleasedReturnValue(), v4 = [v3 editingStyle], v3, v4))
  {
    v10.receiver = self;
    v10.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    return *MEMORY[0x263F1CEE8] | [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v10 accessibilityTraits];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    unint64_t v6 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)&v9 accessibilityTraits];
    BOOL v7 = [(PSTableCellAccessibility__ScreenTimeUI__Preferences *)self _accessibilityIsSTUIExpandable];
    uint64_t v8 = *MEMORY[0x263F1CEE8];
    if (!v7) {
      uint64_t v8 = 0;
    }
    return v8 | v6;
  }
}

@end