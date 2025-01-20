@interface HPRFSessionTrackerAppUnitsOfMeasureController
- (HPRFSessionTrackerAppUnitsOfMeasureController)init;
- (id)_specifierBaseIdForDistanceType:(unint64_t)a3;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_distanceTypeForSection:(int64_t)a3;
- (void)_caloriesSelected;
- (void)_handleFitnessUnitPreferencesDidChange;
- (void)_kilocaloriesSelected;
- (void)_kilojoulesSelected;
- (void)_kilometersSelected:(unint64_t)a3;
- (void)_loadEnergyUnit:(id)a3;
- (void)_loadPoolLengthUnit:(id)a3;
- (void)_loadTrackWorkoutsUnit:(id)a3;
- (void)_loadUnitForDistanceType:(unint64_t)a3 specifiers:(id)a4;
- (void)_metersSelected:(unint64_t)a3;
- (void)_milesSelected:(unint64_t)a3;
- (void)_setDistanceUnit:(unint64_t)a3 withDistanceType:(unint64_t)a4;
- (void)_setEnergyBurnedUnit:(id)a3;
- (void)_trackUnitSelected:(int64_t)a3;
- (void)_yardsSelected:(unint64_t)a3;
- (void)dealloc;
- (void)didUpdateKeyValueDomain:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HPRFSessionTrackerAppUnitsOfMeasureController

- (HPRFSessionTrackerAppUnitsOfMeasureController)init
{
  v20.receiver = self;
  v20.super_class = (Class)HPRFSessionTrackerAppUnitsOfMeasureController;
  v2 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)&v20 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v5 = [v3 getAllDevicesWithArchivedDevicesMatching:v4];
    v6 = [v5 firstObject];

    v7 = FIUIHealthStoreForDevice();
    id v8 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v7];
    v9 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v8];
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v9;

    v11 = (_HKWheelchairUseCharacteristicCache *)[objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v7];
    wheelchairUseCharacteristicCache = v2->_wheelchairUseCharacteristicCache;
    v2->_wheelchairUseCharacteristicCache = v11;

    [(_HKWheelchairUseCharacteristicCache *)v2->_wheelchairUseCharacteristicCache addObserver:v2];
    v2->_activityMoveMode = FIActivityMoveModeWithHealthStore();
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_handleFitnessUnitPreferencesDidChange" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];

    id v14 = objc_alloc((Class)HKKeyValueDomain);
    v15 = (HKKeyValueDomain *)[v14 initWithCategory:0 domainName:kHKNanolifestylePreferencesDomain healthStore:v7];
    trackValueDomain = v2->_trackValueDomain;
    v2->_trackValueDomain = v15;

    [(HKKeyValueDomain *)v2->_trackValueDomain startObservation:v2];
    v17 = (HKNanoSyncControl *)[objc_alloc((Class)HKNanoSyncControl) initWithHealthStore:v7];
    trackSyncControl = v2->_trackSyncControl;
    v2->_trackSyncControl = v17;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache removeObserver:self];
  [(HKKeyValueDomain *)self->_trackValueDomain stopObservation:self];
  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerAppUnitsOfMeasureController;
  [(HPRFSessionTrackerAppUnitsOfMeasureController *)&v4 dealloc];
}

