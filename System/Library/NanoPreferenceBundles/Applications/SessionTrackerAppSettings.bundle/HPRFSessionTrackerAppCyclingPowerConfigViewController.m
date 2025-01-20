@interface HPRFSessionTrackerAppCyclingPowerConfigViewController
+ (id)automaticFTPString:(id)a3;
+ (id)numberFormatter;
- (FIUIFormattingManager)formattingManager;
- (WOCyclingPowerZonesConfiguration)configuration;
- (WOCyclingPowerZonesConfigurationStore)configurationStore;
- (WOCyclingSensorsStore)cyclingSensorsStore;
- (id)_functionalThresholdPowerString;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_insertConfigurationTypeSpecifiers:(id)a3;
- (void)_insertFunctionalThresholdPowerSpecifiers:(id)a3;
- (void)_insertPowerZonesSizeSpecifiers:(id)a3;
- (void)_insertRecalculateZonesSpecifiers:(id)a3;
- (void)_insertZonesSpecifiers:(id)a3;
- (void)_mainThread_handleCyclingPowerZonesConfiguration:(id)a3;
- (void)_pressedAutomaticPreference;
- (void)_pressedCyclingPowerZonesSize;
- (void)_pressedFunctionalThresholdPower;
- (void)_pressedManualPreference;
- (void)_pressedRecalculateZones;
- (void)_pressedZoneForSpecifier:(id)a3;
- (void)_zoneRangeDisplayValueForSpecifier:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationStore:(id)a3;
- (void)setCyclingSensorsStore:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)updateWithConfiguration:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppCyclingPowerConfigViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HPRFSessionTrackerAppCyclingPowerConfigViewController;
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)&v19 viewDidLoad];
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v5 = [v3 getAllDevicesWithArchivedDevicesMatching:v4];
  v6 = [v5 firstObject];

  v7 = FIUIHealthStoreForDevice();
  id v8 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v7];
  v9 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v8];
  formattingManager = self->_formattingManager;
  self->_formattingManager = v9;

  v11 = [[WOCyclingPowerZonesConfigurationStore alloc] initWithHealthStore:v7];
  configurationStore = self->_configurationStore;
  self->_configurationStore = v11;

  v13 = objc_alloc_init(WOCyclingSensorsStore);
  cyclingSensorsStore = self->_cyclingSensorsStore;
  self->_cyclingSensorsStore = v13;

  objc_initWeak(&location, self);
  v15 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configurationStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_14F4C;
  v16[3] = &unk_312E0;
  objc_copyWeak(&v17, &location);
  [v15 fetchCyclingPowerZonesConfigurationWithCompletion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CYCLING_POWER_ZONES_BUTTON_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (id)applicationBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFSessionTrackerAppCyclingPowerConfigViewController;
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)&v6 viewWillAppear:a3];
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Viewing Cycling Power Zones", v5, 2u);
  }
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self reloadSpecifiers];
}

- (void)_mainThread_handleCyclingPowerZonesConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setConfiguration:v4];

  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  v3 = objc_opt_new();
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_PANE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setTitle:v5];

  objc_super v6 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];

  if (v6)
  {
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _insertConfigurationTypeSpecifiers:v3];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _insertFunctionalThresholdPowerSpecifiers:v3];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _insertPowerZonesSizeSpecifiers:v3];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _insertZonesSpecifiers:v3];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _insertRecalculateZonesSpecifiers:v3];
  }
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  id v8 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v9 = v3;

  id v10 = *(id *)&self->BPSNotificationAppController_opaque[v7];
  return v10;
}

