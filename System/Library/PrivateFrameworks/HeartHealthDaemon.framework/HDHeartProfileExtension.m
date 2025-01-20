@interface HDHeartProfileExtension
- (HDHRAFibBurdenProfileExtensionComponents)aFibBurdenComponents;
- (HDHRDailyHeartRateManager)dailyHeartRateManager;
- (HDHRHealthLiteDataCollector)healthLiteDataCollector;
- (HDHRNotificationManager)heartRateNotificationManager;
- (HDHeartProfileExtension)initWithProfile:(id)a3;
- (HDHeartProfileExtension)initWithProfile:(id)a3 heartNotificationsUserDefaults:(id)a4;
- (HDHeartRateWidgetDataManager)heartRateDataManager;
- (HDPrimaryProfile)profile;
- (HKFeatureStatusManager)irregularRhythmNotificationsFeatureStatusManager;
- (NSUserDefaults)heartNotificationsUserDefaults;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (void)_setupElectrocardiogramRecordingWithProfile:(id)a3;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)setAFibBurdenComponents:(id)a3;
- (void)setDailyHeartRateManager:(id)a3;
- (void)setHealthLiteDataCollector:(id)a3;
- (void)setHeartNotificationsUserDefaults:(id)a3;
- (void)setHeartRateDataManager:(id)a3;
- (void)setHeartRateNotificationManager:(id)a3;
- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4;
- (void)watchSettingsReconciliationManager:(id)a3 didReconcileValuesForKeys:(id)a4 didUpdateFeatureSetting:(BOOL)a5 didUpdateUserDefault:(BOOL)a6;
@end

