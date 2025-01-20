@interface PHSettingsSecondaryCloudCallingController
- (BOOL)shouldShowUpgradeToThumperButton;
- (NSArray)thumperSpecifiers;
- (NSMutableArray)specifiersToHideWhenDisabled;
- (PHSettingsSecondaryCloudCallingController)init;
- (PHSettingsThumperProvisioningController)thumperProvisioningController;
- (PSSpecifier)carrierDirectSpecifier;
- (PSSpecifier)iPhoneRelaySpecifier;
- (id)bundleDescriptor;
- (id)getiPhoneCellularSwitchActive:(id)a3;
- (id)mainSwitchFooterText;
- (id)specifiers;
- (id)upgradeToThumperSpecifiers;
- (void)activateThumperForThisDevice:(id)a3;
- (void)applicationDidResume;
- (void)capabilitiesChanged:(id)a3;
- (void)changeEmergencyAddress:(id)a3;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)setCarrierDirectSpecifier:(id)a3;
- (void)setIPhoneRelaySpecifier:(id)a3;
- (void)setSpecifiersToHideWhenDisabled:(id)a3;
- (void)setThumperProvisioningController:(id)a3;
- (void)setThumperSpecifiers:(id)a3;
- (void)setiPhoneCellularSwitchActive:(id)a3 specifier:(id)a4;
- (void)thumperProvisioningURLChanged:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHSettingsSecondaryCloudCallingController

