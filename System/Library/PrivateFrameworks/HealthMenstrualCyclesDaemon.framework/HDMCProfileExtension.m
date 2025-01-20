@interface HDMCProfileExtension
- (HDMCAnalysisManager)analysisManager;
- (HDMCDeviceScopedStorageManager)deviceScopedStorageManager;
- (HDMCNotificationManager)notificationManager;
- (HDMCNotificationSyncManager)notificationSyncManager;
- (HDMCProfileExtension)initWithProfile:(id)a3 settingsManager:(id)a4;
- (HDPrimaryProfile)profile;
- (HKMCSettingsManager)settingsManager;
- (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager)pregnancyManager;
- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)experienceModelManager;
- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)widgetSchedulingManager;
- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)pregnancyRequirementEvaluator;
- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)pregnancyFeatureAdjustmentManager;
- (id)_bridging_analysisProviding;
- (id)evaluatorForRequirement:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (id)getPregnancyModelProvider;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4;
- (void)watchSettingsCompatibilityManager:(id)a3 didChangeUserDefaultsKeys:(id)a4;
- (void)watchSettingsReconciliationManager:(id)a3 didReconcileValuesForKeys:(id)a4 didUpdateFeatureSetting:(BOOL)a5 didUpdateUserDefault:(BOOL)a6;
@end

@implementation HDMCProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F09798]])
  {
    uint64_t v5 = 16;
LABEL_9:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F097A8]])
  {
    uint64_t v5 = 24;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F097A0]])
  {
    uint64_t v5 = 64;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F097B0]])
  {
    uint64_t v5 = 40;
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

- (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager)pregnancyManager
{
  return self->_pregnancyManager;
}

- (HDMCAnalysisManager)analysisManager
{
  return self->_analysisManager;
}

- (id)evaluatorForRequirement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() requirementIdentifier];
  if ([v5 isEqual:*MEMORY[0x263F096A8]])
  {

LABEL_4:
    v8 = self->_pregnancyRequirementEvaluator;
    goto LABEL_6;
  }
  id v6 = [(id)objc_opt_class() requirementIdentifier];
  int v7 = [v6 isEqual:*MEMORY[0x263F096B8]];

  if (v7) {
    goto LABEL_4;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)experienceModelManager
{
  return self->_experienceModelManager;
}

