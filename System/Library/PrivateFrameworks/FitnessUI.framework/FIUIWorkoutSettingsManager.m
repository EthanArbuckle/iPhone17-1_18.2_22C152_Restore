@interface FIUIWorkoutSettingsManager
+ (int64_t)readWorkoutMetricsActivityMoveMode;
+ (void)obliterateUserConfiguredWorkoutMetrics;
- (BOOL)_enabledMetricsAreDefaultAfterPaceMigration:(id)a3 workoutActivityType:(id)a4;
- (BOOL)_hasUserMadeMetricChangesToWorkoutType:(id)a3 enabledMetrics:(id)a4 settingOverridesByMetric:(id)a5 metricFormatVersion:(id)a6;
- (BOOL)_useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:(int64_t)a3 activityMoveMode:(int64_t)a4;
- (BOOL)isMetricEnabled:(unint64_t)a3;
- (FIUIWorkoutActivityType)workoutActivityType;
- (FIUIWorkoutDefaultMetricsProvider)defaultMetricsProvider;
- (FIUIWorkoutSettingsManager)init;
- (FIUIWorkoutSettingsManager)initWithWorkoutActivityType:(id)a3 activityMoveMode:(int64_t)a4;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (id)orderedDisabledMetrics;
- (id)orderedEnabledAndSupportedMetrics;
- (id)orderedEnabledMetrics;
- (id)orderedSupportedMetrics;
- (id)supportedMetrics;
- (int64_t)disabledIndexForMetricType:(unint64_t)a3;
- (void)_clearOldMetricsIfNeeded;
- (void)_migratePaceViewSettingIfNeeded;
- (void)_readFromDomain;
- (void)_writeToDomainWithShouldUpdateVersion:(BOOL)a3;
- (void)assignMetricType:(unint64_t)a3 toSlotIndex:(int64_t)a4;
- (void)moveMetricType:(unint64_t)a3 toEnabledIndex:(int64_t)a4;
- (void)reloadMetrics;
- (void)setDomainAccessor:(id)a3;
- (void)setEnabled:(BOOL)a3 forMetricType:(unint64_t)a4 didChange:(BOOL *)a5;
- (void)setSyncManager:(id)a3;
@end

@implementation FIUIWorkoutSettingsManager

