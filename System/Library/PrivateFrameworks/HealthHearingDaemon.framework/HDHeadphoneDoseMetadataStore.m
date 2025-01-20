@interface HDHeadphoneDoseMetadataStore
+ (id)_earliestFireDateAllowedWithNow:(id)a3;
- (BOOL)_clearPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3;
- (BOOL)_clearPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3;
- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4;
- (BOOL)_rebuildCachedFireDateFromLocalHAENStoreWithNow:(id)a3 error:(id *)a4;
- (BOOL)_setPreviousSevenDayLocalNotificationFireDate:(id)a3 error:(id *)a4;
- (BOOL)_setPreviousSevenDayRemoteNotificationFireDate:(id)a3 error:(id *)a4;
- (BOOL)_setShouldRebuildPreviousSevenDayNotification:(BOOL)a3 error:(id *)a4;
- (BOOL)_setShouldRebuildSevenDayStatistics:(BOOL)a3 error:(id *)a4;
- (BOOL)_shouldRebuildPreviousSevenDayNotificationWithError:(id *)a3;
- (BOOL)_shouldRebuildSevenDayStatisticsWithError:(id *)a3;
- (BOOL)_updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 changed:(BOOL *)a5 error:(id *)a6;
- (BOOL)rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:(id *)a3;
- (BOOL)rebuildCachedFireDateFromLocalHAENStoreWithError:(id *)a3;
- (BOOL)shouldNotifyUserForAccumulatedDose:(double)a3;
- (BOOL)updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 error:(id *)a5;
- (HDHeadphoneDoseMetadataStore)initWithProfile:(id)a3;
- (HKProfileIdentifier)_profileIdentifier;
- (id)_fetchDoseLimitInfoWithError:(id *)a3;
- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3;
- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithNow:(id)a3 error:(id *)a4;
- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3;
- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithNow:(id)a3 error:(id *)a4;
- (id)_filterForValidateFireDate:(id)a3 now:(id)a4 error:(id *)a5;
- (id)_info;
- (id)_infoDict;
- (id)_infoForAccumulatedDoseAtFireDate:(id)a3;
- (id)_infoForSevenDayDoseAtFireDate:(id)a3;
- (id)_lock_fetchDoseLimitInfoWithError:(id *)a3;
- (id)_mostRecentSevenDayLocalNotificationWithNow:(id)a3 error:(id *)a4;
- (id)collectionIntervalForDoseAccumulated:(double)a3;
- (int64_t)_updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 now:(id)a4 error:(id *)a5;
- (int64_t)_updatePreviousSevenDayNotificationFireDateWith:(id)a3 fromRemoteNotification:(BOOL)a4 isLocalDevice:(BOOL)a5 now:(id)a6 error:(id *)a7;
- (int64_t)updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 error:(id *)a4;
- (int64_t)updatePreviousSevenDayRemoteNotificationFireDateWith:(id)a3 error:(id *)a4;
- (void)_lock_loadDoseLimitOverride;
- (void)_lock_loadDoseLimitOverrideIfNeeded;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDHeadphoneDoseMetadataStore

- (HDHeadphoneDoseMetadataStore)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHeadphoneDoseMetadataStore;
  v5 = [(HDHeadphoneDoseMetadataStore *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F43218]) initWithCategory:0 domainName:@"Hearing" profile:v4];
    domain = v6->_domain;
    v6->_domain = (HDKeyValueDomain *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_doseLimit = 1.0;
    int v9 = [MEMORY[0x263F0A980] isAppleInternalInstall];
    char v10 = 0;
    if (v9) {
      char v10 = [MEMORY[0x263F0A980] isTestingDevice] ^ 1;
    }
    v6->_shouldLoadDoseLimitOverride = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];

    v12 = v6;
  }

  return v6;
}

- (void)_lock_loadDoseLimitOverrideIfNeeded
{
  os_unfair_lock_assert_owner(&self->_lock);
  if ([MEMORY[0x263F0A980] isAppleInternalInstall] && self->_shouldLoadDoseLimitOverride)
  {
    self->_shouldLoadDoseLimitOverride = 0;
    [(HDHeadphoneDoseMetadataStore *)self _lock_loadDoseLimitOverride];
  }
}