@implementation HDHeartProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D18]])
  {
    cardioFitnessFeatureAvailabilityManager = self->_cardioFitnessFeatureAvailabilityManager;
LABEL_11:
    id v6 = cardioFitnessFeatureAvailabilityManager;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D10]])
  {
    id v6 = [(HDHRAFibBurdenProfileExtensionComponents *)self->_aFibBurdenComponents featureAvailabilityManager];
LABEL_12:
    v7 = v6;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D78]])
  {
    cardioFitnessFeatureAvailabilityManager = self->_lowHeartRateNotificationsFeatureAvailabilityManager;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D58]])
  {
    cardioFitnessFeatureAvailabilityManager = self->_highHeartRateNotificationsFeatureAvailabilityManager;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D60]])
  {
    cardioFitnessFeatureAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D68]])
  {
    irregularRhythmNotificationsAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
LABEL_18:
    id v6 = [irregularRhythmNotificationsAvailabilityManager v1FeatureAvailabilityManager];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D70]])
  {
    electrocardiogramRecordingAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
LABEL_21:
    id v6 = [electrocardiogramRecordingAvailabilityManager v2FeatureAvailabilityManager];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D20]])
  {
    cardioFitnessFeatureAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D28]])
  {
    irregularRhythmNotificationsAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F29D30]])
  {
    electrocardiogramRecordingAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
    goto LABEL_21;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (HDHeartProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHeartProfileExtension;
  v5 = [(HDHeartProfileExtension *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (HDHeartProfileExtension)initWithProfile:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v97.receiver = self;
  v97.super_class = (Class)HDHeartProfileExtension;
  objc_super v8 = [(HDHeartProfileExtension *)&v97 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  objc_storeWeak((id *)&v8->_profile, v6);
  objc_storeStrong((id *)&v9->_heartNotificationsUserDefaults, a4);
  v10 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v11 = [v10 isAppleWatch];

  if (v11)
  {
    v12 = [HDHeartRateWidgetDataManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v14 = [(HDHeartRateWidgetDataManager *)v12 initWithProfile:WeakRetained];
    heartRateDataManager = v9->_heartRateDataManager;
    v9->_heartRateDataManager = (HDHeartRateWidgetDataManager *)v14;

    v16 = [HDHRHealthLiteDataCollector alloc];
    id v17 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v18 = [(HDHRHealthLiteDataCollector *)v16 initWithProfile:v17];
    healthLiteDataCollector = v9->_healthLiteDataCollector;
    v9->_healthLiteDataCollector = (HDHRHealthLiteDataCollector *)v18;

    v20 = [HDHRDailyHeartRateManager alloc];
    id v21 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v22 = [(HDHRDailyHeartRateManager *)v20 initWithProfile:v21];
    dailyHeartRateManager = v9->_dailyHeartRateManager;
    v9->_dailyHeartRateManager = (HDHRDailyHeartRateManager *)v22;

    v24 = [HDHRNotificationManager alloc];
    id dailyAnalyticsActivity = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v26 = [(HDHRNotificationManager *)v24 initWithProfile:dailyAnalyticsActivity];
    heartRateNotificationManager = v9->_heartRateNotificationManager;
    v9->_heartRateNotificationManager = (HDHRNotificationManager *)v26;
  }
  else
  {
    if ([v6 profileType] != 1) {
      goto LABEL_7;
    }
    v28 = [[HDHRCardioFitnessAnalyticsDailyEventActivity alloc] initWithProfile:v6];
    id dailyAnalyticsActivity = v9->_dailyAnalyticsActivity;
    v9->_id dailyAnalyticsActivity = v28;
  }

LABEL_7:
  uint64_t v29 = [v6 profileType];
  v30 = (os_log_t *)MEMORY[0x1E4F29F48];
  if (v29 == 1)
  {
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F65B10], "hdhr_makeCardioFitnessFeatureAvailabilityManagerWithProfile:", v6);
    cardioFitnessFeatureAvailabilityManager = v9->_cardioFitnessFeatureAvailabilityManager;
    v9->_cardioFitnessFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v31;

    id v33 = objc_loadWeakRetained((id *)&v9->_profile);
    v34 = [v33 daemon];
    v35 = [v34 behavior];
    int v36 = [v35 isCompanionCapable];

    if (v36)
    {
      v37 = [[HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider alloc] initWithHeartRateSettingsDefaults:v9->_heartNotificationsUserDefaults];
      uint64_t v38 = [objc_alloc(MEMORY[0x1E4F65A90]) initWithProfile:v6 featureAvailabilityExtension:v9->_cardioFitnessFeatureAvailabilityManager deliveryCriteria:0 settingsProvider:v37 loggingCategory:*v30];
      cardioFitnessBackgroundFeatureDeliveryManager = v9->_cardioFitnessBackgroundFeatureDeliveryManager;
      v9->_cardioFitnessBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v38;

      uint64_t v40 = [objc_alloc(MEMORY[0x1E4F65BF0]) initWithProfile:v6 heartNotificationsUserDefaults:v9->_heartNotificationsUserDefaults delegate:v9];
      settingsMigrationManager = v9->_settingsMigrationManager;
      v9->_settingsMigrationManager = (HDSettingsMigrationManager *)v40;
    }
  }
  v42 = [HDHRHeartRateNotificationsFeatureAvailabilityManager alloc];
  uint64_t v43 = *MEMORY[0x1E4F29D78];
  v44 = [v6 daemon];
  v45 = [v44 nanoRegistryDeviceCapabilityProvider];
  uint64_t v46 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)v42 initWithFeatureIdentifier:v43 notificationSettingsDefaults:v7 pairedDeviceCapabilityProvider:v45];
  lowHeartRateNotificationsFeatureAvailabilityManager = v9->_lowHeartRateNotificationsFeatureAvailabilityManager;
  v9->_lowHeartRateNotificationsFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v46;

  v48 = [HDHRHeartRateNotificationsFeatureAvailabilityManager alloc];
  uint64_t v49 = *MEMORY[0x1E4F29D58];
  v50 = [v6 daemon];
  v51 = [v50 nanoRegistryDeviceCapabilityProvider];
  uint64_t v52 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)v48 initWithFeatureIdentifier:v49 notificationSettingsDefaults:v7 pairedDeviceCapabilityProvider:v51];
  highHeartRateNotificationsFeatureAvailabilityManager = v9->_highHeartRateNotificationsFeatureAvailabilityManager;
  v9->_highHeartRateNotificationsFeatureAvailabilityManager = (HDFeatureAvailabilityExtension *)v52;

  v54 = [HDHRIrregularRhythmNotificationsFeatureAvailabilityManager alloc];
  v55 = [v6 daemon];
  v56 = HDHRIrregularRhythmNotificationsV2PairedFeaturePropertiesSyncManager(v55);
  uint64_t v57 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v54 initWithProfile:v6 v2PairedFeaturePropertiesSyncManager:v56 notificationSettingDefaults:v9->_heartNotificationsUserDefaults];
  irregularRhythmNotificationsAvailabilityManager = v9->_irregularRhythmNotificationsAvailabilityManager;
  v9->_irregularRhythmNotificationsAvailabilityManager = (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v57;

  if ([v6 profileType] == 1)
  {
    v59 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v60 = [v59 isAppleWatch];

    if ((v60 & 1) == 0)
    {
      v61 = [HDHRIrregularRhythmNotificationsSettingMigrator alloc];
      v62 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v9->_irregularRhythmNotificationsAvailabilityManager v1FeatureAvailabilityManager];
      v63 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v9->_irregularRhythmNotificationsAvailabilityManager v2FeatureAvailabilityManager];
      uint64_t v64 = [(HDHRIrregularRhythmNotificationsSettingMigrator *)v61 initWithV1FeatureAvailabilityManager:v62 v2FeatureAvailabilityManager:v63];
      irregularRhythmNotificationsSettingMigrator = v9->_irregularRhythmNotificationsSettingMigrator;
      v9->_irregularRhythmNotificationsSettingMigrator = (HDHRIrregularRhythmNotificationsSettingMigrator *)v64;
    }
  }
  uint64_t v66 = +[HDHRAFibBurdenProfileExtensionComponents makeComponentsForProfile:v6];
  aFibBurdenComponents = v9->_aFibBurdenComponents;
  v9->_aFibBurdenComponents = (HDHRAFibBurdenProfileExtensionComponents *)v66;

  id v68 = objc_loadWeakRetained((id *)&v9->_profile);
  v69 = [v68 daemon];
  v70 = [v69 behavior];
  int v71 = [v70 isCompanionCapable];

  if (v71)
  {
    v72 = [HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria alloc];
    v73 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v9->_irregularRhythmNotificationsAvailabilityManager v1FeatureAvailabilityManager];
    v74 = [(HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria *)v72 initWithV1FeatureAvailabilityManager:v73];

    id v75 = objc_alloc(MEMORY[0x1E4F65A90]);
    v76 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)v9->_irregularRhythmNotificationsAvailabilityManager v2FeatureAvailabilityManager];
    v77 = objc_alloc_init(HDHRIrregularRhythmNotificationsV1SettingsProvider);
    uint64_t v78 = [v75 initWithProfile:v6 featureAvailabilityExtension:v76 deliveryCriteria:v74 settingsProvider:v77 loggingCategory:*MEMORY[0x1E4F29F50]];
    irregularRhythmNotificationsV2DeliveryManager = v9->_irregularRhythmNotificationsV2DeliveryManager;
    v9->_irregularRhythmNotificationsV2DeliveryManager = (HDBackgroundFeatureDeliveryManager *)v78;
  }
  v80 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v81 = [v80 isAppleWatch];

  if (v81)
  {
    v82 = [HRAtrialFibrillationNotificationManager alloc];
    v83 = [(HDHeartProfileExtension *)v9 irregularRhythmNotificationsFeatureStatusManager];
    uint64_t v84 = [(HRAtrialFibrillationNotificationManager *)v82 initWithProfile:v6 featureStatusManager:v83];
    atrialFibrillationNotificationManager = v9->_atrialFibrillationNotificationManager;
    v9->_atrialFibrillationNotificationManager = (HRAtrialFibrillationNotificationManager *)v84;

    v86 = [HRAtrialFibrillationEventDetector alloc];
    v87 = v9->_irregularRhythmNotificationsAvailabilityManager;
    v88 = [(HDHeartProfileExtension *)v9 irregularRhythmNotificationsFeatureStatusManager];
    uint64_t v89 = [(HRAtrialFibrillationEventDetector *)v86 initWithProfile:v6 availabilityManager:v87 featureStatusManager:v88 notificationManager:v9->_atrialFibrillationNotificationManager];
    atrialFibrillationEventDetector = v9->_atrialFibrillationEventDetector;
    v9->_atrialFibrillationEventDetector = (HRAtrialFibrillationEventDetector *)v89;
  }
  [(HDHeartProfileExtension *)v9 _setupElectrocardiogramRecordingWithProfile:v6];
  v91 = HKCreateSerialDispatchQueue();
  [v6 registerProfileReadyObserver:v9 queue:v91];

  _HKInitializeLogging();
  os_log_t v92 = *v30;
  if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
  {
    v93 = v92;
    v94 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v99 = v94;
    id v95 = v94;
    _os_log_impl(&dword_1D3AC6000, v93, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);
  }
