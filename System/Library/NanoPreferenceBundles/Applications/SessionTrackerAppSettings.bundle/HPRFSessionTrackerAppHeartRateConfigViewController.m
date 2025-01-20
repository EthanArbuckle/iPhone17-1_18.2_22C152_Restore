@interface HPRFSessionTrackerAppHeartRateConfigViewController
- (BOOL)_hasData;
- (BOOL)_shouldManuallyConfigure;
- (FIUIFormattingManager)formattingManager;
- (NSArray)tableStructure;
- (WOHeartRateConfiguration)automaticConfiguration;
- (WOHeartRateConfiguration)configuration;
- (WOHeartRateConfiguration)manualConfiguration;
- (WOHeartRateConfigurationRequest)request;
- (id)_footerForSection:(int64_t)a3;
- (id)_maximumHeartRateDisplayValue;
- (id)_restingHeartRateDisplayValue;
- (id)_zoneRangeDisplayValueForSpecifier:(id)a3;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_insertConfigurationTypeSpecifiers:(id)a3;
- (void)_insertMaximumHeartRateSpecifiers:(id)a3;
- (void)_insertRestingHeartRateSpecifiers:(id)a3;
- (void)_insertSpecifiers:(id)a3 forSection:(int64_t)a4;
- (void)_insertZonesSpecifiers:(id)a3;
- (void)_mainThread_handleLoadingActiveConfiguration:(id)a3 inactiveConfiguration:(id)a4;
- (void)_pressedAutomaticPreference;
- (void)_pressedManualPreference;
- (void)_pressedZoneForSpecifier:(id)a3;
- (void)_restingHeartRateButtonTap;
- (void)setAutomaticConfiguration:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFormattingManager:(id)a3;
- (void)setManualConfiguration:(id)a3;
- (void)setRequest:(id)a3;
- (void)setTableStructure:(id)a3;
- (void)updateZone:(id)a3 withNewZone:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HPRFSessionTrackerAppHeartRateConfigViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HPRFSessionTrackerAppHeartRateConfigViewController;
  [(HPRFSessionTrackerAppHeartRateConfigViewController *)&v11 viewDidLoad];
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v5 = [v3 getAllDevicesWithArchivedDevicesMatching:v4];
  v6 = [v5 firstObject];

  v7 = FIUIHealthStoreForDevice();
  id v8 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v7];
  v9 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v8];
  formattingManager = self->_formattingManager;
  self->_formattingManager = v9;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEART_ZONES_BUTTON_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

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
  v9.receiver = self;
  v9.super_class = (Class)HPRFSessionTrackerAppHeartRateConfigViewController;
  [(HPRFSessionTrackerAppHeartRateConfigViewController *)&v9 viewWillAppear:a3];
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Viewing Heart Rate Zones", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self request];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_965C;
  v6[3] = &unk_31078;
  objc_copyWeak(&v7, buf);
  [v5 fetchActiveAndInactiveConfigurationWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_mainThread_handleLoadingActiveConfiguration:(id)a3 inactiveConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v8 = (char *)[v6 configurationType];
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setManualConfiguration:v6];
  }
  else if (!v8)
  {
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setAutomaticConfiguration:v6];
  }
  objc_super v9 = (char *)[v7 configurationType];
  if (v9 == (unsigned char *)&dword_0 + 1)
  {
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setManualConfiguration:v7];
  }
  else if (!v9)
  {
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setAutomaticConfiguration:v7];
  }
  [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setConfiguration:v6];
  _HKInitializeLogging();
  v10 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = v10;
    v12 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self automaticConfiguration];
    v13 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];
    int v14 = 138412546;
    v15 = v12;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Loaded heart rate configurations automatic %@, manual %@", (uint8_t *)&v14, 0x16u);
  }
  [(HPRFSessionTrackerAppHeartRateConfigViewController *)self reloadSpecifiers];
}

- (WOHeartRateConfigurationRequest)request
{
  request = self->_request;
  if (!request)
  {
    v4 = (WOHeartRateConfigurationRequest *)objc_opt_new();
    v5 = self->_request;
    self->_request = v4;

    request = self->_request;
  }

  return request;
}

