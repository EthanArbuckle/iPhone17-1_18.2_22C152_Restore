@interface HDKeyValueDomain(HDMCOvulationConfirmationNotification)
+ (id)hdmc_menstrualCyclesOvulationConfirmationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCOvulationConfirmationNotification;
- (id)hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:()HDMCOvulationConfirmationNotification;
- (uint64_t)hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:()HDMCOvulationConfirmationNotification error:;
@end

@implementation HDKeyValueDomain(HDMCOvulationConfirmationNotification)

+ (id)hdmc_menstrualCyclesOvulationConfirmationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCOvulationConfirmationNotification
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:1 domainName:@"com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state" profile:v4];

  return v5;
}

- (uint64_t)hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:()HDMCOvulationConfirmationNotification error:
{
  id v7 = a3;
  v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:@"com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state"];

  if ((v9 & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 135, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesOvulationConfirmationNotificationStateDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 136, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  v10 = [v7 dictionaryRepresentation];
  uint64_t v11 = [a1 setValuesWithDictionary:v10 error:a4];

  return v11;
}

- (id)hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:()HDMCOvulationConfirmationNotification
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:@"com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state"];

  if ((v7 & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 141, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesOvulationConfirmationNotificationStateDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 142, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  id v16 = 0;
  v8 = [a1 allValuesWithError:&v16];
  id v9 = v16;
  if (v8)
  {
    v10 = +[HDMCOvulationConfirmationNotificationStateMachineState stateFromDictionaryRepresentation:v8];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDKeyValueDomain(HDMCOvulationConfirmationNotification) hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:](v11, a1);
    }
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

    v10 = 0;
  }

  return v10;
}

- (void)hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:()HDMCOvulationConfirmationNotification .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (id)objc_opt_class();
  v5 = [a2 domainName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_225722000, v6, v7, "[%{public}@] Error retrieving dictionary from key value domain: %@ error:%@", v8, v9, v10, v11, v12);
}

@end