- (void)_readFromDomain
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  v4 = [v3 objectForKey:@"SettingsByActivityType"];
  v5 = (NSMutableDictionary *)[v4 mutableCopy];
  settingsByActivityType = self->_settingsByActivityType;
  self->_settingsByActivityType = v5;

  v7 = self->_settingsByActivityType;
  if (!v7)
  {
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = self->_settingsByActivityType;
    self->_settingsByActivityType = v8;

    v7 = self->_settingsByActivityType;
  }
  v10 = KeyForWorkoutActivityType(self->_workoutActivityType);
  v11 = [(NSMutableDictionary *)v7 objectForKey:v10];

  if (!v11)
  {
    if (+[FIUIWorkoutActivityType shouldDisambiguateOnLocationType:[(FIUIWorkoutActivityType *)self->_workoutActivityType effectiveTypeIdentifier]])
    {
      v11 = 0;
    }
    else
    {
      unint64_t v12 = [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier];
      uint64_t v13 = [(FIUIWorkoutActivityType *)self->_workoutActivityType isIndoor] ^ 1;
      v14 = [(FIUIWorkoutActivityType *)self->_workoutActivityType metadata];
      v15 = +[FIUIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:v12 isIndoor:v13 metadata:v14];

      v16 = self->_settingsByActivityType;
      v17 = KeyForWorkoutActivityType(v15);
      v11 = [(NSMutableDictionary *)v16 objectForKey:v17];
    }
  }
  v18 = [v11 objectForKey:@"MetricSettingOverrides"];
  v19 = (NSMutableDictionary *)[v18 mutableCopy];
  settingOverridesByMetric = self->_settingOverridesByMetric;
  self->_settingOverridesByMetric = v19;

  v21 = [v11 objectForKey:@"EnabledMetrics"];
  v22 = (NSMutableArray *)[v21 mutableCopy];
  enabledMetrics = self->_enabledMetrics;
  self->_enabledMetrics = v22;

  _HKInitializeLogging();
  v24 = (os_log_t *)MEMORY[0x263F09970];
  v25 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_settingsByActivityType;
    v27 = self->_enabledMetrics;
    v28 = v25;
    v29 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
    v30 = [v29 objectForKey:@"ActivitySettingsFormatVersion"];
    int v42 = 138412802;
    v43 = v26;
    __int16 v44 = 2112;
    v45 = v27;
    __int16 v46 = 2112;
    v47 = v30;
    _os_log_impl(&dword_21E433000, v28, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _readFromDomain called before _migratePaceViewSettingsIfNeeded with settingsByActivityType:%@ and enabledMetrics:%@ and versionNumber:%@", (uint8_t *)&v42, 0x20u);
  }
  if (!self->_enabledMetrics)
  {
    v31 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider defaultEnabledMetrics];
    v32 = (NSMutableArray *)[v31 mutableCopy];
    v33 = self->_enabledMetrics;
    self->_enabledMetrics = v32;
  }
  if (!self->_settingOverridesByMetric)
  {
    v34 = [MEMORY[0x263EFF9A0] dictionary];
    v35 = self->_settingOverridesByMetric;
    self->_settingOverridesByMetric = v34;
  }
  [(FIUIWorkoutSettingsManager *)self _migratePaceViewSettingIfNeeded];
  _HKInitializeLogging();
  os_log_t v36 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
  {
    v37 = self->_settingsByActivityType;
    v38 = self->_enabledMetrics;
    v39 = v36;
    v40 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
    v41 = [v40 objectForKey:@"ActivitySettingsFormatVersion"];
    int v42 = 138412802;
    v43 = v37;
    __int16 v44 = 2112;
    v45 = v38;
    __int16 v46 = 2112;
    v47 = v41;
    _os_log_impl(&dword_21E433000, v39, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _readFromDomain called after _migratePaceViewSettingsIfNeeded with settingsByActivityType:%@ and enabledMetrics:%@ and versionNumber:%@", (uint8_t *)&v42, 0x20u);
  }
}

- (BOOL)isMetricEnabled:(unint64_t)a3
{
  settingOverridesByMetric = self->_settingOverridesByMetric;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  v7 = [(NSMutableDictionary *)settingOverridesByMetric objectForKey:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    v9 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider defaultEnabledMetrics];
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    char v8 = [v9 containsObject:v10];
  }
  return v8;
}

- (void)_migratePaceViewSettingIfNeeded
{
  if (![(NSMutableDictionary *)self->_settingOverridesByMetric count]
    && [(FIUIWorkoutSettingsManager *)self isMetricEnabled:4])
  {
    v3 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
    id v8 = [v3 objectForKey:@"ShowAveragePace"];

    if ([v8 BOOLValue])
    {
      settingOverridesByMetric = self->_settingOverridesByMetric;
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 8);
      [(NSMutableDictionary *)settingOverridesByMetric setObject:MEMORY[0x263EFFA88] forKey:v5];

      v6 = self->_settingOverridesByMetric;
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 4);
      [(NSMutableDictionary *)v6 setObject:MEMORY[0x263EFFA80] forKey:v7];

      [(NSMutableArray *)self->_enabledMetrics replaceObjectAtIndex:[(NSMutableArray *)self->_enabledMetrics indexOfObject:&unk_26CF751D8] withObject:&unk_26CF751F0];
      [(FIUIWorkoutSettingsManager *)self _writeToDomainWithShouldUpdateVersion:0];
    }
  }
}

- (id)orderedSupportedMetrics
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(FIUIWorkoutSettingsManager *)self supportedMetrics];
  v4 = [v3 allObjects];
  v5 = (void *)[v4 mutableCopy];

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider supportedMetrics];
  id v8 = [v6 setWithArray:v7];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (void)v17)) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v9 sortUsingFunction:_SortMetricBySortIndex context:0];
  return v9;
}

