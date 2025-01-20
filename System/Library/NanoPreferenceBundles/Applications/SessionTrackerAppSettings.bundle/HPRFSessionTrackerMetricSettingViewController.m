@interface HPRFSessionTrackerMetricSettingViewController
- (BOOL)_shouldObliterateWorkoutMetricsForMetricsActivityMoveMode:(int64_t)a3 activityMoveModeHealthDB:(int64_t)a4;
- (HPRFSessionTrackerMetricSettingViewController)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (id)_activityTypeSpecifiers;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)_obliterateUserConfiguredWorkoutMetricsIfNeeded;
- (void)_saveWorkoutMetricsActivityMoveMode:(int64_t)a3;
- (void)dealloc;
- (void)setDomainAccessor:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation HPRFSessionTrackerMetricSettingViewController

- (HPRFSessionTrackerMetricSettingViewController)init
{
  v18.receiver = self;
  v18.super_class = (Class)HPRFSessionTrackerMetricSettingViewController;
  v2 = [(HPRFSessionTrackerMetricSettingViewController *)&v18 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    id v5 = objc_alloc((Class)NPSDomainAccessor);
    v6 = (NPSDomainAccessor *)[v5 initWithDomain:kNLSessionTrackerAppPreferencesDomain];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v6;

    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v9 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
    uint64_t v11 = [v10 firstObject];
    device = v2->_device;
    v2->_device = (NRDevice *)v11;

    uint64_t v13 = FIUIHealthStoreForDevice();
    healthStore = v2->_healthStore;
    v2->_healthStore = (HKHealthStore *)v13;

    [(HPRFSessionTrackerMetricSettingViewController *)v2 _obliterateUserConfiguredWorkoutMetricsIfNeeded];
    v15 = (_HKWheelchairUseCharacteristicCache *)[objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v2->_healthStore];
    wheelchairUseCharacteristicCache = v2->_wheelchairUseCharacteristicCache;
    v2->_wheelchairUseCharacteristicCache = v15;

    [(_HKWheelchairUseCharacteristicCache *)v2->_wheelchairUseCharacteristicCache addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HPRFSessionTrackerMetricSettingViewController;
  [(HPRFSessionTrackerMetricSettingViewController *)&v3 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"METRIC_VIEW_LABEL" value:&stru_31A20 table:@"SessionTrackerAppSettings"];

  return v3;
}

- (void)_obliterateUserConfiguredWorkoutMetricsIfNeeded
{
  id v3 = +[FIUIWorkoutSettingsManager readWorkoutMetricsActivityMoveMode];
  uint64_t v4 = FIActivityMoveModeWithHealthStore();
  if ([(HPRFSessionTrackerMetricSettingViewController *)self _shouldObliterateWorkoutMetricsForMetricsActivityMoveMode:v3 activityMoveModeHealthDB:v4])
  {
    +[FIUIWorkoutSettingsManager obliterateUserConfiguredWorkoutMetrics];
    [(HPRFSessionTrackerMetricSettingViewController *)self _saveWorkoutMetricsActivityMoveMode:v4];
  }
}

- (BOOL)_shouldObliterateWorkoutMetricsForMetricsActivityMoveMode:(int64_t)a3 activityMoveModeHealthDB:(int64_t)a4
{
  BOOL v4 = a4 == 2;
  if (a3 != 1) {
    BOOL v4 = 0;
  }
  if (a3 == 2) {
    return a4 == 1;
  }
  else {
    return v4;
  }
}

- (void)_saveWorkoutMetricsActivityMoveMode:(int64_t)a3
{
  uint64_t v4 = kHPRFWorkoutMetricsActivityMoveMode;
  [(NPSDomainAccessor *)self->_domainAccessor setInteger:a3 forKey:kHPRFWorkoutMetricsActivityMoveMode];
  id v5 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  v6 = [(HPRFSessionTrackerMetricSettingViewController *)self syncManager];
  v7 = [(NPSDomainAccessor *)self->_domainAccessor domain];
  uint64_t v10 = v4;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  v9 = +[NSSet setWithArray:v8];
  [v6 synchronizeNanoDomain:v7 keys:v9];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSMutableArray array];
    v6 = [(HPRFSessionTrackerMetricSettingViewController *)self _activityTypeSpecifiers];
    [v5 addObjectsFromArray:v6];

    v7 = [(HPRFSessionTrackerMetricSettingViewController *)self localizedPaneTitle];
    [(HPRFSessionTrackerMetricSettingViewController *)self setTitle:v7];

    v8 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v5;

    uint64_t v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (id)_activityTypeSpecifiers
{
  v2 = +[FIUIWorkoutActivityType optimizedActivityTypesWithIsWheelchairUser:[(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser] isSwimmingSupported:FIUIDeviceSupportsSwimming()];
  uint64_t v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v2 count] + 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "identifier", (void)v18) != (char *)&stru_20.filesize + 2)
        {
          id v10 = objc_alloc_init((Class)PSSpecifier);
          [v10 setCellType:2];
          [v10 setDetailControllerClass:objc_opt_class()];
          [v9 identifier];
          [v9 swimmingLocationType];
          [v9 isIndoor];
          uint64_t v11 = FILocalizedNameForActivityType();
          [v10 setName:v11];

          objc_msgSend(v10, "hprf_setWorkoutActivityOption:", v9);
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v3 sortUsingComparator:&stru_30D68];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"WORKOUTS_TITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  v14 = +[PSSpecifier groupSpecifierWithName:v13];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"WORKOUTS_SUBTITLE" value:&stru_31A20 table:@"SessionTrackerAppSettings"];
  [v14 setProperty:v16 forKey:PSHeaderDetailTextGroupKey];

  [v3 insertObject:v14 atIndex:0];

  return v3;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFSessionTrackerMetricSettingViewController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end