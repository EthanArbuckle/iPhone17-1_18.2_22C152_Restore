@interface SCATSwitchesController
+ (id)switchSpecifiersForSwitchesWithTarget:(id)a3 get:(SEL)a4;
+ (id)switchSpecifiersForSwitchesWithTarget:(id)a3 get:(SEL)a4 isEnabled:(id)a5;
+ (void)_sortSwitches:(id)a3;
- (BOOL)_shouldAllowEditing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (PSSpecifier)addSwitchesSpecifierGroup;
- (PSSpecifier)enabledSwitchesSpecifierGroup;
- (id)_disabledSwitchSpecifiers;
- (id)_switchSpecifiers;
- (id)actionStringForSpecifier:(id)a3;
- (id)ignoreInvalidSwitchConfiguration:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_allowUSBRM;
- (void)_clearSCUSBRMDisabler;
- (void)_reloadSpecifiers;
- (void)setAddSwitchesSpecifierGroup:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabledSwitchesSpecifierGroup:(id)a3;
- (void)setIgnoreInvalidSwitchConfiguration:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATSwitchesController

- (BOOL)_shouldAllowEditing
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 assistiveTouchSwitches];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_switchSpecifiers
{
  v3 = objc_opt_class();

  return [v3 switchSpecifiersForSwitchesWithTarget:self get:"actionStringForSpecifier:" isEnabled:&__kCFBooleanTrue];
}

- (id)_disabledSwitchSpecifiers
{
  v3 = objc_opt_class();

  return [v3 switchSpecifiersForSwitchesWithTarget:self get:"actionStringForSpecifier:" isEnabled:&__kCFBooleanFalse];
}

+ (void)_sortSwitches:(id)a3
{
}

int64_t __40__SCATSwitchesController__sortSwitches___block_invoke(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  BOOL v4 = a3;
  v5 = [(PSSpecifier *)a2 propertyForKey:@"SwitchKey"];
  v6 = [(PSSpecifier *)v4 propertyForKey:@"SwitchKey"];

  v7 = [v5 name];
  v8 = [v6 name];
  id v9 = [v7 localizedCaseInsensitiveCompare:v8];

  return (int64_t)v9;
}

+ (id)switchSpecifiersForSwitchesWithTarget:(id)a3 get:(SEL)a4
{
  v5 = objc_opt_class();

  return [v5 switchSpecifiersForSwitchesWithTarget:a1 get:"actionStringForSpecifier:" isEnabled:0];
}

+ (id)switchSpecifiersForSwitchesWithTarget:(id)a3 get:(SEL)a4 isEnabled:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v37 = +[AXSettings sharedInstance];
  v10 = [v37 assistiveTouchSwitches];
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  +[NSMutableDictionary dictionary];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __78__SCATSwitchesController_switchSpecifiersForSwitchesWithTarget_get_isEnabled___block_invoke;
  v47[3] = &unk_20C410;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v48 = v12;
  id v35 = v8;
  id v49 = v35;
  SEL v52 = a4;
  id v53 = a1;
  id v34 = v9;
  id v50 = v34;
  id v13 = v11;
  id v51 = v13;
  v36 = v10;
  [v10 enumerateObjectsUsingBlock:v47];
  id v33 = v13;
  [a1 _sortSwitches:v13];
  v14 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v12 allKeys];
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v20 = [v12 objectForKey:v19];
        v21 = +[NSCharacterSet whitespaceCharacterSet];
        v22 = [v19 stringByTrimmingCharactersInSet:v21];
        id v23 = [v22 length];

        if (v23)
        {
          v24 = +[PSSpecifier groupSpecifierWithName:v19];
          [v14 addObject:v24];
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v25 = v20;
        id v26 = [v25 countByEnumeratingWithState:&v39 objects:v54 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              [v14 addObject:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
            }
            id v27 = [v25 countByEnumeratingWithState:&v39 objects:v54 count:16];
          }
          while (v27);
        }

        v30 = +[PSSpecifier emptyGroupSpecifier];
        [v14 addObject:v30];
      }
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v16);
  }

  if ([v14 count]) {
    [v33 addObjectsFromArray:v14];
  }
  id v31 = v33;

  return v31;
}