LABEL_19:

  return v9;
}

- (HKFeatureStatusManager)irregularRhythmNotificationsFeatureStatusManager
{
  irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
  if (!irregularRhythmNotificationsFeatureStatusManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F2B068]);
    irregularRhythmNotificationsAvailabilityManager = self->_irregularRhythmNotificationsAvailabilityManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v7 = (HKFeatureStatusManager *)[v4 initWithFeatureAvailabilityProviding:irregularRhythmNotificationsAvailabilityManager healthDataSource:WeakRetained];
    objc_super v8 = self->_irregularRhythmNotificationsFeatureStatusManager;
    self->_irregularRhythmNotificationsFeatureStatusManager = v7;

    irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
  }

  return irregularRhythmNotificationsFeatureStatusManager;
}

- (void)_setupElectrocardiogramRecordingWithProfile:(id)a3
{
  id v16 = a3;
  id v4 = [HDHRElectrocardiogramRecordingFeatureAvailabilityManager alloc];
  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  id v6 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)v4 initWithProfile:v16 cacheDefaults:v5];
  electrocardiogramRecordingAvailabilityManager = self->_electrocardiogramRecordingAvailabilityManager;
  self->_electrocardiogramRecordingAvailabilityManager = v6;

  objc_super v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  LODWORD(v5) = [v8 isCompanionCapable];

  if (v5)
  {
    v9 = [HDHRElectrocardiogramRecordingV2UpgradeManager alloc];
    v10 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self->_electrocardiogramRecordingAvailabilityManager v1FeatureAvailabilityManager];
    int v11 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self->_electrocardiogramRecordingAvailabilityManager v2FeatureAvailabilityManager];
    id v12 = objc_alloc(MEMORY[0x1E4F2ABE8]);
    v13 = (void *)[v12 initWithLoggingCategory:*MEMORY[0x1E4F29F50] healthDataSource:v16];
    uint64_t v14 = [(HDHRElectrocardiogramRecordingV2UpgradeManager *)v9 initWithProfile:v16 v1FeatureAvailabilityManager:v10 v2FeatureAvailabilityManager:v11 analyticsSubmissionManager:v13];
    id electrocardiogramRecordingV2DeliveryManager = self->_electrocardiogramRecordingV2DeliveryManager;
    self->_id electrocardiogramRecordingV2DeliveryManager = v14;
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v11 = a3;
  if ([v11 profileType] == 1)
  {
    id v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v5 = [v4 isAppleWatch];

    if ((v5 & 1) == 0)
    {
      id v6 = [HDHRHeartbeatSeriesFeatureExclusivityManager alloc];
      id v7 = [(HDHeartProfileExtension *)self irregularRhythmNotificationsFeatureStatusManager];
      objc_super v8 = [(HDHRAFibBurdenProfileExtensionComponents *)self->_aFibBurdenComponents featureStatusManager];
      v9 = [(HDHRHeartbeatSeriesFeatureExclusivityManager *)v6 initWithIrregularRhythmNotificationsStatusManager:v7 aFibHistoryStatusManager:v8 profile:v11];
      heartbeatSeriesFeatureExclusivityManager = self->_heartbeatSeriesFeatureExclusivityManager;
      self->_heartbeatSeriesFeatureExclusivityManager = v9;
    }
  }
}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v6 = (void *)MEMORY[0x1E4F29F48];
  id v7 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v9 = v21;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating watch settings manager", buf, 0xCu);
  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  id v11 = objc_alloc(MEMORY[0x1E4F65C48]);
  id v12 = [(HDHeartProfileExtension *)self profile];
  heartNotificationsUserDefaults = self->_heartNotificationsUserDefaults;
  id v14 = objc_alloc(MEMORY[0x1E4F65C40]);
  v15 = (void *)[v14 initWithFeatureIdentifier:*MEMORY[0x1E4F29D18] defaultsEnabledKey:*MEMORY[0x1E4F2BE70]];
  v19 = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v17 = (HDWatchSettingsReconciliationManager *)[v11 initWithProfile:v12 userDefaults:heartNotificationsUserDefaults managedKeys:v16 debugIdentifier:@"CardioFitness" loggingCategory:*v6];
  settingsReconciliationManager = self->_settingsReconciliationManager;
  self->_settingsReconciliationManager = v17;

  [(HDWatchSettingsReconciliationManager *)self->_settingsReconciliationManager setDelegate:self];
  if (v4) {
    [(HDHeartProfileExtension *)self _triggerImmediateSyncWithReason:@"HDHeartProfileExtension.settingsMigrationManagerDidRunMigrationSteps"];
  }
}

