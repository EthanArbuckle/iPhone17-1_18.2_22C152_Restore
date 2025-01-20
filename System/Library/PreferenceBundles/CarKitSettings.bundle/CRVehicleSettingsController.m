@interface CRVehicleSettingsController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)suppressNextReloadForPairedVehicleChanged;
- (CRVehicleSettingManager)vehicleSettingManager;
- (CRVehicleSettingsController)init;
- (id)assetIdentifier;
- (id)assetPath;
- (id)assetVersion;
- (id)carPlayEnabled:(id)a3;
- (id)detailTextForOptionsRow:(id)a3;
- (id)enhancedIntegrationEnabled:(id)a3;
- (id)internalNotes:(id)a3;
- (id)isUsingMobileAsset;
- (id)specifiers;
- (void)_updateEnabledGroupSpecifier:(id)a3 switchSpecifier:(id)a4;
- (void)dealloc;
- (void)deleteVehicle;
- (void)handlePairedVehiclesChanged:(id)a3;
- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4;
- (void)setEnhancedIntegrationEnabled:(id)a3 specifier:(id)a4;
- (void)setInternalNotes:(id)a3 forSpecifier:(id)a4;
- (void)setSuppressNextReloadForPairedVehicleChanged:(BOOL)a3;
- (void)setVehicleSettingManager:(id)a3;
@end

@implementation CRVehicleSettingsController

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRVehicleSettingsController;
  [(CRVehicleSettingsController *)&v4 dealloc];
}

- (CRVehicleSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRVehicleSettingsController;
  v2 = [(CRVehicleSettingsController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CRVehicleSettingsController *)v2 setSuppressNextReloadForPairedVehicleChanged:0];
    objc_super v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"handlePairedVehiclesChanged:" name:CRPairedVehiclesDidChangeNotification object:0];
  }
  return v3;
}

- (void)deleteVehicle
{
  objc_initWeak(&location, self);
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3C24;
  v4[3] = &unk_247A0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 removeVehicleWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)carPlayEnabled:(id)a3
{
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  objc_super v4 = [v3 vehicle];

  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isPaired]);

  return v5;
}

- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v9 = [v8 vehicle];

  if ([v6 BOOLValue]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [v9 setPairingStatus:v10];
  [(CRVehicleSettingsController *)self setSuppressNextReloadForPairedVehicleChanged:1];
  objc_initWeak(&location, self);
  v11 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3E44;
  v12[3] = &unk_247C8;
  objc_copyWeak(&v13, &location);
  [v11 saveVehicleWithCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateEnabledGroupSpecifier:(id)a3 switchSpecifier:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  int v7 = MGGetBoolAnswer();
  v8 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v9 = [v8 vehicle];

  unsigned __int8 v10 = [v9 isPaired];
  unsigned int v11 = [v9 supportsWirelessCarPlay];
  unsigned int v12 = [v9 supportsUSBCarPlay];
  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = v13;
  if (v11)
  {
    v15 = [v13 localizedStringForKey:@"CARPLAY_SWITCH" value:&stru_24F60 table:@"Localizable"];
    [v6 setName:v15];

    if (v10)
    {
      if (!v12) {
        goto LABEL_18;
      }
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = v16;
      CFStringRef v18 = @"CARPLAY_FOOTER_TEXT_WIRED_AND_WIRELESS_ON_TOUCHID";
      CFStringRef v19 = @"CARPLAY_FOOTER_TEXT_WIRED_AND_WIRELESS_ON_FACEID";
    }
    else
    {
      if (!v12) {
        goto LABEL_18;
      }
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = v16;
      CFStringRef v18 = @"CARPLAY_FOOTER_TEXT_WIRED_AND_WIRELESS_OFF_TOUCHID";
      CFStringRef v19 = @"CARPLAY_FOOTER_TEXT_WIRED_AND_WIRELESS_OFF_FACEID";
    }
    if (v7) {
      CFStringRef v23 = v19;
    }
    else {
      CFStringRef v23 = v18;
    }
  }
  else
  {
    v20 = [v13 localizedStringForKey:@"ALLOW_LOCKED_CARPLAY_SWITCH" value:&stru_24F60 table:@"Localizable"];
    [v6 setName:v20];

    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = v16;
    if (v10)
    {
      CFStringRef v21 = @"CARPLAY_FOOTER_TEXT_WIRED_ON_TOUCHID";
      CFStringRef v22 = @"CARPLAY_FOOTER_TEXT_WIRED_ON_FACEID";
    }
    else
    {
      CFStringRef v21 = @"CARPLAY_FOOTER_TEXT_WIRED_OFF_TOUCHID";
      CFStringRef v22 = @"CARPLAY_FOOTER_TEXT_WIRED_OFF_FACEID";
    }
    if (v7) {
      CFStringRef v23 = v22;
    }
    else {
      CFStringRef v23 = v21;
    }
  }
  v24 = [v16 localizedStringForKey:v23 value:&stru_24F60 table:@"Localizable"];

  if (v24)
  {
    [v25 setProperty:v24 forKey:PSFooterTextGroupKey];
  }
LABEL_18:
}

- (id)detailTextForOptionsRow:(id)a3
{
  objc_super v4 = [(CRVehicleSettingsController *)self carPlayEnabled:a3];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = [(CRVehicleSettingsController *)self vehicleSettingManager];
    if ([v6 isFerriteEnabled])
    {
      int v7 = @"Next Generation of CarPlay";
    }
    else
    {
      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      int v7 = [v8 localizedStringForKey:@"CARPLAY_OPTIONS_CARPLAY_SUMMARY" value:&stru_24F60 table:@"Localizable"];
    }
  }
  else
  {
    int v7 = @"Off";
  }

  return v7;
}

