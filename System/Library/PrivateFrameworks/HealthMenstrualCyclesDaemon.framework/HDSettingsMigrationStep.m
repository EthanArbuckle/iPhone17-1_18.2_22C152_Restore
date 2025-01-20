@interface HDSettingsMigrationStep
@end

@implementation HDSettingsMigrationStep

uint64_t __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke_2;
  aBlock[3] = &unk_264750E40;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v23 = v6;
  uint64_t v25 = v7;
  id v8 = v5;
  id v24 = v8;
  v9 = _Block_copy(aBlock);
  v10 = (uint64_t (*)(void *, __CFString *, uint64_t, id *))v9[2];
  uint64_t v11 = *MEMORY[0x263F44F10];
  id v21 = 0;
  char v12 = v10(v9, @"MenstruationProjectionsEnabled", v11, &v21);
  id v13 = v21;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    id v17 = v13;
    if (!v17)
    {
LABEL_10:

      uint64_t v18 = 0;
      goto LABEL_11;
    }
    if (!a3)
    {
LABEL_9:
      _HKLogDroppedError();
      goto LABEL_10;
    }
LABEL_6:
    id v17 = v17;
    *a3 = v17;
    goto LABEL_10;
  }
  uint64_t v15 = *MEMORY[0x263F44F08];
  id v20 = v13;
  char v16 = ((uint64_t (*)(void *, __CFString *, uint64_t, id *))v9[2])(v9, @"FertileWindowProjectionsEnabled", v15, &v20);
  id v17 = v20;

  if ((v16 & 1) == 0)
  {
    id v17 = v17;
    if (!v17) {
      goto LABEL_10;
    }
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v18 = 1;
LABEL_11:

  return v18;
}

