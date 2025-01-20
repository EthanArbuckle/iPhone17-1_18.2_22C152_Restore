@interface HDKeyValueDomain(HKMCSyncedUnprotected)
+ (id)hdmc_cycleChartsHiddenRowsDomainWithProfile:()HKMCSyncedUnprotected;
+ (id)hdmc_syncedUnprotectedDomainWithProfile:()HKMCSyncedUnprotected;
- (uint64_t)hdmc_onboardingTileLastDismissedDateWithError:()HKMCSyncedUnprotected;
- (uint64_t)hdmc_setOnboardingTileLastDismissedTimeIntervalSinceReferenceDate:()HKMCSyncedUnprotected error:;
- (uint64_t)hdmc_setUpdatedFertileWindowNotificationFireDate:()HKMCSyncedUnprotected error:;
- (uint64_t)hdmc_updatedFertileWindowNotificationFireDateWithError:()HKMCSyncedUnprotected;
@end

@implementation HDKeyValueDomain(HKMCSyncedUnprotected)

+ (id)hdmc_cycleChartsHiddenRowsDomainWithProfile:()HKMCSyncedUnprotected
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:1 domainName:*MEMORY[0x263F44F18] profile:v4];

  return v6;
}

+ (id)hdmc_syncedUnprotectedDomainWithProfile:()HKMCSyncedUnprotected
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v6 = (void *)[v5 initWithCategory:1 domainName:*MEMORY[0x263F44FE8] profile:v4];

  return v6;
}

- (uint64_t)hdmc_onboardingTileLastDismissedDateWithError:()HKMCSyncedUnprotected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 95, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 96, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F45098];
  return [a1 dateForKey:v8 error:a3];
}

- (uint64_t)hdmc_setOnboardingTileLastDismissedTimeIntervalSinceReferenceDate:()HKMCSyncedUnprotected error:
{
  id v7 = a3;
  uint64_t v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 102, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 103, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
LABEL_5:
  v10 = (void *)MEMORY[0x263EFF910];
  [v7 doubleValue];
  v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
LABEL_8:
  uint64_t v14 = [a1 setDate:v11 forKey:*MEMORY[0x263F45098] error:a4];

  return v14;
}

- (uint64_t)hdmc_setUpdatedFertileWindowNotificationFireDate:()HKMCSyncedUnprotected error:
{
  id v7 = a3;
  uint64_t v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 113, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 114, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v10 = [a1 setDate:v7 forKey:*MEMORY[0x263F45100] error:a4];

  return v10;
}

- (uint64_t)hdmc_updatedFertileWindowNotificationFireDateWithError:()HKMCSyncedUnprotected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 119, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 1)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 120, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F45100];
  return [a1 dateForKey:v8 error:a3];
}

@end