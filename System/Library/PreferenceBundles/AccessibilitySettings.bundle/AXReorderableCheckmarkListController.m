@interface AXReorderableCheckmarkListController
- (AXReorderableCheckmarkListController)init;
- (BOOL)allowItemToBeToggled:(id)a3;
- (BOOL)canItemBeToggled:(id)a3;
- (BOOL)hideListItem:(id)a3;
- (BOOL)isItemEnabled:(id)a3;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)allItems;
- (id)identifierForItem:(id)a3;
- (id)itemAfterTogglingEnabledState:(id)a3;
- (id)itemSpecifiers;
- (id)itemsFromPreferences;
- (id)languageForItem:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)titleForItem:(id)a3;
- (int64_t)indexOfSectionForItems;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_updateCell:(id)a3 forIndexPath:(id)a4;
- (void)clearItemCache;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateCellForItemAtIndex:(unint64_t)a3;
- (void)updateItemsInPreferences:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXReorderableCheckmarkListController

- (AXReorderableCheckmarkListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXReorderableCheckmarkListController;
  v2 = [(AXReorderableCheckmarkListController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(AXReorderableCheckmarkListController *)v2 itemsFromPreferences];
    v5 = (NSMutableArray *)[v4 mutableCopy];
    allItems = v3->_allItems;
    v3->_allItems = v5;
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AXReorderableCheckmarkListController;
  [(AXReorderableCheckmarkListController *)&v5 viewDidLoad];
  v3 = [(AXReorderableCheckmarkListController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  v4 = [(AXReorderableCheckmarkListController *)self table];
  [v4 setEditing:1 animated:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AXReorderableCheckmarkListController *)self itemSpecifiers];
    v6 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)clearItemCache
{
  self->_allItems = 0;
  _objc_release_x1();
}

- (id)allItems
{
  allItems = self->_allItems;
  if (!allItems)
  {
    v4 = [(AXReorderableCheckmarkListController *)self itemsFromPreferences];
    uint64_t v5 = (NSMutableArray *)[v4 mutableCopy];
    v6 = self->_allItems;
    self->_allItems = v5;

    allItems = self->_allItems;
  }

  return allItems;
}

- (id)itemSpecifiers
{
  id v19 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [(AXReorderableCheckmarkListController *)self allItems];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v22;
    uint64_t v20 = AXSSwitchControlMenuItemTypeKey;
    objc_super v8 = (void *)AXSSwitchControlMenuItemGesturesForceTouch;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v9);
        if (![(AXReorderableCheckmarkListController *)self hideListItem:v10])
        {
          v11 = [v10 objectForKeyedSubscript:v20];

          if (v11 != v8)
          {
            uint64_t v12 = [(AXReorderableCheckmarkListController *)self titleForItem:v10];
            goto LABEL_11;
          }
          if (AXForceTouchAvailableAndEnabled())
          {
            uint64_t v12 = settingsLocString(@"FORCE_TOUCH", @"Accessibility");
LABEL_11:
            v13 = (void *)v12;
            v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          }
          else
          {
            v14 = 0;
          }
          v15 = +[NSNumber numberWithUnsignedInteger:(char *)v9 + v6];
          [v14 setProperty:v15 forKey:@"AXReorderableItemIndex"];

          v16 = [(AXReorderableCheckmarkListController *)self identifierForItem:v10];
          [v14 setIdentifier:v16];

          if (v14) {
            [v19 addObject:v14];
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      id v17 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v5 = v17;
      v6 += (uint64_t)v9;
    }
    while (v17);
  }

  return v19;
}

- (BOOL)hideListItem:(id)a3
{
  return 0;
}

- (void)updateCellForItemAtIndex:(unint64_t)a3
{
  id v6 = +[NSIndexPath indexPathForRow:a3 inSection:[(AXReorderableCheckmarkListController *)self indexOfSectionForItems]];
  id v4 = [(AXReorderableCheckmarkListController *)self table];
  id v5 = [v4 cellForRowAtIndexPath:v6];

  [(AXReorderableCheckmarkListController *)self _updateCell:v5 forIndexPath:v6];
}

- (id)identifierForItem:(id)a3
{
  return 0;
}

- (BOOL)canItemBeToggled:(id)a3
{
  return 1;
}

- (id)languageForItem:(id)a3
{
  return 0;
}

- (int64_t)indexOfSectionForItems
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "section", a3);
  return v5 == (id)[(AXReorderableCheckmarkListController *)self indexOfSectionForItems];
}

- (void)_updateCell:(id)a3 forIndexPath:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [v6 section];
  if (v7 == (id)[(AXReorderableCheckmarkListController *)self indexOfSectionForItems])
  {
    if (_updateCell_forIndexPath__onceToken != -1) {
      dispatch_once(&_updateCell_forIndexPath__onceToken, &__block_literal_global_42);
    }
    objc_super v8 = [(AXReorderableCheckmarkListController *)self specifierAtIndexPath:v6];
    v9 = [v8 propertyForKey:@"AXReorderableItemIndex"];
    id v10 = [v9 unsignedIntegerValue];

    v11 = [(AXReorderableCheckmarkListController *)self allItems];
    id v12 = [v11 count];

    if (v10 >= v12) {
      _AXAssert();
    }
    v13 = [(AXReorderableCheckmarkListController *)self allItems];
    v14 = [v13 axSafeObjectAtIndex:v10];

    if ([(AXReorderableCheckmarkListController *)self isItemEnabled:v14])
    {
      uint64_t v15 = _updateCell_forIndexPath__CheckmarkCheckImage;
      v16 = [v26 imageView];
      [v16 setImage:v15];
      id v17 = &UIAccessibilityTraitSelected;
    }
    else
    {
      uint64_t v18 = _updateCell_forIndexPath__CheckmarkClearImage;
      v16 = [v26 imageView];
      [v16 setImage:v18];
      id v17 = &UIAccessibilityTraitNone;
    }

    [v26 setAccessibilityTraits:*v17];
    id v19 = [(AXReorderableCheckmarkListController *)self languageForItem:v14];
    if (v19) {
      [v26 setAccessibilityLanguage:v19];
    }
    BOOL v20 = [(AXReorderableCheckmarkListController *)self canItemBeToggled:v14];
    if (v20)
    {
      long long v21 = [v26 titleLabel];
      long long v22 = v21;
      uint64_t v23 = 1;
    }
    else
    {
      unint64_t v24 = (unint64_t)[v26 accessibilityTraits];
      [v26 setAccessibilityTraits:UIAccessibilityTraitNotEnabled | v24];
      long long v21 = [v26 titleLabel];
      long long v22 = v21;
      uint64_t v23 = 0;
    }
    [v21 setEnabled:v23];

    [v26 setUserInteractionEnabled:v20];
    [v26 setCellEnabled:v20];
    v25 = [v26 titleLabel];
    [v25 setNumberOfLines:0];
  }
}

