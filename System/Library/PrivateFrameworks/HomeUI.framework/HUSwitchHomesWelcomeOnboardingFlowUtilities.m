@interface HUSwitchHomesWelcomeOnboardingFlowUtilities
+ (id)currentUserHasUnfinishedFeatureOnboardingForHome:(id)a3;
@end

@implementation HUSwitchHomesWelcomeOnboardingFlowUtilities

+ (id)currentUserHasUnfinishedFeatureOnboardingForHome:(id)a3
{
  v17[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke;
  v15 = &unk_1E638D5B8;
  id v16 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "na_map:", &v12);
  v7 = (void *)MEMORY[0x1E4F7A0D8];
  v8 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v12, v13, v14, v15);
  v9 = [v7 combineAllFutures:v6 ignoringErrors:1 scheduler:v8];
  v10 = [v9 flatMap:&__block_literal_global_156];

  return v10;
}

uint64_t __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke(uint64_t a1, void *a2)
{
  return [a2 needsOnboardingForHome:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08]];
}

id __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "na_any:", &__block_literal_global_14_0);
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v4 = [NSNumber numberWithBool:v2];
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

uint64_t __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

@end