- (void)watchSettingsReconciliationManager:(id)a3 didReconcileValuesForKeys:(id)a4 didUpdateFeatureSetting:(BOOL)a5 didUpdateUserDefault:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v15 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v6)
  {
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = [v10 defaultsEnabledKey];
    id v14 = [v12 setWithObject:v13];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
  if (v7) {
    [(HDHeartProfileExtension *)self _triggerImmediateSyncWithReason:@"HDHeartProfileExtension.watchSettingsReconciliationManagerDidUpdateFeatureSetting"];
  }
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x1E4F2AD68]);
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
  id v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_1E69B44A0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = (void *)*MEMORY[0x1E4F29F48];
  id v7 = *MEMORY[0x1E4F29F48];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = v6;
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (NSUserDefaults)heartNotificationsUserDefaults
{
  return self->_heartNotificationsUserDefaults;
}

- (void)setHeartNotificationsUserDefaults:(id)a3
{
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDPrimaryProfile *)WeakRetained;
}

- (HDHRHealthLiteDataCollector)healthLiteDataCollector
{
  return self->_healthLiteDataCollector;
}

- (void)setHealthLiteDataCollector:(id)a3
{
}

- (HDHRDailyHeartRateManager)dailyHeartRateManager
{
  return self->_dailyHeartRateManager;
}

