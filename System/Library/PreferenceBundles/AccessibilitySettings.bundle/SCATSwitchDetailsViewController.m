@interface SCATSwitchDetailsViewController
+ (id)switchDetailsViewControllerWithSwitch:(id)a3 parentController:(id)a4;
- (AXSwitch)modelSwitch;
- (SCATAlertCoordinator)switchAlertCoordinator;
- (SCATSwitchDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_actionGroupSpecifiers;
- (id)_generalGroupSpecifiers;
- (id)_getResumeAutoScanning:(id)a3;
- (id)_getSwitchDefaultActionDescription:(id)a3;
- (id)_getSwitchIsEnabledDescription:(id)a3;
- (id)_getSwitchLongPressActionDescription:(id)a3;
- (id)_getSwitchMIDIChannelDescription:(id)a3;
- (id)_getSwitchMIDIKeyDescription:(id)a3;
- (id)_getSwitchNameDescription:(id)a3;
- (id)_getSwitchSourceDescription:(id)a3;
- (id)_midiGroupSpecifiers;
- (id)specifiers;
- (void)_setResumeAutoScanning:(id)a3 specifier:(id)a4;
- (void)_setSwitchIsEnabled:(id)a3 specifier:(id)a4;
- (void)_setSwitchNameDescription:(id)a3 specifier:(id)a4;
- (void)setModelSwitch:(id)a3;
- (void)setSwitchAlertCoordinator:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATSwitchDetailsViewController

+ (id)switchDetailsViewControllerWithSwitch:(id)a3 parentController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    _AXAssert();
    if (v8) {
      goto LABEL_3;
    }
  }
  _AXAssert();
LABEL_3:
  v9 = objc_alloc_init(SCATSwitchDetailsViewController);
  [(SCATSwitchDetailsViewController *)v9 setModelSwitch:v6];
  [(SCATSwitchDetailsViewController *)v9 setParentController:v8];
  v10 = [v8 rootController];
  [(SCATSwitchDetailsViewController *)v9 setRootController:v10];

  v11 = AXParameterizedLocalizedString();
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:a1 set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchDetailsViewController *)v9 setSpecifier:v12];

  return v9;
}

- (SCATSwitchDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCATSwitchDetailsViewController;
  v4 = [(SCATSwitchDetailsViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[SCATAlertCoordinator alloc] initWithViewController:v4];
    [(SCATSwitchDetailsViewController *)v4 setSwitchAlertCoordinator:v5];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATSwitchDetailsViewController;
  [(SCATSwitchDetailsViewController *)&v4 viewWillAppear:a3];
  [(SCATSwitchDetailsViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    objc_super v7 = [(SCATSwitchDetailsViewController *)self _generalGroupSpecifiers];
    [v6 addObjectsFromArray:v7];

    v8 = [(SCATSwitchDetailsViewController *)self _actionGroupSpecifiers];
    [v6 addObjectsFromArray:v8];

    v9 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    v10 = [v9 source];
    unsigned int v11 = [v10 isEqualToString:SCATSwitchSourceMIDI];

    if (v11)
    {
      v12 = [(SCATSwitchDetailsViewController *)self _midiGroupSpecifiers];
      [v6 addObjectsFromArray:v12];
    }
    v13 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v2];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v2] = v6;
    id v14 = v6;

    id v4 = *(id *)&self->AXUISettingsSetupCapableListController_opaque[v2];
  }

  return v4;
}

- (id)_generalGroupSpecifiers
{
  v3 = AXParameterizedLocalizedString();
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"_getSwitchNameDescription:" detail:0 cell:4 edit:0];

  [v4 setIdentifier:@"switchNameID"];
  uint64_t v5 = PSEnabledKey;
  [v4 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  id v6 = AXParameterizedLocalizedString();
  objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_getSwitchSourceDescription:" detail:0 cell:4 edit:0];

  v8 = AXParameterizedLocalizedString();
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setSwitchIsEnabled:specifier:" get:"_getSwitchIsEnabledDescription:" detail:0 cell:6 edit:0];

  [v9 setProperty:&__kCFBooleanTrue forKey:v5];
  v12[0] = v4;
  v12[1] = v7;
  v12[2] = v9;
  v10 = +[NSArray arrayWithObjects:v12 count:3];

  return v10;
}

