@interface HAMenstrualAlgorithmsAnalysis(HKMenstrualCycles)
- (id)hkmc_description;
- (id)hkmc_deviations;
- (id)hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource:()HKMenstrualCycles currentDayIndex:;
- (id)hkmc_menstruationProjections;
- (id)hkmc_statistics;
@end

@implementation HAMenstrualAlgorithmsAnalysis(HKMenstrualCycles)

- (id)hkmc_menstruationProjections
{
  v1 = [a1 menstruationPredictions];
  v2 = objc_msgSend(v1, "hk_map:", &__block_literal_global_0);

  return v2;
}

- (id)hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource:()HKMenstrualCycles currentDayIndex:
{
  id v6 = a3;
  v7 = [a1 fertilityPredictions];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __133__HAMenstrualAlgorithmsAnalysis_HKMenstrualCycles__hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource_currentDayIndex___block_invoke;
  v11[3] = &unk_2646E9648;
  id v12 = v6;
  uint64_t v13 = a4;
  id v8 = v6;
  v9 = objc_msgSend(v7, "hk_map:", v11);

  return v9;
}

- (id)hkmc_statistics
{
  v1 = [a1 stats];
  v2 = objc_msgSend(v1, "hkmc_statistics");

  return v2;
}

- (id)hkmc_deviations
{
  v2 = [a1 deviationAnalysis];

  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    v4 = [a1 deviationAnalysis];
    v5 = [v4 prolongedBleeding];
    id v6 = objc_msgSend(v5, "hkmc_deviationOfType:", 0);
    objc_msgSend(v3, "hk_addNonNilObject:", v6);

    v7 = [a1 deviationAnalysis];
    id v8 = [v7 spotting];
    v9 = objc_msgSend(v8, "hkmc_deviationOfType:", 1);
    objc_msgSend(v3, "hk_addNonNilObject:", v9);

    v10 = [a1 deviationAnalysis];
    v11 = [v10 irregularBleeding];
    id v12 = objc_msgSend(v11, "hkmc_deviationOfType:", 2);
    objc_msgSend(v3, "hk_addNonNilObject:", v12);

    uint64_t v13 = [a1 deviationAnalysis];
    v14 = [v13 infrequentBleeding];
    v15 = objc_msgSend(v14, "hkmc_deviationOfType:", 3);
    objc_msgSend(v3, "hk_addNonNilObject:", v15);

    v16 = (void *)[v3 copy];
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)hkmc_description
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = NSNumber;
  v5 = [a1 menstruationPredictions];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v7 = NSNumber;
  id v8 = [a1 fertilityPredictions];
  v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v10 = [a1 stats];
  v11 = objc_msgSend(v10, "hkmc_description");
  id v12 = objc_msgSend(a1, "hkmc_deviations");
  uint64_t v13 = [v2 stringWithFormat:@"<%@:%p %@ menstruation predictions, %@ fertility predictions, stats: %@, deviations: %@>", v3, a1, v6, v9, v11, v12];

  return v13;
}

@end