- (PHSettingsSecondaryCloudCallingController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHSettingsSecondaryCloudCallingController;
  v2 = [(PHSettingsSecondaryCloudCallingController *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(PHSettingsThumperProvisioningController);
    thumperProvisioningController = v2->_thumperProvisioningController;
    v2->_thumperProvisioningController = v3;

    [(PHSettingsCloudCallingURLController *)v2->_thumperProvisioningController setDelegate:v2];
    +[TUCallCapabilities supportsTelephonyCalls];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"capabilitiesChanged:" name:TUCallCapabilitiesSupportsTelephonyCallsChangedNotification object:0];
    [v5 addObserver:v2 selector:"capabilitiesChanged:" name:TUCallCapabilitiesThumperCallingChangedNotification object:0];
    [v5 addObserver:v2 selector:"capabilitiesChanged:" name:TUCallCapabilitiesRelayCallingChangedNotification object:0];
    [v5 addObserver:v2 selector:"thumperProvisioningURLChanged:" name:TUCallCapabilitiesThumperCallingProvisioningURLChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHSettingsSecondaryCloudCallingController;
  [(PHSettingsSecondaryCloudCallingController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHSettingsSecondaryCloudCallingController;
  [(PHSettingsSecondaryCloudCallingController *)&v9 viewWillAppear:a3];
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "viewWillAppear: reloading specifiers", v8, 2u);
  }

  [(PHSettingsSecondaryCloudCallingController *)self reloadSpecifiers];
  v5 = [(PHSettingsSecondaryCloudCallingController *)self specifier];
  v6 = [v5 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHSettingsSecondaryCloudCallingController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  v3 = [(PHSettingsSecondaryCloudCallingController *)self specifier];
  objc_super v4 = [v3 target];
  v5 = [v4 parentListController];
  v6 = [v5 specifierID];

  if ([v6 isEqualToString:@"com.apple.preferences.facetime"])
  {
    uint64_t v24 = TUBundleIdentifierFaceTimeApplication;
    v25 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", TUBundleIdentifierFaceTimeApplication, @"SECONDARY_CLOUD_CALLING"];
    v23 = +[NSURL URLWithString:v25];
    id v7 = objc_alloc((Class)_NSLocalizedStringResource);
    v8 = +[NSLocale currentLocale];
    objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
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
    id v21 = [v17 initWithKey:@"FaceTime" table:0 locale:v18 bundleURL:v20];

    v26[0] = v16;
    v26[1] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:2];
    [(PHSettingsSecondaryCloudCallingController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v24 title:v11 localizedNavigationComponents:v22 deepLink:v23];
  }
}

- (void)applicationDidResume
{
  v5.receiver = self;
  v5.super_class = (Class)PHSettingsSecondaryCloudCallingController;
  [(PHSettingsSecondaryCloudCallingController *)&v5 applicationDidResume];
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "applicationDidResume: reloading specifiers", v4, 2u);
  }

  [(PHSettingsSecondaryCloudCallingController *)self reloadSpecifiers];
}

- (void)changeEmergencyAddress:(id)a3
{
  +[TUCallCapabilities invalidateAndRefreshThumperCallingProvisioningURL];
  id v5 = [(PHSettingsSecondaryCloudCallingController *)self thumperProvisioningController];
  objc_super v4 = [v5 updateEmergencyAddressController];
  [(PHSettingsCloudCallingListController *)self presentOrUpdateViewController:v4];
}

- (id)bundleDescriptor
{
  return @"SecondaryCloudCallingSettings";
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(PHSettingsSecondaryCloudCallingController *)self loadSpecifiersFromPlistName:@"SecondaryCloudCallingSettings" target:self];
    v6 = [v5 specifierForID:@"SECONDARY_CLOUD_CALLING_GROUP"];
    id v7 = [(PHSettingsSecondaryCloudCallingController *)self mainSwitchFooterText];
    uint64_t v8 = PSFooterTextGroupKey;
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    unsigned int v9 = [(PHSettingsThumperProvisioningController *)self->_thumperProvisioningController shouldShowEmergencyAddress];
    v10 = [v5 specifierForID:@"EMERGENCY_ADDRESS_GROUP"];
    if (v9)
    {
      id v11 = +[NSBundle bundleForClass:objc_opt_class()];
      id v12 = TUStringKeyForNetwork();
      v13 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
      v14 = [v11 localizedStringForKey:v12 value:&stru_C520 table:v13];
      [v10 setProperty:v14 forKey:v8];

      v15 = [v5 specifierForID:@"EMERGENCY_ADDRESS_GROUP"];
      [v15 setProperty:&off_CAA8 forKey:PSFooterAlignmentGroupKey];
    }
    else
    {
      [v5 removeObject:v10];

      id v16 = [v5 specifierForID:@"EMERGENCY_ADDRESS_BUTTON"];
      [v5 removeObject:v16];

      v15 = [v5 specifierForID:@"EMERGENCY_ADDRESS_GROUP"];
      id v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = TUStringKeyForNetwork();
      v19 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
      v20 = [v17 localizedStringForKey:v18 value:&stru_C520 table:v19];
      [v15 setProperty:v20 forKey:v8];
    }
    if ([(PHSettingsThumperProvisioningController *)self->_thumperProvisioningController isThumperProvisioningInProcess])
    {
      id v21 = 0;
    }
    else
    {
      id v21 = v6;
    }
    id v22 = v21;
    if ([(PHSettingsSecondaryCloudCallingController *)self shouldShowUpgradeToThumperButton])
    {
      v23 = [(PHSettingsSecondaryCloudCallingController *)self upgradeToThumperSpecifiers];
      [v5 addObjectsFromArray:v23];
      uint64_t v24 = [v5 specifierForID:@"SECONDARY_CLOUD_CALLING_THUMPER_UPGRADE_GROUP"];

      id v22 = (id)v24;
    }
    if (v22) {
      [(PHSettingsCloudCallingListController *)self appendAboutWiFiCallingFooterToGroupSpecifier:v22];
    }
    id v25 = [v5 copy];
    v26 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v25;

    objc_super v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (id)upgradeToThumperSpecifiers
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"SECONDARY_CLOUD_CALLING_THUMPER_UPGRADE_GROUP"];
  +[TUCallCapabilities supportsThumperCallingOverCellularData];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = TUStringKeyForNetworkAndProduct();
  v6 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
  id v7 = [v4 localizedStringForKey:v5 value:&stru_C520 table:v6];

  [v3 setProperty:v7 forKey:PSFooterTextGroupKey];
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v9 = TUStringKeyForNetwork();
  v10 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
  id v11 = [v8 localizedStringForKey:v9 value:&stru_C520 table:v10];
  id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v12 setButtonAction:"activateThumperForThisDevice:"];
  v15[0] = v3;
  v15[1] = v12;
  v13 = +[NSArray arrayWithObjects:v15 count:2];

  return v13;
}