- (id)enhancedIntegrationEnabled:(id)a3
{
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  objc_super v4 = [v3 vehicle];

  unsigned int v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEnhancedIntegrationEnabled]);

  return v5;
}

- (void)setEnhancedIntegrationEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v9 = [v8 vehicle];

  if ([v6 BOOLValue]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [v9 setEnhancedIntegrationStatus:v10];
  [(CRVehicleSettingsController *)self setSuppressNextReloadForPairedVehicleChanged:1];
  objc_initWeak(&location, self);
  unsigned int v11 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_446C;
  v13[3] = &unk_247F0;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [v11 saveVehicleWithCompletion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)handlePairedVehiclesChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4608;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v76 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = [(CRVehicleSettingsController *)self vehicleSettingManager];

    if (!v4)
    {
      unsigned int v5 = [(CRVehicleSettingsController *)self specifier];
      id v6 = [v5 userInfo];
      [(CRVehicleSettingsController *)self setVehicleSettingManager:v6];
    }
    id v7 = [(CRVehicleSettingsController *)self vehicleSettingManager];
    v8 = [v7 vehicle];

    id v80 = objc_alloc_init((Class)NSMutableArray);
    v75 = [v8 displayName];
    -[CRVehicleSettingsController setTitle:](self, "setTitle:");
    unsigned int v9 = [v8 supportsEnhancedIntegration];
    uint64_t v10 = [(CRVehicleSettingsController *)self vehicleSettingManager];
    unsigned int v11 = [v10 featureAvailability];
    unint64_t v12 = (unint64_t)[v11 deviceSupportedCarPlayFeatures];

    v79 = v8;
    if ((CRCarPlayFeaturesAllFerriteFeatures() & v12) != 0
      && ([v8 clusterAssetIdentifier],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      id v14 = +[PSSpecifier groupSpecifierWithID:@"CARPLAY_OPTIONS_GROUP"];
      id v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"CARPLAY_OPTIONS_ROW_TITLE" value:&stru_24F60 table:@"Localizable"];
      v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"detailTextForOptionsRow:" detail:objc_opt_class() cell:2 edit:0];

      [v17 setIdentifier:@"CARPLAY_OPTIONS_LINK"];
      CFStringRef v18 = [(CRVehicleSettingsController *)self vehicleSettingManager];
      [v17 setUserInfo:v18];

      unsigned int v77 = 0;
      v88 = v14;
      CFStringRef v19 = &v88;
    }
    else
    {
      id v14 = +[PSSpecifier groupSpecifierWithID:@"SWITCH_GROUP"];
      v17 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setCarPlayEnabled:specifier:" get:"carPlayEnabled:" detail:0 cell:6 edit:0];
      [v17 setIdentifier:@"CARPLAY_SWITCH"];
      [(CRVehicleSettingsController *)self _updateEnabledGroupSpecifier:v14 switchSpecifier:v17];
      v87 = v14;
      CFStringRef v19 = &v87;
      unsigned int v77 = v9;
    }
    v19[1] = v17;
    v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
    [v80 addObjectsFromArray:v20];

    uint64_t v21 = +[PSSpecifier groupSpecifierWithID:@"CUSTOMIZE_GROUP"];
    CFStringRef v22 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v23 = [v22 localizedStringForKey:@"CUSTOMIZE_TITLE" value:&stru_24F60 table:@"Localizable"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v24 setUserInfo:v79];
    v73 = v24;
    v74 = (void *)v21;
    v86[0] = v21;
    v86[1] = v24;
    id v25 = +[NSArray arrayWithObjects:v86 count:2];
    [v80 addObjectsFromArray:v25];

    if (v77)
    {
      v26 = +[PSSpecifier groupSpecifierWithID:@"INTEGRATION_GROUP"];
      v27 = +[NSBundle bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"CARPLAY_ENHANCED_INTEGRATION_FOOTER" value:&stru_24F60 table:@"Localizable"];
      [v26 setProperty:v28 forKey:PSFooterTextGroupKey];

      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = [v29 localizedStringForKey:@"CARPLAY_ENHANCED_INTEGRATION_SWITCH" value:&stru_24F60 table:@"Localizable"];
      v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:"setEnhancedIntegrationEnabled:specifier:" get:"enhancedIntegrationEnabled:" detail:0 cell:6 edit:0];

      [v31 setIdentifier:@"INTEGRATION_SWITCH"];
      v85[0] = v26;
      v85[1] = v31;
      v32 = +[NSArray arrayWithObjects:v85 count:2];
      [v80 addObjectsFromArray:v32];
    }
    v78 = +[PSSpecifier groupSpecifierWithID:@"FORGET_GROUP"];
    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"FORGET_BUTTON" value:&stru_24F60 table:@"Localizable"];
    v35 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v35 setIdentifier:@"FORGET_BUTTON"];
    [v35 setProperty:&off_26058 forKey:PSAlignmentKey];
    [v35 setProperty:objc_opt_class() forKey:PSCellClassKey];
    unsigned int v36 = [v79 supportsWirelessCarPlay];
    v37 = +[NSBundle bundleForClass:objc_opt_class()];
    v38 = v37;
    if (v36) {
      CFStringRef v39 = @"FORGET_CONFIRMATION_BLUETOOTH_TITLE_FORMAT";
    }
    else {
      CFStringRef v39 = @"FORGET_CONFIRMATION_WIRED_TITLE_FORMAT";
    }
    v40 = [v37 localizedStringForKey:v39 value:&stru_24F60 table:@"Localizable"];
    v41 = [v79 displayName];
    uint64_t v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v41);

    v72 = (void *)v42;
    v84[0] = v42;
    v83[0] = PSConfirmationPromptKey;
    v83[1] = PSConfirmationTitleKey;
    v43 = +[NSBundle bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"FORGET_CONFIRMATION_FORGET" value:&stru_24F60 table:@"Localizable"];
    v84[1] = v44;
    v83[2] = PSConfirmationCancelKey;
    v45 = +[NSBundle bundleForClass:objc_opt_class()];
    v46 = [v45 localizedStringForKey:@"FORGET_CONFIRMATION_CANCEL" value:&stru_24F60 table:@"Localizable"];
    v84[2] = v46;
    uint64_t v47 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];

    v71 = (void *)v47;
    [v35 setupWithDictionary:v47];
    [v35 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
    [v35 setConfirmationAction:"deleteVehicle"];
    v82[0] = v78;
    v82[1] = v35;
    v48 = +[NSArray arrayWithObjects:v82 count:2];
    v49 = v80;
    [v80 addObjectsFromArray:v48];

    if (CRIsInternalInstall())
    {
      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"DNL_INTERNAL_ONLY" value:&stru_24F60 table:@"Localizable"];
      v52 = +[PSSpecifier groupSpecifierWithName:v51];

      v53 = +[NSBundle bundleForClass:objc_opt_class()];
      v54 = [v53 localizedStringForKey:@"DNL_INTERNAL_NOTES_FOOTER" value:&stru_24F60 table:@"Localizable"];
      uint64_t v70 = PSFooterTextGroupKey;
      objc_msgSend(v52, "setProperty:forKey:", v54);

      v55 = v52;
      v56 = +[NSBundle bundleForClass:objc_opt_class()];
      v57 = [v56 localizedStringForKey:@"DNL_INTERNAL_NOTES" value:&stru_24F60 table:@"Localizable"];
      v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:"setInternalNotes:forSpecifier:" get:"internalNotes:" detail:objc_opt_class() cell:2 edit:0];

      v49 = v80;
      v81[0] = v52;
      v81[1] = v58;
      v59 = +[NSArray arrayWithObjects:v81 count:2];
      [v80 addObjectsFromArray:v59];

      v60 = [v79 supportsThemeAssets];

      if (v60)
      {
        v61 = +[PSSpecifier groupSpecifierWithName:@"Asset Information"];
        [v61 setIdentifier:@"AssetInfo"];
        [v80 addObject:v61];
        v62 = +[PSSpecifier preferenceSpecifierNamed:@"AssetID" target:self set:0 get:"assetIdentifier" detail:0 cell:4 edit:0];
        [v80 addObject:v62];
        v63 = +[PSSpecifier preferenceSpecifierNamed:@"AssetVersion" target:self set:0 get:"assetVersion" detail:0 cell:4 edit:0];
        [v80 addObject:v63];
        v64 = +[PSSpecifier preferenceSpecifierNamed:@"Using MobileAsset?" target:self set:0 get:"isUsingMobileAsset" detail:0 cell:4 edit:0];
        [v80 addObject:v64];
        v65 = +[PSSpecifier preferenceSpecifierNamed:@"AssetPath" target:self set:0 get:"assetPath" detail:0 cell:0 edit:0];
        v66 = [(CRVehicleSettingsController *)self assetPath];
        [v65 setProperty:v66 forKey:v70];

        [v80 addObject:v65];
        v49 = v80;
      }
    }
    uint64_t v67 = +[NSArray arrayWithArray:v49];
    v68 = *(void **)&self->PSListController_opaque[v76];
    *(void *)&self->PSListController_opaque[v76] = v67;

    v3 = *(void **)&self->PSListController_opaque[v76];
  }

  return v3;
}