void __65__AXReorderableCheckmarkListController__updateCell_forIndexPath___block_invoke(id a1)
{
  uint64_t v1 = +[UIImage systemImageNamed:@"checkmark"];
  v2 = (void *)_updateCell_forIndexPath__CheckmarkCheckImage;
  _updateCell_forIndexPath__CheckmarkCheckImage = v1;

  [(id)_updateCell_forIndexPath__CheckmarkCheckImage size];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)_updateCell_forIndexPath__CheckmarkClearImage;
  _updateCell_forIndexPath__CheckmarkClearImage = v10;

  UIGraphicsEndImageContext();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXReorderableCheckmarkListController;
  id v6 = a4;
  id v7 = [(AXReorderableCheckmarkListController *)&v9 tableView:a3 cellForRowAtIndexPath:v6];
  -[AXReorderableCheckmarkListController _updateCell:forIndexPath:](self, "_updateCell:forIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AXReorderableCheckmarkListController *)self indexOfSectionForItems];
  if ([v7 section] != v9 || (id v10 = objc_msgSend(v8, "section"), v11 = v8, v10 != v9)) {
    v11 = v7;
  }
  id v12 = v11;

  return v12;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = [(AXReorderableCheckmarkListController *)self indexOfSectionForItems];
  if ([v22 section] != v8 || objc_msgSend(v7, "section") != v8) {
    _AXAssert();
  }
  if ([v22 section] == v8 && objc_msgSend(v7, "section") == v8)
  {
    id v9 = [(AXReorderableCheckmarkListController *)self specifierAtIndexPath:v7];
    id v10 = [v9 propertyForKey:@"AXReorderableItemIndex"];
    id v11 = [v10 unsignedIntegerValue];

    id v12 = [(AXReorderableCheckmarkListController *)self specifierAtIndexPath:v22];
    CGSize v13 = [v12 propertyForKey:@"AXReorderableItemIndex"];
    id v14 = [v13 unsignedIntegerValue];

    if (v11 != v14)
    {
      uint64_t v15 = [(AXReorderableCheckmarkListController *)self allItems];
      id v16 = [v15 count];

      if (v14 >= v16) {
        _AXAssert();
      }
      id v17 = [(AXReorderableCheckmarkListController *)self allItems];
      uint64_t v18 = [v17 axSafeObjectAtIndex:v14];

      id v19 = [(AXReorderableCheckmarkListController *)self allItems];
      [v19 removeObjectAtIndex:v14];

      BOOL v20 = [(AXReorderableCheckmarkListController *)self allItems];
      [v20 insertObject:v18 atIndex:v11];

      long long v21 = [(AXReorderableCheckmarkListController *)self allItems];
      [(AXReorderableCheckmarkListController *)self updateItemsInPreferences:v21];

      [(AXReorderableCheckmarkListController *)self reloadSpecifiers];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)allowItemToBeToggled:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(AXReorderableCheckmarkListController *)self indexOfSectionForItems])
  {
    id v9 = [(AXReorderableCheckmarkListController *)self specifierAtIndexPath:v7];
    id v10 = [v9 propertyForKey:@"AXReorderableItemIndex"];
    id v11 = [v10 unsignedIntegerValue];

    id v12 = [(AXReorderableCheckmarkListController *)self allItems];
    CGSize v13 = [v12 objectAtIndex:v11];

    if ([(AXReorderableCheckmarkListController *)self allowItemToBeToggled:v13])
    {
      id v14 = [(AXReorderableCheckmarkListController *)self itemAfterTogglingEnabledState:v13];
      uint64_t v15 = [(AXReorderableCheckmarkListController *)self allItems];
      [v15 replaceObjectAtIndex:v11 withObject:v14];

      id v16 = [(AXReorderableCheckmarkListController *)self allItems];
      [(AXReorderableCheckmarkListController *)self updateItemsInPreferences:v16];

      id v17 = [v6 cellForRowAtIndexPath:v7];
      [(AXReorderableCheckmarkListController *)self _updateCell:v17 forIndexPath:v7];

      [v6 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)AXReorderableCheckmarkListController;
      [(AXReorderableCheckmarkListController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)AXReorderableCheckmarkListController;
    [(AXReorderableCheckmarkListController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void).cxx_destruct
{
}

- (id)itemsFromPreferences
{
  return 0;
}

- (void)updateItemsInPreferences:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)titleForItem:(id)a3
{
  return 0;
}

- (BOOL)isItemEnabled:(id)a3
{
  return 1;
}

- (id)itemAfterTogglingEnabledState:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  id v4 = v3;
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();

  return v4;
}

@end