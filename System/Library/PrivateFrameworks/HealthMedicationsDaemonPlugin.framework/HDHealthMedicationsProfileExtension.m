@interface HDHealthMedicationsProfileExtension
- (HDHealthMedicationsProfileExtension)init;
- (HDHealthMedicationsProfileExtension)initWithProfile:(id)a3;
- (HDMedicationDataDonator)medicationsDataDonator;
- (HDMedicationDoseEventObserver)medicationDoseEventObserver;
- (HDMedicationNotificationSyncManager)medicationNotificationSyncManager;
- (HDMedicationPregnancyLactationStatusObserver)medicationPregnancyLactationStatusObserver;
- (HDMedicationPregnancyListConceptObserver)medicationPregnancyListConceptObserver;
- (HDMedicationScheduleManager)medicationScheduleManager;
- (HDMedicationSyncRequester)medicationSyncRequester;
- (HDMedicationsDeviceScopedStorageManager)deviceScopedStorageManager;
- (HDMedicationsWidgetSchedulingManager)widgetSchedulingManager;
- (HDPrimaryProfile)profile;
- (NSUserDefaults)medicationUserDefaults;
- (id)createMedicationNotificationSyncManager;
- (id)createMedicationUserDefaults;
- (id)createMedicationsDonatorWithError:(id *)a3;
- (id)createMedicationsWidgetRelevanceController;
- (id)createMedicationsWidgetTimelineController;
- (void)start;
@end

@implementation HDHealthMedicationsProfileExtension

- (HDMedicationScheduleManager)medicationScheduleManager
{
  return self->_medicationScheduleManager;
}

- (HDHealthMedicationsProfileExtension)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthMedicationsProfileExtension)initWithProfile:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDHealthMedicationsProfileExtension;
  v5 = [(HDHealthMedicationsProfileExtension *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    _HKInitializeLogging();
    v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      [v4 profileType];
      v9 = HKStringFromProfileType();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded for profileType %{public}@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)start
{
  v3 = [(HDHealthMedicationsProfileExtension *)self createMedicationUserDefaults];
  medicationUserDefaults = self->_medicationUserDefaults;
  self->_medicationUserDefaults = v3;

  v5 = [HDMedicationScheduleManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [(HDMedicationScheduleManager *)v5 initWithProfile:WeakRetained userDefaults:self->_medicationUserDefaults];
  medicationScheduleManager = self->_medicationScheduleManager;
  self->_medicationScheduleManager = v7;

  v9 = [[HDMedicationDataDonator alloc] initWithProfile:self];
  medicationsDataDonator = self->_medicationsDataDonator;
  self->_medicationsDataDonator = v9;

  objc_super v11 = [(HDHealthMedicationsProfileExtension *)self createMedicationNotificationSyncManager];
  medicationNotificationSyncManager = self->_medicationNotificationSyncManager;
  self->_medicationNotificationSyncManager = v11;

  uint64_t v13 = [HDMedicationDoseEventObserver alloc];
  id v14 = objc_loadWeakRetained((id *)&self->_profile);
  v15 = [(HDMedicationDoseEventObserver *)v13 initWithProfile:v14 notificationSyncManager:self->_medicationNotificationSyncManager];
  medicationDoseEventObserver = self->_medicationDoseEventObserver;
  self->_medicationDoseEventObserver = v15;

  v17 = [HDMedicationPregnancyLactationStatusObserver alloc];
  id v18 = objc_loadWeakRetained((id *)&self->_profile);
  v19 = [(HDMedicationPregnancyLactationStatusObserver *)v17 initWithProfile:v18];
  medicationPregnancyLactationStatusObserver = self->_medicationPregnancyLactationStatusObserver;
  self->_medicationPregnancyLactationStatusObserver = v19;

  v21 = [HDMedicationPregnancyListConceptObserver alloc];
  id v22 = objc_loadWeakRetained((id *)&self->_profile);
  v23 = [(HDMedicationPregnancyListConceptObserver *)v21 initWithProfile:v22];
  medicationPregnancyListConceptObserver = self->_medicationPregnancyListConceptObserver;
  self->_medicationPregnancyListConceptObserver = v23;

  v25 = [[HDMedicationSyncRequester alloc] initWithProfileExtension:self];
  medicationSyncRequester = self->_medicationSyncRequester;
  self->_medicationSyncRequester = v25;

  v27 = [HDMedicationsDeviceScopedStorageManager alloc];
  id v28 = objc_loadWeakRetained((id *)&self->_profile);
  v29 = [(HDMedicationsDeviceScopedStorageManager *)v27 initWithProfile:v28];
  deviceScopedStorageManager = self->_deviceScopedStorageManager;
  self->_deviceScopedStorageManager = v29;

  id v31 = objc_loadWeakRetained((id *)&self->_profile);
  v32 = [v31 daemon];
  v33 = [v32 behavior];
  int v34 = objc_msgSend(v33, "hkmd_supportsMedicationsWidget");

  if (v34)
  {
    v35 = [HDMedicationsWidgetSchedulingManager alloc];
    id v36 = objc_loadWeakRetained((id *)&self->_profile);
    v37 = [(HDMedicationsWidgetSchedulingManager *)v35 initWithProfile:v36];
    widgetSchedulingManager = self->_widgetSchedulingManager;
    self->_widgetSchedulingManager = v37;
  }
  HKLogMedication();
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = objc_alloc(MEMORY[0x1E4F2ABE8]);
  id v40 = objc_loadWeakRetained((id *)&self->_profile);
  v41 = (void *)[v39 initWithLoggingCategory:v46 healthDataSource:v40];

  id v42 = objc_alloc(MEMORY[0x1E4F65A80]);
  id v43 = objc_loadWeakRetained((id *)&self->_profile);
  v44 = (HDAnalyticsDailyEventManager *)[v42 initWithProfile:v43 eventSubmissionManager:v41 logCategory:v46 eventConstructor:&__block_literal_global_15];
  medicationDailyAnalyticsManager = self->_medicationDailyAnalyticsManager;
  self->_medicationDailyAnalyticsManager = v44;
}

HDMedicationDailyAnalyticsEvent *__44__HDHealthMedicationsProfileExtension_start__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDMedicationDailyAnalyticsEvent alloc] initWithProfile:v2];

  return v3;
}

