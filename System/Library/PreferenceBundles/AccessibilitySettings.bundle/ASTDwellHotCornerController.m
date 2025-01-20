@interface ASTDwellHotCornerController
+ (id)_cornerActionForIdentifier:(id)a3;
- (ASTDwellHotCornerController)init;
- (id)_cornerAction:(id)a3;
- (id)getCurrentActionForHomeActionListController:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)homeActionListController:(id)a3 selectedAction:(id)a4;
@end

@implementation ASTDwellHotCornerController

- (ASTDwellHotCornerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASTDwellHotCornerController;
  v2 = [(ASTDwellHotCornerController *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __35__ASTDwellHotCornerController_init__block_invoke;
    v5[3] = &unk_208798;
    objc_copyWeak(&v6, &location);
    [v3 registerUpdateBlock:v5 forRetrieveSelector:"assistiveTouchMouseDwellControlCornerCustomization" withListener:v2];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__ASTDwellHotCornerController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v18 = +[PSSpecifier emptyGroupSpecifier];
    id v6 = settingsLocString(@"DWELL_HOT_CORNER_FOOTER", @"HandSettings");
    [v18 setProperty:v6 forKey:PSFooterTextGroupKey];

    [v5 addObject:v18];
    v7 = settingsLocString(@"DWELL_HOT_CORNER_TOP_LEFT", @"HandSettings");
    v17 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_cornerAction:" detail:objc_opt_class() cell:2 edit:0];

    [v17 setProperty:AXSAssistiveTouchMouseDwellControlTopLeftHotCorner forKey:@"HOT_CORNER_IDENTIFIER"];
    [v17 setProperty:&off_229540 forKey:@"HomeAction"];
    uint64_t v8 = PSIDKey;
    [v17 setProperty:@"TopLeft" forKey:PSIDKey];
    [v5 addObject:v17];
    v9 = settingsLocString(@"DWELL_HOT_CORNER_TOP_RIGHT", @"HandSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"_cornerAction:" detail:objc_opt_class() cell:2 edit:0];

    [v10 setProperty:AXSAssistiveTouchMouseDwellControlTopRightHotCorner forKey:@"HOT_CORNER_IDENTIFIER"];
    [v10 setProperty:&off_229558 forKey:@"HomeAction"];
    [v10 setProperty:@"TopRight" forKey:v8];
    [v5 addObject:v10];
    v11 = settingsLocString(@"DWELL_HOT_CORNER_BOTTOM_LEFT", @"HandSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_cornerAction:" detail:objc_opt_class() cell:2 edit:0];

    [v12 setProperty:AXSAssistiveTouchMouseDwellControlBottomLeftHotCorner forKey:@"HOT_CORNER_IDENTIFIER"];
    [v12 setProperty:&off_229570 forKey:@"HomeAction"];
    [v12 setProperty:@"BottomLeft" forKey:v8];
    [v5 addObject:v12];
    v13 = settingsLocString(@"DWELL_HOT_CORNER_BOTTOM_RIGHT", @"HandSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_cornerAction:" detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:AXSAssistiveTouchMouseDwellControlBottomRightHotCorner forKey:@"HOT_CORNER_IDENTIFIER"];
    [v14 setProperty:&off_229588 forKey:@"HomeAction"];
    [v14 setProperty:@"BottomRight" forKey:v8];
    [v5 addObject:v14];
    v15 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASTDwellHotCornerController;
  v4 = [(ASTDwellHotCornerController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)_cornerAction:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"HOT_CORNER_IDENTIFIER"];
  v4 = +[ASTDwellHotCornerController _cornerActionForIdentifier:v3];
  if (v4)
  {
    v5 = AXUIAssistiveTouchStringForName();
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    objc_super v6 = AXParameterizedLocalizedString();
  }

  return v6;
}

+ (id)_cornerActionForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[AXSettings sharedInstance];
  v5 = [v4 assistiveTouchMouseDwellControlCornerCustomization];

  objc_super v6 = [v5 objectForKey:v3];

  if ([v6 isEqualToString:@"__NONE__"]) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }

  return v7;
}

- (id)getCurrentActionForHomeActionListController:(id)a3
{
  id v3 = (char *)[a3 homeActionType];
  if ((unint64_t)(v3 - 6) > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[ASTDwellHotCornerController _cornerActionForIdentifier:*(void *)*(&off_209D78 + (void)(v3 - 6))];
  }

  return v4;
}

- (void)homeActionListController:(id)a3 selectedAction:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  objc_super v6 = +[AXSettings sharedInstance];
  id v7 = [v6 assistiveTouchMouseDwellControlCornerCustomization];
  id v8 = [v7 mutableCopy];

  v9 = (char *)[v5 homeActionType];
  if ((unint64_t)(v9 - 6) <= 3)
  {
    [v8 setObject:v11 forKeyedSubscript:*(void *)*(&off_209D78 + (void)(v9 - 6))];
    v10 = +[AXSettings sharedInstance];
    [v10 setAssistiveTouchMouseDwellControlCornerCustomization:v8];
  }
}

@end