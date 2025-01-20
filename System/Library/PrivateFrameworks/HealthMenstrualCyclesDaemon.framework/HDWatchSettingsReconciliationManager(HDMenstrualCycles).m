@interface HDWatchSettingsReconciliationManager(HDMenstrualCycles)
- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:;
@end

@implementation HDWatchSettingsReconciliationManager(HDMenstrualCycles)

- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:
{
  v16[2] = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F43448];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = (void *)[v9 initWithFeatureIdentifier:*MEMORY[0x263F097A8] defaultsEnabledKey:@"SensorBasedProjectionsEnabled"];
  v16[0] = v10;
  id v11 = objc_alloc(MEMORY[0x263F43448]);
  v12 = (void *)[v11 initWithFeatureIdentifier:*MEMORY[0x263F097B0] defaultsEnabledKey:@"WristTemperatureBasedProjectionsEnabled"];
  v16[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  uint64_t v14 = [a1 initWithProfile:v8 userDefaults:v7 managedKeys:v13 debugIdentifier:@"HealthMenstrualCycles" loggingCategory:*MEMORY[0x263F09930]];

  return v14;
}

@end