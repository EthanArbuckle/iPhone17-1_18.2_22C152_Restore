@interface HDKeyValueDomain(HKMCSyncedProtected)
+ (id)hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:()HKMCSyncedProtected;
- (uint64_t)hdmc_lastLoggedInCycleTrackingDateWithError:()HKMCSyncedProtected;
- (uint64_t)hdmc_legacyOnboardingFirstCompletedDateWithError:()HKMCSyncedProtected;
- (uint64_t)hdmc_legacyOnboardingVersionCompletedWithError:()HKMCSyncedProtected;
- (uint64_t)hdmc_setLastLoggedInCycleTrackingDate:()HKMCSyncedProtected error:;
- (uint64_t)hdmc_setUnconfirmedDeviationDismissalDayIndex:()HKMCSyncedProtected error:;
- (uint64_t)hdmc_unconfirmedDeviationDismissalDayIndexWithError:()HKMCSyncedProtected;
@end

@implementation HDKeyValueDomain(HKMCSyncedProtected)

- (uint64_t)hdmc_unconfirmedDeviationDismissalDayIndexWithError:()HKMCSyncedProtected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 65, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 66, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F450F0];
  return [a1 numberForKey:v8 error:a3];
}

+ (id)hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:()HKMCSyncedProtected
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:105 domainName:*MEMORY[0x263F44FE8] profile:v4];

  return v6;
}

- (uint64_t)hdmc_legacyOnboardingVersionCompletedWithError:()HKMCSyncedProtected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 35, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 36, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F44FB8];
  return [a1 numberForKey:v8 error:a3];
}

- (uint64_t)hdmc_legacyOnboardingFirstCompletedDateWithError:()HKMCSyncedProtected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 41, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 42, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F44FC0];
  return [a1 dateForKey:v8 error:a3];
}

- (uint64_t)hdmc_setLastLoggedInCycleTrackingDate:()HKMCSyncedProtected error:
{
  id v7 = a3;
  uint64_t v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 47, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 48, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v10 = [a1 setDate:v7 forKey:*MEMORY[0x263F44FB0] error:a4];

  return v10;
}

- (uint64_t)hdmc_lastLoggedInCycleTrackingDateWithError:()HKMCSyncedProtected
{
  v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 53, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 54, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v8 = *MEMORY[0x263F44FB0];
  return [a1 dateForKey:v8 error:a3];
}

- (uint64_t)hdmc_setUnconfirmedDeviationDismissalDayIndex:()HKMCSyncedProtected error:
{
  id v7 = a3;
  uint64_t v8 = [a1 domainName];
  char v9 = [v8 isEqualToString:*MEMORY[0x263F44FE8]];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 59, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]" object file lineNumber description];
  }
  if ([a1 category] != 105)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKMenstrualCycles.m", 60, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  uint64_t v10 = [a1 setNumber:v7 forKey:*MEMORY[0x263F450F0] error:a4];

  return v10;
}

@end