- (void)_insertConfigurationTypeSpecifiers:(id)a3
{
  id v32 = a3;
  id v4 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_CONFIGURATION_TYPE_GROUP_ID"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  v5 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  objc_super v6 = (char *)[v5 configurationType];

  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = v9;
    CFStringRef v11 = @"CYCLING_POWER_CONFIGURATION_MANUAL_FOOTER";
    goto LABEL_6;
  }
  if (!v6)
  {
    uint64_t v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    unsigned int v8 = [v7 isAutomaticFromAppleFTP];

    if (v8)
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = v9;
      CFStringRef v11 = @"CYCLING_POWER_CONFIGURATION_AUTOMATIC_FOOTER";
LABEL_6:
      v12 = [v9 localizedStringForKey:v11 value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v4 setProperty:v12 forKey:PSFooterTextGroupKey];
    }
  }
  [v32 addObject:v4];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_AUTOMATIC" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v15 setIdentifier:@"CYCLING_POWER_CONFIGURATION_TYPE_AUTOMATIC_ID"];
  [v15 setButtonAction:"_pressedAutomaticPreference"];
  v16 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v17 = [v16 configurationType];

  if (!v17) {
    [v4 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v32 addObject:v15];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v19 = [v18 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_MANUAL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v20 setIdentifier:@"CYCLING_POWER_CONFIGURATION_TYPE_MANUAL_ID"];
  [v20 setButtonAction:"_pressedManualPreference"];
  v21 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  v22 = (char *)[v21 configurationType];

  if (v22 == (unsigned char *)&dword_0 + 1) {
    [v4 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v32 addObject:v20];
  v23 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  if ([v23 configurationType])
  {
  }
  else
  {
    v24 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    unsigned __int8 v25 = [v24 isAutomaticFromAppleFTP];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_NO_FTP_GROUP_ID"];

      [v32 addObject:v26];
      v27 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:4 edit:0];

      [v27 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_AUTOMATIC_FTP_NOT_AVAILABLE_NAME" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v27 setProperty:v29 forKey:@"HPRFSessionTrackerAppCyclingPowerDetailPlatterCellTitleKey"];

      v30 = +[NSBundle bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_AUTOMATIC_FTP_NOT_AVAILABLE_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      [v27 setProperty:v31 forKey:@"HPRFSessionTrackerAppCyclingPowerDetailPlatterCellDetailKey"];

      [v32 addObject:v27];
      id v4 = (void *)v26;
      v20 = v27;
    }
  }
}

- (void)_insertFunctionalThresholdPowerSpecifiers:(id)a3
{
  id v30 = a3;
  id v4 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  v5 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_FTP_GROUP_ID"];
  objc_super v6 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  uint64_t v7 = (char *)[v6 configurationType];

  unsigned int v8 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    v18 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    id v17 = +[HPRFSessionTrackerAppCyclingPowerConfigViewController automaticFTPString:v18];

    objc_super v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_MANUAL_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v17);

    [v5 setProperty:v21 forKey:PSFooterTextGroupKey];
  }
  else
  {
    if (v7) {
      goto LABEL_7;
    }
    id v9 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    unsigned int v10 = [v9 isAutomaticFromAppleFTP];

    if (!v10) {
      goto LABEL_7;
    }
    CFStringRef v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_AUTOMATIC_FTP_AVAILABLE_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v13 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    v14 = [v13 functionalThresholdPower];
    v15 = [v14 creationDate];
    v16 = +[FIUIDateFormattingUtilities stringWithShortStyleDate:v15];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v16);

    unsigned int v8 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    id v4 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;

    [v5 setProperty:v17 forKey:PSFooterTextGroupKey];
  }

LABEL_7:
  [v30 addObject:v5];
  v22 = v4[331];
  v23 = [v8[309] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  unsigned __int8 v25 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  if ([v25 isEditable]) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 4;
  }
  v27 = [v22 preferenceSpecifierNamed:v24 target:self set:0 get:"_functionalThresholdPowerString" detail:0 cell:v26 edit:0];

  v28 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  unsigned int v29 = [v28 isEditable];

  if (v29)
  {
    [v27 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v27 setButtonAction:"_pressedFunctionalThresholdPower"];
  }
  [v27 setProperty:&__kCFBooleanTrue forKey:PSPrioritizeValueTextDisplayKey];
  [v27 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v27 setProperty:&__kCFBooleanTrue forKey:PSAdjustFontSizeToFitWidthKey];
  [v30 addObject:v27];
}