- (NSArray)tableStructure
{
  if (!self->_tableStructure)
  {
    if ([(HPRFSessionTrackerAppHeartRateConfigViewController *)self _hasData])
    {
      if ([(HPRFSessionTrackerAppHeartRateConfigViewController *)self _shouldManuallyConfigure])
      {
        v3 = (NSArray *)&off_344C8;
      }
      else
      {
        v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];

        v3 = (NSArray *)&off_344F8;
        if (!v4) {
          v3 = (NSArray *)&off_344E0;
        }
      }
    }
    else
    {
      v3 = (NSArray *)&__NSArray0__struct;
    }
    tableStructure = self->_tableStructure;
    self->_tableStructure = v3;
  }
  id v6 = self->_tableStructure;

  return v6;
}

- (void)setConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
  tableStructure = self->_tableStructure;
  self->_tableStructure = 0;
}

- (BOOL)_hasData
{
  v2 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldManuallyConfigure
{
  v2 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  unsigned __int8 v3 = [v2 isEditable];

  return v3;
}

- (id)specifiers
{
  unsigned __int8 v3 = objc_opt_new();
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"HEART_RATE_CONFIGURATION_PANE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setTitle:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self tableStructure];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HPRFSessionTrackerAppHeartRateConfigViewController _insertSpecifiers:forSection:](self, "_insertSpecifiers:forSection:", v3, [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) integerValue]);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
  v12 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v13 = v3;

  id v14 = *(id *)&self->BPSNotificationAppController_opaque[v11];
  return v14;
}

- (void)_insertSpecifiers:(id)a3 forSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _insertConfigurationTypeSpecifiers:v6];
      break;
    case 1:
      [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _insertRestingHeartRateSpecifiers:v6];
      break;
    case 2:
      [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _insertMaximumHeartRateSpecifiers:v6];
      break;
    case 3:
      [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _insertZonesSpecifiers:v6];
      break;
    default:
      break;
  }

  _objc_release_x1();
}

- (void)_insertConfigurationTypeSpecifiers:(id)a3
{
  id v21 = a3;
  v4 = +[PSSpecifier groupSpecifierWithID:@"HEART_RATE_CONFIGURATION_TYPE_GROUP_ID"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _footerForSection:0];
  [v4 setProperty:v5 forKey:PSFooterTextGroupKey];

  [v21 addObject:v4];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"HEART_RATE_CONFIGURATION_AUTOMATIC" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v8 setIdentifier:@"HEART_RATE_CONFIGURATION_TYPE_AUTOMATIC_ID"];
  [v8 setButtonAction:"_pressedAutomaticPreference"];
  uint64_t v9 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  v10 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self automaticConfiguration];

  if (v9 == v10) {
    [v4 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v21 addObject:v8];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"HEART_RATE_CONFIGURATION_MANUAL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  id v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v13 setIdentifier:@"HEART_RATE_CONFIGURATION_TYPE_MANUAL_ID"];
  [v13 setButtonAction:"_pressedManualPreference"];
  id v14 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  v15 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];

  if (v14 == v15) {
    [v4 setProperty:v13 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v21 addObject:v13];
  long long v16 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];

  if (!v16)
  {
    uint64_t v17 = +[PSSpecifier groupSpecifierWithID:@"FitnessAppButtonGroup"];

    [v21 addObject:v17];
    long long v18 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v19 = [v18 localizedStringForKey:@"FITNESS_APP_BUTTON_NAME" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v20 setButtonAction:"_restingHeartRateButtonTap"];
    [v21 addObject:v20];
    v4 = (void *)v17;
    id v13 = v20;
  }
}

- (void)_restingHeartRateButtonTap
{
  _HKInitializeLogging();
  v2 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Jumping out to Fitness app", v5, 2u);
  }
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  v4 = +[NSURL URLWithString:@"fitnessapp-settings://health_details"];
  [v3 openURL:v4 options:&__NSDictionary0__struct completionHandler:&stru_310B8];
}

- (void)_insertRestingHeartRateSpecifiers:(id)a3
{
  id v4 = a3;
  id v9 = +[PSSpecifier groupSpecifierWithID:@"RESTING_HEART_RATE_GROUP_ID"];
  v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self _footerForSection:1];
  [v9 setProperty:v5 forKey:PSFooterTextGroupKey];

  [v4 addObject:v9];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"HEART_RATE_CONFIGURATION_RESTING_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_restingHeartRateDisplayValue" detail:0 cell:4 edit:0];

  [v4 addObject:v8];
}