- (HDMCProfileExtension)initWithProfile:(id)a3 settingsManager:(id)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v107.receiver = self;
  v107.super_class = (Class)HDMCProfileExtension;
  v8 = [(HDMCProfileExtension *)&v107 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_16;
  }
  objc_storeWeak((id *)&v8->_profile, v6);
  v10 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x263F0A130]);
  calendarCache = v9->_calendarCache;
  v9->_calendarCache = v10;

  objc_storeStrong((id *)&v9->_settingsManager, a4);
  v12 = [HDMCDeviceScopedStorageManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
  v104 = v7;
  uint64_t v14 = [(HDMCDeviceScopedStorageManager *)v12 initWithProfile:WeakRetained settingsManager:v7];
  deviceScopedStorageManager = v9->_deviceScopedStorageManager;
  v9->_deviceScopedStorageManager = (HDMCDeviceScopedStorageManager *)v14;

  v16 = (void *)MEMORY[0x263F431E8];
  id v17 = objc_loadWeakRetained((id *)&v9->_profile);
  uint64_t v18 = objc_msgSend(v16, "hdmc_menstrualCyclesAvailabilityManagerWithProfile:", v17);
  featureAvailabilityManager = v9->_featureAvailabilityManager;
  v9->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v18;

  v20 = (void *)MEMORY[0x263F431E8];
  id v21 = objc_loadWeakRetained((id *)&v9->_profile);
  uint64_t v22 = objc_msgSend(v20, "hdmc_heartRateInputAvailabilityManagerWithProfile:", v21);
  heartRateFeatureAvailabilityManager = v9->_heartRateFeatureAvailabilityManager;
  v9->_heartRateFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v22;

  id v24 = objc_loadWeakRetained((id *)&v9->_profile);
  v25 = [v24 daemon];
  v26 = [v25 behavior];
  int v27 = [v26 isCompanionCapable];

  v28 = (os_log_t *)MEMORY[0x263F09930];
  if (v27)
  {
    id v29 = objc_alloc(MEMORY[0x263F43178]);
    id v30 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v31 = [v29 initWithProfile:v30 featureAvailabilityExtension:v9->_heartRateFeatureAvailabilityManager loggingCategory:*v28];
    heartRateBackgroundFeatureDeliveryManager = v9->_heartRateBackgroundFeatureDeliveryManager;
    v9->_heartRateBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v31;
  }
  v33 = (void *)MEMORY[0x263F431E8];
  id v34 = objc_loadWeakRetained((id *)&v9->_profile);
  uint64_t v35 = objc_msgSend(v33, "hdmc_wristTemperatureInputAvailabilityManagerWithProfile:", v34);
  wristTemperatureInputAvailabilityManager = v9->_wristTemperatureInputAvailabilityManager;
  v9->_wristTemperatureInputAvailabilityManager = (HDFeatureAvailabilityManager *)v35;

  id v37 = objc_loadWeakRetained((id *)&v9->_profile);
  v38 = [v37 daemon];
  v39 = [v38 behavior];
  int v40 = [v39 isCompanionCapable];

  if (v40)
  {
    id v41 = objc_alloc(MEMORY[0x263F43178]);
    id v42 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v43 = [v41 initWithProfile:v42 featureAvailabilityExtension:v9->_wristTemperatureInputAvailabilityManager loggingCategory:*v28];
    wristTemperatureInputBackgroundFeatureDeliveryManager = v9->_wristTemperatureInputBackgroundFeatureDeliveryManager;
    v9->_wristTemperatureInputBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v43;
  }
  v45 = (void *)MEMORY[0x263F431E8];
  id v46 = objc_loadWeakRetained((id *)&v9->_profile);
  uint64_t v47 = objc_msgSend(v45, "hdmc_deviationsAvailabilityManagerWithProfile:", v46);
  deviationsFeatureAvailabilityManager = v9->_deviationsFeatureAvailabilityManager;
  v9->_deviationsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v47;

  id v49 = objc_alloc(MEMORY[0x263F43178]);
  id v50 = objc_loadWeakRetained((id *)&v9->_profile);
  v51 = v28;
  uint64_t v52 = [v49 initWithProfile:v50 featureAvailabilityExtension:v9->_deviationsFeatureAvailabilityManager loggingCategory:*v28];
  deviationsBackgroundFeatureDeliveryManager = v9->_deviationsBackgroundFeatureDeliveryManager;
  v9->_deviationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v52;

  v54 = [_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager alloc];
  v55 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v56 = [(HDMCExperienceModelManager *)v54 initWithNotificationProvider:v55];
  experienceModelManager = v9->_experienceModelManager;
  v9->_experienceModelManager = (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)v56;

  v58 = [_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager alloc];
  v59 = v9->_experienceModelManager;
  v60 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v61 = [(HDMCPregnancyManager *)v58 initWithProfile:v6 operation:0 experienceModelProvider:v59 notificationProvider:v60 calendarCache:v9->_calendarCache];
  pregnancyManager = v9->_pregnancyManager;
  v9->_pregnancyManager = (_TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager *)v61;

  v63 = [[_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator alloc] initWithPregnancyManager:v9->_pregnancyManager];
  pregnancyRequirementEvaluator = v9->_pregnancyRequirementEvaluator;
  v9->_pregnancyRequirementEvaluator = v63;

  v65 = [[_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager alloc] initWithPregnancyManager:v9->_pregnancyManager profile:v6 experienceModelProvider:v9->_experienceModelManager];
  pregnancyFeatureAdjustmentManager = v9->_pregnancyFeatureAdjustmentManager;
  v9->_pregnancyFeatureAdjustmentManager = v65;

  v67 = [[HDMCAnalysisManager alloc] initWithProfile:v6 settingsManager:v9->_settingsManager featureAvailabilityManager:v9->_featureAvailabilityManager heartRateAvailabilityManager:v9->_heartRateFeatureAvailabilityManager wristTemperatureAvailabilityManager:v9->_wristTemperatureInputAvailabilityManager deviationsAvailabilityManager:v9->_deviationsFeatureAvailabilityManager deviceScopedStorageManager:v9->_deviceScopedStorageManager calendarCache:v9->_calendarCache];
  analysisManager = v9->_analysisManager;
  v9->_analysisManager = v67;

  v69 = [[HDMCNotificationSyncManager alloc] initWithProfile:v6];
  notificationSyncManager = v9->_notificationSyncManager;
  v9->_notificationSyncManager = v69;

  v71 = [[HDMCNotificationManager alloc] initWithProfile:v6 analysisManager:v9->_analysisManager settingsManager:v9->_settingsManager deviceScopedStorageManager:v9->_deviceScopedStorageManager notificationSyncManager:v9->_notificationSyncManager];
  notificationManager = v9->_notificationManager;
  v9->_notificationManager = v71;

  if ((HDIsUnitTesting() & 1) == 0) {
    [(HDMCNotificationManager *)v9->_notificationManager start];
  }
  v73 = [HDMCAnalysisScheduler alloc];
  v74 = [v6 daemon];
  uint64_t v75 = [(HDMCAnalysisScheduler *)v73 initWithDaemon:v74 analysisManager:v9->_analysisManager settingsManager:v9->_settingsManager calendarCache:v9->_calendarCache];
  analysisScheduler = v9->_analysisScheduler;
  v9->_analysisScheduler = (HDMCAnalysisScheduler *)v75;

  v77 = [[_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager alloc] initWithProfile:v6];
  widgetSchedulingManager = v9->_widgetSchedulingManager;
  v9->_widgetSchedulingManager = v77;

  v79 = [MEMORY[0x263F0A980] sharedBehavior];
  id v7 = v104;
  if ([v79 isAppleWatch]) {
    goto LABEL_11;
  }
  id v80 = objc_loadWeakRetained((id *)&v9->_profile);
  uint64_t v81 = [v80 profileType];

  if (v81 == 1)
  {
    v82 = [[HDMCAnalyticsManager alloc] initWithProfile:v6 analysisManager:v9->_analysisManager heartRateFeatureAvailabilityManager:v9->_heartRateFeatureAvailabilityManager deviationDetectionFeatureAvailabilityManager:v9->_deviationsFeatureAvailabilityManager wristTemperatureInputFeatureAvailabilityManager:v9->_wristTemperatureInputAvailabilityManager pregnancyManager:v9->_pregnancyManager];
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = v82;

    v79 = (void *)[objc_alloc(MEMORY[0x263F0A0C0]) initWithLoggingCategory:*v51 healthDataSource:v6];
    v84 = v9->_analysisManager;
    id v85 = objc_alloc(MEMORY[0x263F43158]);
    os_log_t v86 = *v51;
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __56__HDMCProfileExtension_initWithProfile_settingsManager___block_invoke;
    v105[3] = &unk_264751498;
    v106 = v84;
    v87 = v84;
    uint64_t v88 = [v85 initWithProfile:v6 eventSubmissionManager:v79 logCategory:v86 eventConstructor:v105];
    wristTemperatureDailyEventManager = v9->_wristTemperatureDailyEventManager;
    v9->_wristTemperatureDailyEventManager = (HDAnalyticsDailyEventManager *)v88;

LABEL_11:
  }
  v90 = [MEMORY[0x263F0A980] sharedBehavior];
  int v91 = [v90 isCompanionCapable];

  if (v91)
  {
    id v92 = objc_alloc(MEMORY[0x263F43328]);
    id v93 = objc_loadWeakRetained((id *)&v9->_profile);
    v94 = [v104 userDefaults];
    uint64_t v95 = [v92 initWithProfile:v93 userDefaults:v94 delegate:v9];
    settingsMigrationManager = v9->_settingsMigrationManager;
    v9->_settingsMigrationManager = (HDSettingsMigrationManager *)v95;
  }
  v97 = [[HDMCPostInstallUpdateManager alloc] initWithProfileExtension:v9];
  postInstallUpdateManager = v9->_postInstallUpdateManager;
  v9->_postInstallUpdateManager = v97;

  _HKInitializeLogging();
  os_log_t v99 = *v51;
  if (os_log_type_enabled(*v51, OS_LOG_TYPE_DEFAULT))
  {
    v100 = v99;
    v101 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v109 = v101;
    id v102 = v101;
    _os_log_impl(&dword_225722000, v100, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);
  }
LABEL_16:

  return v9;
}

