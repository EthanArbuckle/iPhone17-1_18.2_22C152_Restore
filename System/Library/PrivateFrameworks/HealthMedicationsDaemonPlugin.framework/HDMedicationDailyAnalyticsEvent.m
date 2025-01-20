@interface HDMedicationDailyAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDMedicationDailyAnalyticsEvent)initWithProfile:(id)a3;
- (NSString)eventName;
- (id)_fetchDeviceContextAnalytics;
- (id)_fetchFeatureSettingsAnalyticsWithDataSource:(id)a3;
- (id)_fetchNotificationSettingsAnalyticsWithDataSource:(id)a3 includingCriticalMedsCount:(BOOL)a4;
- (id)_isImproveHealthRecordsAllowedPayloadWithDataSource:(id)a3;
- (id)_lifestyleInteractionsAnalyticsPayload;
- (id)_readValueFromKeyValueDomainForKey:(id)a3;
- (id)_reminderAnalyticsPayload;
- (id)_userCharacteristicsAnalyticsPayloadWithDataSource:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4;
- (void)_fetchDeviceContextAnalytics;
@end

@implementation HDMedicationDailyAnalyticsEvent

- (HDMedicationDailyAnalyticsEvent)initWithProfile:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDMedicationDailyAnalyticsEvent;
  v5 = [(HDMedicationDailyAnalyticsEvent *)&v27 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [v4 healthMedicationsProfileExtension];
    uint64_t v8 = [v7 medicationUserDefaults];
    medicationsUserDefaults = v6->_medicationsUserDefaults;
    v6->_medicationsUserDefaults = (NSUserDefaults *)v8;

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F65B28], "hdmd_defaultDomainWithProfile:", v4);
    medicationsKeyValueDomain = v6->_medicationsKeyValueDomain;
    v6->_medicationsKeyValueDomain = (HDKeyValueDomain *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    currentDate = v6->_currentDate;
    v6->_currentDate = (NSDate *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F66BA0]) initWithUserDefaults:v6->_medicationsUserDefaults];
    criticalNotificationsStore = v6->_criticalNotificationsStore;
    v6->_criticalNotificationsStore = (HKMedicationsCriticalNotificationsStore *)v16;

    v18 = [[HDMedicationDoseEventDailyAnalytics alloc] initWithProfile:v4 calendar:v6->_calendar currentDate:v6->_currentDate];
    doseEventAnalytics = v6->_doseEventAnalytics;
    v6->_doseEventAnalytics = v18;

    v20 = [[HDMedicationUserDomainConceptDailyAnalytics alloc] initWithProfile:v4 medicationsKeyValueDomain:v6->_medicationsKeyValueDomain calendar:v6->_calendar currentDate:v6->_currentDate];
    medicationConceptAnalytics = v6->_medicationConceptAnalytics;
    v6->_medicationConceptAnalytics = v20;

    v22 = [[HDMedicationOntologyDailyAnalytics alloc] initWithProfile:v4];
    ontologyAnalytics = v6->_ontologyAnalytics;
    v6->_ontologyAnalytics = v22;

    v24 = [[HDMedicationScheduleDailyAnalytics alloc] initWithProfile:v4];
    scheduleAnalytics = v6->_scheduleAnalytics;
    v6->_scheduleAnalytics = v24;
  }
  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.meds.daily";
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = [v5 environmentDataSource];
  v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isImproveHealthAndActivityEnabled"));
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F296C0]];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = [WeakRetained healthMedicationsProfileExtension];
  uint64_t v12 = [v11 medicationScheduleManager];
  v13 = [v12 notificationManager];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v13, "areDoseRemindersEnabled"));
  [v6 setObject:v14 forKeyedSubscript:@"hasMedsNotificationsEnabled"];

  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v16 = [v15 notificationManager];

  if (v16)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v16, "areHealthNotificationsAuthorized"));
    [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F29670]];
  }
  v18 = [v5 environmentDataSource];
  v19 = [v18 activePairedDeviceProductType];

  if (v19) {
    [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F29680]];
  }
  v20 = [(HDMedicationDailyAnalyticsEvent *)self _isImproveHealthRecordsAllowedPayloadWithDataSource:v5];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v20);

  v21 = [(HDMedicationDoseEventDailyAnalytics *)self->_doseEventAnalytics makeUnrestrictedEventPayloadWithDataSource:v5 error:0];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v21);

  v22 = [(HDMedicationUserDomainConceptDailyAnalytics *)self->_medicationConceptAnalytics makeUnrestrictedEventPayloadWithDataSource:v5 error:0];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v22);

  v23 = [(HDMedicationOntologyDailyAnalytics *)self->_ontologyAnalytics makeUnrestrictedEventPayloadWithDataSource:v5 error:0];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v23);

  v24 = [(HDMedicationScheduleDailyAnalytics *)self->_scheduleAnalytics makeUnrestrictedEventPayloadWithDataSource:v5 error:0];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v24);

  v25 = [(HDMedicationDailyAnalyticsEvent *)self _fetchDeviceContextAnalytics];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v25);

  v26 = [(HDMedicationDailyAnalyticsEvent *)self _fetchNotificationSettingsAnalyticsWithDataSource:v5 includingCriticalMedsCount:0];
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v26);

  return v6;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [(HDMedicationDailyAnalyticsEvent *)self _userCharacteristicsAnalyticsPayloadWithDataSource:v6];
  [v7 addEntriesFromDictionary:v8];

  v9 = [(HDMedicationDailyAnalyticsEvent *)self _lifestyleInteractionsAnalyticsPayload];
  [v7 addEntriesFromDictionary:v9];

  uint64_t v10 = [(HDMedicationDailyAnalyticsEvent *)self _reminderAnalyticsPayload];
  [v7 addEntriesFromDictionary:v10];

  v11 = [(HDMedicationDoseEventDailyAnalytics *)self->_doseEventAnalytics makeIHAGatedEventPayloadWithDataSource:v6 error:0];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v11);

  uint64_t v12 = [(HDMedicationUserDomainConceptDailyAnalytics *)self->_medicationConceptAnalytics makeIHAGatedEventPayloadWithDataSource:v6 error:0];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v12);

  v13 = [(HDMedicationOntologyDailyAnalytics *)self->_ontologyAnalytics makeIHAGatedEventPayloadWithDataSource:v6 error:0];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v13);

  uint64_t v14 = [(HDMedicationScheduleDailyAnalytics *)self->_scheduleAnalytics makeIHAGatedEventPayloadWithDataSource:v6 error:0];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v14);

  id v15 = [(HDMedicationDailyAnalyticsEvent *)self _fetchNotificationSettingsAnalyticsWithDataSource:v6 includingCriticalMedsCount:1];

  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v15);
  return v7;
}

