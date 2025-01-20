@interface AXAppsViewController
- (BOOL)canEditTable;
- (BOOL)showsHiddenApps;
- (id)_generateAppSpecifiers;
- (id)_generateSpecifierForAppID:(id)a3 name:(id)a4;
- (id)makeSpecifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_generateApps;
- (void)_handleAppDidEnterBackground;
- (void)_launchAppsController;
- (void)_showHiddenApps:(id)a3;
- (void)addAppSpecifier:(id)a3;
- (void)applicationDidResume;
- (void)removeDataForSpecifier:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsHiddenApps:(BOOL)a3;
- (void)showHiddenAppsWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXAppsViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AXAppsViewController;
  [(AXAppsViewController *)&v4 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleAppDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)applicationDidResume
{
  v4.receiver = self;
  v4.super_class = (Class)AXAppsViewController;
  [(AXAppsViewController *)&v4 applicationDidResume];
  apps = self->_apps;
  self->_apps = 0;

  [(AXAppsViewController *)self reloadSpecifiers];
}

- (void)addAppSpecifier:(id)a3
{
  id v4 = a3;
  id v9 = [v4 propertyForKey:@"BundleIdentifier"];
  apps = self->_apps;
  v6 = [v4 name];

  [(NSMutableDictionary *)apps setObject:v6 forKey:v9];
  v7 = +[NSUserDefaults standardUserDefaults];
  v8 = [(NSMutableDictionary *)self->_apps allKeys];
  [v7 setObject:v8 forKey:@"AXSettingsPerAppIDsArray"];

  [(AXAppsViewController *)self reloadSpecifiers];
}

- (void)showHiddenAppsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getAPGuardClass_softClass;
  uint64_t v15 = getAPGuardClass_softClass;
  if (!getAPGuardClass_softClass)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __getAPGuardClass_block_invoke;
    v11[3] = &unk_2089B8;
    v11[4] = &v12;
    __getAPGuardClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = [v6 sharedGuard];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke;
  v9[3] = &unk_209E30;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 authenticateUnconditionallyWithCompletion:v9];
}

void __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke_2;
  block[3] = &unk_209E08;
  char v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setShowsHiddenApps:1];
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
  else
  {
    v2 = AXLogSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke_2_cold_1(v2);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (id)makeSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (_os_feature_enabled_impl() && !self->_showsHiddenApps)
  {
    id v4 = +[PSSpecifier groupSpecifierWithName:0];
    [v3 addObject:v4];
    char v5 = settingsLocString(@"PROTECTED_APPS_SHOW_HIDDEN_TITLE", @"Accessibility");
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v6 setButtonAction:"_showHiddenApps:"];
    [v6 setIdentifier:@"PROTECTED_APPS_SHOW_HIDDEN_TITLE"];
    [v3 addObject:v6];
  }
  v7 = settingsLocString(@"PERAPPSETTINGS_CUSTOMIZATION_TITLE", @"Accessibility");
  id v8 = +[PSSpecifier groupSpecifierWithName:v7];

  [v3 addObject:v8];
  id v9 = settingsLocString(@"PERAPPSETTINGS_ADD_APP_TITLE", @"Accessibility");
  id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v10 setButtonAction:"_launchAppsController"];
  [v10 setIdentifier:@"AX_ADD_BUTTON_IDENTIFIER"];
  [v3 addObject:v10];
  v11 = [(AXAppsViewController *)self _generateAppSpecifiers];
  [v3 addObjectsFromArray:v11];

  return v3;
}

- (BOOL)canEditTable
{
  return [(NSMutableDictionary *)self->_apps count] != 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXAppsViewController;
  [(AXAppsViewController *)&v8 setEditing:a3 animated:a4];
  id v6 = [(AXAppsViewController *)self specifierForID:@"AX_ADD_BUTTON_IDENTIFIER"];
  v7 = +[NSNumber numberWithInt:!v4];
  [v6 setProperty:v7 forKey:PSEnabledKey];

  [(AXAppsViewController *)self reloadSpecifier:v6 animated:1];
}

- (void)removeDataForSpecifier:(id)a3
{
  id v7 = [a3 propertyForKey:@"BundleIdentifier"];
  [(NSMutableDictionary *)self->_apps removeObjectForKey:v7];
  _AXSSetEnhanceTextLegibilityEnabledApp();
  _AXSSetButtonShapesEnabledApp();
  _AXSSetIncreaseButtonLegibilityApp();
  _AXSSetEnhanceBackgroundContrastEnabledApp();
  _AXSSetDarkenSystemColorsApp();
  _AXSSetDifferentiateWithoutColorEnabledApp();
  _AXSInvertColorsSetEnabledApp();
  _AXSSetReduceMotionEnabledApp();
  _AXSSetReduceMotionReduceSlideTransitionsEnabledApp();
  _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp();
  _AXSSetPreferredContentSizeCategoryNameApp();
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  char v5 = [(NSMutableDictionary *)self->_apps allKeys];
  [v4 setObject:v5 forKey:@"AXSettingsPerAppIDsArray"];

  id v6 = +[AXSettings sharedInstance];
  [v6 aggregatePerAppSettingsStatistics];
}