- (void)_lock_loadDoseLimitOverride
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 138543874;
  v3 = @"_SevenDayHeadphoneExposureDoseNotificationThreshold";
  __int16 v4 = 2048;
  uint64_t v5 = 0x3FF0000000000000;
  __int16 v6 = 2048;
  double v7 = a2;
  _os_log_error_impl(&dword_22615C000, log, OS_LOG_TYPE_ERROR, "Read invalid value for AppleInternal key %{public}@, using default %.2f%% instead of %.2f%%", (uint8_t *)&v2, 0x20u);
}

- (BOOL)shouldNotifyUserForAccumulatedDose:(double)a3
{
  __int16 v4 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDHeadphoneDoseMetadataStore *)v4 _lock_loadDoseLimitOverrideIfNeeded];
  LOBYTE(v4) = v4->_doseLimit <= a3;
  os_unfair_lock_unlock(p_lock);
  return (char)v4;
}

- (BOOL)updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 error:(id *)a5
{
  return [(HDHeadphoneDoseMetadataStore *)self _updateCacheWithFireDate:a3 fromRemoteNotification:a4 changed:0 error:a5];
}

- (int64_t)updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 error:(id *)a4
{
  __int16 v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  uint64_t v8 = [v6 now];
  int64_t v9 = [(HDHeadphoneDoseMetadataStore *)self _updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:v7 now:v8 error:a4];

  return v9;
}

- (int64_t)updatePreviousSevenDayRemoteNotificationFireDateWith:(id)a3 error:(id *)a4
{
  __int16 v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  uint64_t v8 = [v6 now];
  int64_t v9 = [(HDHeadphoneDoseMetadataStore *)self _updatePreviousSevenDayNotificationFireDateWith:v7 fromRemoteNotification:1 isLocalDevice:0 now:v8 error:a4];

  return v9;
}

- (BOOL)rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:(id *)a3
{
  id v11 = 0;
  BOOL v5 = [(HDHeadphoneDoseMetadataStore *)self _shouldRebuildPreviousSevenDayNotificationWithError:&v11];
  id v6 = v11;
  if (v6)
  {
    if (a3)
    {
      BOOL v7 = 0;
      *a3 = v6;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v7 = 0;
    }
  }
  else if (v5)
  {
    BOOL v7 = [(HDHeadphoneDoseMetadataStore *)self rebuildCachedFireDateFromLocalHAENStoreWithError:a3];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v10 = 0;
      _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "Rebuild largest recent dose is not needed yet.", v10, 2u);
    }
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)rebuildCachedFireDateFromLocalHAENStoreWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x263EFF910] now];
  LOBYTE(a3) = [(HDHeadphoneDoseMetadataStore *)self _rebuildCachedFireDateFromLocalHAENStoreWithNow:v5 error:a3];

  return (char)a3;
}

- (id)collectionIntervalForDoseAccumulated:(double)a3
{
  if (objc_msgSend(MEMORY[0x263F44978], "unitTesting_forceDefaultHeadphoneDataCollectionInterval")) {
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  double doseLimit = self->_doseLimit;
  os_unfair_lock_unlock(&self->_lock);
  double v7 = doseLimit - a3;
  if (doseLimit - a3 <= 0.01) {
    return &unk_26D9E9AF0;
  }
  if (v7 <= 0.03) {
    return &unk_26D9E9B08;
  }
  if (v7 <= 0.05) {
    return &unk_26D9E9B20;
  }
  if (v7 <= 0.1) {
    return &unk_26D9E9B38;
  }
  if (v7 <= 0.3) {
    return &unk_26D9E9D00;
  }
  if (v7 >= 0.6) {
    return 0;
  }
  return &unk_26D9E9D10;
}

- (void)profileDidBecomeReady:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDHeadphoneDoseMetadataStore *)self _lock_loadDoseLimitOverrideIfNeeded];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_rebuildCachedFireDateFromLocalHAENStoreWithNow:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  double v7 = (os_log_t *)MEMORY[0x263F09910];
  uint64_t v8 = *MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22615C000, v8, OS_LOG_TYPE_DEFAULT, "Rebuilding Previous 7-day HAEN Fire Date.", buf, 2u);
  }
  if ([MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled])
  {
    id v20 = 0;
    int64_t v9 = [(HDHeadphoneDoseMetadataStore *)self _mostRecentSevenDayLocalNotificationWithNow:v6 error:&v20];
    id v10 = v20;
    id v11 = v10;
    if (!v9 && v10)
    {
      if (a4)
      {
        BOOL v12 = 0;
        *a4 = v10;
LABEL_20:

        goto LABEL_21;
      }
      _HKLogDroppedError();
LABEL_15:
      BOOL v12 = 0;
      goto LABEL_20;
    }
    if (![(HDHeadphoneDoseMetadataStore *)self _setPreviousSevenDayLocalNotificationFireDate:v9 error:a4])goto LABEL_15; {
    BOOL v13 = [(HDHeadphoneDoseMetadataStore *)self _setShouldRebuildPreviousSevenDayNotification:0 error:a4];
    }
    BOOL v12 = 0;
    if (!v13) {
      goto LABEL_20;
    }
    _HKInitializeLogging();
    os_log_t v14 = *v7;
    BOOL v15 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        v16 = "Updated Previous 7-day HAEN Fire Date to %@.";
        v17 = v14;
        uint32_t v18 = 12;
LABEL_18:
        _os_log_impl(&dword_22615C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Cleared Previous 7-day HAEN Fire Date, no recent HAENs.";
      v17 = v14;
      uint32_t v18 = 2;
      goto LABEL_18;
    }
    BOOL v12 = 1;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 111, @"Feature Disabled: 7-Day HAEN");
  BOOL v12 = 0;
