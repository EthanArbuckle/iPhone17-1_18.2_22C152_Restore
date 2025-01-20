@interface SCATSwitchActionsController
- (AXSwitch)storedSwitch;
- (BOOL)_popToActionTypeController;
- (BOOL)popToRootSwitchViewControlAfterSelection;
- (BOOL)selectLongPress;
- (NSURL)assetURL;
- (PSSpecifier)footerTextSpecifier;
- (SCATSwitchActionsController)initWithSwitch:(id)a3;
- (id)_actionSpecifiersWithActions:(id)a3;
- (id)_rootSwitchesController;
- (id)_shortcutSpecifiers;
- (id)disallowedActions;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_cellAccessoryTypeForSpecifier:(id)a3;
- (void)_rootSwitchesController;
- (void)dealloc;
- (void)saveSwitchToSettings:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setFooterTextSpecifier:(id)a3;
- (void)setPopToRootSwitchViewControlAfterSelection:(BOOL)a3;
- (void)setSelectLongPress:(BOOL)a3;
- (void)setStoredSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATSwitchActionsController

- (void)dealloc
{
  v3 = +[AXSiriShortcutsManager sharedManager];
  [v3 unregisterShortcutsDidChangeBlock:self->_siriShortcutToken];

  v4.receiver = self;
  v4.super_class = (Class)SCATSwitchActionsController;
  [(SCATSwitchActionsController *)&v4 dealloc];
}

- (id)_shortcutSpecifiers
{
  v3 = objc_opt_new();
  objc_super v4 = +[AXSiriShortcutsManager sharedManager];
  v5 = [v4 shortcuts];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = PSEnabledKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 shortcutName];
        v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

        v14 = [v11 identifier];
        [v13 setProperty:v14 forKey:@"ShortcutActionKey"];

        [v13 setProperty:&__kCFBooleanTrue forKey:v9];
        [v3 addObject:v13];
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)_actionSpecifiersWithActions:(id)a3
{
  id v4 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __60__SCATSwitchActionsController__actionSpecifiersWithActions___block_invoke;
  v9[3] = &unk_20AEA8;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __60__SCATSwitchActionsController__actionSpecifiersWithActions___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) disallowedActions];
  unsigned __int8 v4 = [v3 containsObject:v7];

  if ((v4 & 1) == 0)
  {
    [v7 integerValue];
    id v5 = SCATLocStringForAction();
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

    [v6 setProperty:v7 forKey:@"ActionKey"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)_rootSwitchesController
{
  v2 = self;
  v3 = [(SCATSwitchActionsController *)self navigationController];
  unsigned __int8 v4 = [v3 viewControllers];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [v4 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    v24 = v3;
    v25 = v4;
    v22 = v2;
    uint64_t v23 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(SCATSwitchActionsController **)(*((void *)&v30 + 1) + 8 * i);
        if ([(SCATSwitchActionsController *)v10 isMemberOfClass:objc_opt_class()])
        {
          v21 = v10;
LABEL_23:

          v3 = v24;
          goto LABEL_24;
        }
        v11 = [(SCATSwitchActionsController *)v10 childViewControllers];
        id v12 = [v11 count];

        if (v12)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v13 = [(SCATSwitchActionsController *)v10 childViewControllers];
          id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([*(id *)(*((void *)&v26 + 1) + 8 * (void)j) isMemberOfClass:objc_opt_class()])
                {
                  long long v19 = v10;

                  unsigned __int8 v4 = v25;
                  goto LABEL_23;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          unsigned __int8 v4 = v25;
          uint64_t v8 = v23;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      v3 = v24;
      v2 = v22;
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v18 = AXLogSettings();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    [(SCATSwitchActionsController *)(uint64_t)v2 _rootSwitchesController];
  }

  id v10 = v2;
LABEL_24:

  return v10;
}

- (BOOL)_popToActionTypeController
{
  v3 = [(SCATSwitchActionsController *)self navigationController];
  unsigned __int8 v4 = [v3 viewControllers];
  id v5 = (char *)[v4 indexOfObjectPassingTest:&__block_literal_global_75];

  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [v3 viewControllers];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = [SCATSwitchActionTypeController alloc];
    uint64_t v9 = [(SCATSwitchActionsController *)self storedSwitch];
    id v10 = [(SCATSwitchActionTypeController *)v8 initWithSwitch:v9];

    v11 = [(SCATSwitchActionsController *)self storedSwitch];
    id v12 = [v11 name];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(SCATSwitchActionTypeController *)v10 setSpecifier:v13];

    [v7 insertObject:v10 atIndex:v5 + 1];
    [v3 setViewControllers:v7 animated:0];
    id v14 = [(SCATSwitchActionsController *)self navigationController];
    id v15 = [v14 popToViewController:v10 animated:1];
  }
  return v5 != (char *)0x7FFFFFFFFFFFFFFFLL;
}

