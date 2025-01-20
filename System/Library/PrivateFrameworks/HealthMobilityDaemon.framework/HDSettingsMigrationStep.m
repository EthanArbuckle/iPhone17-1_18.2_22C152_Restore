@interface HDSettingsMigrationStep
@end

@implementation HDSettingsMigrationStep

uint64_t __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", @"EnableWalkingSteadinessNotifications"))
  {
    v6 = [v5 featureSettingsManager];
    v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", @"EnableWalkingSteadinessNotifications"));
    uint64_t v8 = *MEMORY[0x263F09820];
    uint64_t v9 = *MEMORY[0x263F09810];
    id v15 = 0;
    uint64_t v10 = [v6 setFeatureSettingsNumber:v7 forKey:v8 featureIdentifier:v9 suppressNotificationsToObserver:0 error:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
        __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke_cold_1();
      }
      id v12 = v11;
      if (v12)
      {
        if (a3) {
          *a3 = v12;
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
    v13 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = @"CrystalMigrateWalkingSteadinessEnablementToFeatureSettings";
      _os_log_impl(&dword_221A40000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Walking Steadiness notifications enablement key present, not setting enablement feature setting", buf, 0xCu);
    }
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_2;
  v15[3] = &unk_2645D7B40;
  id v16 = *(id *)(a1 + 32);
  v6 = (void (**)(void))MEMORY[0x223C8CE80](v15);
  if (objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", @"OnboardingTileDismissedDate"))
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F43218]) initWithCategory:100 domainName:@"OnboardingPromotionDismissalState" profile:v5];
    uint64_t v8 = *MEMORY[0x263F45288];
    id v14 = 0;
    uint64_t v9 = [v7 setNumber:MEMORY[0x263EFFA88] forKey:v8 error:&v14];
    id v10 = v14;
    if (v9)
    {
      v6[2](v6);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
        __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1();
      }
      id v12 = v10;
      if (v12)
      {
        if (a3) {
          *a3 = v12;
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
    id v11 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = @"CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage";
      _os_log_impl(&dword_221A40000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Walking Steadiness onboarding dismissal key present, not setting notification details entered", buf, 0xCu);
    }
    v6[2](v6);
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = @"CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage";
    _os_log_impl(&dword_221A40000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting the old defaults domain", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) removePersistentDomainForName:@"com.apple.private.health.walking-steadiness"];
}

void __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138543618;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221A40000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Error when saving notification details entered: %{public}@", (uint8_t *)v1, 0x16u);
}

void __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138543618;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221A40000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Error when saving onboarding promotion dismissal state: %{public}@", (uint8_t *)v1, 0x16u);
}

@end