LABEL_21:

  return v12;
}

- (id)_mostRecentSevenDayLocalNotificationWithNow:(id)a3 error:(id *)a4
{
  v30[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void *)MEMORY[0x263F434A8];
  uint64_t v8 = HKHeadphoneAudioExposureEventType();
  int64_t v9 = HDSampleEntityPredicateForDataType();
  v30[0] = v9;
  id v10 = HDCategorySampleEntityPredicateForValue();
  v30[1] = v10;
  id v11 = HDSampleEntityPredicateForEndDate();
  v30[2] = v11;
  BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  BOOL v13 = [v7 predicateMatchingAllPredicates:v12];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  os_log_t v14 = (void *)MEMORY[0x263F43180];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = [v14 entityEnumeratorWithProfile:WeakRetained];

  [v16 setPredicate:v13];
  v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
  v29 = v17;
  uint32_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  [v16 setSortDescriptors:v18];

  [v16 setLimitCount:1];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__HDHeadphoneDoseMetadataStore__mostRecentSevenDayLocalNotificationWithNow_error___block_invoke;
  v22[3] = &unk_264795EC0;
  v22[4] = &v23;
  if ([v16 enumerateWithError:a4 handler:v22]) {
    v19 = (void *)v24[5];
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  _Block_object_dispose(&v23, 8);
  return v20;
}

BOOL __82__HDHeadphoneDoseMetadataStore__mostRecentSevenDayLocalNotificationWithNow_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  __int16 v4 = HKSafeObject();

  if (v4)
  {
    BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5
      || ([v4 endDate],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = objc_msgSend(v5, "hk_isBeforeDate:", v6),
          v6,
          v7))
    {
      uint64_t v8 = [v4 endDate];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }

  return v4 != 0;
}

+ (id)_earliestFireDateAllowedWithNow:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:-604800.0];
}

- (HKProfileIdentifier)_profileIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained profileIdentifier];

  return (HKProfileIdentifier *)v3;
}

- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x263EFF910] now];
  id v6 = [(HDHeadphoneDoseMetadataStore *)self _fetchPreviousSevenDayLocalNotificationFireDateWithNow:v5 error:a3];

  return v6;
}

- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithNow:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(HDKeyValueDomain *)self->_domain dateForKey:@"_PreviousSevenDayHeadphoneExposureNotificationFireDate" error:a4];
  if (v7)
  {
    uint64_t v8 = [(HDHeadphoneDoseMetadataStore *)self _filterForValidateFireDate:v7 now:v6 error:a4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_setPreviousSevenDayLocalNotificationFireDate:(id)a3 error:(id *)a4
{
  return [(HDKeyValueDomain *)self->_domain setDate:a3 forKey:@"_PreviousSevenDayHeadphoneExposureNotificationFireDate" error:a4];
}

- (BOOL)_clearPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3
{
  domain = self->_domain;
  BOOL v5 = [MEMORY[0x263EFFA08] setWithObject:@"_PreviousSevenDayHeadphoneExposureNotificationFireDate"];
  LOBYTE(a3) = [(HDKeyValueDomain *)domain removeValuesForKeys:v5 error:a3];

  return (char)a3;
}

- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x263EFF910] now];
  id v6 = [(HDHeadphoneDoseMetadataStore *)self _fetchPreviousSevenDayRemoteNotificationFireDateWithNow:v5 error:a3];

  return v6;
}

- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithNow:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(HDKeyValueDomain *)self->_domain dateForKey:@"_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate" error:a4];
  if (v7)
  {
    uint64_t v8 = [(HDHeadphoneDoseMetadataStore *)self _filterForValidateFireDate:v7 now:v6 error:a4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_setPreviousSevenDayRemoteNotificationFireDate:(id)a3 error:(id *)a4
{
  return [(HDKeyValueDomain *)self->_domain setDate:a3 forKey:@"_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate" error:a4];
}

- (BOOL)_clearPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3
{
  domain = self->_domain;
  BOOL v5 = [MEMORY[0x263EFFA08] setWithObject:@"_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate"];
  LOBYTE(a3) = [(HDKeyValueDomain *)domain removeValuesForKeys:v5 error:a3];

  return (char)a3;
}

- (BOOL)_shouldRebuildSevenDayStatisticsWithError:(id *)a3
{
  domain = self->_domain;
  id v9 = 0;
  BOOL v5 = [(HDKeyValueDomain *)domain numberForKey:@"_ShouldRebuildSevenDayHeadphoneExposureStatistics" error:&v9];
  id v6 = v9;
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_8;
  }
  if (!v5)
  {
LABEL_8:
    char v7 = 1;
    goto LABEL_9;
  }
  char v7 = [v5 BOOLValue];
LABEL_9:

  return v7;
}

- (BOOL)_setShouldRebuildSevenDayStatistics:(BOOL)a3 error:(id *)a4
{
  domain = self->_domain;
  id v6 = [NSNumber numberWithBool:a3];
  LOBYTE(a4) = [(HDKeyValueDomain *)domain setNumber:v6 forKey:@"_ShouldRebuildSevenDayHeadphoneExposureStatistics" error:a4];

  return (char)a4;
}

- (BOOL)_shouldRebuildPreviousSevenDayNotificationWithError:(id *)a3
{
  id v3 = [(HDKeyValueDomain *)self->_domain numberForKey:@"_ShouldRebuildPreviousSevenDayHeadphoneExposureNotification" error:a3];
  __int16 v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_setShouldRebuildPreviousSevenDayNotification:(BOOL)a3 error:(id *)a4
{
  domain = self->_domain;
  id v6 = [NSNumber numberWithBool:a3];
  LOBYTE(a4) = [(HDKeyValueDomain *)domain setNumber:v6 forKey:@"_ShouldRebuildPreviousSevenDayHeadphoneExposureNotification" error:a4];

  return (char)a4;
}

- (id)_info
{
  int v2 = [(HDHeadphoneDoseMetadataStore *)self _infoDict];
  id v3 = [v2 objectForKeyedSubscript:@"recent_seven_day_haen_error"];

  if (v3)
  {
    __int16 v4 = NSString;
    id v5 = [v2 objectForKeyedSubscript:@"recent_seven_day_haen_error"];
    uint64_t v6 = [v4 stringWithFormat:@"Recent 7-Day HAEN:\t Error (%@)", v5];
LABEL_3:
    char v7 = (__CFString *)v6;

    goto LABEL_6;
  }
  uint64_t v8 = [v2 objectForKeyedSubscript:@"recent_seven_day_haen_nil"];

  if (!v8)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    [v5 appendString:@"Recent 7-Day HAEN:\n"];
    id v10 = [v2 objectForKeyedSubscript:@"previous_fire_date"];
    [v5 appendFormat:@"\tFireDate:\t  %@\n", v10];

    id v11 = [v2 objectForKeyedSubscript:@"seven_day_dose"];
    [v5 appendFormat:@"\t7-Day Dose:\t  %@\n", v11];

    BOOL v12 = [v2 objectForKeyedSubscript:@"accumulated_dose_from_fire_date"];
    [v5 appendFormat:@"\tAccumulated Dose: %@\n", v12];

    uint64_t v6 = [v5 copy];
    goto LABEL_3;
  }
  char v7 = @"Recent 7-Day HAEN:\t None";
LABEL_6:

  return v7;
}

- (id)_infoDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v14 = 0;
  __int16 v4 = +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:self error:&v14];
  id v5 = v14;
  uint64_t v6 = v5;
  if (v4)
  {
    char v7 = (void *)[[NSString alloc] initWithFormat:@"%@", v4];
    [v3 setObject:v7 forKeyedSubscript:@"previous_fire_date"];

    uint64_t v8 = [(HDHeadphoneDoseMetadataStore *)self _infoForSevenDayDoseAtFireDate:v4];
    [v3 setObject:v8 forKeyedSubscript:@"seven_day_dose"];

    id v9 = [(HDHeadphoneDoseMetadataStore *)self _infoForAccumulatedDoseAtFireDate:v4];
    [v3 setObject:v9 forKeyedSubscript:@"accumulated_dose_from_fire_date"];

    id v10 = (id)[v3 copy];
  }
  else
  {
    if (v5)
    {
      id v11 = [NSString stringWithFormat:@"error (%@)", v5];
      [v3 setObject:v11 forKeyedSubscript:@"recent_seven_day_haen_error"];
    }
    else
    {
      [v3 setObject:@"none" forKeyedSubscript:@"recent_seven_day_haen_nil"];
    }
    id v10 = v3;
  }
  BOOL v12 = v10;

  return v12;
}

- (id)_fetchDoseLimitInfoWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(HDHeadphoneDoseMetadataStore *)self _lock_fetchDoseLimitInfoWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_fetchDoseLimitInfoWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  domain = self->_domain;
  id v22 = 0;
  uint64_t v6 = [(HDKeyValueDomain *)domain numberForKey:@"_SevenDayHeadphoneExposureDoseNotificationThreshold" error:&v22];
  id v7 = v22;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    double doseLimit = self->_doseLimit;
    if (v6)
    {
      [v6 doubleValue];
      double v12 = doseLimit - v11;
      if (v12 < 0.0) {
        double v12 = -v12;
      }
      BOOL v13 = @"[Current] %.2f%%\n [After Reboot] %@";
      if (v12 <= 2.22044605e-16)
      {
        v16 = 0;
      }
      else
      {
        [v6 doubleValue];
        double v15 = v14;
        v16 = [NSString stringWithFormat:@"%.2f%% (Override)", v14 * 100.0];
        if (v15 > 5.0 || v15 < 0.01) {
          BOOL v13 = @"[Current] %.2f%%\n [Invalid] %@";
        }
      }
    }
    else
    {
      double v19 = doseLimit + -1.0;
      if (doseLimit + -1.0 < 0.0) {
        double v19 = -(doseLimit + -1.0);
      }
      if (v19 <= 2.22044605e-16)
      {
        v16 = 0;
      }
      else
      {
        v16 = [NSString stringWithFormat:@"%.2f%% (Default)", 0x4059000000000000];
      }
      BOOL v13 = @"[Current] %.2f%%\n [After Reboot] %@";
    }
    if ([v16 length])
    {
      objc_msgSend(NSString, "stringWithFormat:", v13, self->_doseLimit * 100.0, v16);
    }
    else
    {
      id v20 = @"Override";
      if (!v6) {
        id v20 = @"Default";
      }
      [NSString stringWithFormat:@"%.2f%% (%@)", self->_doseLimit * 100.0, v20];
    uint32_t v18 = };
  }
  else if (a3)
  {
    uint32_t v18 = 0;
    *a3 = v7;
  }
  else
  {
    _HKLogDroppedError();
    uint32_t v18 = 0;
  }

  return v18;
}

- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6
    && (([v6 doubleValue], v8 < 0.01) || v8 > 5.0)
    && ([NSString stringWithFormat:@"Dose Limit %.2f%% is outside the range %.2f%% - %.2f%% (Default: %.2f%%)", v8 * 100.0, 0x3FF0000000000000, 0x407F400000000000, 0x4059000000000000], BOOL v9 = objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, v9), v10 = objc_claimAutoreleasedReturnValue(), v9, (v11 = v10) != 0))
  {
    double v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }

    LOBYTE(v13) = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    int v13 = [(HDKeyValueDomain *)self->_domain setNumber:v7 forKey:@"_SevenDayHeadphoneExposureDoseNotificationThreshold" error:a4];
    if (v13) {
      [(HDHeadphoneDoseMetadataStore *)self _lock_loadDoseLimitOverride];
    }
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13;
}

- (id)_infoForSevenDayDoseAtFireDate:(id)a3
{
  p_profile = &self->_profile;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v6 = +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:v4 earliestStartDate:0 profile:WeakRetained];

  return v6;
}