- (void)_insertPowerZonesSizeSpecifiers:(id)a3
{
  id v20 = a3;
  id v4 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  v5 = (char *)[v4 configurationType];

  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    objc_super v6 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    if ([v6 isEditable])
    {
      uint64_t v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
      unsigned int v8 = [v7 functionalThresholdPower];
      unsigned __int8 v9 = [v8 isAvailable];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }

    unsigned int v10 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_NUMBER_OF_ZONES_GROUP_ID"];
    CFStringRef v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_POWER_ZONES_SIZE_HEADER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v10 setName:v12];

    [v20 addObject:v10];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_POWER_ZONES_SIZE_ITEM_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v15 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    v16 = [v15 zones];
    id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
    v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v17);

    if (v9)
    {
      objc_super v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:2 edit:0];
      [v19 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v19 setButtonAction:"_pressedCyclingPowerZonesSize"];
    }
    else
    {
      objc_super v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:4 edit:0];
    }
    [v20 addObject:v19];
  }
}

- (void)_pressedCyclingPowerZonesSize
{
  v3 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v4 = (char *)[v3 configurationType];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      objc_super v6 = v5;
      uint64_t v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _functionalThresholdPowerString];
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Push editing for Functional Threshold Power: %@", (uint8_t *)&v12, 0xCu);
    }
    unsigned int v8 = [HPRFSessionTrackerAppCyclingPowerZonesSizeViewController alloc];
    unsigned __int8 v9 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    unsigned int v10 = [(HPRFSessionTrackerAppCyclingPowerZonesSizeViewController *)v8 initWithConfiguration:v9 updateDelegate:self];

    CFStringRef v11 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
}

+ (id)numberFormatter
{
  if (qword_3D0A8[0] != -1) {
    dispatch_once(qword_3D0A8, &stru_31300);
  }
  v2 = (void *)qword_3D0A0;

  return v2;
}

- (id)_functionalThresholdPowerString
{
  v3 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v4 = [v3 functionalThresholdPower];
  v5 = [v4 quantity];
  [v5 _value];
  double v7 = v6;

  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v9 = v8;
  if (v7 <= 0.0)
  {
    unsigned int v10 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_NOT_AVAILABLE_FORMAT" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    CFStringRef v11 = +[NSBundle bundleForClass:objc_opt_class()];
    int v12 = [v11 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_EMPTY_VALUE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v13 = +[FIUIFormattingManager localizedShortPowerUnitString];
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12, v13);
  }
  else
  {
    unsigned int v10 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_AVAILABLE_FORMAT" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    CFStringRef v11 = [(id)objc_opt_class() numberFormatter];
    int v12 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    v13 = [v12 functionalThresholdPower];
    v14 = [v13 quantity];
    [v14 _value];
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v16 = [v11 stringFromNumber:v15];
    id v17 = +[FIUIFormattingManager localizedShortPowerUnitString];
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v16, v17);
  }

  return v18;
}

+ (id)automaticFTPString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 automaticFTP];
  v5 = [v4 quantity];
  [v5 _value];
  double v7 = v6;

  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v9 = v8;
  if (v7 <= 0.0)
  {
    unsigned int v10 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_NOT_AVAILABLE_FORMAT" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    id v20 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v11 = [v20 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_EMPTY_VALUE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    int v12 = +[FIUIFormattingManager localizedShortPowerUnitString];
    objc_super v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v12);
  }
  else
  {
    unsigned int v10 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FTP_AVAILABLE_WITH_DATE_FORMAT" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v22 = [(id)objc_opt_class() numberFormatter];
    v24 = v9;
    CFStringRef v11 = [v3 automaticFTP];
    int v12 = [v11 quantity];
    [v12 _value];
    v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v22 stringFromNumber:v23];
    v14 = v13 = v3;
    v15 = +[FIUIFormattingManager localizedShortPowerUnitString];
    v16 = [v13 automaticFTP];
    id v17 = [v16 creationDate];
    v18 = +[FIUIDateFormattingUtilities stringWithShortStyleDate:v17];
    objc_super v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v14, v15, v18);

    id v20 = v22;
    id v3 = v13;
    unsigned __int8 v9 = v24;
  }

  return v19;
}

