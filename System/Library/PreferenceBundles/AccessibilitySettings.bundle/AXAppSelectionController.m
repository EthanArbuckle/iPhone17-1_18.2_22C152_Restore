@interface AXAppSelectionController
- (BOOL)includesHomeScreen;
- (BOOL)showsHiddenApps;
- (NSSet)cachedSelectedApps;
- (NSSet)cachedUnselectedApps;
- (id)_appAppliesTo:(id)a3;
- (id)getAppliesToAllApps;
- (id)getSelectedApps;
- (id)getUnselectedApps;
- (id)setAppliesToAllApps;
- (id)setSelectedApps;
- (id)setUnselectedApps;
- (id)specifiers;
- (void)_handleAppDidEnterBackground;
- (void)_hideAppCombinations:(BOOL)a3;
- (void)_setAppliesTo:(id)a3 specifier:(id)a4;
- (void)_showAppCombinationsAnimated:(BOOL)a3;
- (void)_showHiddenApps:(id)a3;
- (void)_updateAppListUI:(BOOL)a3;
- (void)reloadSpecifiers;
- (void)setCachedSelectedApps:(id)a3;
- (void)setCachedUnselectedApps:(id)a3;
- (void)setGetAppliesToAllApps:(id)a3;
- (void)setGetSelectedApps:(id)a3;
- (void)setGetUnselectedApps:(id)a3;
- (void)setIncludesHomeScreen:(BOOL)a3;
- (void)setSetAppliesToAllApps:(id)a3;
- (void)setSetSelectedApps:(id)a3;
- (void)setSetUnselectedApps:(id)a3;
- (void)setShowsHiddenApps:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXAppSelectionController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)AXAppSelectionController;
  [(AXAppSelectionController *)&v10 viewDidLoad];
  v3 = [(AXAppSelectionController *)self getSelectedApps];

  if (v3)
  {
    v4 = [(AXAppSelectionController *)self getSelectedApps];
    v5 = v4[2]();
    [(AXAppSelectionController *)self setCachedSelectedApps:v5];
  }
  v6 = [(AXAppSelectionController *)self getUnselectedApps];

  if (v6)
  {
    v7 = [(AXAppSelectionController *)self getUnselectedApps];
    v8 = v7[2]();
    [(AXAppSelectionController *)self setCachedUnselectedApps:v8];
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_handleAppDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXAppSelectionController;
  [(AXAppSelectionController *)&v3 willBecomeActive];
  [(AXAppSelectionController *)self _updateAppListUI:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AXAppSelectionController;
  -[AXAppSelectionController viewWillAppear:](&v5, "viewWillAppear:");
  [(AXAppSelectionController *)self _updateAppListUI:v3];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    appSpecifiers = self->_appSpecifiers;
    self->_appSpecifiers = 0;

    uint64_t v6 = +[NSMutableArray array];
    v7 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v6;

    v8 = +[NSMutableArray array];
    if (_os_feature_enabled_impl() && !self->_showsHiddenApps)
    {
      v9 = +[PSSpecifier groupSpecifierWithName:0];
      [v8 addObject:v9];
      objc_super v10 = settingsLocString(@"PROTECTED_APPS_SHOW_HIDDEN_TITLE", @"Accessibility");
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v11 setButtonAction:"_showHiddenApps:"];
      [v11 setIdentifier:@"PROTECTED_APPS_SHOW_HIDDEN_TITLE"];
      [v8 addObject:v11];
    }
    v12 = [(AXAppSelectionController *)self getAppliesToAllApps];

    if (v12)
    {
      v13 = settingsLocString(@"APPLIES_TO", @"VoiceOverSettings");
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"_setAppliesTo:specifier:" get:"_appAppliesTo:" detail:0 cell:6 edit:0];

      [v14 setObject:@"AppApplies" forKeyedSubscript:PSIDKey];
      [v8 addObject:v14];
    }
    id v15 = [v8 copy];
    v16 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v15;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_updateAppListUI:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AXAppSelectionController *)self getAppliesToAllApps];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(AXAppSelectionController *)self getAppliesToAllApps],
        v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v8 = v7[2](),
        v7,
        v6,
        v8))
  {
    [(AXAppSelectionController *)self _hideAppCombinations:v3];
  }
  else
  {
    [(AXAppSelectionController *)self _showAppCombinationsAnimated:v3];
  }
}

