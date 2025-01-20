@interface HAMenstrualAlgorithmsWristTemperature(HKMenstrualCycles)
+ (id)hkmc_wristTemperatureWithTemperature:()HKMenstrualCycles;
@end

@implementation HAMenstrualAlgorithmsWristTemperature(HKMenstrualCycles)

+ (id)hkmc_wristTemperatureWithTemperature:()HKMenstrualCycles
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F429C0];
    id v4 = a3;
    id v5 = [v3 alloc];
    v6 = [v4 quantity];
    v7 = [MEMORY[0x263F0A830] degreeCelsiusUnit];
    [v6 doubleValueForUnit:v7];
    double v9 = v8;
    v10 = [v4 watchBundleIdentifier];

    v11 = (void *)[v5 initWithTemperature:v10 forWatchIdentifier:v9];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end