uint64_t __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", v7, 0);
  _HKInitializeLogging();
  v10 = *MEMORY[0x263F09930];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_225722000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_225722000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  id v13 = [*(id *)(a1 + 40) featureSettingsManager];
  uint64_t v14 = *MEMORY[0x263F09798];
  id v21 = 0;
  char v15 = [v13 setFeatureSettingsNumber:v9 forKey:v8 featureIdentifier:v14 suppressNotificationsToObserver:0 error:&v21];
  id v16 = v21;

  if (v15)
  {

LABEL_8:
    uint64_t v18 = 1;
    goto LABEL_14;
  }
  id v19 = v16;
  if (v19)
  {
    if (a4) {
      *a4 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v18 = 0;
LABEL_14:

  return v18;
}

uint64_t __115__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", @"CycleTrackingOnboardingTileDismissedDate", 0);
  _HKInitializeLogging();
  id v7 = *MEMORY[0x263F09930];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = @"CycleTrackingOnboardingTileDismissedDate";
      _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = @"CycleTrackingOnboardingTileDismissedDate";
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  id v10 = objc_alloc(MEMORY[0x263F43218]);
  BOOL v11 = (void *)[v10 initWithCategory:1 domainName:*MEMORY[0x263F44FE8] profile:v5];
  id v19 = 0;
  char v12 = objc_msgSend(v11, "hdmc_setOnboardingTileLastDismissedTimeIntervalSinceReferenceDate:error:", v6, &v19);
  id v13 = v19;
  uint64_t v14 = v13;
  if (v12)
  {

LABEL_8:
    uint64_t v16 = 1;
    goto LABEL_14;
  }
  id v17 = v13;
  if (v17)
  {
    if (a3) {
      *a3 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __99__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryForKeyPath:error:", @"ShouldHideByChartDataTypeIdentifier", 0);
  uint64_t v46 = a1;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryForKeyPath:error:", @"ShouldHideByDisplayTypeIdentifier", 0);
  BOOL v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x263EFFA78];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v44 = v9;

  id v10 = HKMCCycleChartMainTypes();
  BOOL v11 = HKMCSymptomSampleTypes();
  char v12 = [v10 arrayByAddingObjectsFromArray:v11];

  id v13 = objc_msgSend(MEMORY[0x263F43218], "hdmc_cycleChartsHiddenRowsDomainWithProfile:", v5);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (!v14)
  {
    uint64_t v38 = 1;
    goto LABEL_32;
  }
  uint64_t v15 = v14;
  v42 = a3;
  id v43 = v5;
  uint64_t v16 = (os_log_t *)MEMORY[0x263F09930];
  uint64_t v17 = *(void *)v50;
LABEL_5:
  uint64_t v18 = 0;
  uint64_t v45 = v15;
  while (1)
  {
    if (*(void *)v50 != v17) {
      objc_enumerationMutation(obj);
    }
    id v19 = *(void **)(*((void *)&v49 + 1) + 8 * v18);
    if (v6)
    {
      id v20 = [*(id *)(*((void *)&v49 + 1) + 8 * v18) identifier];
      uint64_t v21 = v6;
LABEL_12:
      __int16 v22 = objc_msgSend(v21, "objectForKeyedSubscript:", v20, v42);
      goto LABEL_13;
    }
    id v20 = HKMCDisplayTypeIdentifierForSampleType();
    if (v20)
    {
      uint64_t v21 = v44;
      goto LABEL_12;
    }
    __int16 v22 = 0;
LABEL_13:

    _HKInitializeLogging();
    os_log_t v23 = *v16;
    BOOL v24 = os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT);
    if (v22) {
      break;
    }
    if (v24)
    {
      uint64_t v35 = *(void *)(v46 + 40);
      v34 = v23;
      v36 = [v19 identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = v35;
      __int16 v55 = 2114;
      v56 = v36;
      _os_log_impl(&dword_225722000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);

LABEL_20:
    }

    if (v15 == ++v18)
    {
      uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
      uint64_t v15 = v37;
      if (!v37)
      {
        uint64_t v38 = 1;
        id v5 = v43;
        goto LABEL_32;
      }
      goto LABEL_5;
    }
  }
  if (v24)
  {
    id v25 = v6;
    uint64_t v26 = v17;
    v27 = v13;
    uint64_t v28 = v16;
    uint64_t v29 = *(void *)(v46 + 40);
    v30 = v23;
    v31 = [v19 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v29;
    uint64_t v16 = v28;
    id v13 = v27;
    uint64_t v17 = v26;
    id v6 = v25;
    uint64_t v15 = v45;
    __int16 v55 = 2114;
    v56 = v31;
    __int16 v57 = 2114;
    v58 = v22;
    _os_log_impl(&dword_225722000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  v32 = objc_msgSend(v19, "identifier", v42);
  id v48 = 0;
  char v33 = [v13 setNumber:v22 forKey:v32 error:&v48];
  v34 = v48;

  if (v33) {
    goto LABEL_20;
  }
  v39 = v34;
  v40 = v39;
  id v5 = v43;
  if (v39)
  {
    if (v42) {
      void *v42 = v39;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v38 = 0;
LABEL_32:

  return v38;
}

uint64_t __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke_2;
  aBlock[3] = &unk_264750E90;
  uint64_t v34 = *(void *)(a1 + 40);
  id v6 = v5;
  id v33 = v6;
  uint64_t v7 = (uint64_t (**)(void *, void, void *, void *, id *))_Block_copy(aBlock);
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryIfExistsForKeyPath:error:", @"ShouldHideByDisplayTypeIdentifier", 0);
  uint64_t v9 = (void *)v8;
  id v10 = (void *)MEMORY[0x263EFFA78];
  if (v8) {
    id v10 = (void *)v8;
  }
  id v11 = v10;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  HKMCAllDisplayTypeIdentifiers();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v25 = a3;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, v25);
        uint64_t v18 = HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier();
        id v27 = 0;
        char v19 = v7[2](v7, v16, v17, v18, &v27);
        id v20 = v27;

        if ((v19 & 1) == 0)
        {
          id v22 = v20;
          os_log_t v23 = v22;
          if (v22)
          {
            if (v25) {
              *id v25 = v22;
            }
            else {
              _HKLogDroppedError();
            }
          }

          uint64_t v21 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = 1;
  }
LABEL_18:

  return v21;
}

uint64_t __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  _HKInitializeLogging();
  uint64_t v12 = *MEMORY[0x263F09930];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl(&dword_225722000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v14;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_225722000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  uint64_t v15 = [*(id *)(a1 + 32) featureSettingsManager];
  uint64_t v16 = *MEMORY[0x263F09798];
  id v23 = 0;
  char v17 = [v15 setFeatureSettingsNumber:v10 forKey:v11 featureIdentifier:v16 suppressNotificationsToObserver:0 error:&v23];
  id v18 = v23;

  if (v17)
  {

LABEL_8:
    uint64_t v20 = 1;
    goto LABEL_14;
  }
  id v21 = v18;
  if (v21)
  {
    if (a5) {
      *a5 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v20 = 0;
LABEL_14:

  return v20;
}

uint64_t __106__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v28 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  HKMCAllDeviationTypes();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v25 = a3;
    uint64_t v7 = *(void *)v31;
    uint64_t v27 = *MEMORY[0x263F097A0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unint64_t v10 = [v9 integerValue];
        if (v10 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnknownType_%ld", v10);
          id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v11 = off_264750EB0[v10];
        }
        uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", v11, 0);
        _HKInitializeLogging();
        BOOL v13 = *MEMORY[0x263F09930];
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            uint64_t v15 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v35 = v15;
            __int16 v36 = 2114;
            uint64_t v37 = v11;
            __int16 v38 = 2114;
            v39 = v12;
            _os_log_impl(&dword_225722000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
          }
          uint64_t v16 = [v28 featureSettingsManager];
          [v9 integerValue];
          char v17 = HKFeatureSettingsKeyForDeviationDetectionTypeEnabled();
          id v29 = 0;
          char v18 = [v16 setFeatureSettingsNumber:v12 forKey:v17 featureIdentifier:v27 suppressNotificationsToObserver:0 error:&v29];
          id v19 = v29;

          if ((v18 & 1) == 0)
          {
            id v22 = v19;
            id v23 = v22;
            if (v22)
            {
              if (v25) {
                *uint64_t v25 = v22;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v21 = 0;
            goto LABEL_24;
          }
        }
        else if (v14)
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v20;
          __int16 v36 = 2114;
          uint64_t v37 = v11;
          _os_log_impl(&dword_225722000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v21 = 1;
LABEL_24:

  return v21;
}

@end