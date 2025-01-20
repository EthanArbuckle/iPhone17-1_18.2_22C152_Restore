@interface CDSleepPredictor
@end

@implementation CDSleepPredictor

uint64_t __51___CDSleepPredictor_array_reduce_withInitialValue___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

id __41___CDSleepPredictor_indexSetFromUnionOf___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 addIndexes:a2];
  return v4;
}

void __31___CDSleepPredictor_array_map___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

uint64_t __34___CDSleepPredictor_array_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___CDSleepPredictor_mutableArray_replaceObjectsAtIndexes_withObjectFromBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = [v3 objectAtIndexedSubscript:a2];
  v5 = (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  [v3 replaceObjectAtIndex:a2 withObject:v5];
}

unint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "cd_dateWithFloorForAlignment:", 900.0);
  uint64_t v4 = [*(id *)(a1 + 32) startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  uint64_t v7 = *(void *)(a1 + 40) - 1;
  double v8 = v6 / 900.0;
  if (v6 / 900.0 > (double)v7) {
    double v8 = (double)v7;
  }
  return (unint64_t)fmax(v8, 0.0);
}

uint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  double v5 = [v4 startDate];
  double v6 = [*(id *)(a1 + 32) startDate];
  uint64_t v7 = [v5 laterDate:v6];
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v7);

  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v4 endDate];

  v11 = [*(id *)(a1 + 32) endDate];
  v12 = [v10 earlierDate:v11];
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  v14 = (void *)MEMORY[0x1E4F28D60];
  if (*(void *)(a1 + 48) - v8 >= (unint64_t)(v13 - v8 + 1)) {
    uint64_t v15 = v13 - v8 + 1;
  }
  else {
    uint64_t v15 = *(void *)(a1 + 48) - v8;
  }
  return objc_msgSend(v14, "indexSetWithIndexesInRange:", v8, v15);
}

uint64_t __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_3()
{
  return [NSNumber numberWithInt:1];
}

uint64_t __83___CDSleepPredictor_fetchDeviceInUseDateIntervalsFromStore_whichIntersectInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __107___CDSleepPredictor_fetchFirstEventDateIntervalFromStore_forStream_sortDateAscending_intersectingInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  [a2 doubleValue];
  return [v2 numberWithInt:v3 > 0.5];
}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 BOOLValue] ^ 1;
}

void __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

uint64_t __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 rangeValue];
  unint64_t v6 = v5;
  [v4 rangeValue];
  unint64_t v8 = v7;

  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 != v8;
  }
}

id __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeValue];
  uint64_t v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  unint64_t v7 = [*(id *)(a1 + 32) dateByAddingTimeInterval:(double)(unint64_t)(900 * v3)];
  unint64_t v8 = (void *)[v6 initWithStartDate:v7 duration:(double)(unint64_t)(900 * v5)];

  return v8;
}

@end