- (id)createMedicationUserDefaults
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F66A78]];
  return v3;
}

- (id)createMedicationNotificationSyncManager
{
  id v2 = [[HDMedicationNotificationSyncManager alloc] initWithProfileExtension:self];
  return v2;
}

- (id)createMedicationsDonatorWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F71FD8] donatorWithItemType:19 originAppId:@"Health" error:a3];
}

- (id)createMedicationsWidgetTimelineController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = +[HDMedicationsWidgetSchedulingManager defaultMedicationsWidgetTimelineControllerForProfile:WeakRetained];

  return v3;
}

- (id)createMedicationsWidgetRelevanceController
{
  return +[HDMedicationsWidgetSchedulingManager defaultMedicationsWidgetRelevanceController];
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDPrimaryProfile *)WeakRetained;
}

- (NSUserDefaults)medicationUserDefaults
{
  return self->_medicationUserDefaults;
}

- (HDMedicationNotificationSyncManager)medicationNotificationSyncManager
{
  return self->_medicationNotificationSyncManager;
}

- (HDMedicationDoseEventObserver)medicationDoseEventObserver
{
  return self->_medicationDoseEventObserver;
}

- (HDMedicationSyncRequester)medicationSyncRequester
{
  return self->_medicationSyncRequester;
}

- (HDMedicationsDeviceScopedStorageManager)deviceScopedStorageManager
{
  return self->_deviceScopedStorageManager;
}

- (HDMedicationsWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (HDMedicationPregnancyLactationStatusObserver)medicationPregnancyLactationStatusObserver
{
  return self->_medicationPregnancyLactationStatusObserver;
}

- (HDMedicationPregnancyListConceptObserver)medicationPregnancyListConceptObserver
{
  return self->_medicationPregnancyListConceptObserver;
}

- (HDMedicationDataDonator)medicationsDataDonator
{
  return self->_medicationsDataDonator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicationsDataDonator, 0);
  objc_storeStrong((id *)&self->_medicationPregnancyListConceptObserver, 0);
  objc_storeStrong((id *)&self->_medicationPregnancyLactationStatusObserver, 0);
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_medicationSyncRequester, 0);
  objc_storeStrong((id *)&self->_medicationDoseEventObserver, 0);
  objc_storeStrong((id *)&self->_medicationScheduleManager, 0);
  objc_storeStrong((id *)&self->_medicationNotificationSyncManager, 0);
  objc_storeStrong((id *)&self->_medicationUserDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_medicationDailyAnalyticsManager, 0);
}

@end