- (void)_insertZonesSpecifiers:(id)a3
{
  id v32 = a3;
  id v4 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  v5 = [v4 zones];
  id v6 = [v5 count];

  if (v6)
  {
    unsigned int v29 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_ZONES_GROUP_ID"];
    objc_msgSend(v32, "addObject:");
    double v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    if ([v7 isEditable])
    {
      unsigned int v8 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
      unsigned __int8 v9 = [v8 functionalThresholdPower];
      id v10 = [v9 isAvailable];
    }
    else
    {
      id v10 = 0;
    }

    CFStringRef v11 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    int v12 = [v11 zones];
    id v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      uint64_t v15 = 4;
      if (v10) {
        uint64_t v15 = 2;
      }
      uint64_t v31 = v15;
      uint64_t v16 = PSCellClassKey;
      uint64_t v30 = PSEnabledKey;
      do
      {
        id v17 = +[NSBundle bundleForClass:objc_opt_class()];
        v18 = [v17 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        unint64_t v19 = v14 + 1;
        id v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v14 + 1);
        v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:v31 edit:0];

        v22 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
        v23 = [v22 zones];
        v24 = [v23 objectAtIndexedSubscript:v14];
        [v21 setUserInfo:v24];

        [v21 setProperty:objc_opt_class() forKey:v16];
        unsigned __int8 v25 = +[NSNumber numberWithBool:v10];
        [v21 setProperty:v25 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellEditableKey"];

        [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _zoneRangeDisplayValueForSpecifier:v21];
        if (v10)
        {
          [v21 setProperty:&__kCFBooleanTrue forKey:v30];
          [v21 setButtonAction:"_pressedZoneForSpecifier:"];
        }
        [v32 addObject:v21];

        uint64_t v26 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
        v27 = [v26 zones];
        id v28 = [v27 count];

        unint64_t v14 = v19;
      }
      while (v19 < (unint64_t)v28);
    }
  }
}