HDMCWristTemperatureDailyAnalyticsEvent *__56__HDMCProfileExtension_initWithProfile_settingsManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HDMCWristTemperatureDailyAnalyticsEvent alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"HDMCProfileExtension" healthStore:0 options:2];
  id v7 = [(HDMCWristTemperatureDailyAnalyticsEvent *)v4 initWithProfile:v3 analysisManager:v5 sleepStore:v6];

  return v7;
}

- (void)settingsMigrationManagerDidCompleteMigration:(id)a3 didRunMigrationSteps:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v20 = 138543362;
    id v21 = (id)objc_opt_class();
    id v8 = v21;
    _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings migration finished, initiating watch settings managers", (uint8_t *)&v20, 0xCu);
  }
  settingsMigrationManager = self->_settingsMigrationManager;
  self->_settingsMigrationManager = 0;

  v10 = [HDMCWatchSettingsCompatibilityManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = [(HKMCSettingsManager *)self->_settingsManager userDefaults];
  v13 = [(HDMCWatchSettingsCompatibilityManager *)v10 initWithProfile:WeakRetained userDefaults:v12];
  watchSettingsCompatibilityManager = self->_watchSettingsCompatibilityManager;
  self->_watchSettingsCompatibilityManager = v13;

  [(HDMCWatchSettingsCompatibilityManager *)self->_watchSettingsCompatibilityManager setDelegate:self];
  id v15 = objc_alloc(MEMORY[0x263F43450]);
  id v16 = objc_loadWeakRetained((id *)&self->_profile);
  id v17 = [(HKMCSettingsManager *)self->_settingsManager userDefaults];
  uint64_t v18 = (HDWatchSettingsReconciliationManager *)[v15 initWithProfile:v16 userDefaults:v17];
  watchSettingsReconciliationManager = self->_watchSettingsReconciliationManager;
  self->_watchSettingsReconciliationManager = v18;

  [(HDWatchSettingsReconciliationManager *)self->_watchSettingsReconciliationManager setDelegate:self];
  if (v4) {
    [(HDMCProfileExtension *)self _triggerImmediateSyncWithReason:@"settingsMigrationManagerDidRunMigrationSteps"];
  }
}

