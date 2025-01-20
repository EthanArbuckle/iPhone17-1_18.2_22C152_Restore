@interface SCATScreenSwitchSourceController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATScreenSwitchSourceController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v6 = +[AXSettings sharedInstance];
    v7 = [v6 assistiveTouchSwitches];

    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      uint64_t v11 = SCATSwitchSourceScreen;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) source];
          unsigned __int8 v14 = [v13 isEqualToString:v11];

          if (v14)
          {
            uint64_t v15 = 0;
            goto LABEL_12;
          }
          v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v15 = 1;
LABEL_12:

    v16 = +[PSSpecifier emptyGroupSpecifier];
    v17 = AXParameterizedLocalizedString();
    [v16 setProperty:v17 forKey:PSFooterTextGroupKey];

    [v5 addObject:v16];
    v18 = AXParameterizedLocalizedString();
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v19 setIdentifier:@"ScreenSwitchIdentifier"];
    v20 = +[NSNumber numberWithBool:v15];
    [v19 setProperty:v20 forKey:PSEnabledKey];

    [v5 addObject:v19];
    v21 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SCATScreenSwitchSourceController;
  v5 = [(SCATScreenSwitchSourceController *)&v14 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  v7 = [v6 identifier];

  id v8 = +[AXSwitch switchWithAction:0 name:0 source:SCATSwitchSourceScreen type:SCATSwitchTypeOptional];
  if ([v7 isEqualToString:@"ScreenSwitchIdentifier"])
  {
    id v9 = AXParameterizedLocalizedString();
    [v8 setName:v9];
  }
  uint64_t v10 = [[SCATSwitchActionsController alloc] initWithSwitch:v8];
  [(SCATSwitchActionsController *)v10 setParentController:self];
  uint64_t v11 = [(SCATScreenSwitchSourceController *)self rootController];
  [(SCATSwitchActionsController *)v10 setRootController:v11];

  v12 = AXParameterizedLocalizedString();
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchActionsController *)v10 setSpecifier:v13];

  [(SCATScreenSwitchSourceController *)self showController:v10 animate:1];
}

@end