- (id)supportedMetrics
{
  unint64_t v3 = [(FIUIWorkoutActivityType *)self->_workoutActivityType identifier];
  BOOL v4 = [(FIUIWorkoutActivityType *)self->_workoutActivityType isIndoor];
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider supportedMetrics];
  v7 = [v5 setWithArray:v6];

  if ((objc_msgSend(MEMORY[0x263F0A8F8], "fiui_isHeartRateSupportedForActivityType:isIndoor:", v3, v4) & 1) == 0)
  {
    [v7 removeObject:&unk_26CF75160];
    [v7 removeObject:&unk_26CF75178];
    [v7 removeObject:&unk_26CF75190];
    [v7 removeObject:&unk_26CF751A8];
    [v7 removeObject:&unk_26CF751C0];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetricsProvider, 0);
  objc_storeStrong((id *)&self->_workoutActivityType, 0);
  objc_storeStrong((id *)&self->_lazy_syncManager, 0);
  objc_storeStrong((id *)&self->_lazy_domainAccessor, 0);
  objc_storeStrong((id *)&self->_enabledMetrics, 0);
  objc_storeStrong((id *)&self->_settingOverridesByMetric, 0);
  objc_storeStrong((id *)&self->_settingsByActivityType, 0);
}

- (id)orderedEnabledAndSupportedMetrics
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(FIUIWorkoutSettingsManager *)self supportedMetrics];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_enabledMetrics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v10, (void)v12)) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (FIUIWorkoutSettingsManager)init
{
  return 0;
}

- (FIUIWorkoutSettingsManager)initWithWorkoutActivityType:(id)a3 activityMoveMode:(int64_t)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FIUIWorkoutSettingsManager;
  uint64_t v8 = [(FIUIWorkoutSettingsManager *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workoutActivityType, a3);
    v9->_activityMoveMode = a4;
    uint64_t v10 = [FIUIWorkoutDefaultMetricsProvider alloc];
    uint64_t v11 = FIUIDeviceSupportsElevationGain();
    uint64_t v12 = [(FIUIWorkoutDefaultMetricsProvider *)v10 initWithMetricsVersion:6 activityType:v7 activityMoveMode:a4 deviceSupportsElevationMetrics:v11 deviceSupportsGroundElevationMetrics:FIUIDeviceSupportsGroundElevation()];
    defaultMetricsProvider = v9->_defaultMetricsProvider;
    v9->_defaultMetricsProvider = (FIUIWorkoutDefaultMetricsProvider *)v12;

    if ([(FIUIWorkoutSettingsManager *)v9 _useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:+[FIUIWorkoutSettingsManager readWorkoutMetricsActivityMoveMode] activityMoveMode:a4])
    {
      [(FIUIWorkoutSettingsManager *)v9 _clearOldMetricsIfNeeded];
      [(FIUIWorkoutSettingsManager *)v9 _readFromDomain];
    }
    else
    {
      long long v14 = [(FIUIWorkoutDefaultMetricsProvider *)v9->_defaultMetricsProvider defaultEnabledMetrics];
      uint64_t v15 = [v14 mutableCopy];
      enabledMetrics = v9->_enabledMetrics;
      v9->_enabledMetrics = (NSMutableArray *)v15;
    }
  }

  return v9;
}

- (NPSDomainAccessor)domainAccessor
{
  lazy_domainAccessor = self->_lazy_domainAccessor;
  if (!lazy_domainAccessor)
  {
    id v4 = objc_alloc(MEMORY[0x263F57520]);
    v5 = (NPSDomainAccessor *)[v4 initWithDomain:*MEMORY[0x263F3D1B0]];
    uint64_t v6 = self->_lazy_domainAccessor;
    self->_lazy_domainAccessor = v5;

    lazy_domainAccessor = self->_lazy_domainAccessor;
  }
  return lazy_domainAccessor;
}

- (NPSManager)syncManager
{
  lazy_syncManager = self->_lazy_syncManager;
  if (!lazy_syncManager)
  {
    id v4 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    v5 = self->_lazy_syncManager;
    self->_lazy_syncManager = v4;

    lazy_syncManager = self->_lazy_syncManager;
  }
  return lazy_syncManager;
}

