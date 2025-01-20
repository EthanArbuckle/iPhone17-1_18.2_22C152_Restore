@interface TTYRelayEditController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldSelectResponderOnAppearance;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)suspend;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTYRelayEditController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"TTY_RELAY_FOOTER", @"Accessibility");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = [(TTYRelayEditController *)self parentController];
    v9 = +[PSSpecifier preferenceSpecifierNamed:0 target:v8 set:"setRelayNumber:specifier:" get:"relayNumber:" detail:0 cell:8 edit:0];

    [v9 setProperty:&__kCFBooleanTrue forKey:PSNumberKeyboardKey];
    *(void *)&v9[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
    [v5 addObject:v9];
    v10 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)suspend
{
  uint64_t v3 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)TTYRelayEditController;
  [(TTYRelayEditController *)&v4 suspend];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)TTYRelayEditController;
  [(TTYRelayEditController *)&v6 viewWillDisappear:v3];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TTYRelayEditController;
  objc_super v4 = [(TTYRelayEditController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == &dword_8)
  {
    id v5 = [v4 editableTextField];
    [v5 setAutocapitalizationType:2];
    [v5 setAutocorrectionType:1];
    [v5 setAdjustsFontSizeToFitWidth:1];
    [v5 setReturnKeyType:9];
    [v5 setClearButtonMode:3];
  }

  return v4;
}

@end