BOOL __57__SCATSwitchActionsController__popToActionTypeController__block_invoke(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

- (SCATSwitchActionsController)initWithSwitch:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SCATSwitchActionsController;
  id v5 = [(SCATSwitchActionsController *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    [(SCATSwitchActionsController *)v5 setPopToRootSwitchViewControlAfterSelection:1];
    [(SCATSwitchActionsController *)v6 setStoredSwitch:v4];
    objc_initWeak(&location, v6);
    id v7 = +[AXSiriShortcutsManager sharedManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __46__SCATSwitchActionsController_initWithSwitch___block_invoke;
    v11[3] = &unk_2099A8;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v7 registerShortcutsDidChangeBlock:v11];
    siriShortcutToken = v6->_siriShortcutToken;
    v6->_siriShortcutToken = (NSString *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__SCATSwitchActionsController_initWithSwitch___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_opt_new();
    id v6 = [(SCATSwitchActionsController *)self storedSwitch];
    id v7 = [v6 source];
    unsigned __int8 v8 = [v7 isEqualToString:SCATSwitchSourceSound];

    if (v8)
    {
      uint64_t v9 = +[PSSpecifier emptyGroupSpecifier];
      id v10 = settingsLocString(@"SOUND_ACTION_PRACTICE_FOOTER", @"Accessibility");
      uint64_t v11 = PSFooterTextGroupKey;
      [v9 setProperty:v10 forKey:PSFooterTextGroupKey];

      [v5 addObject:v9];
      id v12 = settingsLocString(@"SOUND_ACTION_PRACTICE_TITLE", @"Accessibility");
      v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v13 setIdentifier:@"SOUND_ACTION_PRACTICE_ID"];
      [v5 addObject:v13];
    }
    else
    {
      uint64_t v11 = PSFooterTextGroupKey;
    }
    objc_super v14 = +[PSSpecifier emptyGroupSpecifier];
    id v15 = AXParameterizedLocalizedString();
    [v14 setProperty:v15 forKey:v11];

    [(SCATSwitchActionsController *)self setFooterTextSpecifier:v14];
    [v5 addObject:v14];
    if ([(SCATSwitchActionsController *)self selectLongPress])
    {
      uint64_t v16 = +[AXSettings sharedInstance];
      unsigned int v17 = [v16 assistiveTouchLongPressEnabled];

      if (v17)
      {
        long long v18 = AXParameterizedLocalizedString();
        long long v19 = +[PSSpecifier groupSpecifierWithName:v18];

        [v5 addObject:v19];
        long long v20 = AXParameterizedLocalizedString();
        v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

        [v21 setObject:&off_22A920 forKeyedSubscript:@"ActionKey"];
        [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
        [v5 addObject:v21];
      }
    }
    v22 = AXParameterizedLocalizedString();
    uint64_t v23 = +[PSSpecifier groupSpecifierWithName:v22];

    [v5 addObject:v23];
    v24 = SCATScannerSwitchActions();
    v25 = [(SCATSwitchActionsController *)self _actionSpecifiersWithActions:v24];

    [v5 addObjectsFromArray:v25];
    long long v26 = AXParameterizedLocalizedString();
    long long v27 = +[PSSpecifier groupSpecifierWithName:v26];

    [v5 addObject:v27];
    long long v28 = SCATSystemSwitchActions();
    long long v29 = [(SCATSwitchActionsController *)self _actionSpecifiersWithActions:v28];

    [v5 addObjectsFromArray:v29];
    long long v30 = AXParameterizedLocalizedString();
    long long v31 = +[PSSpecifier groupSpecifierWithName:v30];

    [v5 addObject:v31];
    long long v32 = [(SCATSwitchActionsController *)self _shortcutSpecifiers];
    [v5 addObjectsFromArray:v32];

    long long v33 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCATSwitchActionsController;
  id v5 = [(SCATSwitchActionsController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 specifier];
  objc_msgSend(v5, "setAccessoryType:", -[SCATSwitchActionsController _cellAccessoryTypeForSpecifier:](self, "_cellAccessoryTypeForSpecifier:", v6));

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)SCATSwitchActionsController;
  [(SCATSwitchActionsController *)&v43 tableView:v6 didSelectRowAtIndexPath:v7];
  v42.receiver = self;
  v42.super_class = (Class)SCATSwitchActionsController;
  objc_super v8 = [(SCATSwitchActionsController *)&v42 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v9 = [(SCATSwitchActionsController *)self storedSwitch];
  id v10 = [v8 specifier];
  uint64_t v11 = [v10 identifier];
  unsigned int v12 = [v11 isEqualToString:@"SOUND_ACTION_PRACTICE_ID"];

  if (v12)
  {
    v13 = [SoundActionsPracticeNavigationController alloc];
    objc_super v14 = [(SCATSwitchActionsController *)self assetURL];
    id v15 = -[SoundActionsPracticeNavigationController initWithAssetURL:usage:](v13, "initWithAssetURL:usage:", v14, [v9 accessibilityEventUsage]);

    [(SCATSwitchActionsController *)self presentModalViewController:v15 withTransition:3];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
  else
  {
    uint64_t v16 = [v8 specifier];
    unsigned int v17 = [v16 propertyForKey:@"ActionKey"];
    if (v17)
    {
    }
    else
    {
      long long v18 = [v8 specifier];
      long long v19 = [v18 propertyForKey:@"ShortcutActionKey"];

      if (!v19)
      {
        [v8 setAccessoryType:0];
        goto LABEL_24;
      }
    }
    long long v20 = [v8 specifier];
    v21 = [v20 propertyForKey:@"ActionKey"];

    if (v21)
    {
      id v22 = [v21 integerValue];
      unsigned int v23 = [(SCATSwitchActionsController *)self selectLongPress];
      v24 = [(SCATSwitchActionsController *)self storedSwitch];
      v25 = v24;
      if (v23)
      {
        [v24 setLongPressShortcutIdentifier:0];

        long long v26 = [(SCATSwitchActionsController *)self storedSwitch];
        [v26 setLongPressAction:v22];
      }
      else
      {
        [v24 setShortcutIdentifier:0];

        long long v26 = [(SCATSwitchActionsController *)self storedSwitch];
        [v26 setAction:v22];
      }
    }
    long long v27 = [v8 specifier];
    long long v28 = [v27 propertyForKey:@"ShortcutActionKey"];

    if (v28)
    {
      unsigned int v29 = [(SCATSwitchActionsController *)self selectLongPress];
      long long v30 = [(SCATSwitchActionsController *)self storedSwitch];
      long long v31 = v30;
      if (v29)
      {
        [v30 setLongPressShortcutIdentifier:v28];

        long long v32 = [(SCATSwitchActionsController *)self storedSwitch];
        [v32 setLongPressAction:0];
      }
      else
      {
        [v30 setShortcutIdentifier:v28];

        long long v32 = [(SCATSwitchActionsController *)self storedSwitch];
        [v32 setAction:0];
      }
    }
    [(SCATSwitchActionsController *)self saveSwitchToSettings:v9];
    if ([(SCATSwitchActionsController *)self popToRootSwitchViewControlAfterSelection])
    {
      v38 = v21;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = __65__SCATSwitchActionsController_tableView_didSelectRowAtIndexPath___block_invoke;
      v41[3] = &unk_2087C0;
      v41[4] = self;
      long long v33 = objc_retainBlock(v41);
      v34 = +[AXSettings sharedInstance];
      unsigned int v35 = [v34 assistiveTouchLongPressEnabled];

      if (!v35
        || ([(SCATSwitchActionsController *)self storedSwitch],
            v36 = objc_claimAutoreleasedReturnValue(),
            unsigned int v37 = [v36 supportsLongPress],
            v36,
            !v37)
        || ![(SCATSwitchActionsController *)self _popToActionTypeController])
      {
        ((void (*)(void *))v33[2])(v33);
      }
      v40.receiver = self;
      v40.super_class = (Class)SCATSwitchActionsController;
      [(SCATSwitchActionsController *)&v40 tableView:v6 didSelectRowAtIndexPath:v7];

      v21 = v38;
    }
    else
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = __65__SCATSwitchActionsController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v39[3] = &unk_209DA0;
      v39[4] = self;
      [(SCATSwitchActionsController *)self updateCellAccessories:v39];
    }
  }
LABEL_24:
}

void __65__SCATSwitchActionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) navigationController];
  v2 = [*(id *)(a1 + 32) _rootSwitchesController];
  id v3 = [v4 popToViewController:v2 animated:1];
}

id __65__SCATSwitchActionsController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cellAccessoryTypeForSpecifier:a2];
}

