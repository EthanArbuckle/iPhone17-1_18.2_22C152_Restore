@interface SCATHeadMovementController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATHeadMovementController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = AXParameterizedLocalizedString();
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = SCATLocalizedHeadMovementSummary();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setProperty:&off_229D38 forKey:@"SensitivityKey"];
    [v5 addObject:v9];
    v10 = SCATLocalizedHeadMovementSummary();
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setProperty:&off_229D50 forKey:@"SensitivityKey"];
    [v5 addObject:v11];
    v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCATHeadMovementController;
  v4 = [(SCATHeadMovementController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 specifier];
  v6 = [v5 propertyForKey:@"SensitivityKey"];
  id v7 = [v6 integerValue];

  v8 = +[AXSettings sharedInstance];
  objc_msgSend(v4, "setChecked:", objc_msgSend(v8, "assistiveTouchHeadMovementSensitivity") == v7);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SCATHeadMovementController;
  id v6 = a4;
  id v7 = a3;
  v8 = [(SCATHeadMovementController *)&v14 tableView:v7 cellForRowAtIndexPath:v6];
  v9 = [v8 specifier];
  objc_super v10 = [v9 propertyForKey:@"SensitivityKey"];
  id v11 = [v10 integerValue];

  v12 = +[AXSettings sharedInstance];
  [v12 setAssistiveTouchHeadMovementSensitivity:v11];
  [(SCATHeadMovementController *)self updateTableCheckedSelection:v6];
  v13.receiver = self;
  v13.super_class = (Class)SCATHeadMovementController;
  [(SCATHeadMovementController *)&v13 tableView:v7 didSelectRowAtIndexPath:v6];
}

@end