- (void)_setAppliesTo:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(AXAppSelectionController *)self setAppliesToAllApps];
  id v7 = [v5 BOOLValue];

  ((void (**)(void, id))v6)[2](v6, v7);

  [(AXAppSelectionController *)self _updateAppListUI:1];
}

- (id)_appAppliesTo:(id)a3
{
  v4 = [(AXAppSelectionController *)self getAppliesToAllApps];

  if (v4)
  {
    id v5 = [(AXAppSelectionController *)self getAppliesToAllApps];
    uint64_t v6 = +[NSNumber numberWithBool:v5[2]()];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)reloadSpecifiers
{
  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  v4.receiver = self;
  v4.super_class = (Class)AXAppSelectionController;
  [(AXAppSelectionController *)&v4 reloadSpecifiers];
  [(AXAppSelectionController *)self _updateAppListUI:1];
}

- (void)_showAppCombinationsAnimated:(BOOL)a3
{
  if (!self->_appSpecifiers)
  {
    BOOL v16 = a3;
    objc_super v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    appSpecifiers = self->_appSpecifiers;
    self->_appSpecifiers = v4;

    AXGenerateAppNameSpecifiers(self, self->_appSpecifiers, [(AXAppSelectionController *)self includesHomeScreen]);
    int v6 = _os_feature_enabled_impl();
    v17 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = self->_appSpecifiers;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 propertyForKey:@"BundleIdentifier"];
          if (v6 && !self->_showsHiddenApps)
          {
            if (AXIsHiddenAppWithBundleId()) {
              [v17 addObject:v12];
            }
          }
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)self->_appSpecifiers removeObjectsInArray:v17];
    v14 = self->_appSpecifiers;
    id v15 = [(AXAppSelectionController *)self specifierForID:@"AppApplies"];
    [(AXAppSelectionController *)self insertContiguousSpecifiers:v14 afterSpecifier:v15 animated:v16];
  }
}

- (void)_hideAppCombinations:(BOOL)a3
{
  [(AXAppSelectionController *)self removeContiguousSpecifiers:self->_appSpecifiers animated:a3];
  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;
}

- (void)_showHiddenApps:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)getAPGuardClass_softClass_0;
  uint64_t v13 = getAPGuardClass_softClass_0;
  if (!getAPGuardClass_softClass_0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __getAPGuardClass_block_invoke_0;
    v9[3] = &unk_2089B8;
    v9[4] = &v10;
    __getAPGuardClass_block_invoke_0((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [v6 sharedGuard];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __44__AXAppSelectionController__showHiddenApps___block_invoke;
  v8[3] = &unk_20B080;
  v8[4] = self;
  [v7 authenticateUnconditionallyWithCompletion:v8];
}

void __44__AXAppSelectionController__showHiddenApps___block_invoke(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __44__AXAppSelectionController__showHiddenApps___block_invoke_2;
  v2[3] = &unk_2088F8;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void __44__AXAppSelectionController__showHiddenApps___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setShowsHiddenApps:1];
    v2 = *(void **)(a1 + 32);
    [v2 reloadSpecifiers];
  }
  else
  {
    char v3 = AXLogSettings();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke_2_cold_1(v3);
    }
  }
}

- (void)_handleAppDidEnterBackground
{
  self->_showsHiddenApps = 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXAppSelectionController *)self specifierForIndexPath:v7];
  v23.receiver = self;
  v23.super_class = (Class)AXAppSelectionController;
  [(AXAppSelectionController *)&v23 tableView:v6 didSelectRowAtIndexPath:v7];
  id v9 = [v8 propertyForKey:@"BundleIdentifier"];
  if (v9)
  {
    uint64_t v10 = [(AXAppSelectionController *)self getSelectedApps];

    if (v10)
    {
      v11 = [(AXAppSelectionController *)self getSelectedApps];
      uint64_t v12 = v11[2]();

      if (v12)
      {
        id v13 = [v12 mutableCopy];
      }
      else
      {
        id v13 = +[NSMutableSet set];
      }
      v17 = v13;
      long long v18 = [v6 cellForRowAtIndexPath:v7];
      if ([v17 containsObject:v9])
      {
        [v18 setChecked:0];
        [v17 removeObject:v9];
      }
      else
      {
        [v18 setChecked:1];
        [v17 addObject:v9];
      }
      long long v19 = [(AXAppSelectionController *)self setSelectedApps];

      if (v19)
      {
        long long v20 = [(AXAppSelectionController *)self setSelectedApps];
        ((void (**)(void, void *))v20)[2](v20, v17);
      }
      [(AXAppSelectionController *)self setCachedSelectedApps:v17];
LABEL_22:

      goto LABEL_23;
    }
    v14 = [(AXAppSelectionController *)self getUnselectedApps];

    if (v14)
    {
      id v15 = [(AXAppSelectionController *)self getUnselectedApps];
      uint64_t v12 = v15[2]();

      if (v12)
      {
        id v16 = [v12 mutableCopy];
      }
      else
      {
        id v16 = +[NSMutableSet set];
      }
      v17 = v16;
      long long v18 = [v6 cellForRowAtIndexPath:v7];
      if ([v17 containsObject:v9])
      {
        [v18 setChecked:1];
        [v17 removeObject:v9];
      }
      else
      {
        [v18 setChecked:0];
        [v17 addObject:v9];
      }
      long long v21 = [(AXAppSelectionController *)self setUnselectedApps];

      if (v21)
      {
        v22 = [(AXAppSelectionController *)self setUnselectedApps];
        ((void (**)(void, void *))v22)[2](v22, v17);
      }
      [(AXAppSelectionController *)self setCachedUnselectedApps:v17];
      goto LABEL_22;
    }
  }
