@interface SCATCameraHeadGesturesSwitchSourceController
- (BOOL)_shouldEnableHeadSwitch:(int64_t)a3;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATCameraHeadGesturesSwitchSourceController

- (BOOL)_shouldEnableHeadSwitch:(int64_t)a3
{
  v4 = +[AXSettings sharedInstance];
  v5 = [v4 assistiveTouchSwitches];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __72__SCATCameraHeadGesturesSwitchSourceController__shouldEnableHeadSwitch___block_invoke;
  v7[3] = &unk_20A090;
  v7[4] = &v8;
  v7[5] = a3;
  [v5 enumerateObjectsUsingBlock:v7];
  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return a3;
}

void __72__SCATCameraHeadGesturesSwitchSourceController__shouldEnableHeadSwitch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  v5 = [v9 source];
  if ([v5 isEqual:SCATSwitchSourceCamera])
  {
    id v6 = [v9 headSwitch];
    id v7 = *(id *)(a1 + 40);

    uint64_t v8 = v9;
    if (v6 == v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
  else
  {

    uint64_t v8 = v9;
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    id v6 = +[PSSpecifier emptyGroupSpecifier];
    id v7 = AXParameterizedLocalizedString();
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    uint64_t v8 = AXParameterizedLocalizedString();
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v9 setIdentifier:@"LeftHeadMovementSwitchIdentifier"];
    uint64_t v10 = +[NSNumber numberWithBool:[(SCATCameraHeadGesturesSwitchSourceController *)self _shouldEnableHeadSwitch:1]];
    uint64_t v11 = PSEnabledKey;
    [v9 setProperty:v10 forKey:PSEnabledKey];

    [v5 addObject:v9];
    v12 = AXParameterizedLocalizedString();
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v13 setIdentifier:@"RightHeadMovementSwitchIdentifier"];
    v14 = +[NSNumber numberWithBool:[(SCATCameraHeadGesturesSwitchSourceController *)self _shouldEnableHeadSwitch:2]];
    [v13 setProperty:v14 forKey:v11];

    [v5 addObject:v13];
    v15 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SCATCameraHeadGesturesSwitchSourceController;
  v5 = [(SCATCameraHeadGesturesSwitchSourceController *)&v15 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 specifier];
  id v7 = [v6 identifier];

  uint64_t v8 = +[AXSwitch switchWithAction:0 name:0 source:SCATSwitchSourceCamera type:SCATSwitchTypeOptional];
  if ([v7 isEqualToString:@"LeftHeadMovementSwitchIdentifier"])
  {
    uint64_t v9 = 1;
LABEL_5:
    [v8 setHeadSwitch:v9];
    uint64_t v10 = AXParameterizedLocalizedString();
    [v8 setName:v10];

    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"RightHeadMovementSwitchIdentifier"])
  {
    uint64_t v9 = 2;
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v11 = [[SCATSwitchActionsController alloc] initWithSwitch:v8];
  [(SCATSwitchActionsController *)v11 setParentController:self];
  v12 = [(SCATCameraHeadGesturesSwitchSourceController *)self rootController];
  [(SCATSwitchActionsController *)v11 setRootController:v12];

  v13 = AXParameterizedLocalizedString();
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchActionsController *)v11 setSpecifier:v14];

  [(SCATCameraHeadGesturesSwitchSourceController *)self showController:v11 animate:1];
}

@end