- (id)_infoForAccumulatedDoseAtFireDate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dateByAddingTimeInterval:-1.0];
  id v14 = 0;
  id v6 = [(HDHeadphoneDoseMetadataStore *)self _mostRecentSevenDayLocalNotificationWithNow:v5 error:&v14];
  id v7 = v14;
  double v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v11 = +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:v4 earliestStartDate:v6 profile:WeakRetained];
  }
  else
  {
    char v12 = objc_msgSend(v7, "hk_isDatabaseAccessibilityError");
    if (v12)
    {
      id v11 = @"Locked (Data Inaccessible)";
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"fetch previous HAEN before %@ failed: %@", v4, v8];
    }
  }

  return v11;
}

- (BOOL)_updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 changed:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  if (!v11)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDHeadphoneDoseMetadataStore.m", 459, @"Invalid parameter not satisfying: %@", @"fireDate" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    char v12 = (id *)&v21;
    uint64_t v13 = [(HDHeadphoneDoseMetadataStore *)self _fetchPreviousSevenDayLocalNotificationFireDateWithError:&v21];
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v22 = 0;
  char v12 = (id *)&v22;
  uint64_t v13 = [(HDHeadphoneDoseMetadataStore *)self _fetchPreviousSevenDayRemoteNotificationFireDateWithError:&v22];
LABEL_6:
  double v15 = (void *)v13;
  id v16 = *v12;
  v17 = v16;
  if (v15 || !v16)
  {
    if (v15 && (objc_msgSend(v15, "hk_isBeforeDate:", v11) & 1) == 0)
    {
      if (a5) {
        *a5 = 0;
      }
      BOOL v18 = 1;
    }
    else
    {
      if (v8) {
        BOOL v19 = [(HDHeadphoneDoseMetadataStore *)self _setPreviousSevenDayRemoteNotificationFireDate:v11 error:a6];
      }
      else {
        BOOL v19 = [(HDHeadphoneDoseMetadataStore *)self _setPreviousSevenDayLocalNotificationFireDate:v11 error:a6];
      }
      BOOL v18 = v19;
      if (a5) {
        *a5 = v19;
      }
    }
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6)
    {
      BOOL v18 = 0;
      *a6 = v16;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (int64_t)_updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 now:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled])
  {
    v43 = [(id)objc_opt_class() _earliestFireDateAllowedWithNow:v9];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = v8;
    uint64_t v44 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v44)
    {
      v40 = self;
      id v41 = v8;
      char v42 = 0;
      id v11 = 0;
      uint64_t v12 = *(void *)v46;
      uint64_t v13 = @"sample";
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          double v15 = HKSafeObject();
          if (!v15)
          {

            int64_t v35 = 0;
            goto LABEL_23;
          }
          id v16 = v15;
          if (objc_msgSend(v15, "hk_isHearingSevenDayDoseNotification"))
          {
            v17 = a5;
            id v18 = v10;
            BOOL v19 = v13;
            id v20 = [v16 endDate];
            int v21 = objc_msgSend(v20, "hk_isAfterDate:", v9);

            if (v21)
            {
              _HKInitializeLogging();
              uint64_t v22 = (void *)*MEMORY[0x263F09910];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR))
              {
                log = v22;
                v39 = [v16 endDate];
                [v39 timeIntervalSinceDate:v9];
                uint64_t v24 = v23;
                v37 = [v16 endDate];
                [v37 timeIntervalSince1970];
                uint64_t v26 = (uint64_t)v25;
                [v9 timeIntervalSince1970];
                *(_DWORD *)buf = 134218496;
                uint64_t v50 = v24;
                __int16 v51 = 2048;
                uint64_t v52 = v26;
                __int16 v53 = 2048;
                uint64_t v54 = (uint64_t)v27;
                _os_log_error_impl(&dword_22615C000, log, OS_LOG_TYPE_ERROR, "Ignoring incoming HAEN ending %f seconds in the future (endDate: %{time_t}ld, now: %{time_t}ld).", buf, 0x20u);
              }
            }
            else
            {
              id v28 = [v16 endDate];
              int v29 = objc_msgSend(v28, "hk_isAfterOrEqualToDate:", v43);

              if (v29)
              {
                if (!v11
                  || ([v16 endDate],
                      v30 = objc_claimAutoreleasedReturnValue(),
                      int v31 = objc_msgSend(v11, "hk_isBeforeDate:", v30),
                      v30,
                      v31))
                {
                  uint64_t v32 = [v16 endDate];

                  v33 = [v16 sourceRevision];
                  v34 = [v33 source];
                  char v42 = [v34 _isLocalDevice];

                  id v11 = (void *)v32;
                }
              }
            }
            uint64_t v13 = v19;
            id v10 = v18;
            a5 = v17;
          }
        }
        uint64_t v44 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v44) {
          continue;
        }
        break;
      }

      if (v11)
      {
        int64_t v35 = [(HDHeadphoneDoseMetadataStore *)v40 _updatePreviousSevenDayNotificationFireDateWith:v11 fromRemoteNotification:0 isLocalDevice:v42 & 1 now:v9 error:a5];
        id v8 = v41;
        goto LABEL_25;
      }
      int64_t v35 = 1;
