@interface SCATDefaultVsLongPressController
- (id)_actionStringForSpecifier:(id)a3;
- (id)actionStringForLongPress:(BOOL)a3;
- (id)controllerForLongPress:(BOOL)a3;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATDefaultVsLongPressController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATDefaultVsLongPressController;
  [(SCATDefaultVsLongPressController *)&v4 viewWillAppear:a3];
  [(SCATDefaultVsLongPressController *)self reloadSpecifiers];
}

- (id)_actionStringForSpecifier:(id)a3
{
  objc_super v4 = [a3 objectForKeyedSubscript:@"LongPressKey"];
  v5 = -[SCATDefaultVsLongPressController actionStringForLongPress:](self, "actionStringForLongPress:", [v4 BOOLValue]);

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = AXParameterizedLocalizedString();
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_actionStringForSpecifier:" detail:0 cell:2 edit:0];

    uint64_t v9 = PSEnabledKey;
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
    [v8 setObject:&__kCFBooleanFalse forKeyedSubscript:@"LongPressKey"];
    [v5 addObject:v8];

    v10 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v10];
    v11 = AXParameterizedLocalizedString();
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_actionStringForSpecifier:" detail:0 cell:2 edit:0];

    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"LongPressKey"];
    [v5 addObject:v12];

    v13 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SCATDefaultVsLongPressController;
  v5 = [(SCATDefaultVsLongPressController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  v7 = [v6 objectForKeyedSubscript:@"LongPressKey"];
  id v8 = [v7 BOOLValue];

  uint64_t v9 = [(SCATDefaultVsLongPressController *)self controllerForLongPress:v8];
  v10 = [v6 name];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [(SCATDefaultVsLongPressController *)self showController:v9 withSpecifier:v11];
}

- (id)actionStringForLongPress:(BOOL)a3
{
  return 0;
}

- (id)controllerForLongPress:(BOOL)a3
{
  return 0;
}

@end