- (void)_zoneRangeDisplayValueForSpecifier:(id)a3
{
  id v62 = a3;
  id v3 = [v62 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v62 userInfo];
  }
  else
  {
    id v4 = 0;
  }

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  double v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, (char *)[v4 index] + 1);

  [v62 setProperty:v7 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellTitleKey"];
  if (v4)
  {
    if ([v4 isEmpty])
    {
      unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v9 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_EMPTY_ZONE_WATTS_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      id v10 = +[FIUIFormattingManager localizedShortPowerUnitString];
      CFStringRef v11 = [v10 lowercaseString];
      int v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);

      [v62 setProperty:v12 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellDisplayRangeKey"];
      [v62 setProperty:&stru_31A20 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellPercentageRangeKey"];
LABEL_18:

      goto LABEL_19;
    }
    int v12 = [v4 lowerBound];

    if (v12)
    {
      id v13 = [(id)objc_opt_class() numberFormatter];
      unint64_t v14 = [v4 lowerBound];
      [v14 _value];
      uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      int v12 = [v13 stringFromNumber:v15];
    }
    uint64_t v16 = [v4 upperBound];

    if (v16)
    {
      id v17 = [(id)objc_opt_class() numberFormatter];
      v18 = [v4 upperBound];
      [v18 _value];
      unint64_t v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v20 = [v17 stringFromNumber:v19];

      if (v12 && v20)
      {
        v21 = [(id)objc_opt_class() numberFormatter];
        [v4 percentageLowerBound];
        v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v57 = [v21 stringFromNumber:v22];

        v23 = [(id)objc_opt_class() numberFormatter];
        [v4 percentageUpperBound];
        v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v55 = [v23 stringFromNumber:v24];

        unsigned __int8 v25 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v26 = [v25 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_WATTS_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        v27 = +[FIUIFormattingManager localizedShortPowerUnitString];
        id v28 = [v27 lowercaseString];
        v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v12, v20, v28);

        unsigned int v29 = (void *)v57;
        [v62 setProperty:v59 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellDisplayRangeKey"];
        uint64_t v30 = (void *)v55;
        uint64_t v31 = +[NSBundle bundleForClass:objc_opt_class()];
        id v32 = [v31 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_PERCENTAGE_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v57, v55);

        [v62 setProperty:v33 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellPercentageRangeKey"];
        goto LABEL_17;
      }
      if (v20)
      {
        v34 = [(id)objc_opt_class() numberFormatter];
        [v4 percentageLowerBound];
        v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v58 = [v34 stringFromNumber:v35];

        v36 = [(id)objc_opt_class() numberFormatter];
        [v4 percentageUpperBound];
        v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v56 = [v36 stringFromNumber:v37];

        v38 = +[NSBundle bundleForClass:objc_opt_class()];
        v39 = [v38 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_FIRST_ZONE_WATTS_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        v40 = +[FIUIFormattingManager localizedShortPowerUnitString];
        [v40 lowercaseString];
        v41 = v60 = v20;
        v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v39, v60, v41);

        unsigned int v29 = (void *)v58;
        [v62 setProperty:v42 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellDisplayRangeKey"];
        uint64_t v30 = (void *)v56;
        v43 = +[NSBundle bundleForClass:objc_opt_class()];
        v44 = [v43 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_ZONE_PERCENTAGE_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v58, v56);

        [v62 setProperty:v45 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellPercentageRangeKey"];
        id v20 = v60;

        goto LABEL_17;
      }
    }
    if (!v12) {
      goto LABEL_18;
    }
    v46 = [(id)objc_opt_class() numberFormatter];
    [v4 percentageLowerBound];
    v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v61 = [v46 stringFromNumber:v47];

    v48 = +[NSBundle bundleForClass:objc_opt_class()];
    v49 = [v48 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_LAST_ZONE_WATTS_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v50 = +[FIUIFormattingManager localizedShortPowerUnitString];
    v51 = [v50 lowercaseString];
    uint64_t v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v49, v12, v51);

    unsigned int v29 = (void *)v52;
    [v62 setProperty:v52 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellDisplayRangeKey"];
    v53 = +[NSBundle bundleForClass:objc_opt_class()];
    v54 = [v53 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_LAST_ZONE_PERCENTAGE_RANGE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    id v20 = (void *)v61;
    uint64_t v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v61);

    [v62 setProperty:v30 forKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellPercentageRangeKey"];
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
}

- (void)_insertRecalculateZonesSpecifiers:(id)a3
{
  id v16 = a3;
  id v4 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  if ([v4 isEditable])
  {
    v5 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    id v6 = [v5 functionalThresholdPower];
    unsigned int v7 = [v6 isAvailable];

    if (!v7) {
      goto LABEL_11;
    }
    id v4 = +[PSSpecifier groupSpecifierWithID:@"CYCLING_POWER_RECALCULATE_ZONES_GROUP_ID"];
    unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_RECALCULATE_ZONES_FOOTER" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    [v4 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v16 addObject:v4];
    id v10 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    if ([v10 isEditable])
    {
      CFStringRef v11 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
      unsigned int v12 = !+[WOCyclingPowerZonesConfigurationEditor isManualZonesEqualToAutomaticUsing:v11];
    }
    else
    {
      unsigned int v12 = 0;
    }

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v14 = [v13 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_RECALCULATE_ZONES_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];

    if (v12)
    {
      [v15 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [v15 setButtonAction:"_pressedRecalculateZones"];
    }
    else
    {
      [v15 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    [v16 addObject:v15];
  }
LABEL_11:
}

- (void)_pressedRecalculateZones
{
  id v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_RECALCULATE_ZONES_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_175B4;
  v10[3] = &unk_31328;
  v10[4] = self;
  id v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:v10];
  [v3 addAction:v6];

  unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"CYCLING_POWER_CONFIGURATION_CANCEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  unsigned __int8 v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&stru_31368];
  [v3 addAction:v9];

  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self presentViewController:v3 animated:1 completion:&stru_31388];
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, a3);
  if (self->_configurationStore && *p_configuration)
  {
    _HKInitializeLogging();
    unsigned int v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = *p_configuration;
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Save CyclingPowerZonesConfiguration: %@", (uint8_t *)&v9, 0xCu);
    }
    [(WOCyclingPowerZonesConfigurationStore *)self->_configurationStore saveCyclingPowerZonesConfiguration:*p_configuration];
  }
}

- (void)_pressedAutomaticPreference
{
  id v3 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v4 = [v3 configurationType];

  if (v4)
  {
    id v5 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    id v6 = +[WOCyclingPowerZonesConfigurationEditor changeConfigurationTypeTo:0 using:v5];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setConfiguration:v6];

    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self reloadSpecifiers];
  }
}

- (void)_pressedManualPreference
{
  id v3 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v4 = (char *)[v3 configurationType];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return;
  }
  id v5 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v6 = +[WOCyclingPowerZonesConfigurationEditor changeConfigurationTypeTo:1 using:v5];
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setConfiguration:v6];

  unsigned int v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  unsigned int v8 = [v7 functionalThresholdPower];
  if ([v8 isAvailable]) {
    goto LABEL_7;
  }
  int v9 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  if (![v9 isEmpty])
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v10 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  CFStringRef v11 = [v10 automaticFTP];
  unsigned int v12 = [v11 isAvailable];

  if (v12)
  {
    unsigned int v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    unsigned int v8 = [v7 automaticFTP];
    [v8 value];
    double v14 = v13;
    int v9 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    uint64_t v15 = +[WOCyclingPowerZonesConfigurationEditor changeFunctionalThresholdPowerTo:v9 using:v14];
    [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setConfiguration:v15];

    goto LABEL_6;
  }
LABEL_8:

  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self reloadSpecifiers];
}

- (void)_pressedFunctionalThresholdPower
{
  id v3 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  id v4 = (char *)[v3 configurationType];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    _HKInitializeLogging();
    id v5 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      unsigned int v7 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self _functionalThresholdPowerString];
      int v12 = 138412290;
      double v13 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Push editing for Functional Threshold Power: %@", (uint8_t *)&v12, 0xCu);
    }
    unsigned int v8 = [HPRFSessionTrackerAppCyclingPowerFTPViewController alloc];
    int v9 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
    id v10 = [(HPRFSessionTrackerAppCyclingPowerFTPViewController *)v8 initWithConfiguration:v9 updateDelegate:self];

    CFStringRef v11 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
}