- (void)_handleFitnessUnitPreferencesDidChange
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_552C;
  v2[3] = &unk_30ED8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"UNITS_OF_MEASURE_PANE_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (void)_loadEnergyUnit:(id)a3
{
  id v3 = a3;
  v27 = [v3 specifierForID:@"ENERGY_UNITS_GROUP_ID"];
  objc_super v4 = [v3 specifierForID:@"ENERGY_UNITS_CALORIES_ID"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"ENERGY_UNITS_CALORIES_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v7 = +[NSString stringWithFormat:v6];

  [v4 setName:v7];
  id v8 = [v3 specifierForID:@"ENERGY_UNITS_KILOCALORIES_ID"];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"ENERGY_UNITS_KILOCALORIES_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v11 = +[NSString stringWithFormat:v10];

  [v8 setName:v11];
  v12 = [v3 specifierForID:@"ENERGY_UNITS_KILOJOULES_ID"];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"ENERGY_UNITS_KILOJOULES_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v15 = +[NSString stringWithFormat:v14];

  [v12 setName:v15];
  v16 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  v17 = [v16 userActiveEnergyBurnedUnit];

  v18 = +[HKUnit largeCalorieUnit];
  LOBYTE(v14) = [v17 isEqual:v18];

  v19 = v4;
  if ((v14 & 1) == 0)
  {
    objc_super v20 = +[HKUnit kilocalorieUnit];
    unsigned __int8 v21 = [v17 isEqual:v20];

    v19 = v8;
    if ((v21 & 1) == 0)
    {
      v22 = +[HKUnit jouleUnitWithMetricPrefix:9];
      unsigned __int8 v23 = [v17 isEqual:v22];

      v19 = v12;
      if ((v23 & 1) == 0)
      {
        _HKInitializeLogging();
        BOOL v24 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR);
        v19 = v12;
        if (v24)
        {
          sub_1F90C();
          v19 = v12;
        }
      }
    }
  }
  id v25 = v19;
  [v27 setProperty:v25 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)_loadPoolLengthUnit:(id)a3
{
  id v3 = a3;
  v18 = [v3 specifierForID:@"POOL_LENGTH_GROUP_ID"];
  objc_super v4 = [v3 specifierForID:@"POOL_LENGTH_YARDS_ID"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"POOL_LENGTH_YARDS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v7 = +[NSString stringWithFormat:v6];

  [v4 setName:v7];
  id v8 = [v3 specifierForID:@"POOL_LENGTH_METERS_ID"];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"POOL_LENGTH_METERS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v11 = +[NSString stringWithFormat:v10];

  [v8 setName:v11];
  v12 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  id v13 = [v12 userDistanceUnitForDistanceType:3];

  uint64_t v14 = v4;
  switch((unint64_t)v13)
  {
    case 1uLL:
      goto LABEL_4;
    case 2uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_1F9A8();
      }
LABEL_4:
      uint64_t v14 = v8;
      goto LABEL_10;
    case 3uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_1F974();
      }
      goto LABEL_8;
    case 4uLL:
      goto LABEL_10;
    case 5uLL:
LABEL_8:
      _HKInitializeLogging();
      BOOL v16 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR);
      uint64_t v14 = v4;
      if (v16)
      {
        sub_1F940();
        uint64_t v14 = v4;
      }
LABEL_10:
      id v15 = v14;
      break;
    default:
      id v15 = 0;
      break;
  }
  objc_msgSend(v18, "setProperty:forKey:", v15, PSRadioGroupCheckedSpecifierKey, self);
}

- (void)_loadTrackWorkoutsUnit:(id)a3
{
  id v3 = a3;
  v17 = [v3 specifierForID:@"TRACK_WORKOUTS_GROUP_ID"];
  objc_super v4 = [v3 specifierForID:@"TRACK_WORKOUTS_MILES_ID"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TRACK_WORKOUTS_MILES_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v7 = +[NSString stringWithFormat:v6];

  [v4 setName:v7];
  id v8 = [v3 specifierForID:@"TRACK_WORKOUTS_METERS_ID"];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"TRACK_WORKOUTS_METERS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v11 = +[NSString stringWithFormat:v10];

  [v8 setName:v11];
  trackValueDomain = self->_trackValueDomain;
  uint64_t v18 = 0;
  id v13 = [(HKKeyValueDomain *)trackValueDomain numberForKey:@"WOTrackWorkoutsUnit" error:&v18];
  uint64_t v14 = v13;
  id v15 = v8;
  if (!v18)
  {
    id v15 = v8;
    if (v13)
    {
      if (objc_msgSend(v13, "integerValue", v8) == (char *)&dword_0 + 1) {
        id v15 = v8;
      }
      else {
        id v15 = v4;
      }
    }
  }
  [v17 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)_loadUnitForDistanceType:(unint64_t)a3 specifiers:(id)a4
{
  id v6 = a4;
  v7 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _specifierBaseIdForDistanceType:a3];
  v26 = +[NSString stringWithFormat:@"%@%@", v7, @"_GROUP_ID"];
  id v25 = objc_msgSend(v6, "specifierForID:");
  BOOL v24 = +[NSString stringWithFormat:@"%@%@", v7, @"_MILES_ID"];
  id v8 = objc_msgSend(v6, "specifierForID:");
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"STANDARD_WORKOUTS_MILES_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v11 = +[NSString stringWithFormat:v10];
  [v8 setName:v11];

  v12 = +[NSString stringWithFormat:@"%@%@", v7, @"_KILOMETERS_ID"];
  id v13 = [v6 specifierForID:v12];

  uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"STANDARD_WORKOUTS_KILOMETERS_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  BOOL v16 = +[NSString stringWithFormat:v15];
  [v13 setName:v16];

  v17 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  id v18 = [v17 userDistanceUnitForDistanceType:a3];

  v19 = v8;
  switch((unint64_t)v18)
  {
    case 1uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_1FA44();
      }
      goto LABEL_4;
    case 2uLL:
LABEL_4:
      v19 = v13;
      goto LABEL_10;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_8;
    case 5uLL:
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_1FA10();
      }
LABEL_8:
      _HKInitializeLogging();
      BOOL v21 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR);
      v19 = v8;
      if (v21)
      {
        sub_1F9DC();
        v19 = v8;
      }
