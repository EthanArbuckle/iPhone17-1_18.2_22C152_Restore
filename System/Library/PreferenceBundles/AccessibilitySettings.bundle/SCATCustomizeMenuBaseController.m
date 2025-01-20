@interface SCATCustomizeMenuBaseController
- (BOOL)_toggleShouldEnableAllMenuItems;
- (BOOL)isItemEnabled:(id)a3;
- (NSMutableDictionary)hiddenIndexesToDictionaries;
- (id)_nameForToggle;
- (id)filterAndTrackMenuItemsMatchingBlock:(id)a3 allItems:(id)a4;
- (id)itemAfterTogglingEnabledState:(id)a3;
- (id)menuItemSpecifiersIncludingToggleButton;
- (id)nameForHideToggle;
- (id)nameForShowToggle;
- (id)restorePreviouslyFilteredItemsToItems:(id)a3;
- (id)specifiers;
- (id)titleForItem:(id)a3;
- (int64_t)indexOfSectionForItems;
- (void)_toggleButtonTapped:(id)a3;
- (void)_updateToggleButtonName;
- (void)selectRowForSpecifier:(id)a3;
- (void)setHiddenIndexesToDictionaries:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateElementsInTopLevelWithItems:(id)a3;
@end

@implementation SCATCustomizeMenuBaseController

- (id)menuItemSpecifiersIncludingToggleButton
{
  v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];
  v5 = [(SCATCustomizeMenuBaseController *)self _nameForToggle];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setProperty:&off_2298D0 forKey:PSAlignmentKey];
  [v6 setIdentifier:@"ToggleButton"];
  [v6 setButtonAction:"_toggleButtonTapped:"];
  [v3 addObject:v6];
  v7 = +[PSSpecifier emptyGroupSpecifier];

  [v3 addObject:v7];
  v8 = [(AXReorderableCheckmarkListController *)self itemSpecifiers];
  [v3 addObjectsFromArray:v8];

  return v3;
}

- (id)filterAndTrackMenuItemsMatchingBlock:(id)a3 allItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionary];
  [(SCATCustomizeMenuBaseController *)self setHiddenIndexesToDictionaries:v8];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __81__SCATCustomizeMenuBaseController_filterAndTrackMenuItemsMatchingBlock_allItems___block_invoke;
  v14[3] = &unk_20AA30;
  id v16 = v6;
  v14[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v9;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v14];

  v11 = v15;
  id v12 = v9;

  return v12;
}

void __81__SCATCustomizeMenuBaseController_filterAndTrackMenuItemsMatchingBlock_allItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  v5 = [v8 objectForKeyedSubscript:AXSSwitchControlMenuItemTypeKey];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v6 = [*(id *)(a1 + 32) hiddenIndexesToDictionaries];
    id v7 = +[NSNumber numberWithUnsignedInteger:a3];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (id)restorePreviouslyFilteredItemsToItems:(id)a3
{
  id v5 = a3;
  id v6 = [(SCATCustomizeMenuBaseController *)self hiddenIndexesToDictionaries];

  if (!v6)
  {
    v22 = NSStringFromSelector(a2);
    _AXAssert();
  }
  id v7 = [(SCATCustomizeMenuBaseController *)self hiddenIndexesToDictionaries];
  id v8 = [v7 count];

  id v9 = v5;
  if (v8)
  {
    id v10 = [(SCATCustomizeMenuBaseController *)self hiddenIndexesToDictionaries];
    v11 = [v10 allKeys];
    id v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_35];

    id v9 = [v5 mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v19 = [(SCATCustomizeMenuBaseController *)self hiddenIndexesToDictionaries];
          v20 = [v19 objectForKeyedSubscript:v18];
          objc_msgSend(v9, "insertObject:atIndex:", v20, objc_msgSend(v18, "unsignedIntegerValue"));
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
  }

  return v9;
}