- (void)watchSettingsCompatibilityManager:(id)a3 didChangeUserDefaultsKeys:(id)a4
{
  id v4 = a4;
  if ([v4 count]) {
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (void)watchSettingsReconciliationManager:(id)a3 didReconcileValuesForKeys:(id)a4 didUpdateFeatureSetting:(BOOL)a5 didUpdateUserDefault:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v15 = a3;
  id v10 = a4;
  v11 = v10;
  if (v6)
  {
    v12 = (void *)MEMORY[0x263EFFA08];
    v13 = [v10 defaultsEnabledKey];
    uint64_t v14 = [v12 setWithObject:v13];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
  if (v7) {
    [(HDMCProfileExtension *)self _triggerImmediateSyncWithReason:@"watchSettingsReconciliationManagerDidUpdateFeatureSetting"];
  }
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x263F0A1C8]);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_264750B28;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __56__HDMCProfileExtension__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (id)getPregnancyModelProvider
{
  return self->_pregnancyManager;
}

- (id)_bridging_analysisProviding
{
  return self->_analysisManager;
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDPrimaryProfile *)WeakRetained;
}

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)pregnancyRequirementEvaluator
{
  return self->_pregnancyRequirementEvaluator;
}

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)pregnancyFeatureAdjustmentManager
{
  return self->_pregnancyFeatureAdjustmentManager;
}

- (HDMCDeviceScopedStorageManager)deviceScopedStorageManager
{
  return self->_deviceScopedStorageManager;
}

- (HDMCNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDMCNotificationSyncManager)notificationSyncManager
{
  return self->_notificationSyncManager;
}

- (HKMCSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_experienceModelManager, 0);
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_analysisScheduler, 0);
  objc_storeStrong((id *)&self->_watchSettingsReconciliationManager, 0);
  objc_storeStrong((id *)&self->_watchSettingsCompatibilityManager, 0);
  objc_storeStrong((id *)&self->_settingsMigrationManager, 0);
  objc_storeStrong((id *)&self->_postInstallUpdateManager, 0);
  objc_storeStrong((id *)&self->_pregnancyFeatureAdjustmentManager, 0);
  objc_storeStrong((id *)&self->_pregnancyRequirementEvaluator, 0);
  objc_storeStrong((id *)&self->_deviationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureDailyEventManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_heartRateBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end