void __78__SCATSwitchesController_switchSpecifiersForSwitchesWithTarget_get_isEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  v3 = [v23 source];
  unsigned int v4 = [v3 isEqualToString:SCATSwitchSourceMFI];

  if (v4)
  {
    v5 = [v23 productName];
    v6 = [v23 manufacturerName];
    if ([v5 length] || objc_msgSend(v6, "length"))
    {
      if ([v5 length] || !objc_msgSend(v6, "length"))
      {
        if ([v5 length] && !objc_msgSend(v6, "length"))
        {
          v7 = v5;
        }
        else
        {
          v7 = +[NSString stringWithFormat:@"%@ (%@)", v5, v6];
        }
      }
      else
      {
        v7 = v6;
      }
      v19 = v7;
    }
    else
    {
      v19 = @" ";
    }
    v20 = [*(id *)(a1 + 32) objectForKey:v19];
    if (!v20)
    {
      v20 = +[NSMutableArray array];
      [*(id *)(a1 + 32) setObject:v20 forKey:v19];
    }
    v21 = [v23 name];
    v18 = +[PSSpecifier preferenceSpecifierNamed:v21 target:*(void *)(a1 + 40) set:0 get:*(void *)(a1 + 64) detail:0 cell:2 edit:0];

    [v18 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v18 setProperty:v23 forKey:@"SwitchKey"];
    [v20 addObject:v18];
    [*(id *)(a1 + 72) _sortSwitches:v20];

LABEL_31:
    id v12 = v23;
    goto LABEL_32;
  }
  id v8 = [v23 source];
  if ([v8 isEqualToString:SCATSwitchSourceBackTap])
  {
    int v9 = AXDeviceSupportsBackTap();

    if (!v9)
    {
      int v10 = AXDeviceSupportsVoiceTriggers() ^ 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v11 = [v23 source];
  if ([v11 isEqualToString:SCATSwitchSourceSound]) {
    LOBYTE(v10) = AXDeviceSupportsVoiceTriggers() ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

LABEL_16:
  id v12 = v23;
  if (!*(void *)(a1 + 48))
  {
    if (v10) {
      goto LABEL_32;
    }
    goto LABEL_20;
  }
  unsigned int v13 = [v23 isEnabled];
  BOOL v14 = v13 == [*(id *)(a1 + 48) BOOLValue];
  id v12 = v23;
  if (v14)
  {
LABEL_20:
    v5 = [v12 name];
    id v15 = [v23 remoteDeviceName];
    id v16 = [v15 length];

    if (v16)
    {
      v22 = [v23 remoteDeviceName];
      uint64_t v17 = AXParameterizedLocalizedString();

      v5 = (void *)v17;
    }
    v18 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, *(void *)(a1 + 40), 0, *(void *)(a1 + 64), 0, 2, 0, v22);
    [v18 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v18 setProperty:v23 forKey:@"SwitchKey"];
    [*(id *)(a1 + 56) addObject:v18];
    goto LABEL_31;
  }
LABEL_32:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SCATSwitchesController;
  [(SCATSwitchesController *)&v19 setEditing:a3 animated:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v20[0] = @"AddSwitchIdentifier";
  v20[1] = @"BluetoothDevicesIdentifier";
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2, 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    BOOL v10 = !v4;
    uint64_t v11 = PSEnabledKey;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v13 = [(SCATSwitchesController *)self specifierForID:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12)];
        BOOL v14 = +[NSNumber numberWithInt:v10];
        [v13 setProperty:v14 forKey:v11];

        [(SCATSwitchesController *)self reloadSpecifier:v13];
        id v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = AXParameterizedLocalizedString();
    uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"EnabledSwitchesGroupIdentifier" name:v6];

    [(SCATSwitchesController *)self setEnabledSwitchesSpecifierGroup:v7];
    id v8 = [(SCATSwitchesController *)self _switchSpecifiers];
    if ([v8 count])
    {
      [v5 addObject:v7];
      [v5 addObjectsFromArray:v8];
    }
    v30 = v8;
    id v31 = (void *)v7;
    uint64_t v9 = +[PSSpecifier groupSpecifierWithID:@"AddSwitchGroupIdentifier"];
    [(SCATSwitchesController *)self setAddSwitchesSpecifierGroup:v9];
    BOOL v10 = +[AXSettings sharedInstance];
    id v11 = [v10 switchControlScanningStyle];

    if ((unint64_t)v11 > 2)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = AXParameterizedLocalizedString();
    }
    uint64_t v28 = PSFooterTextGroupKey;
    v29 = (void *)v12;
    objc_msgSend(v9, "setProperty:forKey:", v12);
    [v5 addObject:v9];
    unsigned int v13 = AXParameterizedLocalizedString();
    BOOL v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v14 setIdentifier:@"AddSwitchIdentifier"];
    [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v5 addObject:v14];
    long long v15 = AXParameterizedLocalizedString();
    uint64_t v16 = +[PSSpecifier groupSpecifierWithID:@"DisabledSwitchesGroupIdentifier" name:v15];

    long long v17 = [(SCATSwitchesController *)self _disabledSwitchSpecifiers];
    if ([v17 count])
    {
      [v5 addObject:v16];
      [v5 addObjectsFromArray:v17];
    }
    long long v18 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v18];
    id v27 = (void *)v16;
    objc_super v19 = settingsLocString(@"BluetoothDevicesScanning", @"HandSettings");
    [(SCATSwitchesController *)self inSetup];
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v20 setIdentifier:@"BluetoothDevicesIdentifier"];
    [v5 addObject:v20];
    v21 = +[PSSpecifier emptyGroupSpecifier];

    v22 = settingsLocString(@"IGNORE_INVALID_SWITCH_FOOTER", @"HandSettings");
    [v21 setProperty:v22 forKey:v28];

    [v5 addObject:v21];
    id v23 = settingsLocString(@"IGNORE_INVALID_SWITCH", @"HandSettings");
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"setIgnoreInvalidSwitchConfiguration:specifier:" get:"ignoreInvalidSwitchConfiguration:" detail:0 cell:6 edit:0];

    [v24 setProperty:@"IgnoreInvalidSwitchConfiguration" forKey:PSIDKey];
    [v5 addObject:v24];
    id v25 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    BOOL v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_reloadSpecifiers
{
  [(SCATSwitchesController *)self beginUpdates];
  uint64_t v3 = [(SCATSwitchesController *)self _switchSpecifiers];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
    v6 = [(SCATSwitchesController *)self enabledSwitchesSpecifierGroup];
    LOBYTE(v5) = [v5 containsObject:v6];

    if (v5) {
      goto LABEL_6;
    }
    uint64_t v7 = [(SCATSwitchesController *)self enabledSwitchesSpecifierGroup];
    [(SCATSwitchesController *)self insertSpecifier:v7 atIndex:0];
  }
  else
  {
    uint64_t v7 = [(SCATSwitchesController *)self enabledSwitchesSpecifierGroup];
    [(SCATSwitchesController *)self removeSpecifier:v7 animated:1];
  }

