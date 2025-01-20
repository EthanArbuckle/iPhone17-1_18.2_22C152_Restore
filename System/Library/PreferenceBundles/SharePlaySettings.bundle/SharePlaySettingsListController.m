@interface SharePlaySettingsListController
- (PSSpecifier)mainSwitchSpecifier;
- (SharePlayProviderController)providerController;
- (TUUserConfiguration)userConfiguration;
- (id)mainSwitchOn:(id)a3;
- (id)providerForSpecifier:(id)a3;
- (id)providerSpecifiers;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (void)emitNavigationEvent;
- (void)refreshView;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setProviderController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)sharePlayController:(id)a3 didChangeProvider:(id)a4;
- (void)sharePlayController:(id)a3 didRemoveProvider:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SharePlaySettingsListController

- (id)providerSpecifiers
{
  id v26 = +[NSMutableArray array];
  v3 = [(SharePlaySettingsListController *)self providerController];
  v4 = [v3 providers];

  if ([v4 count])
  {
    v24 = v4;
    v5 = +[SharePlaySettingsStrings localizedStringForKey:@"LIST_CONTROLLER_PROVIDERS_GROUP_SPECIFIER_TITLE"];
    v6 = +[PSSpecifier groupSpecifierWithName:v5];

    v7 = +[SharePlaySettingsStrings localizedStringForKey:@"LIST_CONTROLLER_PROVIDERS_GROUP_SPECIFIER_DETAIL"];
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    v23 = v6;
    [v26 addObject:v6];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = [(SharePlaySettingsListController *)self providerController];
    v9 = [v8 providers];

    id obj = v9;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      uint64_t v13 = PSIconImageKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = [v15 localizedName];
          v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

          v18 = [v15 bundleIdentifier];
          [v17 setIdentifier:v18];

          v19 = [v15 iconImage];
          [v17 setProperty:v19 forKey:v13];

          v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          [v17 setProperty:v15 forKey:v21];

          [v26 addObject:v17];
        }
        id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    v4 = v24;
  }

  return v26;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = +[SharePlaySettingsStrings localizedStringForKey:@"LIST_CONTROLLER_MAIN_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setMainSwitchOn:specifier:" get:"mainSwitchOn:" detail:0 cell:6 edit:0];
    v6 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v5;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }

  return mainSwitchSpecifier;
}

- (id)mainSwitchOn:(id)a3
{
  v3 = [(SharePlaySettingsListController *)self providerController];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEnabled]);

  return v4;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  v6 = SharePlaySettingsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"DISABLED";
    if (v5) {
      CFStringRef v7 = @"ENABLED";
    }
    int v9 = 138412290;
    CFStringRef v10 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting SharePlay service to %@.", (uint8_t *)&v9, 0xCu);
  }

  v8 = [(SharePlaySettingsListController *)self providerController];
  [v8 setEnabled:v5];
}

