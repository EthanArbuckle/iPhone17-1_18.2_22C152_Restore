@interface VoiceOverRotorSettingsController
- (VoiceOverRotorSettingsController)init;
- (id)editAppsActionEnabled:(id)a3;
- (id)specifiers;
- (id)updateRotorWithElement:(id)a3;
- (void)setEditAppsActionEnabled:(id)a3 specifier:(id)a4;
- (void)setUpdateRotorWithElement:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverRotorSettingsController

- (VoiceOverRotorSettingsController)init
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverRotorSettingsController;
  v2 = [(VoiceOverRotorSettingsController *)&v7 init];
  if (v2)
  {
    v3 = settingsLocString(@"ROTOR_GROUP_HEADING", @"VoiceOverSettings");
    v4 = [(VoiceOverRotorSettingsController *)v2 navigationItem];
    [v4 setTitle:v3];

    v5 = v2;
  }

  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    objc_super v7 = settingsLocString(@"WEB_ROTOR", @"VoiceOverSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    uint64_t v9 = PSIDKey;
    [v8 setProperty:@"WebRotor" forKey:PSIDKey];
    [v5 addObject:v8];
    v10 = +[PSSpecifier emptyGroupSpecifier];

    v11 = settingsLocString(@"STICKY_ROTOR_TITLE_FOOTER", @"VoiceOverSettings");
    uint64_t v12 = PSFooterTextGroupKey;
    [v10 setProperty:v11 forKey:PSFooterTextGroupKey];

    [v5 addObject:v10];
    v13 = settingsLocString(@"STICKY_ROTOR_TITLE", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"setUpdateRotorWithElement:specifier:" get:"updateRotorWithElement:" detail:0 cell:6 edit:0];

    [v5 addObject:v14];
    v15 = +[PSSpecifier emptyGroupSpecifier];
    v16 = settingsLocString(@"DIRECT_TOUCH_APPS_FOOTER", @"VoiceOverSettings");
    [v15 setProperty:v16 forKey:v12];

    [v5 addObject:v15];
    v17 = settingsLocString(@"EDIT_APPS_ACTION", @"VoiceOverSettings");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"setEditAppsActionEnabled:specifier:" get:"editAppsActionEnabled:" detail:0 cell:6 edit:0];

    [v18 setProperty:@"editApps" forKey:v9];
    [v5 addObject:v18];
    v19 = settingsLocString(@"DIRECT_TOUCH_APPS", @"VoiceOverSettings");
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v20 setProperty:@"apps" forKey:v9];
    [v5 addObject:v20];
    v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)setUpdateRotorWithElement:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverRotorUpdatesWithElement:v4];
}

- (id)updateRotorWithElement:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverRotorUpdatesWithElement]);

  return v4;
}

- (void)setEditAppsActionEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverEditAppsActionEnabled:v4];
}

- (id)editAppsActionEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverEditAppsActionEnabled]);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VoiceOverRotorSettingsController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [v8 propertyForKey:PSIDKey];
  unsigned int v10 = [v9 isEqualToString:@"apps"];

  if (v10)
  {
    v11 = objc_alloc_init(AXAppSelectionController);
    uint64_t v12 = [(VoiceOverRotorSettingsController *)self rootController];
    [(AXAppSelectionController *)v11 setRootController:v12];

    [(AXAppSelectionController *)v11 setSpecifier:v8];
    [(AXAppSelectionController *)v11 setParentController:self];
    [(AXAppSelectionController *)v11 setIncludesHomeScreen:0];
    [(AXAppSelectionController *)v11 setGetUnselectedApps:&__block_literal_global_10];
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __70__VoiceOverRotorSettingsController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v14[3] = &unk_209698;
    objc_copyWeak(&v15, &location);
    [(AXAppSelectionController *)v11 setSetUnselectedApps:v14];
    [(VoiceOverRotorSettingsController *)self showController:v11 animate:1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VoiceOverRotorSettingsController;
    [(VoiceOverRotorSettingsController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

NSSet *__cdecl __70__VoiceOverRotorSettingsController_tableView_didSelectRowAtIndexPath___block_invoke(id a1)
{
  v1 = +[NSMutableSet set];
  v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 voiceOverDirectTouchEnabledApps];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          unsigned int v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v14);
          unsigned __int8 v11 = [v10 BOOLValue];

          if ((v11 & 1) == 0) {
            [v1 addObject:v9];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v12 = +[LSApplicationWorkspace defaultWorkspace];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __70__VoiceOverRotorSettingsController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v18[3] = &unk_209670;
    id v19 = v1;
    [v12 enumerateBundlesOfType:1 block:v18];

    id v4 = v19;
  }

  return (NSSet *)v1;
}

void __70__VoiceOverRotorSettingsController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

void __70__VoiceOverRotorSettingsController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[AXSettings sharedInstance];
  id v6 = [v5 voiceOverDirectTouchEnabledApps];
  id v7 = [v6 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = objc_msgSend(v7, "allKeys", 0);
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 containsObject:v13] ^ 1);
        [v7 setObject:v14 forKeyedSubscript:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v15 = +[AXSettings sharedInstance];
  [v15 setVoiceOverDirectTouchEnabledApps:v7];

  [WeakRetained reloadSpecifierID:@"apps"];
}

@end