LABEL_6:

  [(SCATSwitchesController *)self endUpdates];
}

- (void)setIgnoreInvalidSwitchConfiguration:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlIgnoreInvalidSwitchConfiguration:v4];
}

- (id)ignoreInvalidSwitchConfiguration:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 switchControlIgnoreInvalidSwitchConfiguration]);

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATSwitchesController;
  [(SCATSwitchesController *)&v6 viewWillAppear:a3];
  if ([(SCATSwitchesController *)self _shouldAllowEditing])
  {
    id v4 = [(SCATSwitchesController *)self editButtonItem];
    id v5 = [(SCATSwitchesController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  [(SCATSwitchesController *)self reloadSpecifiers];
}

- (id)actionStringForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"SwitchKey"];
  unsigned __int8 v5 = [v4 hasLongPressAction];
  if ((v5 & 1) == 0)
  {
    uint64_t v3 = [v4 longPressShortcutIdentifier];
    if (!v3) {
      goto LABEL_5;
    }
  }
  objc_super v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 assistiveTouchLongPressEnabled];

  if ((v5 & 1) == 0)
  {

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v13 = AXParameterizedLocalizedString();
    goto LABEL_10;
  }
  if (v7) {
    goto LABEL_8;
  }
LABEL_5:
  id v8 = [v4 shortcutIdentifier];

  if (v8)
  {
    uint64_t v9 = +[AXSiriShortcutsManager sharedManager];
    BOOL v10 = [v4 shortcutIdentifier];
    id v11 = [v9 shortcutForIdentifier:v10];
    uint64_t v12 = [v11 shortcutName];

    goto LABEL_11;
  }
  [v4 action];
  uint64_t v13 = SCATLocStringForAction();
LABEL_10:
  uint64_t v12 = (void *)v13;
