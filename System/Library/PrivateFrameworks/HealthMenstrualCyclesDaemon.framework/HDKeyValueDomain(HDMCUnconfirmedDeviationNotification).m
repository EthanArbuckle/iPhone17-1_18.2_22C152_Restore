@interface HDKeyValueDomain(HDMCUnconfirmedDeviationNotification)
+ (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCUnconfirmedDeviationNotification;
- (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:()HDMCUnconfirmedDeviationNotification;
- (uint64_t)hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:()HDMCUnconfirmedDeviationNotification error:;
@end

@implementation HDKeyValueDomain(HDMCUnconfirmedDeviationNotification)

+ (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCUnconfirmedDeviationNotification
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:1 domainName:@"com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state" profile:v4];

  return v5;
}

- (uint64_t)hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:()HDMCUnconfirmedDeviationNotification error:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:@"com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state"];

  if ((v9 & 1) == 0)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 165, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesUnconfirmedDeviationNotificationStateDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 166, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  id v39 = 0;
  char v10 = [a1 setValueForAllKeys:0 error:&v39];
  id v11 = v39;
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    id v20 = v11;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDKeyValueDomain(HDMCUnconfirmedDeviationNotification) hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:](v28, (uint64_t)a1, (uint64_t)v20);
    }
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x263F09930];
  v14 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    id v17 = v16;
    _os_log_impl(&dword_225722000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared key value domain of unconfirmed deviation notification state", buf, 0xCu);
  }
  v18 = [v7 dictionaryRepresentation];
  id v38 = v12;
  char v19 = [a1 setValuesWithDictionary:v18 error:&v38];
  id v20 = v38;

  if ((v19 & 1) == 0)
  {
    id v20 = v20;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    os_log_t v29 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v31 = v29;
      v32 = objc_opt_class();
      id v33 = v32;
      v34 = HKSensitiveLogItem();
      v35 = [a1 domainName];
      *(_DWORD *)buf = 138544130;
      v41 = v32;
      __int16 v42 = 2112;
      v43 = v34;
      __int16 v44 = 2112;
      v45 = v35;
      __int16 v46 = 2114;
      id v47 = v20;
      _os_log_error_impl(&dword_225722000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Error saving state:%@ in key value domain: %@ error: %{public}@", buf, 0x2Au);
    }
LABEL_24:
    uint64_t v27 = 0;
    goto LABEL_25;
  }
  _HKInitializeLogging();
  os_log_t v21 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = objc_opt_class();
    id v24 = v23;
    v25 = HKSensitiveLogItem();
    v26 = [a1 domainName];
    *(_DWORD *)buf = 138543874;
    v41 = v23;
    __int16 v42 = 2112;
    v43 = v25;
    __int16 v44 = 2112;
    v45 = v26;
    _os_log_impl(&dword_225722000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved new state:%@ in key value domain:%@", buf, 0x20u);
  }
  uint64_t v27 = 1;
LABEL_25:

  return v27;
}

- (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:()HDMCUnconfirmedDeviationNotification
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:@"com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state"];

  if ((v7 & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 189, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesUnconfirmedDeviationNotificationStateDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 190, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  id v17 = 0;
  v8 = [a1 allValuesWithError:&v17];
  id v9 = v17;
  char v10 = v9;
  if (v8)
  {
    id v11 = +[HDMCUnconfirmedDeviationNotificationStateMachineState stateFromDictionaryRepresentation:v8];
  }
  else
  {
    id v12 = v9;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDKeyValueDomain(HDMCOvulationConfirmationNotification) hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](v13, a1);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:()HDMCUnconfirmedDeviationNotification error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_225722000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error clearing key value domain of unconfirmed deviation notification state: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end