- (id)readPreferenceValue:(id)a3
{
  v3 = [(SharePlaySettingsListController *)self providerForSpecifier:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 isEnabled];
    v6 = SharePlaySettingsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 localizedName];
      v8 = (void *)v7;
      CFStringRef v9 = @"DISABLED";
      if (v5) {
        CFStringRef v9 = @"ENABLED";
      }
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      CFStringRef v15 = v9;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Getting SharePlay provider %@ as %@", (uint8_t *)&v12, 0x16u);
    }
    CFStringRef v10 = +[NSNumber numberWithBool:v5];
  }
  else
  {
    CFStringRef v10 = 0;
  }

  return v10;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(SharePlaySettingsListController *)self providerForSpecifier:a4];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = [v6 BOOLValue];
    }
    else {
      id v8 = 0;
    }
    CFStringRef v9 = SharePlaySettingsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 bundleIdentifier];
      id v11 = (void *)v10;
      CFStringRef v12 = @"DISABLED";
      if (v8) {
        CFStringRef v12 = @"ENABLED";
      }
      int v14 = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      CFStringRef v17 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Setting SharePlay provider %@ to %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v13 = [(SharePlaySettingsListController *)self providerController];
    [v13 setSharePlayEnabled:v8 forProvider:v7];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SharePlaySettingsListController;
  [(SharePlaySettingsListController *)&v7 viewDidAppear:a3];
  v4 = [(SharePlaySettingsListController *)self specifier];
  id v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(SharePlaySettingsListController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  v3 = [(SharePlaySettingsListController *)self specifier];
  v4 = [v3 target];
  id v5 = [v4 parentListController];
  id v6 = [v5 specifierID];

  if ([v6 isEqualToString:@"com.apple.preferences.facetime"])
  {
    uint64_t v24 = TUBundleIdentifierFaceTimeApplication;
    v25 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", TUBundleIdentifierFaceTimeApplication, @"SHAREPLAY_SETTINGS_GROUP"];
    v23 = +[NSURL URLWithString:v25];
    id v7 = objc_alloc((Class)_NSLocalizedStringResource);
    id v8 = +[NSLocale currentLocale];
    CFStringRef v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 bundleURL];
    id v11 = [v7 initWithKey:@"SharePlay" table:0 locale:v8 bundleURL:v10];

    id v12 = objc_alloc((Class)_NSLocalizedStringResource);
    uint64_t v13 = +[NSLocale currentLocale];
    int v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 bundleURL];
    id v16 = [v12 initWithKey:@"Apps" table:0 locale:v13 bundleURL:v15];

    id v17 = objc_alloc((Class)_NSLocalizedStringResource);
    v18 = +[NSLocale currentLocale];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 bundleURL];
    id v21 = [v17 initWithKey:@"FaceTime" table:0 locale:v18 bundleURL:v20];

    v26[0] = v16;
    v26[1] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:2];
    [(SharePlaySettingsListController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v24 title:v11 localizedNavigationComponents:v22 deepLink:v23];
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharePlaySettingsListController;
  id v5 = [(SharePlaySettingsListController *)&v15 specifier];

  if (v5 != v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)SharePlaySettingsListController;
    [(SharePlaySettingsListController *)&v14 setSpecifier:v4];
    id v6 = [v4 sharePlayProviderController];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(SharePlayProviderController);
    }
    CFStringRef v9 = v8;

    [(SharePlayProviderController *)v9 addDelegate:self queue:&_dispatch_main_q];
    uint64_t v10 = objc_msgSend(v4, "sharePlay_userConfiguration");
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init((Class)TUUserConfiguration);
    }
    uint64_t v13 = v12;

    [v13 addDelegate:self queue:&_dispatch_main_q];
    [(SharePlaySettingsListController *)self setProviderController:v9];
    [(SharePlaySettingsListController *)self setUserConfiguration:v13];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(SharePlaySettingsListController *)self mainSwitchSpecifier];
    [v5 addObject:v6];

    id v7 = [(SharePlaySettingsListController *)self providerController];
    unsigned int v8 = [v7 isEnabled];

    if (v8)
    {
      CFStringRef v9 = [(SharePlaySettingsListController *)self providerSpecifiers];
      [v5 addObjectsFromArray:v9];
    }
    id v10 = [v5 copy];
    id v11 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v10;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)refreshView
{
  if ([(SharePlaySettingsListController *)self isViewLoaded])
  {
    [(SharePlaySettingsListController *)self reloadSpecifiers];
  }
}

- (id)providerForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 propertyForKey:v5];

  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)sharePlayController:(id)a3 didChangeProvider:(id)a4
{
  id v10 = a4;
  id v5 = [v10 bundleIdentifier];
  id v6 = [(SharePlaySettingsListController *)self specifierForID:v5];

  if (v6)
  {
    id v7 = [v10 iconImage];
    [v6 setProperty:v7 forKey:PSIconImageKey];

    unsigned int v8 = (objc_class *)objc_opt_class();
    CFStringRef v9 = NSStringFromClass(v8);
    [v6 setProperty:v10 forKey:v9];

    [(SharePlaySettingsListController *)self reloadSpecifier:v6];
  }
  else
  {
    [(SharePlaySettingsListController *)self refreshView];
  }
}

- (void)sharePlayController:(id)a3 didRemoveProvider:(id)a4
{
  id v5 = objc_msgSend(a4, "bundleIdentifier", a3);
  id v7 = [(SharePlaySettingsListController *)self specifierForID:v5];

  id v6 = v7;
  if (v7)
  {
    [(SharePlaySettingsListController *)self removeSpecifier:v7 animated:1];
    id v6 = v7;
  }
}

- (SharePlayProviderController)providerController
{
  return self->_providerController;
}

- (void)setProviderController:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userConfiguration, 0);
  objc_storeStrong((id *)&self->_providerController, 0);

  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
}

@end