LABEL_11:

  return v12;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(SCATSwitchesController *)self specifierForIndexPath:a4];
  unsigned __int8 v5 = [v4 propertyForKey:@"SwitchKey"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    BOOL v10 = [(SCATSwitchesController *)self specifierForIndexPath:v9];
    id v11 = [v10 propertyForKey:@"SwitchKey"];
    uint64_t v12 = [v11 source];
    unsigned int v13 = [v12 isEqual:SCATSwitchSourceMFI];

    BOOL v14 = +[AXSettings sharedInstance];
    id v26 = [v14 assistiveTouchSwitches];
    id v15 = [v26 mutableCopy];
    [v15 removeObject:v11];
    [v14 setAssistiveTouchSwitches:v15];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v16 = [v14 assistiveTouchSwitches];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v29[3] = &unk_20BDE0;
    v29[4] = &v30;
    [v16 enumerateObjectsUsingBlock:v29];

    [(SCATSwitchesController *)self removeSpecifier:v10 animated:1];
    if (![(SCATSwitchesController *)self _shouldAllowEditing])
    {
      v28[5] = _NSConcreteStackBlock;
      v28[6] = 3221225472;
      v28[7] = __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
      v28[8] = &unk_2087C0;
      v28[9] = self;
      AXPerformBlockOnMainThreadAfterDelay();
    }
    char v17 = _AXSGetUSBRMDisablers();
    if (v13 && !*((unsigned char *)v31 + 24) && (v17 & 2) != 0)
    {
      long long v18 = AXParameterizedLocalizedString();
      objc_super v19 = AXLocStringKeyForModel();
      v20 = AXParameterizedLocalizedString();
      id v25 = +[UIAlertController alertControllerWithTitle:v18 message:v20 preferredStyle:1];

      v21 = AXParameterizedLocalizedString();
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_3;
      v28[3] = &unk_208B68;
      v28[4] = self;
      v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v28];
      [v25 addAction:v22];

      id v23 = AXParameterizedLocalizedString();
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_4;
      v27[3] = &unk_208B68;
      v27[4] = self;
      v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v27];
      [v25 addAction:v24];

      [(SCATSwitchesController *)self presentViewController:v25 animated:1 completion:0];
    }
    _Block_object_dispose(&v30, 8);
  }
  [(SCATSwitchesController *)self _reloadSpecifiers];
}

void __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  unsigned __int8 v5 = [a2 source];
  unsigned int v6 = [v5 isEqual:SCATSwitchSourceMFI];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

id __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationItem];
  [v2 setRightBarButtonItem:0];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setEditing:0 animated:1];
}

id __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _allowUSBRM];
  v2 = *(void **)(a1 + 32);

  return [v2 _clearSCUSBRMDisabler];
}

id __73__SCATSwitchesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSCUSBRMDisabler];
}

- (void)_clearSCUSBRMDisabler
{
  uint64_t v2 = _AXSGetUSBRMDisablers() & 0xFFFFFFFDLL;

  __AXSSetUSBRMDisablers(v2);
}

- (void)_allowUSBRM
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 setBoolValue:1 forSetting:MCFeatureUSBRestrictedModeAllowed];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCATSwitchesController *)self specifierForIndexPath:v7];
  id v9 = [v8 identifier];
  if ([v9 isEqualToString:@"AddSwitchIdentifier"])
  {
    BOOL v10 = objc_opt_new();
    [v10 setParentController:self];
    id v11 = [(SCATSwitchesController *)self rootController];
    [v10 setRootController:v11];

    uint64_t v12 = AXParameterizedLocalizedString();
    unsigned int v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v10 setSpecifier:v13];

    [(SCATSwitchesController *)self showController:v10 animate:1];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
  else
  {
    BOOL v14 = [v8 propertyForKey:@"SwitchKey"];

    if (!v14)
    {
      v16.receiver = self;
      v16.super_class = (Class)SCATSwitchesController;
      [(SCATSwitchesController *)&v16 tableView:v6 didSelectRowAtIndexPath:v7];
      goto LABEL_7;
    }
    BOOL v10 = [v8 propertyForKey:@"SwitchKey"];
    id v15 = +[SCATSwitchDetailsViewController switchDetailsViewControllerWithSwitch:v10 parentController:self];
    [(SCATSwitchesController *)self showController:v15 animate:1];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
LABEL_7:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(SCATSwitchesController *)self specifierForIndexPath:a4];
  unsigned __int8 v5 = [v4 propertyForKey:@"SwitchKey"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (PSSpecifier)addSwitchesSpecifierGroup
{
  return self->_addSwitchesSpecifierGroup;
}

- (void)setAddSwitchesSpecifierGroup:(id)a3
{
}

- (PSSpecifier)enabledSwitchesSpecifierGroup
{
  return self->_enabledSwitchesSpecifierGroup;
}

- (void)setEnabledSwitchesSpecifierGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitchesSpecifierGroup, 0);

  objc_storeStrong((id *)&self->_addSwitchesSpecifierGroup, 0);
}

@end