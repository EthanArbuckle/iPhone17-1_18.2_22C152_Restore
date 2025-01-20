@interface ASTDwellAutorevertActionController
- (ASTDwellAutorevertActionController)init;
- (id)dwellControlAutorevertEnabled:(id)a3;
- (id)specifiers;
- (void)setDwellControlAutorevertEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ASTDwellAutorevertActionController

- (ASTDwellAutorevertActionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASTDwellAutorevertActionController;
  v2 = [(ASTDwellAutorevertActionController *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __42__ASTDwellAutorevertActionController_init__block_invoke;
    v5[3] = &unk_208798;
    objc_copyWeak(&v6, &location);
    [v3 registerUpdateBlock:v5 forRetrieveSelector:"assistiveTouchMouseDwellControlAutorevertEnabled" withListener:v2];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__ASTDwellAutorevertActionController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"DwellAutorevertEnabled" animated:0];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithName:0];
    id v6 = settingsLocString(@"MOUSE_POINTER_DWELL_AUTOREVERT_FOOTER", @"HandSettings");
    [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v7 = settingsLocString(@"MOUSE_POINTER_DWELL_AUTOREVERT_ENABLED", @"HandSettings");
    objc_super v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setDwellControlAutorevertEnabled:specifier:" get:"dwellControlAutorevertEnabled:" detail:0 cell:6 edit:0];

    uint64_t v9 = PSIDKey;
    [v8 setProperty:@"DwellAutorevertEnabled" forKey:PSIDKey];
    [v4 addObject:v8];
    v10 = +[PSSpecifier groupSpecifierWithName:0];

    [v10 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v10 setProperty:@"AutorevertActionGroupID" forKey:v9];
    [v4 addObject:v10];
    id v11 = AXAssistiveTouchIconTypeDwellClick;
    v12 = AXUIAssistiveTouchStringForName();
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v13 setProperty:v11 forKey:@"AutorevertActionValueKey"];
    [v4 addObject:v13];
    id v14 = AXAssistiveTouchIconTypeDwellPause;
    v15 = AXUIAssistiveTouchStringForName();
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v16 setProperty:v14 forKey:@"AutorevertActionValueKey"];
    [v4 addObject:v16];
    v17 = +[AXSettings sharedInstance];
    v18 = [v17 assistiveTouchMouseDwellControlAutorevertAction];

    unsigned __int8 v19 = [v18 isEqualToString:v11];
    v20 = v13;
    if ((v19 & 1) != 0 || (unsigned int v21 = [v18 isEqualToString:v14], v20 = v16, v21)) {
      [v10 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
    *(void *)&self->AXUISettingsBaseListController_opaque[v24] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ASTDwellAutorevertActionController;
  id v6 = a4;
  [(ASTDwellAutorevertActionController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v14.receiver, v14.super_class);

  objc_super v8 = [(ASTDwellAutorevertActionController *)self specifierAtIndex:[(ASTDwellAutorevertActionController *)self indexOfGroup:v7]];
  uint64_t v9 = [v8 propertyForKey:PSIDKey];
  unsigned int v10 = [v9 isEqualToString:@"AutorevertActionGroupID"];

  if (v10)
  {
    id v11 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    v12 = [v11 propertyForKey:@"AutorevertActionValueKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = +[AXSettings sharedInstance];
      [v13 setAssistiveTouchMouseDwellControlAutorevertAction:v12];
    }
  }
}

- (id)dwellControlAutorevertEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchMouseDwellControlAutorevertEnabled]);

  return v4;
}

- (void)setDwellControlAutorevertEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchMouseDwellControlAutorevertEnabled:v4];
}

@end