- (void)_clearOldMetricsIfNeeded
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  id v4 = [v3 objectForKey:@"SettingsByActivityType"];
  v5 = (NSMutableDictionary *)[v4 mutableCopy];
  settingsByActivityType = self->_settingsByActivityType;
  self->_settingsByActivityType = v5;

  id v7 = self->_settingsByActivityType;
  uint64_t v8 = KeyForWorkoutActivityType(self->_workoutActivityType);
  id v9 = [(NSMutableDictionary *)v7 objectForKey:v8];

  uint64_t v10 = [v9 objectForKey:@"MetricSettingOverrides"];
  uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];
  settingOverridesByMetric = self->_settingOverridesByMetric;
  self->_settingOverridesByMetric = v11;

  long long v13 = [v9 objectForKey:@"EnabledMetrics"];
  long long v14 = (NSMutableArray *)[v13 mutableCopy];
  enabledMetrics = self->_enabledMetrics;
  self->_enabledMetrics = v14;

  v16 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  uint64_t v17 = [v16 objectForKey:@"ActivitySettingsFormatVersion"];

  if ([(FIUIWorkoutActivityType *)self->_workoutActivityType identifier] == 37
    && ![(FIUIWorkoutActivityType *)self->_workoutActivityType isIndoor]
    && FIDeviceMeetsMinimumOSVersionGlory()
    && ![(FIUIWorkoutSettingsManager *)self _hasUserMadeMetricChangesToWorkoutType:self->_workoutActivityType enabledMetrics:self->_enabledMetrics settingOverridesByMetric:self->_settingOverridesByMetric metricFormatVersion:v17])
  {
    _HKInitializeLogging();
    objc_super v18 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      workoutActivityType = self->_workoutActivityType;
      long long v20 = self->_settingsByActivityType;
      int v23 = 138543874;
      v24 = workoutActivityType;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_21E433000, v18, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] Clearing metrics for activity type: %{public}@, version number: %{public}@, settingsByActivityType: %{public}@", (uint8_t *)&v23, 0x20u);
    }
    v21 = self->_settingOverridesByMetric;
    self->_settingOverridesByMetric = 0;

    uint64_t v22 = self->_enabledMetrics;
    self->_enabledMetrics = 0;

    [(FIUIWorkoutSettingsManager *)self _writeToDomainWithShouldUpdateVersion:1];
  }
}

- (id)orderedEnabledMetrics
{
  return self->_enabledMetrics;
}

- (id)orderedDisabledMetrics
{
  unint64_t v3 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider supportedMetrics];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectsInArray:self->_enabledMetrics];
  [v4 sortUsingFunction:_SortMetricBySortIndex context:0];
  return v4;
}

- (void)setEnabled:(BOOL)a3 forMetricType:(unint64_t)a4 didChange:(BOOL *)a5
{
  BOOL v7 = a3;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  id v17 = (id)v9;
  if (a5)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_settingOverridesByMetric objectForKey:v9];
    uint64_t v11 = v10;
    if (v10) {
      char v12 = [v10 BOOLValue] ^ v7;
    }
    else {
      char v12 = 1;
    }
    *a5 = v12;
  }
  settingOverridesByMetric = self->_settingOverridesByMetric;
  long long v14 = [NSNumber numberWithBool:v7];
  [(NSMutableDictionary *)settingOverridesByMetric setObject:v14 forKey:v17];

  enabledMetrics = self->_enabledMetrics;
  v16 = [NSNumber numberWithUnsignedInteger:a4];
  if (v7) {
    [(NSMutableArray *)enabledMetrics addObject:v16];
  }
  else {
    [(NSMutableArray *)enabledMetrics removeObject:v16];
  }

  [(FIUIWorkoutSettingsManager *)self _writeToDomainWithShouldUpdateVersion:0];
}