- (id)mainSwitchFooterText
{
  if ([(PHSettingsThumperProvisioningController *)self->_thumperProvisioningController isThumperProvisioningInProcess]|| !+[TUCallCapabilities isThumperCallingEnabled])
  {
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = TUStringKeyForNetwork();
    id v7 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
    v6 = [v3 localizedStringForKey:v5 value:&stru_C520 table:v7];
  }
  else
  {
    uint64_t v3 = TUThumperCarrierName();
    id v4 = [v3 length];
    +[TUCallCapabilities supportsThumperCallingOverCellularData];
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = TUStringKeyForNetworkAndProduct();
    uint64_t v8 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
    [v5 localizedStringForKey:v7 value:&stru_C520 table:v8];
    if (v4) {
      unsigned int v9 = {;
    }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v3);
    }
    else {
      unsigned int v9 = {;
    }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);
    v6 = };
  }

  return v6;
}

- (BOOL)shouldShowUpgradeToThumperButton
{
  BOOL v3 = [(PHSettingsThumperProvisioningController *)self->_thumperProvisioningController shouldShowUpgradeToThumperButton];
  if (v3)
  {
    id v4 = [(PHSettingsSecondaryCloudCallingController *)self getiPhoneCellularSwitchActive:0];
    unsigned __int8 v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setiPhoneCellularSwitchActive:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v29 = [v5 BOOLValue];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "setiPhoneCellularSwitchActive: value is %d ... ", buf, 8u);
  }

  if (![v5 BOOLValue])
  {
    v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Disabling Thumper and relay", buf, 2u);
    }

    uint64_t v11 = 0;
    goto LABEL_22;
  }
  if (+[TUCallCapabilities accountsSupportSecondaryCalling])
  {
    unsigned int v7 = +[TUCallCapabilities isThumperCallingAllowedForCurrentDevice];
    uint64_t v8 = PHDefaultLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "... and thumper calling is allowed for current device", buf, 2u);
      }

      +[TUCallCapabilities setThumperCallingEnabled:1];
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "... and thumper calling is not allowed for current device", buf, 2u);
      }
    }
    uint64_t v11 = 1;
LABEL_22:
    +[TUCallCapabilities setRelayCallingEnabled:v11];
    goto LABEL_23;
  }
  id v12 = PHDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = +[TUCallCapabilities accountsSupportSecondaryCalling];
    *(_DWORD *)buf = 67109120;
    unsigned int v29 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "... but not allowing Calls from iPhone to be enabled because accountsSupportSecondaryCalling = %d", buf, 8u);
  }

  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
  id v16 = [v14 localizedStringForKey:@"SECONDARY_CLOUD_CALLING_ACCOUNT_ALERT_TITLE" value:&stru_C520 table:v15];

  id v17 = objc_alloc_init((Class)TUFeatureFlags);
  LODWORD(v15) = [v17 appleAccountRebrandEnabled];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
  if (v15) {
    CFStringRef v20 = @"SECONDARY_CLOUD_CALLING_ACCOUNT_ALERT_MESSAGE_APPLEACCOUNT";
  }
  else {
    CFStringRef v20 = @"SECONDARY_CLOUD_CALLING_ACCOUNT_ALERT_MESSAGE";
  }
  id v21 = [v18 localizedStringForKey:v20 value:&stru_C520 table:v19];

  id v22 = +[UIAlertController alertControllerWithTitle:v16 message:v21 preferredStyle:1];
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v24 = [(PHSettingsSecondaryCloudCallingController *)self bundleDescriptor];
  id v25 = [v23 localizedStringForKey:@"OK" value:&stru_C520 table:v24];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_6244;
  v27[3] = &unk_C428;
  v27[4] = self;
  v26 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v27];
  [v22 addAction:v26];

  [(PHSettingsSecondaryCloudCallingController *)self presentViewController:v22 animated:1 completion:0];
