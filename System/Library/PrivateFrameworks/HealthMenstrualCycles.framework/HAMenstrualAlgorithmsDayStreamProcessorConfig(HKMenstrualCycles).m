@interface HAMenstrualAlgorithmsDayStreamProcessorConfig(HKMenstrualCycles)
+ (id)hkmc_configurationWithBirthDateComponents:()HKMenstrualCycles userReportedCycleLength:onDayIndex:userReportedMenstruationLength:onDayIndex:;
@end

@implementation HAMenstrualAlgorithmsDayStreamProcessorConfig(HKMenstrualCycles)

+ (id)hkmc_configurationWithBirthDateComponents:()HKMenstrualCycles userReportedCycleLength:onDayIndex:userReportedMenstruationLength:onDayIndex:
{
  id v11 = a4;
  id v12 = a6;
  v13 = (objc_class *)MEMORY[0x263F42978];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  [v15 setBirthDateComponents:v14];

  if (v11)
  {
    v16 = NSNumber;
    v17 = [MEMORY[0x263F0A830] dayUnit];
    [v11 doubleValueForUnit:v17];
    v18 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setUserReportedCycleLength:v18];

    v19 = [NSNumber numberWithInteger:a5];
    [v15 setJulianDayOfUserReportedCycleLength:v19];
  }
  if (v12)
  {
    v20 = NSNumber;
    v21 = [MEMORY[0x263F0A830] dayUnit];
    [v12 doubleValueForUnit:v21];
    v22 = objc_msgSend(v20, "numberWithDouble:");
    [v15 setUserReportedMenstruationLength:v22];

    v23 = [NSNumber numberWithInteger:a7];
    [v15 setJulianDayOfUserReportedMenstruationLength:v23];
  }
  return v15;
}

@end