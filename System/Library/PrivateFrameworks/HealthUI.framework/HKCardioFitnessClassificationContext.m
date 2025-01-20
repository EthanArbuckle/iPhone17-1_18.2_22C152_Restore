@interface HKCardioFitnessClassificationContext
@end

@implementation HKCardioFitnessClassificationContext

void __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (a3)
  {
    v10 = objc_msgSend(a2, "hk_map:", &__block_literal_global_22);
    v11 = +[HKCardioFitnessUtilities cardioFitnessLevelDataForChartData:v10];
    v12 = v11;
    if (v11)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3;
      v13[3] = &unk_1E6D513B0;
      v13[4] = *(void *)(a1 + 32);
      id v14 = v11;
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
  }
  (*(void (**)(void, uint64_t, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, v9, v7, v8);
}

id __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v2 userInfo];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 contextDidUpdate:*(void *)(a1 + 32) withCardioFitnessLevelData:*(void *)(a1 + 40)];
}

@end