- (id)_userCharacteristicsAnalyticsPayloadWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 healthDataSource];
  id v20 = 0;
  id v7 = [v6 biologicalSexWithError:&v20];
  uint64_t v8 = v20;

  if (v7)
  {
    v9 = HKAnalyticsPropertyValueForBiologicalSex();
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F29698]];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = HKLogMedication();
    v9 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:]();
      }

      [v5 setObject:*MEMORY[0x1E4F296C8] forKeyedSubscript:*MEMORY[0x1E4F29698]];
      v9 = v8;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:]((uint64_t)self, v9);
    }
    uint64_t v8 = 0;
  }

  v11 = [v4 healthDataSource];
  uint64_t v12 = [v4 environmentDataSource];
  v13 = [v12 currentDate];
  v19 = v8;
  uint64_t v14 = [v11 ageWithCurrentDate:v13 error:&v19];
  id v15 = v19;

  if (v14)
  {
    uint64_t v16 = HKMedicationsBucketedDecadeForAge();
    [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  }
  else
  {
    if (!v15) {
      goto LABEL_17;
    }
    _HKInitializeLogging();
    v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:]();
    }

    [v5 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:*MEMORY[0x1E4F29688]];
  }

LABEL_17:
  return v5;
}

- (id)_reminderAnalyticsPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSUserDefaults *)self->_medicationsUserDefaults objectForKey:*MEMORY[0x1E4F66A10]];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
    [(NSDate *)self->_currentDate timeIntervalSinceDate:v7];
    uint64_t v10 = [v8 numberWithInt:v9 <= 86400.0];
    [v3 setObject:v10 forKeyedSubscript:@"hasReceivedMedicationReminderInPast24hrs"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasReceivedMedicationReminderInPast24hrs"];
  }
  v11 = [(NSUserDefaults *)self->_medicationsUserDefaults objectForKey:*MEMORY[0x1E4F66A08]];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F28ED0];
    [(NSDate *)self->_currentDate timeIntervalSinceDate:v14];
    v17 = [v15 numberWithInt:v16 <= 86400.0];
    [v3 setObject:v17 forKeyedSubscript:@"hasOpenedAppOrLoggedFromMedicationReminderInPast24hrs"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasOpenedAppOrLoggedFromMedicationReminderInPast24hrs"];
  }

  return v3;
}

