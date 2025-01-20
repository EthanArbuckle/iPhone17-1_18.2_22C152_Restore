@interface ARUIRingGroup(HKActivitySummary)
- (uint64_t)hk_configureWithActivitySummary:()HKActivitySummary animated:;
- (void)hk_configureWithActivitySummary:()HKActivitySummary animated:completion:;
- (void)hk_configureWithActivitySummary:()HKActivitySummary isStandaloneFallback:animated:completion:;
@end

@implementation ARUIRingGroup(HKActivitySummary)

- (uint64_t)hk_configureWithActivitySummary:()HKActivitySummary animated:
{
  return objc_msgSend(a1, "hk_configureWithActivitySummary:animated:completion:", a3, a4, 0);
}

- (void)hk_configureWithActivitySummary:()HKActivitySummary animated:completion:
{
  v8 = (void *)MEMORY[0x263F0A980];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 sharedBehavior];
  objc_msgSend(a1, "hk_configureWithActivitySummary:isStandaloneFallback:animated:completion:", v10, objc_msgSend(v11, "isStandalonePhoneFitnessMode"), a4, v9);
}

- (void)hk_configureWithActivitySummary:()HKActivitySummary isStandaloneFallback:animated:completion:
{
  id v26 = a3;
  if (v26)
  {
    id v10 = a6;
    if ([v26 activityMoveMode] == 2) {
      [v26 _moveMinutesCompletionPercentage];
    }
    else {
      [v26 _activeEnergyCompletionPercentage];
    }
    float v18 = v11;
    [v26 _exerciseTimeCompletionPercentage];
    float v20 = v19;
    [v26 _standHoursCompletionPercentage];
    float v22 = v21;
    objc_msgSend(a1, "setIsStandalonePhoneFitnessMode:animated:", objc_msgSend(v26, "_isStandalonePhoneSummary"), 0);
    *(float *)&double v23 = v18;
    *(float *)&double v24 = v20;
    *(float *)&double v25 = v22;
    [a1 setActiveEnergyPercentage:a5 exerciseMinutesPercentage:v10 standHoursPercentage:v23 animated:v24 completion:v25];

    uint64_t v17 = [v26 isPaused];
  }
  else
  {
    int v12 = *MEMORY[0x263F23918];
    id v13 = a6;
    [a1 setIsStandalonePhoneFitnessMode:a4 animated:0];
    LODWORD(v14) = v12;
    LODWORD(v15) = v12;
    LODWORD(v16) = v12;
    [a1 setActiveEnergyPercentage:a5 exerciseMinutesPercentage:v13 standHoursPercentage:v14 animated:v15 completion:v16];

    uint64_t v17 = 0;
  }
  [a1 setIsPaused:v17];
}

@end