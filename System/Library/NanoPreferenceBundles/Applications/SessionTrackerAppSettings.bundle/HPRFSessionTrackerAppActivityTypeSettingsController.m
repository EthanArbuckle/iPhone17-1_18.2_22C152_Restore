@interface HPRFSessionTrackerAppActivityTypeSettingsController
- (BOOL)metricEnabledForType:(unint64_t)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (HPRFSessionTrackerAppActivityTypeSettingsController)init;
- (id)_metricSpecifiersForSettingSection:(unint64_t)a3;
- (id)_specifierForMetricType:(unint64_t)a3;
- (id)metricEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_handleFitnessUnitPreferencesDidChange;
- (void)dealloc;
- (void)setMetricEnabled:(BOOL)a3 forSpecifier:(id)a4 autoMove:(BOOL)a5;
- (void)setMetricEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation HPRFSessionTrackerAppActivityTypeSettingsController

- (HPRFSessionTrackerAppActivityTypeSettingsController)init
{
  v14.receiver = self;
  v14.super_class = (Class)HPRFSessionTrackerAppActivityTypeSettingsController;
  v2 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)&v14 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
    uint64_t v6 = [v5 firstObject];
    device = v2->_device;
    v2->_device = (NRDevice *)v6;

    v8 = FIUIHealthStoreForDevice();
    v2->_activityMoveMode = FIActivityMoveModeWithHealthStore();
    id v9 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v8];
    v10 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v9];
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v10;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_handleFitnessUnitPreferencesDidChange" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HPRFSessionTrackerAppActivityTypeSettingsController;
  [(HPRFSessionTrackerAppActivityTypeSettingsController *)&v4 dealloc];
}

- (void)_handleFitnessUnitPreferencesDidChange
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_134D0;
  v2[3] = &unk_30ED8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setSpecifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HPRFSessionTrackerAppActivityTypeSettingsController;
  id v4 = a3;
  [(HPRFSessionTrackerAppActivityTypeSettingsController *)&v14 setSpecifier:v4];
  objc_msgSend(v4, "hprf_workoutActivityType", v14.receiver, v14.super_class);
  v5 = (FIUIWorkoutActivityType *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (FIUIWorkoutSettingsManager *)[objc_alloc((Class)FIUIWorkoutSettingsManager) initWithWorkoutActivityType:v5 activityMoveMode:self->_activityMoveMode];
  settingManager = self->_settingManager;
  self->_settingManager = v6;

  workoutActivityType = self->_workoutActivityType;
  self->_workoutActivityType = v5;
  id v9 = v5;

  id v10 = objc_alloc((Class)NPSDomainAccessor);
  v11 = (NPSDomainAccessor *)[v10 initWithDomain:kNLSessionTrackerAppPreferencesDomain];
  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = v11;

  [(FIUIWorkoutActivityType *)v9 identifier];
  [(FIUIWorkoutActivityType *)v9 swimmingLocationType];
  [(FIUIWorkoutActivityType *)v9 isIndoor];

  v13 = FILocalizedNameForActivityType();
  [(HPRFSessionTrackerAppActivityTypeSettingsController *)self setTitle:v13];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"ENABLED_METRICS_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v8 = +[PSSpecifier groupSpecifierWithName:v7];

    [v5 addObject:v8];
    id v9 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self _metricSpecifiersForSettingSection:0];
    [v5 addObjectsFromArray:v9];
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"DISABLED_METRICS_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
    v12 = +[PSSpecifier groupSpecifierWithName:v11];

    [v5 addObject:v12];
    v13 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self _metricSpecifiersForSettingSection:1];
    [v5 addObjectsFromArray:v13];
    objc_super v14 = *(void **)&self->PSEditableListController_opaque[v3];
    *(void *)&self->PSEditableListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSEditableListController_opaque[v3];
  }

  return v4;
}

- (id)_metricSpecifiersForSettingSection:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = [(FIUIWorkoutSettingsManager *)self->_settingManager orderedDisabledMetrics];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v4 = [(FIUIWorkoutSettingsManager *)self->_settingManager orderedEnabledMetrics];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15);
        if ([(HPRFSessionTrackerAppActivityTypeSettingsController *)self metricEnabledForType:v12])
        {
          v13 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self _specifierForMetricType:v12];
          [v6 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)metricEnabledForType:(unint64_t)a3
{
  if (a3 == 17)
  {
    device = self->_device;
    id v4 = objc_alloc((Class)NSUUID);
    CFStringRef v5 = @"CB81F0AE-3F2F-4D57-8C90-F0D1A4ADD373";
  }
  else
  {
    if (a3 != 10) {
      return 1;
    }
    device = self->_device;
    id v4 = objc_alloc((Class)NSUUID);
    CFStringRef v5 = @"D1DBCF21-D875-4EA8-B63E-8182578C0B0C";
  }
  id v6 = [v4 initWithUUIDString:v5];
  unsigned __int8 v7 = [(NRDevice *)device supportsCapability:v6];

  return v7;
}

- (id)_specifierForMetricType:(unint64_t)a3
{
  CFStringRef v5 = _LocalizedStringForMetricType(a3, self->_workoutActivityType, self->_formattingManager);
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setMetricEnabled:forSpecifier:" get:"metricEnabledForSpecifier:" detail:0 cell:-1 edit:0];

  objc_msgSend(v6, "hprf_setMetricType:", a3);

  return v6;
}