- (id)_lifestyleInteractionsAnalyticsPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(HDMedicationDailyAnalyticsEvent *)self _readValueFromKeyValueDomainForKey:*MEMORY[0x1E4F66978]];
  [v3 setObject:v4 forKeyedSubscript:@"hasLifestyleInteractionAlcoholEnabled"];

  id v5 = [(HDMedicationDailyAnalyticsEvent *)self _readValueFromKeyValueDomainForKey:*MEMORY[0x1E4F669D8]];
  [v3 setObject:v5 forKeyedSubscript:@"hasLifestyleInteractionCannabisEnabled"];

  id v6 = [(HDMedicationDailyAnalyticsEvent *)self _readValueFromKeyValueDomainForKey:*MEMORY[0x1E4F66A70]];
  [v3 setObject:v6 forKeyedSubscript:@"hasLifestyleInteractionTobaccoEnabled"];

  return v3;
}

- (id)_readValueFromKeyValueDomainForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  medicationsKeyValueDomain = self->_medicationsKeyValueDomain;
  uint64_t v6 = *MEMORY[0x1E4F669D8];
  id v11 = 0;
  id v7 = [(HDKeyValueDomain *)medicationsKeyValueDomain numberForKey:v6 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    _HKInitializeLogging();
    double v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v8;
    }
  }
  return v7;
}