int64_t __73__SCATCustomizeMenuBaseController_restorePreviouslyFilteredItemsToItems___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  v4 = a3;
  NSUInteger v5 = [(NSNumber *)a2 unsignedIntegerValue];
  id v6 = [(NSNumber *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if (v5 >= (unint64_t)v6) {
    int64_t v7 = 1;
  }
  if ((id)v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(SCATCustomizeMenuBaseController *)self menuItemSpecifiersIncludingToggleButton];
    id v6 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->super.AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (id)_nameForToggle
{
  if ([(SCATCustomizeMenuBaseController *)self _toggleShouldEnableAllMenuItems]) {
    [(SCATCustomizeMenuBaseController *)self nameForShowToggle];
  }
  else {
  uint64_t v3 = [(SCATCustomizeMenuBaseController *)self nameForHideToggle];
  }

  return v3;
}

- (id)nameForShowToggle
{
  return (id)AXParameterizedLocalizedString();
}

- (id)nameForHideToggle
{
  return (id)AXParameterizedLocalizedString();
}

- (BOOL)_toggleShouldEnableAllMenuItems
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(AXReorderableCheckmarkListController *)self cachedItems];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![(SCATCustomizeMenuBaseController *)self isItemEnabled:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)_updateToggleButtonName
{
  id v4 = [(SCATCustomizeMenuBaseController *)self specifierForID:@"ToggleButton"];
  uint64_t v3 = [(SCATCustomizeMenuBaseController *)self _nameForToggle];
  [v4 setName:v3];

  [(SCATCustomizeMenuBaseController *)self reloadSpecifier:v4 animated:0];
}

- (void)_toggleButtonTapped:(id)a3
{
  unsigned int v4 = [(SCATCustomizeMenuBaseController *)self _toggleShouldEnableAllMenuItems];
  id v10 = [(AXReorderableCheckmarkListController *)self cachedItems];
  id v5 = (char *)[v10 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      BOOL v8 = [v10 objectAtIndexedSubscript:i];
      if (v4 != [(SCATCustomizeMenuBaseController *)self isItemEnabled:v8])
      {
        id v9 = [(SCATCustomizeMenuBaseController *)self itemAfterTogglingEnabledState:v8];
        [v10 replaceObjectAtIndex:i withObject:v9];
      }
    }
  }
  [(AXReorderableCheckmarkListController *)self updateItemsInPreferences:v10];
  [(SCATCustomizeMenuBaseController *)self reloadSpecifiers];
}

- (void)selectRowForSpecifier:(id)a3
{
  id v4 = [(SCATCustomizeMenuBaseController *)self indexPathForSpecifier:a3];
  [(SCATCustomizeMenuBaseController *)self tableView:*(void *)&self->super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__table] didSelectRowAtIndexPath:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCATCustomizeMenuBaseController;
  id v6 = a4;
  [(AXReorderableCheckmarkListController *)&v8 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v8.receiver, v8.super_class);

  if (v7 == (id)[(SCATCustomizeMenuBaseController *)self indexOfSectionForItems]) {
    [(SCATCustomizeMenuBaseController *)self _updateToggleButtonName];
  }
}

- (void)updateElementsInTopLevelWithItems:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v6 = [v5 switchControlTopLevelMenuItems];
  id v7 = +[NSMutableSet setWithArray:v6];

  objc_super v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ([(SCATCustomizeMenuBaseController *)self isItemEnabled:v15]) {
          uint64_t v16 = v8;
        }
        else {
          uint64_t v16 = v9;
        }
        [v16 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v12);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
        if (([v7 containsObject:v22] & 1) == 0) {
          [v7 addObject:v22];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v19);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v9;
  id v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v32 + 1) + 8 * (void)k);
        v29 = -[SCATCustomizeMenuBaseController itemAfterTogglingEnabledState:](self, "itemAfterTogglingEnabledState:", v28, (void)v32);
        if (([v7 containsObject:v28] & 1) != 0
          || (v28 = v29, [v7 containsObject:v29]))
        {
          [v7 removeObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v25);
  }

  v30 = +[AXSettings sharedInstance];
  v31 = [v7 allObjects];
  [v30 setSwitchControlTopLevelMenuItems:v31];
}

- (id)titleForItem:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:AXSSwitchControlMenuItemTypeKey];
  id v4 = [@"CUSTOMIZE_MENU_" stringByAppendingString:v3];
  [v3 isEqualToString:AXSSwitchControlMenuItemGesturesForceTouch];
  id v5 = AXParameterizedLocalizedString();

  return v5;
}

- (BOOL)isItemEnabled:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:AXSSwitchControlMenuItemEnabledKey];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)itemAfterTogglingEnabledState:(id)a3
{
  uint64_t v3 = AXSSwitchControlMenuItemEnabledKey;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  unsigned int v6 = [v5 BOOLValue];

  v11[0] = v3;
  id v7 = +[NSNumber numberWithInt:v6 ^ 1];
  v12[0] = v7;
  v11[1] = AXSSwitchControlMenuItemTypeKey;
  objc_super v8 = objc_msgSend(v4, "objectForKeyedSubscript:");

  v12[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (int64_t)indexOfSectionForItems
{
  return 1;
}

- (NSMutableDictionary)hiddenIndexesToDictionaries
{
  return self->_hiddenIndexesToDictionaries;
}

- (void)setHiddenIndexesToDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end