LABEL_23:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v15 = [(AXAppSelectionController *)self specifierForIndexPath:a5];
  id v8 = [v15 propertyForKey:@"BundleIdentifier"];
  if (!v8) {
    goto LABEL_6;
  }
  id v9 = [(AXAppSelectionController *)self cachedSelectedApps];

  if (v9)
  {
    uint64_t v10 = [(AXAppSelectionController *)self cachedSelectedApps];
    id v11 = [v10 containsObject:v8];

    goto LABEL_7;
  }
  uint64_t v12 = [(AXAppSelectionController *)self cachedUnselectedApps];

  if (v12)
  {
    id v13 = [(AXAppSelectionController *)self cachedUnselectedApps];
    unsigned int v14 = [v13 containsObject:v8];

    id v11 = (id)(v14 ^ 1);
  }
  else
  {
LABEL_6:
    id v11 = 0;
  }
LABEL_7:
  [v7 setChecked:v11];
  [v7 setAccessibilityTraits:UIAccessibilityTraitButton];
}

- (id)setAppliesToAllApps
{
  return self->_setAppliesToAllApps;
}

- (void)setSetAppliesToAllApps:(id)a3
{
}

- (id)getAppliesToAllApps
{
  return self->_getAppliesToAllApps;
}

- (void)setGetAppliesToAllApps:(id)a3
{
}

- (id)setSelectedApps
{
  return self->_setSelectedApps;
}

- (void)setSetSelectedApps:(id)a3
{
}

- (id)getSelectedApps
{
  return self->_getSelectedApps;
}

- (void)setGetSelectedApps:(id)a3
{
}

- (id)setUnselectedApps
{
  return self->_setUnselectedApps;
}

- (void)setSetUnselectedApps:(id)a3
{
}

- (id)getUnselectedApps
{
  return self->_getUnselectedApps;
}

- (void)setGetUnselectedApps:(id)a3
{
}

- (BOOL)includesHomeScreen
{
  return self->_includesHomeScreen;
}

- (void)setIncludesHomeScreen:(BOOL)a3
{
  self->_includesHomeScreen = a3;
}

- (NSSet)cachedUnselectedApps
{
  return self->_cachedUnselectedApps;
}

- (void)setCachedUnselectedApps:(id)a3
{
}

- (NSSet)cachedSelectedApps
{
  return self->_cachedSelectedApps;
}

- (void)setCachedSelectedApps:(id)a3
{
}

- (BOOL)showsHiddenApps
{
  return self->_showsHiddenApps;
}

- (void)setShowsHiddenApps:(BOOL)a3
{
  self->_showsHiddenApps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSelectedApps, 0);
  objc_storeStrong((id *)&self->_cachedUnselectedApps, 0);
  objc_storeStrong(&self->_getUnselectedApps, 0);
  objc_storeStrong(&self->_setUnselectedApps, 0);
  objc_storeStrong(&self->_getSelectedApps, 0);
  objc_storeStrong(&self->_setSelectedApps, 0);
  objc_storeStrong(&self->_getAppliesToAllApps, 0);
  objc_storeStrong(&self->_setAppliesToAllApps, 0);

  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

@end