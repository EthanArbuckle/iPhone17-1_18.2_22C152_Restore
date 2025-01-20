@interface HKHeartRateRecoveryQueryUtility
@end

@implementation HKHeartRateRecoveryQueryUtility

void __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1[4] + 40) + 16))();
  }
  else
  {
    v7 = [(id)objc_opt_class() workoutRecoveryDateIntervalForWorkout:*(void *)(a1[4] + 16) overlappingWorkouts:v6];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = a1[6];
      v10 = (void *)a1[4];
      if (*(unsigned char *)(*(void *)(v9 + 8) + 24))
      {
        v11 = [(id)objc_opt_class() workoutRecoveryHeartRatesForWorkout:*(void *)(a1[4] + 16) recoveryDateInterval:v7 readings:*(void *)(a1[4] + 48)];
        (*(void (**)(void))(*(void *)(a1[4] + 40) + 16))();
      }
      else
      {
        uint64_t v12 = v10[2];
        uint64_t v13 = a1[5];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke_2;
        v14[3] = &unk_1E58C28C0;
        uint64_t v16 = v9;
        v14[4] = v10;
        id v15 = v7;
        [v10 _heartRatesPostWorkout:v12 workoutRecoveryTimePredicate:v13 completionHandler:v14];
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1[4] + 40) + 16))();
    }
  }
}

void __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  uint64_t v6 = a1[4];
  if (a3)
  {
    (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(v6 + 48), a2);
    v7 = [(id)objc_opt_class() workoutRecoveryHeartRatesForWorkout:*(void *)(a1[4] + 16) recoveryDateInterval:a1[5] readings:*(void *)(a1[4] + 48)];
    (*(void (**)(void))(*(void *)(a1[4] + 40) + 16))();
  }
}

void __106___HKHeartRateRecoveryQueryUtility__heartRatesPostWorkout_workoutRecoveryTimePredicate_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, char a6, void *a7)
{
  id v23 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13 || !v14)
  {
    if ((a6 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v17 = (void *)a1[4];
  v18 = [v14 startDate];
  LODWORD(v17) = [v17 containsDate:v18];

  if (v17)
  {
    v19 = (void *)a1[5];
    v20 = [HKHeartRateSummaryReading alloc];
    v21 = [v14 startDate];
    v22 = [(HKHeartRateSummaryReading *)v20 initWithDate:v21 quantity:v13];
    [v19 addObject:v22];
  }
  if (a6) {
LABEL_8:
  }
    (*(void (**)(void))(a1[6] + 16))();
LABEL_9:
}

uint64_t __94___HKHeartRateRecoveryQueryUtility_workoutRecoveryDateIntervalForWorkout_overlappingWorkouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) UUID];
  v5 = [v3 UUID];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v3 startDate];
    if (objc_msgSend(v8, "hk_isAfterDate:", v9))
    {
      v10 = *(void **)(a1 + 48);
      v11 = [v3 endDate];
      uint64_t v7 = objc_msgSend(v10, "hk_isBeforeDate:", v11);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

uint64_t __102___HKHeartRateRecoveryQueryUtility_workoutRecoveryHeartRatesForWorkout_recoveryDateInterval_readings___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 date];
  uint64_t v4 = [v2 containsDate:v3];

  return v4;
}

@end