- (void)moveMetricType:(unint64_t)a3 toEnabledIndex:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_enabledMetrics count] >= (unint64_t)a4)
  {
    enabledMetrics = self->_enabledMetrics;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableArray *)enabledMetrics removeObject:v9];

    uint64_t v10 = self->_enabledMetrics;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableArray *)v10 insertObject:v11 atIndex:a4];

    [(FIUIWorkoutSettingsManager *)self _writeToDomainWithShouldUpdateVersion:0];
  }
  else
  {
    _HKInitializeLogging();
    BOOL v7 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR))
    {
      char v12 = NSNumber;
      long long v13 = v7;
      long long v14 = [v12 numberWithUnsignedInteger:a3];
      uint64_t v15 = [NSNumber numberWithInteger:a4];
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_enabledMetrics, "count"));
      int v17 = 138412802;
      objc_super v18 = v14;
      __int16 v19 = 2112;
      long long v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_error_impl(&dword_21E433000, v13, OS_LOG_TYPE_ERROR, "Workout Settings Manager attempting to move metric %@ to index %@ (enabled count = %@)", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)assignMetricType:(unint64_t)a3 toSlotIndex:(int64_t)a4
{
  [(NSMutableArray *)self->_enabledMetrics removeObjectAtIndex:a4];
  enabledMetrics = self->_enabledMetrics;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)enabledMetrics insertObject:v8 atIndex:a4];

  [(FIUIWorkoutSettingsManager *)self _writeToDomainWithShouldUpdateVersion:0];
}

- (int64_t)disabledIndexForMetricType:(unint64_t)a3
{
  v5 = [(FIUIWorkoutSettingsManager *)self orderedDisabledMetrics];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if ([(FIUIWorkoutSettingsManager *)self isMetricEnabled:a3])
  {
    BOOL v7 = [NSNumber numberWithUnsignedInteger:a3];
    [v6 addObject:v7];

    [v6 sortUsingFunction:_SortMetricBySortIndex context:0];
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  int64_t v9 = [v6 indexOfObject:v8];

  return v9;
}

- (void)reloadMetrics
{
  if ([(FIUIWorkoutSettingsManager *)self _useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:+[FIUIWorkoutSettingsManager readWorkoutMetricsActivityMoveMode] activityMoveMode:self->_activityMoveMode])
  {
    [(FIUIWorkoutSettingsManager *)self _readFromDomain];
  }
  else
  {
    id v5 = [(FIUIWorkoutDefaultMetricsProvider *)self->_defaultMetricsProvider defaultEnabledMetrics];
    unint64_t v3 = (NSMutableArray *)[v5 mutableCopy];
    enabledMetrics = self->_enabledMetrics;
    self->_enabledMetrics = v3;
  }
}

- (BOOL)_enabledMetricsAreDefaultAfterPaceMigration:(id)a3 workoutActivityType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 isIndoor];
  uint64_t v8 = [v6 identifier];

  BOOL v9 = 0;
  if (v8 == 37 && (v7 & 1) == 0)
  {
    if ([v5 count] != 4) {
      goto LABEL_8;
    }
    uint64_t v10 = [v5 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 unsignedIntegerValue];

    if (v11 != 3) {
      goto LABEL_8;
    }
    char v12 = [v5 objectAtIndexedSubscript:1];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v13 != 8) {
      goto LABEL_8;
    }
    long long v14 = [v5 objectAtIndexedSubscript:2];
    uint64_t v15 = [v14 unsignedIntegerValue];

    if (v15 == 5)
    {
      v16 = [v5 objectAtIndexedSubscript:3];
      BOOL v9 = [v16 unsignedIntegerValue] == 1;
    }
    else
    {
LABEL_8:
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_hasUserMadeMetricChangesToWorkoutType:(id)a3 enabledMetrics:(id)a4 settingOverridesByMetric:(id)a5 metricFormatVersion:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  long long v14 = v13;
  if (v11 | v12)
  {
    if ([v13 intValue] == 1 || objc_msgSend(v14, "intValue") == 2) {
      BOOL v15 = ![(FIUIWorkoutSettingsManager *)self _enabledMetricsAreDefaultAfterPaceMigration:v11 workoutActivityType:v10];
    }
    else {
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (int64_t)readWorkoutMetricsActivityMoveMode
{
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  unint64_t v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F3D1B0]];
  id v4 = (id)[v3 synchronize];
  char v8 = 0;
  uint64_t v5 = [v3 integerForKey:@"WorkoutMetricsActivityMoveMode" keyExistsAndHasValidFormat:&v8];
  if (v8) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (void)_writeToDomainWithShouldUpdateVersion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v6 = v5;
  enabledMetrics = self->_enabledMetrics;
  if (enabledMetrics) {
    [v5 setObject:enabledMetrics forKey:@"EnabledMetrics"];
  }
  settingOverridesByMetric = self->_settingOverridesByMetric;
  if (settingOverridesByMetric) {
    [v6 setObject:settingOverridesByMetric forKey:@"MetricSettingOverrides"];
  }
  uint64_t v9 = [v6 count];
  settingsByActivityType = self->_settingsByActivityType;
  unint64_t v11 = KeyForWorkoutActivityType(self->_workoutActivityType);
  if (v9) {
    [(NSMutableDictionary *)settingsByActivityType setObject:v6 forKey:v11];
  }
  else {
    [(NSMutableDictionary *)settingsByActivityType removeObjectForKey:v11];
  }

  unint64_t v12 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  [v12 setObject:self->_settingsByActivityType forKey:@"SettingsByActivityType"];

  if (v3)
  {
    id v13 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
    long long v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIUIWorkoutDefaultMetricsProvider metricsVersion](self->_defaultMetricsProvider, "metricsVersion"));
    [v13 setObject:v14 forKey:@"ActivitySettingsFormatVersion"];
  }
  BOOL v15 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  id v16 = (id)[v15 synchronize];

  int v17 = [(FIUIWorkoutSettingsManager *)self syncManager];
  objc_super v18 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
  __int16 v19 = [v18 domain];
  long long v20 = [MEMORY[0x263EFFA08] setWithObject:@"SettingsByActivityType"];
  [v17 synchronizeNanoDomain:v19 keys:v20];

  _HKInitializeLogging();
  __int16 v21 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = self->_settingsByActivityType;
    uint64_t v23 = self->_enabledMetrics;
    if (v3) {
      v24 = @"YES";
    }
    else {
      v24 = @"NO";
    }
    __int16 v25 = v21;
    v26 = [(FIUIWorkoutSettingsManager *)self domainAccessor];
    __int16 v27 = [v26 objectForKey:@"ActivitySettingsFormatVersion"];
    int v28 = 138413058;
    uint64_t v29 = v22;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    v33 = v24;
    __int16 v34 = 2112;
    v35 = v27;
    _os_log_impl(&dword_21E433000, v25, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _writeToDomain called with settingsByActivityType:%@ and enabledMetrics:%@ and shouldUpdateVersion:%@ and metricsVersion:%@", (uint8_t *)&v28, 0x2Au);
  }
}