LABEL_10:
      id v20 = v19;
      break;
    default:
      id v20 = 0;
      break;
  }
  [v25 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self loadSpecifiersFromPlistName:@"SessionTrackerUnitsOfMeasureSettings" target:self];
    id v6 = v5;
    if (self->_activityMoveMode == 2)
    {
      v7 = [v5 specifierForID:@"ENERGY_UNITS_CALORIES_ID"];
      [v6 removeObject:v7];

      id v8 = [v6 specifierForID:@"ENERGY_UNITS_KILOCALORIES_ID"];
      [v6 removeObject:v8];

      v9 = [v6 specifierForID:@"ENERGY_UNITS_KILOJOULES_ID"];
      [v6 removeObject:v9];
    }
    else
    {
      [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadEnergyUnit:v5];
    }
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadPoolLengthUnit:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadTrackWorkoutsUnit:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:1 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:2 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:6 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:7 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:8 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:9 specifiers:v6];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _loadUnitForDistanceType:10 specifiers:v6];
    v10 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self localizedPaneTitle];
    [(HPRFSessionTrackerAppUnitsOfMeasureController *)self setTitle:v10];

    v11 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v6;

    objc_super v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (id)_specifierBaseIdForDistanceType:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"WALKING_AND_RUNNING_WORKOUTS";
  }
  else {
    return *(&off_30F38 + a3);
  }
}