- (id)_actionGroupSpecifiers
{
  v3 = AXParameterizedLocalizedString();
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  uint64_t v5 = AXParameterizedLocalizedString();
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"_getSwitchDefaultActionDescription:" detail:0 cell:2 edit:0];

  [v6 setIdentifier:@"defaultActionID"];
  uint64_t v7 = PSEnabledKey;
  [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  v8 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  v9 = +[AXSettings sharedInstance];
  unsigned int v10 = [v9 assistiveTouchLongPressEnabled];

  unsigned int v11 = [v8 supportsLongPress];
  v12 = AXParameterizedLocalizedString();
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"_getSwitchLongPressActionDescription:" detail:0 cell:2 edit:0];

  [v13 setIdentifier:@"longPressActionID"];
  uint64_t v14 = v10 & v11;
  v15 = +[NSNumber numberWithInt:v14];
  [v13 setProperty:v15 forKey:v7];

  if ((v14 & 1) == 0)
  {
    v16 = AXParameterizedLocalizedString();
    [v4 setProperty:v16 forKey:PSFooterTextGroupKey];
  }
  v22[0] = v4;
  v22[1] = v6;
  v22[2] = v13;
  v17 = +[NSArray arrayWithObjects:v22 count:3];
  id v18 = [v17 mutableCopy];

  if ([v8 action] == (char *)&stru_20.flags + 3
    || [v8 action] == &stru_68.sectname[5]
    || [v8 longPressAction] == (char *)&stru_20.flags + 3
    || [v8 longPressAction] == &stru_68.sectname[5])
  {
    v19 = AXParameterizedLocalizedString();
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"_setResumeAutoScanning:specifier:" get:"_getResumeAutoScanning:" detail:0 cell:6 edit:0];

    [v18 addObject:v20];
  }

  return v18;
}

- (id)_midiGroupSpecifiers
{
  v3 = AXParameterizedLocalizedString();
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  uint64_t v5 = AXParameterizedLocalizedString();
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"_getSwitchMIDIChannelDescription:" detail:0 cell:2 edit:0];

  [v6 setIdentifier:@"midiChannelID"];
  uint64_t v7 = PSEnabledKey;
  [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  v8 = AXParameterizedLocalizedString();
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"_getSwitchMIDIKeyDescription:" detail:0 cell:2 edit:0];

  [v9 setIdentifier:@"midiKeyID"];
  [v9 setProperty:&__kCFBooleanTrue forKey:v7];
  v12[0] = v4;
  v12[1] = v6;
  v12[2] = v9;
  unsigned int v10 = +[NSArray arrayWithObjects:v12 count:3];

  return v10;
}

- (id)_getSwitchNameDescription:(id)a3
{
  v3 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v4 = [v3 name];

  return v4;
}

- (void)_setSwitchNameDescription:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  if ([v7 length])
  {
    uint64_t v5 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    [v5 setName:v7];

    id v6 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    SCATAddOrUpdateSwitchToSettings();
  }
}

- (id)_getSwitchSourceDescription:(id)a3
{
  v3 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v4 = [v3 localizedSourceDescription];

  return v4;
}

- (id)_getSwitchIsEnabledDescription:(id)a3
{
  v3 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEnabled]);

  return v4;
}

- (void)_setSwitchIsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v6 = [v5 BOOLValue];

  [v7 setIsEnabled:v6];
  SCATAddOrUpdateSwitchToSettings();
}

- (id)_getSwitchDefaultActionDescription:(id)a3
{
  id v4 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v5 = [v4 shortcutIdentifier];

  if (v5)
  {
    id v6 = +[AXSiriShortcutsManager sharedManager];
    id v7 = [v6 shortcutForIdentifier:v5];

    v8 = [v7 shortcutName];
  }
  else
  {
    v9 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    id v10 = [v9 action];

    if (v10) {
      SCATLocStringForAction();
    }
    else {
    v8 = AXParameterizedLocalizedString();
    }
  }

  return v8;
}

- (id)_getSwitchLongPressActionDescription:(id)a3
{
  id v4 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v5 = [v4 longPressShortcutIdentifier];

  if (v5)
  {
    id v6 = +[AXSiriShortcutsManager sharedManager];
    id v7 = [v6 shortcutForIdentifier:v5];

    v8 = [v7 shortcutName];
  }
  else
  {
    v9 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    id v10 = [v9 longPressAction];

    if (v10) {
      SCATLocStringForAction();
    }
    else {
    v8 = AXParameterizedLocalizedString();
    }
  }

  return v8;
}

- (id)_getSwitchMIDIChannelDescription:(id)a3
{
  v3 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v4 = [v3 midiEvent];
  id v5 = AXLocalizedNameForMIDIChannel((uint64_t)[v4 channel]);

  return v5;
}

- (id)_getSwitchMIDIKeyDescription:(id)a3
{
  v3 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v4 = [v3 midiEvent];
  [v4 note];
  id v5 = AXLocalizedNameForMIDINote();

  return v5;
}

