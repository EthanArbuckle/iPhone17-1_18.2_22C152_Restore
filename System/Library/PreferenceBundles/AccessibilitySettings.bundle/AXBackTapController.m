@interface AXBackTapController
- (AXBackTapController)init;
- (id)actionForActionPickerController:(id)a3;
- (id)backTapFalsePositiveAlertsEnabled:(id)a3;
- (id)backTapRNNModelEnabled:(id)a3;
- (id)doubleTapAction:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)tripleTapAction:(id)a3;
- (void)actionPickerController:(id)a3 didSelectAction:(id)a4;
- (void)setBackTapFalsePositiveAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)setBackTapRNNModelEnabled:(id)a3 specifier:(id)a4;
- (void)updateBackTapEnabled;
@end

@implementation AXBackTapController

- (AXBackTapController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXBackTapController;
  v2 = [(AXBackTapController *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSiriShortcutsManager sharedManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __27__AXBackTapController_init__block_invoke;
    v6[3] = &unk_2099A8;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 registerShortcutsDidChangeBlock:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__AXBackTapController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v4);
}

void __27__AXBackTapController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v20 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    v5 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v6 = AXInBuddySetupKey;
    [v5 setProperty:&__kCFBooleanFalse forKey:AXInBuddySetupKey];
    [v4 addObject:v5];
    id v7 = settingsLocString(@"DOUBLE_TAP", @"Accessibility");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"doubleTapAction:" detail:objc_opt_class() cell:2 edit:0];

    [v8 setProperty:&__kCFBooleanFalse forKey:v6];
    [v8 setIdentifier:@"DoubleTap"];
    uint64_t v9 = PSIDKey;
    [v8 setProperty:@"DoubleTap" forKey:PSIDKey];
    [v4 addObject:v8];
    v10 = settingsLocString(@"TRIPLE_TAP", @"Accessibility");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"tripleTapAction:" detail:objc_opt_class() cell:2 edit:0];

    [v11 setProperty:&__kCFBooleanFalse forKey:v6];
    [v11 setIdentifier:@"TripleTap"];
    [v11 setProperty:@"TripleTap" forKey:v9];
    [v4 addObject:v11];
    if (AXIsInternalInstall())
    {
      v12 = +[PSSpecifier emptyGroupSpecifier];

      [v12 setProperty:&__kCFBooleanFalse forKey:v6];
      v13 = settingsLocString(@"FALSE_POSITIVE_COLLECTION_FOOTER", @"Accessibility");
      [v12 setProperty:v13 forKey:PSFooterTextGroupKey];

      [v4 addObject:v12];
      v14 = settingsLocString(@"FALSE_POSITIVE_COLLECTION", @"Accessibility");
      v11 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setBackTapFalsePositiveAlertsEnabled:specifier:" get:"backTapFalsePositiveAlertsEnabled:" detail:objc_opt_class() cell:6 edit:0];

      [v11 setProperty:&__kCFBooleanFalse forKey:v6];
      [v4 addObject:v11];
      uint64_t v15 = v20;
      if (_os_feature_enabled_impl())
      {
        v16 = +[PSSpecifier emptyGroupSpecifier];

        [v16 setProperty:&__kCFBooleanFalse forKey:v6];
        [v4 addObject:v16];
        v17 = settingsLocString(@"BACK_TAP_MODEL", @"Accessibility");
        v11 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"setBackTapRNNModelEnabled:specifier:" get:"backTapRNNModelEnabled:" detail:objc_opt_class() cell:6 edit:0];

        [v11 setProperty:&__kCFBooleanFalse forKey:v6];
        [v4 addObject:v11];
      }
    }
    else
    {
      uint64_t v15 = v20;
    }
    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
    *(void *)&self->AXUISettingsBaseListController_opaque[v15] = v4;

    id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
  }

  return v3;
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXBackTapController;
  v5 = [(AXBackTapController *)&v8 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDelegate:self];
    uint64_t v6 = [v4 identifier];
    [v5 setIdentifier:v6];
  }

  return v5;
}

- (id)doubleTapAction:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 backTapDoubleTapAction];

  if (v4) {
    AXUIAssistiveTouchStringForName();
  }
  else {
  v5 = settingsLocString(@"NONE", @"HandSettings");
  }

  return v5;
}

- (id)tripleTapAction:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 backTapTripleTapAction];

  if (v4) {
    AXUIAssistiveTouchStringForName();
  }
  else {
  v5 = settingsLocString(@"NONE", @"HandSettings");
  }

  return v5;
}

- (id)actionForActionPickerController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  unsigned int v5 = [v4 isEqualToString:@"DoubleTap"];

  if (v5)
  {
    uint64_t v6 = +[AXSettings sharedInstance];
    uint64_t v7 = [v6 backTapDoubleTapAction];
LABEL_5:
    v10 = (void *)v7;

    goto LABEL_7;
  }
  objc_super v8 = [v3 identifier];
  unsigned int v9 = [v8 isEqualToString:@"TripleTap"];

  if (v9)
  {
    uint64_t v6 = +[AXSettings sharedInstance];
    uint64_t v7 = [v6 backTapTripleTapAction];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)actionPickerController:(id)a3 didSelectAction:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 identifier];
  unsigned int v8 = [v7 isEqualToString:@"DoubleTap"];

  if (v8)
  {
    unsigned int v9 = +[AXSettings sharedInstance];
    [v9 setBackTapDoubleTapAction:v6];
  }
  else
  {
    v10 = [v13 identifier];
    unsigned int v11 = [v10 isEqualToString:@"TripleTap"];

    if (!v11) {
      goto LABEL_6;
    }
    unsigned int v9 = +[AXSettings sharedInstance];
    [v9 setBackTapTripleTapAction:v6];
  }

LABEL_6:
  v12 = [v13 identifier];
  [(AXBackTapController *)self reloadSpecifierID:v12];

  [(AXBackTapController *)self updateBackTapEnabled];
}

- (void)updateBackTapEnabled
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 backTapDoubleTapAction];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    unsigned int v5 = +[AXSettings sharedInstance];
    id v6 = [v5 backTapTripleTapAction];
    BOOL v4 = v6 != 0;
  }
  id v7 = +[AXSettings sharedInstance];
  [v7 setBackTapEnabled:v4];
}

- (id)backTapFalsePositiveAlertsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  BOOL v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 backTapFalsePositiveAlertsEnabled]);

  return v4;
}

- (void)setBackTapFalsePositiveAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setBackTapFalsePositiveAlertsEnabled:v4];
}

- (id)backTapRNNModelEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 backTapRNNModelEnabled]);

  return v4;
}

- (void)setBackTapRNNModelEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setBackTapRNNModelEnabled:v4];
}

@end