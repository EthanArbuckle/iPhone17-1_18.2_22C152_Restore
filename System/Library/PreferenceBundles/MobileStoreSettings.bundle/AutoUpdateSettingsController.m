@interface AutoUpdateSettingsController
- (AutoUpdateSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_automaticUpdatesEnabledForAppSpecifier:(id)a3;
- (id)_globalAutomaticUpdatesEnabled:(id)a3;
- (id)specifiers;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_setAutomaticUpdatesEnabled:(id)a3 forAppSpecifier:(id)a4;
- (void)_setGlobalAutomaticUpdatesEnabled:(id)a3 specifier:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation AutoUpdateSettingsController

- (AutoUpdateSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AutoUpdateSettingsController;
  v4 = [(AutoUpdateSettingsController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES" value:&stru_14C40 table:@"StoreSettings"];
    [(AutoUpdateSettingsController *)v4 setTitle:v6];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"_lowPowerModeChangedNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyAutoUpdatesEnabled, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat))
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = keyExistsAndHasValidFormat == 0;
    }
    char v9 = v8;
    v4->_autoUpdatesEnabledDefault = v9;
    v10 = +[NSProcessInfo processInfo];
    v4->_isLowPowerMode = [v10 isLowPowerModeEnabled];

    v11 = +[LSApplicationWorkspace defaultWorkspace];
    [v11 addObserver:v4];

    sub_697C((id *)v4);
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AutoUpdateSettingsController;
  [(AutoUpdateSettingsController *)&v4 dealloc];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    v20 = self;
    char v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v14 = [v13 correspondingApplicationRecord];
        unsigned int v15 = +[ASDUpdatesService isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:v14];

        if (v15)
        {
          v16 = [v13 bundleIdentifier];
          uint64_t v17 = [v13 localizedName];
          v18 = (void *)v17;
          if (v16) {
            BOOL v19 = v17 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19)
          {
            [v21 addObject:v16];
            [v6 addObject:v18];
            char v10 = 1;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);

    if (v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6E94;
      block[3] = &unk_14908;
      block[4] = v20;
      id v23 = v21;
      id v24 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      char v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) bundleIdentifier];
        [v5 addObject:v11];

        char v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7178;
  v13[3] = &unk_14958;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"AUTO_DOWNLOAD_UPDATES"];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES_PREINSTALLED_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
    uint64_t v29 = PSFooterTextGroupKey;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8);

    v30 = v5;
    [v5 addObject:v6];
    id v9 = objc_alloc((Class)PSSpecifier);
    char v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES" value:&stru_14C40 table:@"StoreSettings"];
    id v12 = [v9 initWithName:v11 target:self set:"_setGlobalAutomaticUpdatesEnabled:specifier:" get:"_globalAutomaticUpdatesEnabled:" detail:0 cell:6 edit:0];

    if (self->_isLowPowerMode) {
      [v12 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    [v30 addObject:v12];
    if (!self->_isLowPowerMode && self->_autoUpdatesEnabledDefault)
    {
      if (!self->_preinstalledApps)
      {
        v13 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:7];
        preinstalledApps = self->_preinstalledApps;
        self->_preinstalledApps = v13;

        nameForBundleID = self->_nameForBundleID;
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_777C;
        v31[3] = &unk_14980;
        v31[4] = self;
        [(NSMutableDictionary *)nameForBundleID enumerateKeysAndObjectsUsingBlock:v31];
        [(NSMutableArray *)self->_preinstalledApps sortUsingComparator:&stru_149C0];
      }
      preinstalledAppsGroup = self->_preinstalledAppsGroup;
      if (!preinstalledAppsGroup)
      {
        long long v17 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v18 = [v17 localizedStringForKey:@"PREINSTALLED_APPS" value:&stru_14C40 table:@"StoreSettings"];
        BOOL v19 = +[PSSpecifier groupSpecifierWithID:@"PREINSTALLED_APPS" name:v18];
        v20 = self->_preinstalledAppsGroup;
        self->_preinstalledAppsGroup = v19;

        id v21 = [(NSMutableArray *)self->_preinstalledApps count];
        v22 = +[NSBundle bundleForClass:objc_opt_class()];
        id v23 = v22;
        if (v21) {
          CFStringRef v24 = @"PREINSTALLED_APPS_EXPLANATION";
        }
        else {
          CFStringRef v24 = @"PREINSTALLED_APPS_EMPTY_EXPLANATION";
        }
        long long v25 = [v22 localizedStringForKey:v24 value:&stru_14C40 table:@"StoreSettings"];
        [(PSSpecifier *)self->_preinstalledAppsGroup setObject:v25 forKeyedSubscript:v29];

        preinstalledAppsGroup = self->_preinstalledAppsGroup;
      }
      [v30 addObject:preinstalledAppsGroup];
      [v30 addObjectsFromArray:self->_preinstalledApps];
    }
    id v26 = [v30 copy];
    long long v27 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v26;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_globalAutomaticUpdatesEnabled:(id)a3
{
  BOOL v3 = self && !self->_isLowPowerMode && self->_autoUpdatesEnabledDefault;
  return +[NSNumber numberWithBool:v3];
}

- (void)_setGlobalAutomaticUpdatesEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v5 = [a3 BOOLValue];
  self->_autoUpdatesEnabledDefault = v5;
  id v6 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v5) {
    id v6 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFStringRef v7 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoUpdatesEnabled, *v6, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v7);
  sub_7A14((uint64_t)self, self->_autoUpdatesEnabledDefault);

  sub_6BA8((char *)self, 0);
}

- (id)_automaticUpdatesEnabledForAppSpecifier:(id)a3
{
  if (self->_isLowPowerMode)
  {
    BOOL v3 = &__kCFBooleanFalse;
  }
  else
  {
    id v4 = a3;
    unsigned int v5 = (void *)CFPreferencesCopyValue(@"AutomaticUpdateAuthorizations", @"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    id v6 = [v4 identifier];

    BOOL v3 = [v5 objectForKeyedSubscript:v6];
  }

  return v3;
}

- (void)_setAutomaticUpdatesEnabled:(id)a3 forAppSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)CFPreferencesCopyValue(@"AutomaticUpdateAuthorizations", @"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  id v9 = v8;
  if (!v8) {
    id v8 = &__NSDictionary0__struct;
  }
  id value = [v8 mutableCopy];

  char v10 = [v6 identifier];

  [value setObject:v7 forKeyedSubscript:v10];
  CFPreferencesSetValue(@"AutomaticUpdateAuthorizations", value, @"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesSynchronize(@"com.apple.appstored", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_7A14((uint64_t)self, 0);
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7CE0;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preinstalledApps, 0);
  objc_storeStrong((id *)&self->_preinstalledAppsGroup, 0);

  objc_storeStrong((id *)&self->_nameForBundleID, 0);
}

@end