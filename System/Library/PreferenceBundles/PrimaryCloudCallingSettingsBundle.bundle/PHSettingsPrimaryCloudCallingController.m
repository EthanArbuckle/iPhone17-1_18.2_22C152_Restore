@interface PHSettingsPrimaryCloudCallingController
- (PHSettingsPrimaryCloudCallingController)init;
- (id)deviceSpecifiers;
- (id)getCallsOnOtherDevices:(id)a3;
- (id)getDeviceActive:(id)a3;
- (id)mainSwitchFooterText;
- (id)specifiers;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)setCallsOnOtherDevices:(id)a3 specifier:(id)a4;
- (void)setDeviceActive:(id)a3 specifier:(id)a4;
- (void)statusChanged:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHSettingsPrimaryCloudCallingController

- (PHSettingsPrimaryCloudCallingController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PHSettingsPrimaryCloudCallingController;
  v2 = [(PHSettingsPrimaryCloudCallingController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"statusChanged:" name:TUCallCapabilitiesRelayCallingChangedNotification object:0];
    [v3 addObserver:v2 selector:"statusChanged:" name:TUCallCapabilitiesCloudCallingDevicesChangedNotification object:0];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHSettingsPrimaryCloudCallingController;
  [(PHSettingsPrimaryCloudCallingController *)&v7 viewWillAppear:a3];
  v4 = [(PHSettingsPrimaryCloudCallingController *)self specifier];
  objc_super v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHSettingsPrimaryCloudCallingController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  v3 = [(PHSettingsPrimaryCloudCallingController *)self specifier];
  v4 = [v3 target];
  objc_super v5 = [v4 parentListController];
  v6 = [v5 specifierID];

  if ([v6 isEqualToString:@"com.apple.preferences.phone"])
  {
    uint64_t v24 = TUBundleIdentifierPhoneApplication;
    v25 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", TUBundleIdentifierPhoneApplication, @"PRIMARY_CLOUD_CALLING"];
    v23 = +[NSURL URLWithString:v25];
    id v7 = objc_alloc((Class)_NSLocalizedStringResource);
    v8 = +[NSLocale currentLocale];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 bundleURL];
    id v11 = [v7 initWithKey:@"Calls on Other Devices" table:0 locale:v8 bundleURL:v10];

    id v12 = objc_alloc((Class)_NSLocalizedStringResource);
    v13 = +[NSLocale currentLocale];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 bundleURL];
    id v16 = [v12 initWithKey:@"Apps" table:0 locale:v13 bundleURL:v15];

    id v17 = objc_alloc((Class)_NSLocalizedStringResource);
    v18 = +[NSLocale currentLocale];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 bundleURL];
    id v21 = [v17 initWithKey:@"Phone" table:0 locale:v18 bundleURL:v20];

    v26[0] = v16;
    v26[1] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:2];
    [(PHSettingsPrimaryCloudCallingController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v24 title:v11 localizedNavigationComponents:v22 deepLink:v23];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHSettingsPrimaryCloudCallingController;
  [(PHSettingsPrimaryCloudCallingController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(PHSettingsPrimaryCloudCallingController *)self loadSpecifiersFromPlistName:@"PrimaryCloudCallingSettings" target:self];
    v6 = [v5 specifierForID:@"PRIMARY_CLOUD_CALLING_GROUP"];
    id v7 = [(PHSettingsPrimaryCloudCallingController *)self mainSwitchFooterText];
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    v8 = [(PHSettingsPrimaryCloudCallingController *)self getCallsOnOtherDevices:0];
    LODWORD(v7) = [v8 BOOLValue];

    if (v7)
    {
      v9 = [(PHSettingsPrimaryCloudCallingController *)self deviceSpecifiers];
      [v5 addObjectsFromArray:v9];
    }
    id v10 = [objc_alloc((Class)NSArray) initWithArray:v5];
    id v11 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v10;

    objc_super v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (id)deviceSpecifiers
{
  id v18 = objc_alloc_init((Class)NSMutableArray);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  +[TUCallCapabilities cloudCallingDevices];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v23;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v6 supportsRestrictingSecondaryCalling])
        {
          id v7 = [v6 name];
          v8 = [v6 modelIdentifier];
          v9 = +[IMDeviceSupport marketingNameForModel:v8];

          id v10 = +[NSString stringWithFormat:@"%@ (%@)", v7, v9];
          id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setDeviceActive:specifier:" get:"getDeviceActive:" detail:0 cell:6 edit:0];
          id v12 = [v6 uniqueID];
          [v11 setIdentifier:v12];

          [v20 addObject:v11];
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v3);
  }
  if ([v20 count])
  {
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"PRIMARY_CLOUD_CALLING_DEVICE_LIST_HEADER" value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v18 addObject:v15];
    [v18 addObjectsFromArray:v20];
  }
  id v16 = [v18 copy];

  return v16;
}

- (id)mainSwitchFooterText
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = TUStringKeyForNetwork();
  uint64_t v4 = [v2 localizedStringForKey:v3 value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

  return v4;
}

- (void)setCallsOnOtherDevices:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v23 = [v5 BOOLValue];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Asked to set calls on other devices to %d", buf, 8u);
  }

  if ([v5 BOOLValue]
    && (+[TUCallCapabilities accountsSupportSecondaryCalling] & 1) == 0)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = +[TUCallCapabilities accountsSupportSecondaryCalling];
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Not allowing Calls on Other Devices to be enabled because accountsSupportSecondaryCalling = %d", buf, 8u);
    }

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"PRIMARY_CLOUD_CALLING_ACCOUNT_ALERT_TITLE" value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

    id v11 = objc_alloc_init((Class)TUFeatureFlags);
    unsigned int v12 = [v11 appleAccountRebrandEnabled];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = v13;
    if (v12) {
      CFStringRef v15 = @"PRIMARY_CLOUD_CALLING_ACCOUNT_ALERT_MESSAGE_APPLEACCOUNT";
    }
    else {
      CFStringRef v15 = @"PRIMARY_CLOUD_CALLING_ACCOUNT_ALERT_MESSAGE";
    }
    id v16 = [v13 localizedStringForKey:v15 value:&stru_C668 table:@"PrimaryCloudCallingSettings"];

    id v17 = +[UIAlertController alertControllerWithTitle:v10 message:v16 preferredStyle:1];
    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"OK" value:&stru_C668 table:@"PrimaryCloudCallingSettings"];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_3008;
    v21[3] = &unk_C360;
    v21[4] = self;
    id v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v21];
    [v17 addAction:v20];

    [(PHSettingsPrimaryCloudCallingController *)self presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    +[TUCallCapabilities setRelayCallingEnabled:](TUCallCapabilities, "setRelayCallingEnabled:", [v5 BOOLValue]);
  }
}

- (id)getCallsOnOtherDevices:(id)a3
{
  id v3 = +[TUCallCapabilities isRelayCallingEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setDeviceActive:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = [a4 identifier];
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Asked to set device active=%@ on secondary device with unique ID %@", (uint8_t *)&v8, 0x16u);
  }

  +[TUCallCapabilities setRelayCallingEnabled:forDeviceWithID:](TUCallCapabilities, "setRelayCallingEnabled:forDeviceWithID:", [v5 BOOLValue], v6);
}

- (id)getDeviceActive:(id)a3
{
  id v3 = [a3 identifier];
  uint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[TUCallCapabilities isRelayCallingEnabledForDeviceWithID:v3]);

  return v4;
}

- (void)statusChanged:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received capability changed notification: %@. Reloading specifiers", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_32DC;
  block[3] = &unk_C388;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end