LABEL_23:
  [(PHSettingsSecondaryCloudCallingController *)self reloadSpecifiers];
}

- (id)getiPhoneCellularSwitchActive:(id)a3
{
  if (+[TUCallCapabilities isRelayCallingEnabled])id v3 = &dword_0 + 1; {
  else
  }
    id v3 = +[TUCallCapabilities isThumperCallingEnabled];

  return +[NSNumber numberWithInt:v3];
}

- (void)activateThumperForThisDevice:(id)a3
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "activateThumperForThisDevice", buf, 2u);
  }

  unsigned int v4 = +[TUCallCapabilities isThumperCallingAllowedForCurrentDevice];
  id v5 = PHDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Thumper calling is already allowed for current device. Enabling Thumper directly", v8, 2u);
    }

    +[TUCallCapabilities setThumperCallingEnabled:1];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Thumper calling is not allowed for current device. Starting PIN pairing", v7, 2u);
    }

    +[TUCallCapabilities requestPinFromPrimaryDevice];
  }
}

- (void)capabilitiesChanged:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received capabilites changed notification: %@. Reloading specifiers", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64C8;
  block[3] = &unk_C450;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)thumperProvisioningURLChanged:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received Thumper provisioning URL changed notification: %@", (uint8_t *)&v11, 0xCu);
  }

  BOOL v6 = +[TUCallCapabilities thumperCallingCapabilityInfo];
  unsigned int v7 = [(PHSettingsSecondaryCloudCallingController *)self presentedViewController];

  if (v7 && ![v6 provisioningStatus])
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "We have a presented view controller and Thumper provisioning status is not-allowed, so updating our presented controller", (uint8_t *)&v11, 2u);
    }

    BOOL v9 = [(PHSettingsSecondaryCloudCallingController *)self thumperProvisioningController];
    v10 = [v9 provisionCapabilityController];
    [(PHSettingsCloudCallingListController *)self presentOrUpdateViewController:v10];
  }
}

- (PSSpecifier)iPhoneRelaySpecifier
{
  return self->_iPhoneRelaySpecifier;
}

- (void)setIPhoneRelaySpecifier:(id)a3
{
}

- (PSSpecifier)carrierDirectSpecifier
{
  return self->_carrierDirectSpecifier;
}

- (void)setCarrierDirectSpecifier:(id)a3
{
}

- (NSArray)thumperSpecifiers
{
  return self->_thumperSpecifiers;
}

- (void)setThumperSpecifiers:(id)a3
{
}

- (NSMutableArray)specifiersToHideWhenDisabled
{
  return self->_specifiersToHideWhenDisabled;
}

- (void)setSpecifiersToHideWhenDisabled:(id)a3
{
}

- (PHSettingsThumperProvisioningController)thumperProvisioningController
{
  return self->_thumperProvisioningController;
}

- (void)setThumperProvisioningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumperProvisioningController, 0);
  objc_storeStrong((id *)&self->_specifiersToHideWhenDisabled, 0);
  objc_storeStrong((id *)&self->_thumperSpecifiers, 0);
  objc_storeStrong((id *)&self->_carrierDirectSpecifier, 0);

  objc_storeStrong((id *)&self->_iPhoneRelaySpecifier, 0);
}

@end