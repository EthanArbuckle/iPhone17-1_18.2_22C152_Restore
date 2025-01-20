@interface SCATHeadGesturesSourceController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATHeadGesturesSourceController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[SCATHeadGesturesSourceControllerHelper specifiers];
    v6 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SCATHeadGesturesSourceController;
  uint64_t v5 = [(SCATHeadGesturesSourceController *)&v15 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  v7 = [v6 name];
  v8 = +[AXSwitch switchWithAction:0 name:v7 source:SCATSwitchSourceHeadGesture type:SCATSwitchTypeOptional];

  [v8 setAccessibilityEventUsagePage:7];
  v9 = [v6 propertyForKey:PSValueKey];
  v10 = v9;
  if (v9) {
    objc_msgSend(v8, "setAccessibilityEventUsage:", (int)objc_msgSend(v9, "intValue"));
  }
  v11 = [[SCATSwitchActionsController alloc] initWithSwitch:v8];
  [(SCATSwitchActionsController *)v11 setParentController:self];
  v12 = [(SCATHeadGesturesSourceController *)self rootController];
  [(SCATSwitchActionsController *)v11 setRootController:v12];

  v13 = AXParameterizedLocalizedString();
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchActionsController *)v11 setSpecifier:v14];

  [(SCATHeadGesturesSourceController *)self showController:v11 animate:1];
}

@end