- (void)setDailyHeartRateManager:(id)a3
{
}

- (HDHRNotificationManager)heartRateNotificationManager
{
  return self->_heartRateNotificationManager;
}

- (void)setHeartRateNotificationManager:(id)a3
{
}

- (HDHeartRateWidgetDataManager)heartRateDataManager
{
  return self->_heartRateDataManager;
}

- (void)setHeartRateDataManager:(id)a3
{
}

- (HDHRAFibBurdenProfileExtensionComponents)aFibBurdenComponents
{
  return self->_aFibBurdenComponents;
}

- (void)setAFibBurdenComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aFibBurdenComponents, 0);
  objc_storeStrong((id *)&self->_heartRateDataManager, 0);
  objc_storeStrong((id *)&self->_heartRateNotificationManager, 0);
  objc_storeStrong((id *)&self->_dailyHeartRateManager, 0);
  objc_storeStrong((id *)&self->_healthLiteDataCollector, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong(&self->_electrocardiogramRecordingV2DeliveryManager, 0);
  objc_storeStrong((id *)&self->_electrocardiogramRecordingAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationNotificationManager, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationEventDetector, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsV2DeliveryManager, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsSettingMigrator, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_highHeartRateNotificationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_lowHeartRateNotificationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartbeatSeriesFeatureExclusivityManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsActivity, 0);
  objc_storeStrong((id *)&self->_cardioFitnessBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_cardioFitnessFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_settingsReconciliationManager, 0);

  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
}

void __59__HDHeartProfileExtension__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end