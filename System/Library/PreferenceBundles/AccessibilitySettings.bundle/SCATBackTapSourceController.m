@interface SCATBackTapSourceController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATBackTapSourceController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
    v28 = self;
    v26 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v4 = +[AXSettings sharedInstance];
    v5 = [v4 assistiveTouchSwitches];

    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      id v7 = v6;
      char v8 = 0;
      char v9 = 0;
      uint64_t v10 = *(void *)v30;
      uint64_t v11 = SCATSwitchSourceBackTap;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v5);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v14 = [v13 source];
          unsigned int v15 = [v14 isEqualToString:v11];

          if (v15)
          {
            v8 |= [v13 accessibilityEventUsage] == (char *)&dword_0 + 1;
            v9 |= [v13 accessibilityEventUsage] == (char *)&dword_0 + 2;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
      char v9 = 0;
    }

    v16 = +[PSSpecifier emptyGroupSpecifier];
    [v26 addObject:v16];
    v17 = settingsLocString(@"DOUBLE_TAP", @"Accessibility");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v28 set:0 get:0 detail:0 cell:1 edit:0];

    v19 = +[NSNumber numberWithInt:(v8 & 1) == 0];
    uint64_t v20 = PSEnabledKey;
    [v18 setProperty:v19 forKey:PSEnabledKey];

    [v18 setIdentifier:@"DoubleTap"];
    [v26 addObject:v18];
    v21 = settingsLocString(@"TRIPLE_TAP", @"Accessibility");
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:v28 set:0 get:0 detail:0 cell:1 edit:0];

    v23 = +[NSNumber numberWithInt:(v9 & 1) == 0];
    [v22 setProperty:v23 forKey:v20];

    [v22 setIdentifier:@"TripleTap"];
    [v26 addObject:v22];
    v24 = *(void **)&v28->AXUISettingsSetupCapableListController_opaque[v27];
    *(void *)&v28->AXUISettingsSetupCapableListController_opaque[v27] = v26;

    v3 = *(void **)&v28->AXUISettingsSetupCapableListController_opaque[v27];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SCATBackTapSourceController;
  v5 = [(SCATBackTapSourceController *)&v18 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 specifier];
  id v7 = [v6 name];
  char v8 = +[AXSwitch switchWithAction:0 name:v7 source:SCATSwitchSourceBackTap type:SCATSwitchTypeOptional];

  uint64_t v9 = 1;
  [v8 setAccessibilityEventUsagePage:1];
  uint64_t v10 = [v6 identifier];
  unsigned __int8 v11 = [v10 isEqualToString:@"DoubleTap"];

  if (v11) {
    goto LABEL_4;
  }
  v12 = [v6 identifier];
  unsigned int v13 = [v12 isEqualToString:@"TripleTap"];

  if (v13)
  {
    uint64_t v9 = 2;
LABEL_4:
    [v8 setAccessibilityEventUsage:v9];
  }
  v14 = [[SCATSwitchActionsController alloc] initWithSwitch:v8];
  [(SCATSwitchActionsController *)v14 setParentController:self];
  unsigned int v15 = [(SCATBackTapSourceController *)self rootController];
  [(SCATSwitchActionsController *)v14 setRootController:v15];

  v16 = AXParameterizedLocalizedString();
  v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchActionsController *)v14 setSpecifier:v17];

  [(SCATBackTapSourceController *)self showController:v14 animate:1];
}

@end