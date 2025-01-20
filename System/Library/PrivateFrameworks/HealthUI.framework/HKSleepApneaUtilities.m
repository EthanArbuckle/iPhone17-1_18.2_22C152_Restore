@interface HKSleepApneaUtilities
+ (id)averageBreathingDisturbancesForChartData:(id)a3;
+ (id)localizedTitleForBreathingDisturbances:(id)a3;
+ (id)localizedTitleForBreathingDisturbancesClassification:(int64_t)a3;
+ (id)mostFrequentBreathingDisturbancesClassificationForChartData:(id)a3;
@end

@implementation HKSleepApneaUtilities

+ (id)localizedTitleForBreathingDisturbancesClassification:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = v4;
    v6 = @"SLEEP_BREATHING_DISTURBANCES_CLASSIFICATION_ELEVATED";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = v4;
    v6 = @"SLEEP_BREATHING_DISTURBANCES_CLASSIFICATION_NOT_ELEVATED";
  }
  v3 = [v4 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];

LABEL_6:
  return v3;
}

+ (id)localizedTitleForBreathingDisturbances:(id)a3
{
  v4 = HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v5 = objc_msgSend(a1, "localizedTitleForBreathingDisturbancesClassification:", objc_msgSend(v4, "integerValue"));

  return v5;
}

+ (id)averageBreathingDisturbancesForChartData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v19;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "value", (void)v18);
          double v9 = v9 + v12 * (double)[v11 recordCount];
          v7 += [v11 recordCount];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
      double v13 = (double)v7;
    }
    else
    {
      double v9 = 0.0;
      double v13 = 0.0;
    }

    v15 = (void *)MEMORY[0x1E4F2B370];
    v16 = [MEMORY[0x1E4F2B618] countUnit];
    v14 = [v15 quantityWithUnit:v16 doubleValue:v9 / v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)mostFrequentBreathingDisturbancesClassificationForChartData:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke;
    aBlock[3] = &unk_1E6D51688;
    id v9 = v3;
    id v4 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
    int v5 = v4[2](v4, 0);
    if ((int)v4[2](v4, 1) >= v5) {
      uint64_t v6 = &unk_1F3C202D8;
    }
    else {
      uint64_t v6 = &unk_1F3C202F0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke_2;
  v6[3] = &__block_descriptor_40_e43_B16__0__HKInteractiveChartSinglePointData_8l;
  v6[4] = a2;
  id v3 = objc_msgSend(v2, "hk_filter:", v6);
  uint64_t v4 = [v3 count];

  return v4;
}

uint64_t __85__HKSleepApneaUtilities_mostFrequentBreathingDisturbancesClassificationForChartData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v4 = (void *)MEMORY[0x1E4F2B618];
  id v5 = a2;
  uint64_t v6 = [v4 countUnit];
  [v5 value];
  double v8 = v7;

  id v9 = [v3 quantityWithUnit:v6 doubleValue:v8];

  v10 = HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v11 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  uint64_t v12 = [v10 isEqual:v11];

  return v12;
}

@end