LABEL_23:
      id v8 = v41;
    }
    else
    {

      id v11 = 0;
      int64_t v35 = 1;
    }
LABEL_25:
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 111, @"Feature Disabled: 7-Day HAEN");
    int64_t v35 = 0;
  }

  return v35;
}

- (int64_t)_updatePreviousSevenDayNotificationFireDateWith:(id)a3 fromRemoteNotification:(BOOL)a4 isLocalDevice:(BOOL)a5 now:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  if (v10 && v9)
  {
    int v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HDHeadphoneDoseMetadataStore.m", 542, @"Invalid parameter not satisfying: %@", @"(!isLocalDevice && fromRemoteNotification) || !fromRemoteNotification" object file lineNumber description];
  }
  if ([MEMORY[0x263F44978] isHeadphoneExposureNotificationsEnabled])
  {
    double v15 = [(id)objc_opt_class() _earliestFireDateAllowedWithNow:v14];
    if (objc_msgSend(v13, "hk_isAfterDate:", v14))
    {
      _HKInitializeLogging();
      id v16 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        [v13 timeIntervalSinceDate:v14];
        uint64_t v19 = v18;
        [v13 timeIntervalSince1970];
        uint64_t v21 = (uint64_t)v20;
        [v14 timeIntervalSince1970];
        uint64_t v23 = @"NO";
        *(_DWORD *)buf = 134218754;
        uint64_t v31 = v19;
        __int16 v32 = 2048;
        if (v10) {
          uint64_t v23 = @"YES";
        }
        uint64_t v33 = v21;
        __int16 v34 = 2048;
        uint64_t v35 = (uint64_t)v22;
        __int16 v36 = 2112;
        v37 = v23;
        _os_log_error_impl(&dword_22615C000, v17, OS_LOG_TYPE_ERROR, "Ignoring if fire date ending %f seconds in the future (endDate: %{time_t}ld, now: %{time_t}ld). Is fire date from remote notification: %@", buf, 0x2Au);
      }
    }
    else if (objc_msgSend(v13, "hk_isAfterOrEqualToDate:", v15))
    {
      buf[0] = 0;
      BOOL v25 = [(HDHeadphoneDoseMetadataStore *)self _updateCacheWithFireDate:v13 fromRemoteNotification:v10 changed:buf error:a7];
      uint64_t v26 = 2;
      if (v9) {
        uint64_t v26 = 3;
      }
      if (buf[0]) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = 1;
      }
      if (v25) {
        int64_t v24 = v27;
      }
      else {
        int64_t v24 = 0;
      }
      goto LABEL_21;
    }
    int64_t v24 = 1;
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a7, 111, @"Feature Disabled: 7-Day HAEN");
  int64_t v24 = 0;
LABEL_22:

  return v24;
}

- (id)_filterForValidateFireDate:(id)a3 now:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "hk_isAfterDate:", v7))
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      -[HDHeadphoneDoseMetadataStore _filterForValidateFireDate:now:error:](v8, v6, (uint64_t)v7);
    }
    id v9 = 0;
  }
  else
  {
    BOOL v10 = [(id)objc_opt_class() _earliestFireDateAllowedWithNow:v7];
    if (objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v10)) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_filterForValidateFireDate:(void *)a1 now:(void *)a2 error:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a1;
  [a2 timeIntervalSinceDate:a3];
  int v7 = 134217984;
  uint64_t v8 = v6;
  _os_log_fault_impl(&dword_22615C000, v5, OS_LOG_TYPE_FAULT, "Ignoring fetched HAEN ending %f seconds in the future.", (uint8_t *)&v7, 0xCu);
}

@end