- (void)_insertMaximumHeartRateSpecifiers:(id)a3
{
  id v4 = a3;
  id v8 = +[PSSpecifier groupSpecifierWithID:@"RESTING_HEART_RATE_GROUP_ID"];
  [v4 addObject:v8];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"HEART_RATE_CONFIGURATION_MAXIMUM_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_maximumHeartRateDisplayValue" detail:0 cell:4 edit:0];

  [v4 addObject:v7];
}

- (void)_insertZonesSpecifiers:(id)a3
{
  id v32 = a3;
  id v4 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  v5 = +[PSSpecifier groupSpecifierWithID:@"RESTING_HEART_RATE_GROUP_ID"];
  id v6 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v7 = &selRef_setButtonAction_;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"HEART_RATE_CONFIGURATION_ZONES_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [v5 setName:v9];

  v30 = v5;
  [v32 addObject:v5];
  v10 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  uint64_t v11 = [v10 zones];
  id v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v31 = PSEnabledKey;
    do
    {
      id v14 = v4[331];
      v15 = [v6[309] bundleForClass:objc_opt_class()];
      [v15 localizedStringForKey:@"HEART_RATE_CONFIGURATION_ZONE_DETAIL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
      long long v16 = v7;
      v18 = uint64_t v17 = v6;
      unint64_t v19 = v13 + 1;
      v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v13 + 1);
      id v21 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
      if ([v21 isEditable]) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 4;
      }
      v23 = [v14 preferenceSpecifierNamed:v20 target:self set:0 get:"_zoneRangeDisplayValueForSpecifier:" detail:0 cell:v22 edit:0];

      [v23 setProperty:&__kCFBooleanTrue forKey:v31];
      v24 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
      v25 = [v24 zones];
      v26 = [v25 objectAtIndexedSubscript:v13];
      [v23 setUserInfo:v26];

      id v6 = v17;
      id v7 = v16;

      [v23 setButtonAction:"_pressedZoneForSpecifier:"];
      [v32 addObject:v23];

      v27 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
      v28 = [v27 zones];
      id v29 = [v28 count];

      id v4 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      ++v13;
    }
    while (v19 < (unint64_t)v29);
  }
}

- (id)_footerForSection:(int64_t)a3
{
  if (a3 == 1)
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v12;
      id v14 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
      v19[0] = 67109120;
      v19[1] = [v14 hasDefaultRestingHeartRate];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Resting heart rate section: %d", (uint8_t *)v19, 8u);
    }
    v15 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
    unsigned int v16 = [v15 hasDefaultRestingHeartRate];

    if (v16)
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = v9;
      CFStringRef v11 = @"HEART_RATE_CONFIGURATION_AUTOMATIC_DEFAULT_RESTING_FOOTER";
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  if (a3) {
    goto LABEL_11;
  }
  id v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];

  if (!v4)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v9;
    CFStringRef v11 = @"HEART_RATE_CONFIGURATION_AUTOMATIC_NO_DOB_FOOTER";
    goto LABEL_14;
  }
  v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  id v6 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self automaticConfiguration];

  if (v5 == v6)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = v9;
    CFStringRef v11 = @"HEART_RATE_CONFIGURATION_AUTOMATIC_FOOTER";
    goto LABEL_14;
  }
  id v7 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  id v8 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];

  if (v7 != v8) {
    goto LABEL_11;
  }
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = v9;
  CFStringRef v11 = @"HEART_RATE_CONFIGURATION_MANUAL_FOOTER";
LABEL_14:
  uint64_t v17 = [v9 localizedStringForKey:v11 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

LABEL_15:

  return v17;
}

- (void)_pressedAutomaticPreference
{
  unsigned __int8 v3 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  id v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self automaticConfiguration];

  if (v3 != v4)
  {
    +[WOHeartRateConfiguration setConfigurationType:0];
    v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self automaticConfiguration];
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setConfiguration:v5];

    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self reloadSpecifiers];
  }
}

- (void)_pressedManualPreference
{
  unsigned __int8 v3 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  id v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];

  if (v3 != v4)
  {
    +[WOHeartRateConfiguration setConfigurationType:1];
    v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self manualConfiguration];
    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self setConfiguration:v5];

    [(HPRFSessionTrackerAppHeartRateConfigViewController *)self reloadSpecifiers];
  }
}