- (void)_pressedZoneForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
  unsigned int v6 = [v5 isEditable];

  if (!v6) {
    goto LABEL_10;
  }
  unsigned int v7 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v8 = [v4 userInfo];

    if (v8)
    {
      _HKInitializeLogging();
      int v9 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Push editing for Cycling Power Zone (%@)", (uint8_t *)&v15, 0xCu);
      }
      id v10 = [HPRFSessionTrackerAppCyclingPowerZoneViewController alloc];
      CFStringRef v11 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self configuration];
      int v12 = -[HPRFSessionTrackerAppCyclingPowerZoneViewController initWithConfiguration:zoneIndex:updateDelegate:](v10, "initWithConfiguration:zoneIndex:updateDelegate:", v11, [v8 index], self);

      double v13 = [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self navigationController];
      [v13 pushViewController:v12 animated:1];

      goto LABEL_10;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  double v14 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    sub_1FC14((uint64_t)v4, v14, self);
  }
LABEL_10:
}

- (void)updateWithConfiguration:(id)a3
{
  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self setConfiguration:a3];

  [(HPRFSessionTrackerAppCyclingPowerConfigViewController *)self reloadSpecifiers];
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (WOCyclingPowerZonesConfiguration)configuration
{
  return self->_configuration;
}

- (WOCyclingPowerZonesConfigurationStore)configurationStore
{
  return self->_configurationStore;
}

- (void)setConfigurationStore:(id)a3
{
}

- (WOCyclingSensorsStore)cyclingSensorsStore
{
  return self->_cyclingSensorsStore;
}

- (void)setCyclingSensorsStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingSensorsStore, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end