- (id)internalNotes:(id)a3
{
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  objc_super v4 = [v3 vehicle];

  unsigned int v5 = [v4 internalNotes];

  return v5;
}

- (void)setInternalNotes:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  unsigned int v9 = [v8 vehicle];

  [v9 setInternalNotes:v6];
  objc_initWeak(&location, self);
  uint64_t v10 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5418;
  v12[3] = &unk_247F0;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [v10 saveVehicleWithCompletion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)assetIdentifier
{
  v2 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  v3 = [v2 vehicle];
  objc_super v4 = [v3 clusterAssetIdentifier];

  return v4;
}

- (id)assetVersion
{
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  objc_super v4 = [v3 vehicle];
  unsigned int v5 = [v4 clusterAssetVersion];

  id v6 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  id v7 = [v6 vehicle];
  v8 = [v7 stagedClusterAssetVersion];

  if (v5 && (int)[v5 intValue] >= 1)
  {
    uint64_t v9 = [v5 stringValue];
LABEL_7:
    uint64_t v10 = (__CFString *)v9;
    goto LABEL_9;
  }
  if (v8 && (int)[v8 intValue] >= 1)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"%@ (Staged)", v8];
    goto LABEL_7;
  }
  uint64_t v10 = @"–";
LABEL_9:

  return v10;
}