- (unint64_t)_distanceTypeForSection:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 3;
  }
  else {
    return qword_2DA28[a3];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 2;
  }
  if (self->_activityMoveMode == 2) {
    return 0;
  }
  return 3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unsigned int v6 = [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser];
  switch(a4)
  {
    case 0:
      if (self->_activityMoveMode == 2) {
        goto LABEL_3;
      }
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"ENERGY_UNITS_TITLE";
      goto LABEL_15;
    case 1:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"POOL_LENGTH_TITLE";
      goto LABEL_15;
    case 2:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"CYCLING_WORKOUTS_TITLE";
      goto LABEL_15;
    case 3:
      unsigned int v11 = v6;
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      if (v11) {
        CFStringRef v10 = @"WALKING_RUNNING_WORKOUTS_TITLE_WHEELCHAIR";
      }
      else {
        CFStringRef v10 = @"WALKING_RUNNING_WORKOUTS_TITLE";
      }
      goto LABEL_15;
    case 4:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"TRACK_WORKOUTS_TITLE";
      goto LABEL_15;
    case 5:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"CROSS_COUNTRY_SKIING_WORKOUTS_TITLE";
      goto LABEL_15;
    case 6:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"DOWNHILL_SNOW_SPORTS_WORKOUTS_TITLE";
      goto LABEL_15;
    case 7:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"ROWING_WORKOUTS_TITLE";
      goto LABEL_15;
    case 8:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"PADDLE_SPORTS_WORKOUTS_TITLE";
      goto LABEL_15;
    case 9:
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"SKATING_SPORTS_WORKOUTS_TITLE";
LABEL_15:
      v7 = [v8 localizedStringForKey:v10 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

      break;
    default:
LABEL_3:
      v7 = 0;
      break;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  id v10 = [v6 section];
  switch((unint64_t)v10)
  {
    case 0uLL:
      v19 = objc_msgSend(v9, "identifier", v10);
      unsigned int v20 = [v19 isEqualToString:@"ENERGY_UNITS_CALORIES_ID"];

      if (v20)
      {
        [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _caloriesSelected];
      }
      else
      {
        v27 = [v9 identifier];
        unsigned int v28 = [v27 isEqualToString:@"ENERGY_UNITS_KILOCALORIES_ID"];

        if (v28)
        {
          [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _kilocaloriesSelected];
        }
        else
        {
          v33 = [v9 identifier];
          unsigned int v34 = [v33 isEqualToString:@"ENERGY_UNITS_KILOJOULES_ID"];

          if (v34) {
            [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _kilojoulesSelected];
          }
        }
      }
      goto LABEL_7;
    case 1uLL:
      BOOL v21 = objc_msgSend(v9, "identifier", v10);
      unsigned int v22 = [v21 isEqualToString:@"POOL_LENGTH_YARDS_ID"];

      if (v22)
      {
        [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _yardsSelected:3];
      }
      else
      {
        v29 = [v9 identifier];
        unsigned int v30 = [v29 isEqualToString:@"POOL_LENGTH_METERS_ID"];

        if (v30) {
          [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _metersSelected:3];
        }
      }
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      unint64_t v11 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _distanceTypeForSection:v10];
      v12 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _specifierBaseIdForDistanceType:v11];
      id v13 = +[NSString stringWithFormat:@"%@%@", v12, @"_MILES_ID"];
      uint64_t v14 = +[NSString stringWithFormat:@"%@%@", v12, @"_KILOMETERS_ID"];
      id v15 = [v9 identifier];
      unsigned int v16 = [v15 isEqualToString:v13];

      if (v16)
      {
        [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _milesSelected:v11];
      }
      else
      {
        v17 = [v9 identifier];
        unsigned int v18 = [v17 isEqualToString:v14];

        if (v18) {
          [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _kilometersSelected:v11];
        }
      }

      goto LABEL_7;
    case 4uLL:
      unsigned __int8 v23 = objc_msgSend(v9, "identifier", v10);
      unsigned int v24 = [v23 isEqualToString:@"TRACK_WORKOUTS_MILES_ID"];

      if (v24)
      {
        id v25 = self;
        uint64_t v26 = 0;
      }
      else
      {
        v31 = [v9 identifier];
        unsigned int v32 = [v31 isEqualToString:@"TRACK_WORKOUTS_METERS_ID"];

        if (!v32) {
          goto LABEL_7;
        }
        id v25 = self;
        uint64_t v26 = 1;
      }
      [(HPRFSessionTrackerAppUnitsOfMeasureController *)v25 _trackUnitSelected:v26];
LABEL_7:
      [(HPRFSessionTrackerAppUnitsOfMeasureController *)self reloadSpecifiers];
      v35.receiver = self;
      v35.super_class = (Class)HPRFSessionTrackerAppUnitsOfMeasureController;
      [(HPRFSessionTrackerAppUnitsOfMeasureController *)&v35 tableView:v7 didSelectRowAtIndexPath:v6];

      return;
    default:
      goto LABEL_7;
  }
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerAppUnitsOfMeasureController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)_setEnergyBurnedUnit:(id)a3
{
  formattingManager = self->_formattingManager;
  id v4 = a3;
  id v5 = [(FIUIFormattingManager *)formattingManager unitManager];
  [v5 setUserActiveEnergyBurnedUnit:v4];
}

- (void)_caloriesSelected
{
  id v3 = +[HKUnit largeCalorieUnit];
  [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _setEnergyBurnedUnit:v3];
}

- (void)_kilocaloriesSelected
{
  id v3 = +[HKUnit kilocalorieUnit];
  [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _setEnergyBurnedUnit:v3];
}

- (void)_kilojoulesSelected
{
  id v3 = +[HKUnit jouleUnitWithMetricPrefix:9];
  [(HPRFSessionTrackerAppUnitsOfMeasureController *)self _setEnergyBurnedUnit:v3];
}

- (void)_setDistanceUnit:(unint64_t)a3 withDistanceType:(unint64_t)a4
{
  id v6 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  [v6 setUserDistanceUnit:a3 forDistanceType:a4];
}

- (void)_milesSelected:(unint64_t)a3
{
}

- (void)_kilometersSelected:(unint64_t)a3
{
}

- (void)_yardsSelected:(unint64_t)a3
{
}

- (void)_metersSelected:(unint64_t)a3
{
}

- (void)_trackUnitSelected:(int64_t)a3
{
  trackValueDomain = self->_trackValueDomain;
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  id v9 = 0;
  [(HKKeyValueDomain *)trackValueDomain setNumber:v6 forKey:@"WOTrackWorkoutsUnit" error:&v9];
  id v7 = v9;

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_1FA78(v8, v7, a3);
    }
  }
  else
  {
    [(HKNanoSyncControl *)self->_trackSyncControl forceNanoSyncWithOptions:0 completion:&stru_30F18];
  }
}

- (void)didUpdateKeyValueDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackSyncControl, 0);
  objc_storeStrong((id *)&self->_trackValueDomain, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);

  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end