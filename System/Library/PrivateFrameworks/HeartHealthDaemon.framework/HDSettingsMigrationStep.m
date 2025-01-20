@interface HDSettingsMigrationStep
@end

@implementation HDSettingsMigrationStep

uint64_t __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", *MEMORY[0x1E4F2BE70]))
  {
    v6 = [v5 featureSettingsManager];
    uint64_t v7 = *MEMORY[0x1E4F67CE8];
    uint64_t v8 = *MEMORY[0x1E4F29D18];
    id v14 = 0;
    uint64_t v9 = [v6 setFeatureSettingsNumber:MEMORY[0x1E4F1CC38] forKey:v7 featureIdentifier:v8 suppressNotificationsToObserver:0 error:&v14];
    id v10 = v14;

    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke_cold_1();
      }
      id v11 = v10;
      if (v11)
      {
        if (a3) {
          *a3 = v11;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = @"CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered";
      _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Cardio Fitness notifications enablement key present, not setting notification details entered", buf, 0xCu);
    }
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", @"OnboardingTileDismissedDate"))
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F65B28]) initWithCategory:100 domainName:@"OnboardingPromotionDismissalState" profile:v5];
    uint64_t v7 = *MEMORY[0x1E4F67CF0];
    id v13 = 0;
    uint64_t v8 = [v6 setNumber:MEMORY[0x1E4F1CC38] forKey:v7 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1();
      }
      id v10 = v9;
      if (v10)
      {
        if (a3) {
          *a3 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = @"CrystalMoveOnboardingTileDismissalDateToKeyValueStorage";
      _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Cardio Fitness onboarding dismissal key present, not setting notification details entered", buf, 0xCu);
    }
    uint64_t v8 = 1;
  }

  return v8;
}

void __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138543618;
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Error when saving notification details entered: %{public}@", (uint8_t *)v1, 0x16u);
}

void __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138543618;
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Error when saving onboarding promotion dismissal state: %{public}@", (uint8_t *)v1, 0x16u);
}

@end