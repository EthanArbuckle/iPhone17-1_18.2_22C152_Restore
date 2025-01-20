@interface SCATCustomizeTopLevelMenuController
- (BOOL)_isSiriAvailable;
- (BOOL)_isVoiceControlAvailable;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (id)_replaceSubMenuTopLevelItems:(id)a3 withItem:(id)a4 itemKey:(id)a5;
- (id)_shortFirstPageEnabled:(id)a3;
- (id)itemsFromPreferences;
- (id)specifiers;
- (id)titleForItem:(id)a3;
- (void)_setShortFirstPageEnabled:(id)a3 specifier:(id)a4;
- (void)updateItemsInPreferences:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATCustomizeTopLevelMenuController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCustomizeTopLevelMenuController;
  [(SCATCustomizeTopLevelMenuController *)&v4 viewWillAppear:a3];
  [(AXReorderableCheckmarkListController *)self clearItemCache];
  [(SCATCustomizeTopLevelMenuController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(SCATCustomizeMenuBaseController *)self menuItemSpecifiersIncludingToggleButton];
    [v5 addObjectsFromArray:v6];

    v7 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v7];
    v8 = AXParameterizedLocalizedString();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v5 addObject:v9];
    v10 = +[AXSettings sharedInstance];
    v11 = (char *)[v10 switchControlTapBehavior];

    if ((unint64_t)(v11 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = AXParameterizedLocalizedString();
      [v7 setProperty:v12 forKey:PSFooterTextGroupKey];

      v13 = AXParameterizedLocalizedString();
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"_setShortFirstPageEnabled:specifier:" get:"_shortFirstPageEnabled:" detail:0 cell:6 edit:0];

      [v5 addObject:v14];
    }
    v15 = *(void **)&self->super.super.AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->super.super.AXUISettingsSetupCapableListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->super.super.AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)_setShortFirstPageEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlShouldUseShortFirstPage:v4];
}

- (id)_shortFirstPageEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlShouldUseShortFirstPage]);

  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "section", a3);
  return v5 == (id)[(SCATCustomizeMenuBaseController *)self indexOfSectionForItems];
}

- (id)itemsFromPreferences
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 switchControlTopLevelMenuItems];
  id v5 = [(SCATCustomizeMenuBaseController *)self filterAndTrackMenuItemsMatchingBlock:&__block_literal_global_18 allItems:v4];

  return v5;
}