- (void)saveSwitchToSettings:(id)a3
{
}

- (id)disallowedActions
{
  return &__NSArray0__struct;
}

- (int64_t)_cellAccessoryTypeForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"ShortcutActionKey"];
  unsigned __int8 v6 = [(SCATSwitchActionsController *)self selectLongPress];
  id v7 = [(SCATSwitchActionsController *)self storedSwitch];
  objc_super v8 = v7;
  if (v6) {
    [v7 longPressShortcutIdentifier];
  }
  else {
  uint64_t v9 = [v7 shortcutIdentifier];
  }

  if ([v5 isEqualToString:v9])
  {
    int64_t v10 = 3;
  }
  else if (v9)
  {
    int64_t v10 = 0;
  }
  else
  {
    unsigned __int8 v11 = [(SCATSwitchActionsController *)self selectLongPress];
    unsigned int v12 = [(SCATSwitchActionsController *)self storedSwitch];
    v13 = v12;
    if (v11) {
      id v14 = [v12 longPressAction];
    }
    else {
      id v14 = [v12 action];
    }
    id v15 = v14;

    uint64_t v16 = [v4 propertyForKey:@"ActionKey"];
    unsigned int v17 = v16;
    if (v16 && [v16 integerValue] == v15) {
      int64_t v10 = 3;
    }
    else {
      int64_t v10 = 0;
    }
  }
  return v10;
}

- (BOOL)selectLongPress
{
  return self->_selectLongPress;
}

- (void)setSelectLongPress:(BOOL)a3
{
  self->_selectLongPress = a3;
}

- (BOOL)popToRootSwitchViewControlAfterSelection
{
  return self->_popToRootSwitchViewControlAfterSelection;
}

- (void)setPopToRootSwitchViewControlAfterSelection:(BOOL)a3
{
  self->_popToRootSwitchViewControlAfterSelection = a3;
}

- (PSSpecifier)footerTextSpecifier
{
  return self->_footerTextSpecifier;
}

- (void)setFooterTextSpecifier:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (AXSwitch)storedSwitch
{
  return self->_storedSwitch;
}

- (void)setStoredSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedSwitch, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_footerTextSpecifier, 0);

  objc_storeStrong((id *)&self->_siriShortcutToken, 0);
}

- (void)_rootSwitchesController
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%@ Failed to find rootswitchController for rootVC: %@", (uint8_t *)&v3, 0x16u);
}

@end