- (id)_getResumeAutoScanning:(id)a3
{
  id v4 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  if ([v4 action] == &stru_68.sectname[5])
  {
    id v5 = +[NSNumber numberWithInt:1];
  }
  else
  {
    id v6 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 longPressAction] == &stru_68.sectname[5]);
  }

  return v5;
}

- (void)_setResumeAutoScanning:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v10 = [(SCATSwitchDetailsViewController *)self modelSwitch];
  id v6 = (char *)[v10 action];
  id v7 = (char *)[v10 longPressAction];
  unsigned int v8 = [v5 BOOLValue];

  if (v8)
  {
    if (v6 == (unsigned char *)&stru_20.flags + 3) {
      [v10 setAction:109];
    }
    if (v7 == (unsigned char *)&stru_20.flags + 3)
    {
      uint64_t v9 = 109;
LABEL_10:
      [v10 setLongPressAction:v9];
    }
  }
  else
  {
    if (v6 == &stru_68.sectname[5]) {
      [v10 setAction:103];
    }
    if (v7 == &stru_68.sectname[5])
    {
      uint64_t v9 = 103;
      goto LABEL_10;
    }
  }
  SCATAddOrUpdateSwitchToSettings();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SCATSwitchDetailsViewController;
  unsigned int v8 = [(SCATSwitchDetailsViewController *)&v24 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v9 = [v8 specifier];
  id v10 = [v9 identifier];

  objc_initWeak(&location, self);
  if ([v10 isEqualToString:@"switchNameID"])
  {
    unsigned int v11 = [(SCATSwitchDetailsViewController *)self switchAlertCoordinator];
    v12 = [(SCATSwitchDetailsViewController *)self modelSwitch];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __69__SCATSwitchDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v21[3] = &unk_208798;
    objc_copyWeak(&v22, &location);
    [v11 showSwitchNamingAlertWithSwitch:v12 message:0 successHandler:v21 cancelHandler:0];

    objc_destroyWeak(&v22);
  }
  else
  {
    if (([v10 isEqualToString:@"defaultActionID"] & 1) != 0
      || [v10 isEqualToString:@"longPressActionID"])
    {
      v13 = [SCATSwitchActionsController alloc];
      uint64_t v14 = [(SCATSwitchDetailsViewController *)self modelSwitch];
      v15 = [(SCATSwitchActionsController *)v13 initWithSwitch:v14];

      [(SCATSwitchActionsController *)v15 setParentController:self];
      v16 = [(SCATSwitchDetailsViewController *)self rootController];
      [(SCATSwitchActionsController *)v15 setRootController:v16];

      v17 = AXParameterizedLocalizedString();
      id v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:-1 edit:0];
      [(SCATSwitchActionsController *)v15 setSpecifier:v18];

      -[SCATSwitchActionsController setSelectLongPress:](v15, "setSelectLongPress:", [v10 isEqualToString:@"longPressActionID"]);
      [(SCATSwitchActionsController *)v15 setPopToRootSwitchViewControlAfterSelection:0];
      [(SCATSwitchDetailsViewController *)self showController:v15 animate:1];
    }
    else if ([v10 isEqualToString:@"midiChannelID"])
    {
      v19 = [(SCATSwitchDetailsViewController *)self modelSwitch];
      v15 = +[SCATMIDISwitchChannelViewController channelViewControllerWithSwitch:v19 parentController:self];

      [(SCATSwitchDetailsViewController *)self showController:v15 animate:1];
    }
    else
    {
      if (![v10 isEqualToString:@"midiKeyID"]) {
        goto LABEL_7;
      }
      v20 = [(SCATSwitchDetailsViewController *)self modelSwitch];
      v15 = +[SCATMIDISwitchKeyViewController keyViewControllerWithSwitch:v20 parentController:self];

      [(SCATSwitchDetailsViewController *)self showController:v15 animate:1];
    }
  }
LABEL_7:
  objc_destroyWeak(&location);
}

void __69__SCATSwitchDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained modelSwitch];
  SCATAddOrUpdateSwitchToSettings();

  id v4 = objc_loadWeakRetained(v1);
  [v4 reloadSpecifiers];
}

- (AXSwitch)modelSwitch
{
  return self->_modelSwitch;
}

- (void)setModelSwitch:(id)a3
{
}

- (SCATAlertCoordinator)switchAlertCoordinator
{
  return self->_switchAlertCoordinator;
}

- (void)setSwitchAlertCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchAlertCoordinator, 0);

  objc_storeStrong((id *)&self->_modelSwitch, 0);
}

@end