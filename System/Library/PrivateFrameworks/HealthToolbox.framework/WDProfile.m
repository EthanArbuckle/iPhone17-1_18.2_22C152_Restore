@interface WDProfile
- (HKChartDataCacheController)dataCacheController;
- (HKDateCache)dateCache;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthRecordsStore)healthRecordsStore;
- (HKHealthStore)healthStore;
- (HKManualEntryValidationController)manualEntryValidationController;
- (HKSampleTypeDateRangeController)sampleTypeDateRangeController;
- (HKSampleTypeUpdateController)updateController;
- (HKSelectedTimeScopeController)selectedTimeScopeController;
- (HKUCUMUnitDisplayConverter)ucumDisplayConverter;
- (HKUnitPreferenceController)unitController;
- (NSString)presentationContext;
- (WDNotificationManager)notificationManager;
- (WDProfile)init;
- (WDProfile)initWithHealthStore:(id)a3;
- (WDSourceOrderController)sourceOrderController;
- (WDUserActivityManager)userActivityManager;
- (WDUserDefaults)userDefaults;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache;
- (id)_createHealthStore;
- (void)_createHealthStore;
- (void)notificationManager;
@end

@implementation WDProfile

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (WDProfile)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WDProfile;
  v5 = [(WDProfile *)&v42 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v7 = (HKHealthStore *)v4;
    }
    else
    {
      v7 = [(WDProfile *)v5 _createHealthStore];
    }
    healthStore = v6->_healthStore;
    v6->_healthStore = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F0A400]) initWithHealthStore:v6->_healthStore];
    healthRecordsStore = v6->_healthRecordsStore;
    v6->_healthRecordsStore = (HKHealthRecordsStore *)v9;

    uint64_t v11 = [MEMORY[0x263F46700] sharedInstanceForHealthStore:v6->_healthStore];
    displayTypeController = v6->_displayTypeController;
    v6->_displayTypeController = (HKDisplayTypeController *)v11;

    v13 = [(HKHealthStore *)v6->_healthStore profileIdentifier];
    if ([v13 type] == 3)
    {
    }
    else
    {
      v14 = [(HKHealthStore *)v6->_healthStore profileIdentifier];
      uint64_t v15 = [v14 type];

      if (v15 != 2)
      {
        uint64_t v20 = [objc_alloc(MEMORY[0x263F46A40]) initWithHealthStore:v6->_healthStore];
        unitController = v6->_unitController;
        v6->_unitController = (HKUnitPreferenceController *)v20;
        goto LABEL_10;
      }
    }
    id v16 = objc_alloc(MEMORY[0x263F46A40]);
    unitController = (HKUnitPreferenceController *)objc_alloc_init(MEMORY[0x263F0A410]);
    uint64_t v18 = [v16 initWithHealthStore:unitController];
    v19 = v6->_unitController;
    v6->_unitController = (HKUnitPreferenceController *)v18;

LABEL_10:
    v21 = (HKManualEntryValidationController *)objc_alloc_init(MEMORY[0x263F46810]);
    manualEntryValidationController = v6->_manualEntryValidationController;
    v6->_manualEntryValidationController = v21;

    v23 = [[WDUserDefaults alloc] initWithHealthStore:v6->_healthStore];
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = v23;

    v25 = [[WDSourceOrderController alloc] initWithHealthStore:v6->_healthStore];
    sourceOrderController = v6->_sourceOrderController;
    v6->_sourceOrderController = v25;

    v27 = (HKSelectedTimeScopeController *)objc_alloc_init(MEMORY[0x263F46960]);
    selectedTimeScopeController = v6->_selectedTimeScopeController;
    v6->_selectedTimeScopeController = v27;

    id v29 = objc_alloc(MEMORY[0x263F466D0]);
    v30 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v31 = [v29 initWithCalendar:v30];
    dateCache = v6->_dateCache;
    v6->_dateCache = (HKDateCache *)v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x263F46958]) initWithHealthStore:v6->_healthStore];
    updateController = v6->_updateController;
    v6->_updateController = (HKSampleTypeUpdateController *)v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x263F46418]) initWithHealthStore:v6->_healthStore unitController:v6->_unitController updateController:v6->_updateController];
    dataCacheController = v6->_dataCacheController;
    v6->_dataCacheController = (HKChartDataCacheController *)v35;

    v37 = objc_alloc_init(WDUserActivityManager);
    userActivityManager = v6->_userActivityManager;
    v6->_userActivityManager = v37;

    v39 = (HKUCUMUnitDisplayConverter *)objc_alloc_init(MEMORY[0x263F0A820]);
    ucumDisplayConverter = v6->_ucumDisplayConverter;
    v6->_ucumDisplayConverter = v39;
  }
  return v6;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (WDProfile)init
{
  return [(WDProfile *)self initWithHealthStore:0];
}