- (void)_showHiddenApps:(id)a3
{
}

- (id)_generateAppSpecifiers
{
  if (!self->_apps) {
    [(AXAppsViewController *)self _generateApps];
  }
  int v3 = _os_feature_enabled_impl();
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v5 = self->_apps;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (!v3 || self->_showsHiddenApps || (AXIsHiddenAppWithBundleId() & 1) == 0)
        {
          v11 = -[NSMutableDictionary valueForKey:](self->_apps, "valueForKey:", v10, (void)v14);
          uint64_t v12 = [(AXAppsViewController *)self _generateSpecifierForAppID:v10 name:v11];

          [v4 addObject:v12];
        }
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_19];

  return v4;
}

int64_t __46__AXAppsViewController__generateAppSpecifiers__block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  char v5 = [a2 name];
  id v6 = [v4 name];

  id v7 = [v5 caseInsensitiveCompare:v6];
  return (int64_t)v7;
}

- (id)_generateSpecifierForAppID:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v8 setProperty:v6 forKey:@"BundleIdentifier"];
  [v8 setProperty:v6 forKey:PSIDKey];
  if (AXFlipsIconRightToLeftForAppID(v6))
  {
    id v9 = AXImageIconForAppID(v6);
    [v8 setProperty:v9 forKey:PSIconImageKey];
LABEL_5:

    goto LABEL_6;
  }
  if ([v6 isEqualToString:AX_SpringBoardBundleName])
  {
    id v9 = +[PKIconImageCache settingsIconCache];
    uint64_t v10 = [v9 imageForKey:PKHomeScreenIconKey];
    [v8 setProperty:v10 forKey:PSIconImageKey];

    goto LABEL_5;
  }
  if ([v6 isEqualToString:AX_LiveTranscriptionBundleName])
  {
    uint64_t v12 = AXSettingsBundle();
    v13 = +[UIImage imageNamed:@"LiveCaptions" inBundle:v12];
    [v8 setProperty:v13 forKey:PSIconImageKey];
  }
  else
  {
    [v8 setProperty:v6 forKey:PSLazyIconAppID];
    [v8 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  }
LABEL_6:

  return v8;
}

- (void)_launchAppsController
{
  id v5 = (id)objc_opt_new();
  int v3 = objc_opt_new();
  id v4 = settingsLocString(@"PERAPPSETTINGS_CHOOSE_APP_TO_CUSTOMIZE_TITLE", @"Accessibility");
  [v3 setTitle:v4];

  [v3 setParentController:self];
  [v3 setShowsHiddenApps:self->_showsHiddenApps];
  [v3 setSelectedApps:self->_apps];
  [v5 setModalPresentationStyle:2];
  [v5 pushViewController:v3 animated:0];
  [(AXAppsViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_generateApps
{
  int v3 = (NSMutableDictionary *)objc_opt_new();
  apps = self->_apps;
  self->_apps = v3;

  char v22 = 0;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"AXSettingsPerAppIDsArray"];
  id v7 = __UIAccessibilitySafeClass();

  id v8 = [v7 mutableCopy];
  uint64_t v9 = AX_LiveTranscriptionBundleName;
  if ([v8 containsObject:AX_LiveTranscriptionBundleName])
  {
    [v8 removeObject:v9];
    uint64_t v10 = +[AXSettings sharedInstance];
    [v10 setPerAppSettingsCustomizedAppIDs:v8];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v17 = AXAppNameForBundleId();
        if (v17) {
          -[NSMutableDictionary setObject:forKey:](self->_apps, "setObject:forKey:", v17, v16, (void)v18);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

- (void)_handleAppDidEnterBackground
{
  self->_showsHiddenApps = 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(AXAppsViewController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"BundleIdentifier"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AXAppsViewController;
  id v6 = a4;
  id v7 = [(AXAppsViewController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[AXAppsViewController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v18.receiver, v18.super_class);

  uint64_t v9 = [v8 propertyForKey:PSIconImageKey];
  if (v9)
  {
    uint64_t v10 = kISImageDescriptorTableUIName;
    id v11 = v7;
    id v12 = +[ISImageDescriptor imageDescriptorNamed:v10];
    [v12 continuousCornerRadius];
    double v14 = v13;

    long long v15 = [v11 iconImageView];
    [v15 _setContinuousCornerRadius:v14];

    uint64_t v16 = [v11 iconImageView];

    [v16 setClipsToBounds:1];
  }

  return v7;
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
}

void __53__AXAppsViewController_showHiddenAppsWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Couldn't show hidden protected apps, auth failed", v1, 2u);
}

@end