- (id)_restingHeartRateDisplayValue
{
  unsigned __int8 v3 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self formattingManager];
  id v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  v5 = [v4 restingHeartRate];
  id v6 = [v3 localizedStringWithHeartRate:v5 unitStyle:3];

  return v6;
}

- (id)_maximumHeartRateDisplayValue
{
  unsigned __int8 v3 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self formattingManager];
  id v4 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  v5 = [v4 maximumHeartRate];
  id v6 = [v3 localizedStringWithHeartRate:v5 unitStyle:3];

  return v6;
}

- (id)_zoneRangeDisplayValueForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 userInfo];

    if (!v6)
    {
      unsigned int v16 = 0;
      goto LABEL_19;
    }
    id v7 = [v6 lowerDisplayBound];

    if (v7)
    {
      id v8 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self formattingManager];
      id v9 = [v6 lowerDisplayBound];
      id v7 = [v8 localizedStringWithHeartRate:v9 unitStyle:0];
    }
    v10 = [v6 upperDisplayBound];

    if (v10)
    {
      CFStringRef v11 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self formattingManager];
      id v12 = [v6 upperDisplayBound];
      uint64_t v13 = [v11 localizedStringWithHeartRate:v12 unitStyle:0];

      if (v7 && v13)
      {
        id v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v15 = [v14 localizedStringForKey:@"HEART_RATE_CONFIGURATION_ZONE_MANUAL_VALUE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v7, v13);
        unsigned int v16 = LABEL_13:;

        goto LABEL_16;
      }
      if (v13)
      {
        id v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v15 = [v14 localizedStringForKey:@"HEART_RATE_CONFIGURATION_FIRST_ZONE_MANUAL_VALUE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13, v18);
        goto LABEL_13;
      }
    }
    if (!v7)
    {
      unsigned int v16 = 0;
      goto LABEL_17;
    }
    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"HEART_RATE_CONFIGURATION_LAST_ZONE_MANUAL_VALUE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    unsigned int v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v7);
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  unsigned int v16 = 0;
  id v6 = v5;
LABEL_18:

LABEL_19:

  return v16;
}

- (void)_pressedZoneForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  unsigned int v6 = [v5 isEditable];

  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v4 userInfo];

    if (v8)
    {
      _HKInitializeLogging();
      id v9 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Push editing for Heart Rate Zone (%@)", (uint8_t *)&v13, 0xCu);
      }
      v10 = [[HPRFSessionTrackerAppHeartRateZoneViewController alloc] initWithDelegate:self zone:v8];
      CFStringRef v11 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self navigationController];
      [v11 pushViewController:v10 animated:1];

      goto LABEL_10;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  id v12 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    sub_1FC14((uint64_t)v4, v12, self);
  }
LABEL_10:
}

- (void)updateZone:(id)a3 withNewZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Updating Heart Rate Zone (%@) to (%@)", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  v10 = [v9 zones];
  CFStringRef v11 = +[WOHeartRateZone zones:replacingZoneAtIndex:withZone:](WOHeartRateZone, "zones:replacingZoneAtIndex:withZone:", v10, [v6 zoneIndex], v7);

  id v12 = [(HPRFSessionTrackerAppHeartRateConfigViewController *)self configuration];
  [v12 setZones:v11];

  [(HPRFSessionTrackerAppHeartRateConfigViewController *)self reloadSpecifiers];
  +[WOHeartRateConfiguration setConfiguredZones:v11];
}

- (void)setRequest:(id)a3
{
}

- (WOHeartRateConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (WOHeartRateConfiguration *)WeakRetained;
}

- (WOHeartRateConfiguration)automaticConfiguration
{
  return self->_automaticConfiguration;
}

- (void)setAutomaticConfiguration:(id)a3
{
}

- (WOHeartRateConfiguration)manualConfiguration
{
  return self->_manualConfiguration;
}

- (void)setManualConfiguration:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (void)setTableStructure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableStructure, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_manualConfiguration, 0);
  objc_storeStrong((id *)&self->_automaticConfiguration, 0);
  objc_destroyWeak((id *)&self->_configuration);

  objc_storeStrong((id *)&self->_request, 0);
}

@end