- (id)_isImproveHealthRecordsAllowedPayloadWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x3032000000;
  v27[2] = __Block_byref_object_copy__7;
  v27[3] = __Block_byref_object_dispose__7;
  id v28 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [v4 healthDataSource];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HDMedicationDailyAnalyticsEvent__isImproveHealthRecordsAllowedPayloadWithDataSource___block_invoke;
  v16[3] = &unk_1E6337988;
  uint64_t v18 = &v20;
  v19 = &v26;
  id v8 = v6;
  id v17 = v8;
  [v7 isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:v16];

  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    uint64_t v10 = (id *)(v27[0] + 40);
    id obj = *(id *)(v27[0] + 40);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &obj, 100, @"Timed out calling isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion.");
    objc_storeStrong(v10, obj);
  }
  uint64_t v11 = v21[5];
  if (v11)
  {
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F66988]];
LABEL_5:
    id v12 = v5;
    goto LABEL_10;
  }
  if (!*(void *)(v27[0] + 40)) {
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v13 = HKLogMedication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    [(HDMedicationDailyAnalyticsEvent *)(uint64_t)self _isImproveHealthRecordsAllowedPayloadWithDataSource:v13];
  }

  id v12 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __87__HDMedicationDailyAnalyticsEvent__isImproveHealthRecordsAllowedPayloadWithDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_fetchDeviceContextAnalytics
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained deviceContextManager];
  id v24 = 0;
  id v4 = [v3 numberOfDeviceContextsPerDeviceType:&v24];
  id v5 = v24;

  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:&unk_1F17FC360];
    uint64_t v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = &unk_1F17FC378;
    }
    uint64_t v9 = v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:&unk_1F17FC390];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = &unk_1F17FC378;
    }
    id v13 = v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:&unk_1F17FC3A8];
    id v15 = (void *)v14;
    if (v14) {
      __int16 v16 = (void *)v14;
    }
    else {
      __int16 v16 = &unk_1F17FC378;
    }
    id v17 = v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:&unk_1F17FC3C0];
    v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (void *)v18;
    }
    else {
      uint64_t v20 = &unk_1F17FC378;
    }
    id v21 = v20;

    v25[0] = @"countPairediPhone";
    v25[1] = @"countPairedWatch";
    v26[0] = v9;
    v26[1] = v17;
    v25[2] = @"countPairediPad";
    v25[3] = @"countPairedVisionPro";
    v26[2] = v13;
    v26[3] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDailyAnalyticsEvent _fetchDeviceContextAnalytics]();
    }
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)_fetchNotificationSettingsAnalyticsWithDataSource:(id)a3 includingCriticalMedsCount:(BOOL)a4
{
  BOOL v28 = a4;
  v30[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [(NSUserDefaults *)self->_medicationsUserDefaults hk_BOOLForKey:*MEMORY[0x1E4F66A50] defaultValue:1];
  BOOL v8 = [(NSUserDefaults *)self->_medicationsUserDefaults BOOLForKey:*MEMORY[0x1E4F669B0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = [WeakRetained notificationManager];
  uint64_t v11 = [v10 areHealthCriticalAlertsAuthorized];

  id v12 = (id)*MEMORY[0x1E4F29668];
  id v13 = [(NSUserDefaults *)self->_medicationsUserDefaults objectForKey:*MEMORY[0x1E4F669E0]];
  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    int64_t v17 = [(HDMedicationDailyAnalyticsEvent *)self _bucketedWeeksSinceDate:v16 dataSource:v5];
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v17];

    id v12 = (id)v18;
  }
  v29[0] = @"hasTimeZoneChangeNotificationEnabled";
  v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  v30[0] = v19;
  v29[1] = @"hasFollowUpRemindersEnabled";
  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  v30[1] = v20;
  v29[2] = @"hasCriticalAlertsNotificationEnabled";
  id v21 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
  v29[3] = @"weeksSinceFirstEnteredDataTypeRoom";
  v30[2] = v21;
  v30[3] = v12;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  [v6 addEntriesFromDictionary:v22];

  if (v28)
  {
    uint64_t v23 = [(HKMedicationsCriticalNotificationsStore *)self->_criticalNotificationsStore identifiersCount];
    id v24 = [MEMORY[0x1E4F28ED0] numberWithInteger:v23];
    id v25 = HDMedicationDailyAnalyticsBucketForCount(v24);

    [v6 setObject:v25 forKeyedSubscript:@"numberOfCriticalAlertMeds"];
  }
  uint64_t v26 = (void *)[v6 copy];

  return v26;
}

- (id)_fetchFeatureSettingsAnalyticsWithDataSource:(id)a3
{
  id v3 = objc_opt_new();
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasPregnancyModeEnabled"];
  return v3;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 environmentDataSource];
  uint64_t v7 = [v6 bucketedNumberOfWeeksSinceDate:v5 minimumBinningValue:120];

  BOOL v8 = (void *)*MEMORY[0x1E4F29668];
  if (v7) {
    BOOL v8 = v7;
  }
  id v9 = v8;

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleAnalytics, 0);
  objc_storeStrong((id *)&self->_ontologyAnalytics, 0);
  objc_storeStrong((id *)&self->_medicationConceptAnalytics, 0);
  objc_storeStrong((id *)&self->_doseEventAnalytics, 0);
  objc_storeStrong((id *)&self->_criticalNotificationsStore, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_medicationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_medicationsKeyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] No error when fetching biological sex but also didn't get object", (uint8_t *)&v2, 0xCu);
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
}

- (void)_isImproveHealthRecordsAllowedPayloadWithDataSource:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_1(&dword_1BD54A000, a2, a3, "[%{public}@] Failed to get health records opt-in status with error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_fetchDeviceContextAnalytics
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to get deviceContextsDict with error: %{public}@");
}

@end