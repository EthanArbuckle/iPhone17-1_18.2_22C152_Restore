@interface HAMenstrualAlgorithmsDeviationInput
@end

@implementation HAMenstrualAlgorithmsDeviationInput

uint64_t __119__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles__hdmc_deviationInputWithProfile_enabledSetExplicitly_calendar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 completionDate];
  v6 = [v4 completionDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __109__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles___dayIndexAfterLastDeviationOfType_profile_calendar___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

@end