BOOL __59__SCATCustomizeTopLevelMenuController_itemsFromPreferences__block_invoke(id a1, NSString *a2)
{
  v2 = a2;
  if ([(NSString *)v2 isEqualToString:AXSSwitchControlMenuItemSideApp])
  {
    int v3 = AXDeviceSupportsSideApp() ^ 1;
  }
  else if ([(NSString *)v2 isEqualToString:AXSSwitchControlMenuItemItemMenu] {
         || [(NSString *)v2 isEqualToString:AXSSwitchControlMenuItemLockItemMenu])
  }
  {
    id v4 = +[AXSettings sharedInstance];
    LOBYTE(v3) = [v4 switchControlTapBehavior] != (char *)&dword_0 + 2;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  v34 = [v5 gestureKeys];
  v31 = [v5 deviceKeys];
  v28 = [v5 settingsKeys];
  v26 = [v5 mediaControlsKeys];
  v30 = [v5 switchControlGesturesTopLevelMenuItems];
  v27 = [v5 switchControlDeviceTopLevelMenuItems];
  v25 = [v5 switchControlSettingsTopLevelMenuItems];
  v33 = v5;
  v24 = [v5 switchControlMediaControlsTopLevelMenuItems];
  id v29 = [v4 mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    uint64_t v9 = AXSSwitchControlMenuItemTypeKey;
    uint64_t v10 = AXSSwitchControlMenuItemEnabledKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:v9];
        if ([v34 containsObject:v13])
        {
          v14 = [v12 objectForKeyedSubscript:v10];
          unsigned __int8 v15 = [v14 BOOLValue];

          v16 = [(SCATCustomizeTopLevelMenuController *)self _replaceSubMenuTopLevelItems:v30 withItem:v12 itemKey:v13];
          [v33 setSwitchControlGesturesTopLevelMenuItems:v16];

          if ((v15 & 1) == 0) {
            goto LABEL_16;
          }
        }
        else
        {
          if ([v31 containsObject:v13])
          {
            v17 = [v12 objectForKeyedSubscript:v10];
            unsigned __int8 v18 = [v17 BOOLValue];

            v19 = [(SCATCustomizeTopLevelMenuController *)self _replaceSubMenuTopLevelItems:v27 withItem:v12 itemKey:v13];
            [v33 setSwitchControlDeviceTopLevelMenuItems:v19];
          }
          else if ([v28 containsObject:v13])
          {
            v20 = [v12 objectForKeyedSubscript:v10];
            unsigned __int8 v18 = [v20 BOOLValue];

            v19 = [(SCATCustomizeTopLevelMenuController *)self _replaceSubMenuTopLevelItems:v25 withItem:v12 itemKey:v13];
            [v33 setSwitchControlSettingsTopLevelMenuItems:v19];
          }
          else
          {
            if (![v26 containsObject:v13]) {
              goto LABEL_17;
            }
            v21 = [v12 objectForKeyedSubscript:v10];
            unsigned __int8 v18 = [v21 BOOLValue];

            v19 = [(SCATCustomizeTopLevelMenuController *)self _replaceSubMenuTopLevelItems:v24 withItem:v12 itemKey:v13];
            [v33 setSwitchControlMediaControlsTopLevelMenuItems:v19];
          }

          if ((v18 & 1) == 0) {
LABEL_16:
          }
            [v29 removeObject:v12];
        }
LABEL_17:
      }
      id v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }

  v22 = [(SCATCustomizeMenuBaseController *)self restorePreviouslyFilteredItemsToItems:v29];

  v23 = +[AXSettings sharedInstance];
  [v23 setSwitchControlTopLevelMenuItems:v22];
}

- (id)_replaceSubMenuTopLevelItems:(id)a3 withItem:(id)a4 itemKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 mutableCopy];
  if ([v7 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = AXSSwitchControlMenuItemTypeKey;
    while (1)
    {
      v13 = [v7 objectAtIndex:v11];
      v14 = [v13 objectForKeyedSubscript:v12];
      unsigned int v15 = [v14 isEqualToString:v9];

      if (v15) {
        break;
      }

      if (++v11 >= (unint64_t)[v7 count]) {
        goto LABEL_7;
      }
    }
    [v10 replaceObjectAtIndex:v11 withObject:v8];
  }
LABEL_7:

  return v10;
}

- (BOOL)_isSiriAvailable
{
  return _AXDeviceIsSiriAvailable(self, a2);
}

- (BOOL)_isVoiceControlAvailable
{
  return _AXDeviceIsVoiceControlAvailable(self, a2);
}

- (id)titleForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:AXSSwitchControlMenuItemTypeKey];
  if ([v5 isEqualToString:AXSSwitchControlMenuItemDeviceSiriVoiceControl])
  {
    if (![(SCATCustomizeTopLevelMenuController *)self _isSiriAvailable]
      && ![(SCATCustomizeTopLevelMenuController *)self _isVoiceControlAvailable])
    {
      _AXAssert();
    }
    goto LABEL_9;
  }
  if (![v5 isEqualToString:AXSSwitchControlMenuItemDeviceTypeToSiri])
  {
    v9.receiver = self;
    v9.super_class = (Class)SCATCustomizeTopLevelMenuController;
    uint64_t v6 = [(SCATCustomizeMenuBaseController *)&v9 titleForItem:v4];
    goto LABEL_11;
  }
  if ([(SCATCustomizeTopLevelMenuController *)self _isSiriAvailable])
  {
LABEL_9:
    uint64_t v6 = AXParameterizedLocalizedString();
LABEL_11:
    id v7 = (void *)v6;
    goto LABEL_12;
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

@end