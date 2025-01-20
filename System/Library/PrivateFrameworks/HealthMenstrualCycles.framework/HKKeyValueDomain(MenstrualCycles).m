@interface HKKeyValueDomain(MenstrualCycles)
+ (id)hkmc_cycleChartsHiddenRowsDomainWithHealthStore:()MenstrualCycles;
- (uint64_t)hkmc_setOnboardingTileLastDismissedDate:()MenstrualCycles error:;
@end

@implementation HKKeyValueDomain(MenstrualCycles)

+ (id)hkmc_cycleChartsHiddenRowsDomainWithHealthStore:()MenstrualCycles
{
  v3 = (objc_class *)MEMORY[0x263F0A470];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:4 domainName:@"com.apple.private.health.menstrual-cycles.cycle-charts-hidden-rows" healthStore:v4];

  return v5;
}

- (uint64_t)hkmc_setOnboardingTileLastDismissedDate:()MenstrualCycles error:
{
  id v7 = a3;
  v8 = [a1 domainName];
  if (![v8 isEqualToString:@"com.apple.private.health.menstrual-cycles"])
  {

    goto LABEL_5;
  }
  uint64_t v9 = [a1 category];

  if (v9 != 4)
  {
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKKeyValueDomain+MenstrualCycles.m", 64, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain] && self.category == HKKeyValueCategoryUbiquitousUserDefaults" object file lineNumber description];
  }
  uint64_t v10 = [a1 setDate:v7 forKey:@"OnboardingTileLastDismissedDate" error:a4];

  return v10;
}

@end