- (BOOL)_useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:(int64_t)a3 activityMoveMode:(int64_t)a4
{
  BOOL v4 = a3 != 2 || (unint64_t)a4 > 1;
  if ((unint64_t)a3 >= 2) {
    return v4;
  }
  else {
    return a4 != 2;
  }
}

+ (void)obliterateUserConfiguredWorkoutMetrics
{
  v13[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  BOOL v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F3D1B0]];
  id v4 = (id)[v3 synchronize];
  [v3 removeObjectForKey:@"SettingsByActivityType"];
  [v3 removeObjectForKey:@"ActivitySettingsFormatVersion"];
  [v3 removeObjectForKey:@"WorkoutMetricsActivityMoveMode"];
  id v5 = (id)[v3 synchronize];
  id v6 = objc_alloc_init(MEMORY[0x263F57528]);
  char v7 = (void *)MEMORY[0x263EFF9C0];
  v13[0] = @"SettingsByActivityType";
  v13[1] = @"ActivitySettingsFormatVersion";
  char v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v7 setWithArray:v8];

  [v9 addObject:@"WorkoutMetricsActivityMoveMode"];
  id v10 = [v3 domain];
  [v6 synchronizeNanoDomain:v10 keys:v9];

  _HKInitializeLogging();
  unint64_t v11 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v12 = 0;
    _os_log_impl(&dword_21E433000, v11, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] user configured workout metrics obliterated", v12, 2u);
  }
}

- (void)setDomainAccessor:(id)a3
{
}

- (void)setSyncManager:(id)a3
{
}

- (FIUIWorkoutActivityType)workoutActivityType
{
  return self->_workoutActivityType;
}

- (FIUIWorkoutDefaultMetricsProvider)defaultMetricsProvider
{
  return self->_defaultMetricsProvider;
}

@end