- (WDNotificationManager)notificationManager
{
  v3 = [(WDProfile *)self healthStore];
  id v4 = [v3 identifier];
  v5 = [MEMORY[0x263F0A420] primaryStoreIdentifier];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    notificationManager = self->_notificationManager;
    if (!notificationManager)
    {
      v8 = [WDNotificationManager alloc];
      uint64_t v9 = [(WDProfile *)self healthStore];
      v10 = [(WDNotificationManager *)v8 initWithHealthStore:v9];
      uint64_t v11 = self->_notificationManager;
      self->_notificationManager = v10;

      notificationManager = self->_notificationManager;
    }
    v12 = notificationManager;
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_FAULT)) {
      -[WDProfile notificationManager](v13);
    }
    v12 = 0;
  }

  return v12;
}

- (id)_createHealthStore
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 stringForKey:@"HealthProfileIdentifierKey"];
  id v4 = (os_log_t *)MEMORY[0x263F098F8];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  if (!v5) {
    goto LABEL_6;
  }
  char v6 = (void *)v5;
  v7 = [MEMORY[0x263F0A618] _profileWithUUID:v5 type:2];
  _HKInitializeLogging();
  os_log_t v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = [v7 debugDescription];
    int v14 = 138412290;
    uint64_t v15 = v10;
    _os_log_impl(&dword_2210D2000, v9, OS_LOG_TYPE_DEFAULT, "WDProfile: Using healthstore for profile: %@", (uint8_t *)&v14, 0xCu);
  }
  id v11 = objc_alloc_init(MEMORY[0x263F0A410]);
  [v11 setProfileIdentifier:v7];
  [v11 resume];

  if (!v11)
  {
LABEL_6:
    _HKInitializeLogging();
    v12 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
      -[WDProfile _createHealthStore](v12);
    }
    id v11 = objc_alloc_init(MEMORY[0x263F0A410]);
  }

  return v11;
}

- (NSString)presentationContext
{
  return (NSString *)@"App";
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return (_HKWheelchairUseCharacteristicCache *)[(HKDisplayTypeController *)self->_displayTypeController wheelchairUseCharacteristicCache];
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sampleTypeDateRangeController = self->_sampleTypeDateRangeController;
  if (!sampleTypeDateRangeController)
  {
    uint64_t v5 = (HKSampleTypeDateRangeController *)[objc_alloc(MEMORY[0x263F46950]) initWithHealthStore:self->_healthStore];
    char v6 = self->_sampleTypeDateRangeController;
    self->_sampleTypeDateRangeController = v5;

    sampleTypeDateRangeController = self->_sampleTypeDateRangeController;
  }
  v7 = sampleTypeDateRangeController;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HKManualEntryValidationController)manualEntryValidationController
{
  return self->_manualEntryValidationController;
}

- (HKUCUMUnitDisplayConverter)ucumDisplayConverter
{
  return self->_ucumDisplayConverter;
}

- (HKChartDataCacheController)dataCacheController
{
  return self->_dataCacheController;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSampleTypeUpdateController)updateController
{
  return self->_updateController;
}

- (WDSourceOrderController)sourceOrderController
{
  return self->_sourceOrderController;
}

- (WDUserActivityManager)userActivityManager
{
  return self->_userActivityManager;
}

- (WDUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_sourceOrderController, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_dataCacheController, 0);
  objc_storeStrong((id *)&self->_ucumDisplayConverter, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_manualEntryValidationController, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);

  objc_storeStrong((id *)&self->_notificationManager, 0);
}

- (void)notificationManager
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2210D2000, log, OS_LOG_TYPE_FAULT, "Notification manager should only be bounded to the primary health store", v1, 2u);
}

- (void)_createHealthStore
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2210D2000, log, OS_LOG_TYPE_DEBUG, "WDProfile: Using default healthstore", v1, 2u);
}

@end