- (id)metricEnabledForSpecifier:(id)a3
{
  id v3 = -[FIUIWorkoutSettingsManager isMetricEnabled:](self->_settingManager, "isMetricEnabled:", objc_msgSend(a3, "hprf_metricType"));

  return +[NSNumber numberWithBool:v3];
}

- (void)setMetricEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  -[HPRFSessionTrackerAppActivityTypeSettingsController setMetricEnabled:forSpecifier:autoMove:](self, "setMetricEnabled:forSpecifier:autoMove:", [a3 BOOLValue], v6, 1);
}

- (void)setMetricEnabled:(BOOL)a3 forSpecifier:(id)a4 autoMove:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v8, "hprf_metricType");
  char v16 = 0;
  [(FIUIWorkoutSettingsManager *)self->_settingManager setEnabled:v6 forMetricType:v9 didChange:&v16];
  if (v5)
  {
    uint64_t v10 = [(FIUIWorkoutSettingsManager *)self->_settingManager orderedEnabledMetrics];
    v11 = v10;
    if (v6)
    {
      id v12 = +[NSNumber numberWithUnsignedInteger:v9];
      v13 = (char *)[v11 indexOfObject:v12] + 1;
    }
    else
    {
      id v14 = [v10 count];
      id v12 = [(FIUIWorkoutSettingsManager *)self->_settingManager orderedDisabledMetrics];
      long long v15 = +[NSNumber numberWithUnsignedInteger:v9];
      v13 = (char *)[v12 indexOfObject:v15] + (void)v14 + 2;
    }
    [(HPRFSessionTrackerAppActivityTypeSettingsController *)self removeSpecifier:v8];
    [(HPRFSessionTrackerAppActivityTypeSettingsController *)self insertSpecifier:v8 atIndex:v13 animated:1];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HPRFSessionTrackerAppActivityTypeSettingsController;
  BOOL v5 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)&v14 tableView:a3 cellForRowAtIndexPath:a4];
  BOOL v6 = [v5 specifier];
  unsigned __int8 v7 = (char *)objc_msgSend(v6, "hprf_metricType");

  if (v7 == (unsigned char *)&dword_4 + 1)
  {
    int v8 = FIUIIsHeartRateEnabled();
    if ([(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == &stru_20.segname[12]
      || [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == &dword_18
      || [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == (char *)&stru_20.cmdsize + 1
      || [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == (char *)&stru_20.vmsize + 6
      || [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == (char *)&stru_20.vmsize + 7)
    {
      unsigned int v9 = [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:kNLSessionTrackerAppKeyEnablePowerSavingMode] ^ 1;
    }
    else
    {
      unsigned int v9 = 1;
    }
    uint64_t v10 = [v5 textLabel];
    v11 = v10;
    double v12 = 0.25;
    if ((v8 & v9) != 0) {
      double v12 = 1.0;
    }
    [v10 setAlpha:v12];
  }

  return v5;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] != (char *)&dword_0 + 1)
    {
      char v8 = 1;
      goto LABEL_7;
    }
    id v6 = &dword_4 + 1;
  }
  else
  {
    id v6 = &dword_0 + 2;
  }
  unsigned __int8 v7 = [(FIUIWorkoutSettingsManager *)self->_settingManager orderedEnabledMetrics];
  char v8 = [v7 count] != v6;

LABEL_7:
  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self table];
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    if ([v5 section]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DELETE_BUTTON_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self specifierAtIndexPath:v8];
  v12.receiver = self;
  v12.super_class = (Class)HPRFSessionTrackerAppActivityTypeSettingsController;
  [(HPRFSessionTrackerAppActivityTypeSettingsController *)&v12 tableView:v9 commitEditingStyle:a4 forRowAtIndexPath:v8];

  if (a4 == 2)
  {
    uint64_t v11 = 1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v11 = 0;
LABEL_5:
    [(HPRFSessionTrackerAppActivityTypeSettingsController *)self setMetricEnabled:v11 forSpecifier:v10 autoMove:1];
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self specifierAtIndexPath:a4];
  id v11 = v9;
  objc_super v12 = (char *)[v11 section];
  if (![v11 section] && (uint64_t)objc_msgSend(v8, "numberOfRowsInSection:", 0) > 5
    || (v13 = v11, v12 == (unsigned char *)&dword_0 + 1))
  {
    v13 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[FIUIWorkoutSettingsManager disabledIndexForMetricType:](self->_settingManager, "disabledIndexForMetricType:", objc_msgSend(v10, "hprf_metricType")), 1);
  }

  return v13;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v11 = a5;
  id v7 = a4;
  id v8 = [(HPRFSessionTrackerAppActivityTypeSettingsController *)self specifierAtIndexPath:v7];
  id v9 = [v11 section];
  id v10 = [v7 section];

  if (v10 != [v11 section]) {
    [(HPRFSessionTrackerAppActivityTypeSettingsController *)self setMetricEnabled:v9 == 0 forSpecifier:v8 autoMove:0];
  }
  if (!v9) {
    -[FIUIWorkoutSettingsManager moveMetricType:toEnabledIndex:](self->_settingManager, "moveMetricType:toEnabledIndex:", objc_msgSend(v8, "hprf_metricType"), objc_msgSend(v11, "row"));
  }
  [(HPRFSessionTrackerAppActivityTypeSettingsController *)self reloadSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_workoutActivityType, 0);

  objc_storeStrong((id *)&self->_settingManager, 0);
}

@end