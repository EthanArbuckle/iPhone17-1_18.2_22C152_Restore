@interface HAMenstrualAlgorithmsAnalysis
@end

@implementation HAMenstrualAlgorithmsAnalysis

uint64_t __80__HAMenstrualAlgorithmsAnalysis_HKMenstrualCycles__hkmc_menstruationProjections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hkmc_projectionConstrainingToMostLikelyDays:overridePredictionPrimarySource:currentDayIndex:", 0, 0, 0);
}

uint64_t __133__HAMenstrualAlgorithmsAnalysis_HKMenstrualCycles__hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource_currentDayIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hkmc_projectionConstrainingToMostLikelyDays:overridePredictionPrimarySource:currentDayIndex:", 1, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end