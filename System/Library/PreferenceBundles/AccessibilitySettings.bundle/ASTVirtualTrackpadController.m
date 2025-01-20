@interface ASTVirtualTrackpadController
- (ASTVirtualTrackpadController)init;
- (id)fadeDelay;
- (id)fullScreenToggleEnabled;
- (id)holdDuration;
- (id)scrollToggleEnabled;
- (id)specifiers;
- (id)virtualTrackpadEnabled:(id)a3;
- (id)virtualTrackpadScrollSpeed;
- (id)virtualTrackpadSpeed;
- (void)setFadeDelay:(id)a3;
- (void)setFullScreenToggleEnabled:(id)a3;
- (void)setHoldDuration:(id)a3;
- (void)setScrollToggleEnabled:(id)a3;
- (void)setVirtualTrackpadEnabled:(id)a3 specifier:(id)a4;
- (void)setVirtualTrackpadScrollSpeed:(id)a3;
- (void)setVirtualTrackpadSpeed:(id)a3;
@end

@implementation ASTVirtualTrackpadController

- (ASTVirtualTrackpadController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASTVirtualTrackpadController;
  v2 = [(ASTVirtualTrackpadController *)&v8 init];
  if (v2 && AXDeviceSupportsVirtualTrackpad())
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __36__ASTVirtualTrackpadController_init__block_invoke;
    v5[3] = &unk_208798;
    objc_copyWeak(&v6, &location);
    [v3 registerUpdateBlock:v5 forRetrieveSelector:"assistiveTouchVirtualTrackpadEnabled" withListener:v2];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__ASTVirtualTrackpadController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"VirtualTrackpadEnabledSpecifier" animated:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = settingsLocString(@"ASTVirtualTrackpadToggleTitle", @"HandSettings");
    v38 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setVirtualTrackpadEnabled:specifier:" get:"virtualTrackpadEnabled:" detail:0 cell:6 edit:0];

    [v38 setIdentifier:@"VirtualTrackpadEnabledSpecifier"];
    [v5 addObject:v38];
    v7 = settingsLocString(@"ASTVirtualTrackpadTrackingSpeed", @"HandSettings");
    objc_super v8 = +[PSSpecifier groupSpecifierWithName:v7];

    [v5 addObject:v8];
    v9 = settingsLocString(@"ASTVirtualTrackpadTrackingSpeed", @"HandSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setVirtualTrackpadSpeed:" get:"virtualTrackpadSpeed" detail:0 cell:5 edit:0];

    uint64_t v37 = PSControlMinimumKey;
    objc_msgSend(v10, "setProperty:forKey:", &off_22C370);
    uint64_t v36 = PSControlMaximumKey;
    objc_msgSend(v10, "setProperty:forKey:", &off_2291F8);
    v11 = AXHareImage();
    uint64_t v35 = PSSliderRightImageKey;
    objc_msgSend(v10, "setProperty:forKey:", v11);

    v12 = AXTortoiseImage();
    uint64_t v34 = PSSliderLeftImageKey;
    objc_msgSend(v10, "setProperty:forKey:", v12);

    uint64_t v13 = PSIDKey;
    [v10 setProperty:@"TRACKING_SPEED_SLIDER" forKey:PSIDKey];
    [v5 addObject:v10];
    v14 = +[PSSpecifier emptyGroupSpecifier];

    v15 = settingsLocString(@"ASTVirtualTrackpadScrollOptionToggleFooter", @"HandSettings");
    [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

    [v5 addObject:v14];
    v16 = settingsLocString(@"ASTVirtualTrackpadScrollOptionToggleTitle", @"HandSettings");
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setScrollToggleEnabled:" get:"scrollToggleEnabled" detail:0 cell:6 edit:0];

    [v17 setProperty:@"NATURAL_SCROLLING" forKey:v13];
    [v5 addObject:v17];
    v18 = settingsLocString(@"ASTVirtualTrackpadScrollSpeed", @"HandSettings");
    v19 = +[PSSpecifier groupSpecifierWithName:v18];

    [v5 addObject:v19];
    v20 = settingsLocString(@"ASTVirtualTrackpadScrollSpeed", @"HandSettings");
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:"setVirtualTrackpadScrollSpeed:" get:"virtualTrackpadScrollSpeed" detail:0 cell:5 edit:0];

    [v21 setProperty:&off_22C380 forKey:v37];
    [v21 setProperty:&off_229210 forKey:v36];
    v22 = AXHareImage();
    [v21 setProperty:v22 forKey:v35];

    v23 = AXTortoiseImage();
    [v21 setProperty:v23 forKey:v34];

    [v21 setProperty:@"SCROLL_SPEED_SLIDER" forKey:v13];
    [v5 addObject:v21];
    v24 = settingsLocString(@"ASTVirtualTrackpadAppearance", @"HandSettings");
    v25 = +[PSSpecifier groupSpecifierWithName:v24];

    [v5 addObject:v25];
    v26 = settingsLocString(@"ASTVirtualTrackpadBorderTitle", @"Accessibility-hello");
    v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v27 setProperty:@"BORDER" forKey:v13];
    [v5 addObject:v27];
    v28 = settingsLocString(@"ASTVirtualTrackpadTitle", @"Accessibility-hello");
    v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v29 setProperty:@"TRACKPAD" forKey:v13];
    [v5 addObject:v29];
    v30 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v31 = settingsLocString(@"PointerControlTitle", @"Accessibility-hello");
    [v30 setName:v31];

    [v30 setObject:@"POINTER_CONTROL" forKeyedSubscript:v13];
    [v5 addObject:v30];
    v32 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)virtualTrackpadEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchVirtualTrackpadEnabled]);

  return v4;
}

- (void)setVirtualTrackpadEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchVirtualTrackpadEnabled:v4];
}

- (id)virtualTrackpadSpeed
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadSpeed];
  *(float *)&double v3 = v3;
  id v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setVirtualTrackpadSpeed:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadSpeed:v5];
}

- (id)scrollToggleEnabled
{
  v2 = +[AXSettings sharedInstance];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 assistiveTouchVirtualTrackpadScrollToggleEnabled]);

  return v3;
}

- (void)setScrollToggleEnabled:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v4 = [v3 BOOLValue];

  [v5 setAssistiveTouchVirtualTrackpadScrollToggleEnabled:v4];
}

- (id)fullScreenToggleEnabled
{
  v2 = +[AXSettings sharedInstance];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 assistiveTouchVirtualTrackpadFullScreenToggleEnabled]);

  return v3;
}

- (void)setFullScreenToggleEnabled:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v4 = [v3 BOOLValue];

  [v5 setAssistiveTouchVirtualTrackpadFullScreenToggleEnabled:v4];
}

- (id)virtualTrackpadScrollSpeed
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadScrollSpeed];
  *(float *)&double v3 = v3;
  id v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setVirtualTrackpadScrollSpeed:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadScrollSpeed:v5];
}

- (id)holdDuration
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadHoldDuration];
  *(float *)&double v3 = v3;
  float v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setHoldDuration:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadHoldDuration:v5];
}

- (id)fadeDelay
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadFadeDelay];
  *(float *)&double v3 = v3;
  float v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setFadeDelay:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadFadeDelay:v5];
}

@end