@interface HDSQLitePredicate(HKMenstrualCycles)
+ (id)hdmc_predicateForPossibleOngoingSamplesOnDayIndex:()HKMenstrualCycles;
+ (id)hdmc_predicateForSamplesInDayIndexRange:()HKMenstrualCycles;
@end

@implementation HDSQLitePredicate(HKMenstrualCycles)

+ (id)hdmc_predicateForPossibleOngoingSamplesOnDayIndex:()HKMenstrualCycles
{
  v12[2] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF910], "hk_latestPossibleDateWithDayIndex:", a3 - 1);
  v5 = objc_msgSend(MEMORY[0x263EFF910], "hk_earliestPossibleDateWithDayIndex:", a3);
  v6 = HDSampleEntityPredicateForStartDate();
  v7 = HDSampleEntityPredicateForEndDate();
  v8 = (void *)MEMORY[0x263F434A8];
  v12[0] = v6;
  v12[1] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v10 = [v8 predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)hdmc_predicateForSamplesInDayIndexRange:()HKMenstrualCycles
{
  v15[2] = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(MEMORY[0x263EFF910], "hk_earliestPossibleDateWithDayIndex:");
  if (a4 <= 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = a4 + a3 - 1;
  }
  v8 = objc_msgSend(MEMORY[0x263EFF910], "hk_latestPossibleDateWithDayIndex:", v7);
  v9 = HDSampleEntityPredicateForStartDate();
  v10 = HDSampleEntityPredicateForEndDate();
  v11 = (void *)MEMORY[0x263F434A8];
  v15[0] = v9;
  v15[1] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v13 = [v11 predicateMatchingAllPredicates:v12];

  return v13;
}

@end