- (id)assetPath
{
  v3 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  objc_super v4 = [v3 vehicle];
  unsigned int v5 = [v4 clusterAssetURL];

  id v6 = [(CRVehicleSettingsController *)self vehicleSettingManager];
  id v7 = [v6 vehicle];
  v8 = [v7 stagedClusterAssetURL];

  if (v5)
  {
    uint64_t v9 = [v5 absoluteString];
LABEL_5:
    uint64_t v10 = (__CFString *)v9;
    goto LABEL_6;
  }
  if (v8)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"%@ (Staged)", v8];
    goto LABEL_5;
  }
  uint64_t v10 = @"–";
LABEL_6:

  return v10;
}

- (id)isUsingMobileAsset
{
  v2 = [(CRVehicleSettingsController *)self assetPath];
  [v2 containsString:@"/private/var/MobileAsset"];
  v3 = NSStringFromBOOL();

  return v3;
}

- (CRVehicleSettingManager)vehicleSettingManager
{
  return self->_vehicleSettingManager;
}

- (void)setVehicleSettingManager:(id)a3
{
}

- (BOOL)suppressNextReloadForPairedVehicleChanged
{
  return self->_suppressNextReloadForPairedVehicleChanged;
}

- (void)setSuppressNextReloadForPairedVehicleChanged:(BOOL)a3
{
  self->_suppressNextReloadForPairedVehicleChanged = a3;
}

- (void).cxx_destruct
{
}

@end