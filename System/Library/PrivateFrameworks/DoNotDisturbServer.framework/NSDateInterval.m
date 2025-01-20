@interface NSDateInterval
@end

@implementation NSDateInterval

void __79__NSDateInterval_Schedule__dnds_dateIntervalForScheduleSettings_date_calendar___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v6 = *(void *)(a1 + 72);
  if ((DNDWeekdaysFromDay() & v6) == 0) {
    return;
  }
  v7 = [*(id *)(a1 + 32) startTime];
  id v19 = [v7 dateComponents];

  v8 = [*(id *)(a1 + 32) endTime];
  v9 = [v8 dateComponents];

  if ([*(id *)(a1 + 40) date:*(void *)(a1 + 48) matchesComponents:v19])
  {
    id v10 = *(id *)(a1 + 48);
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) nextDateAfterDate:*(void *)(a1 + 48) matchingComponents:v19 options:5124];
  }
  v11 = v10;
  v12 = [*(id *)(a1 + 40) nextDateAfterDate:v10 matchingComponents:v9 options:9216];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v13 setWeekday:a2];
  while (DNDSGetLifetimePhase(*(void **)(a1 + 48), (uint64_t)v11, v12) == 2
       || [v11 compare:v12] != -1
       || ([*(id *)(a1 + 40) date:v11 matchesComponents:v13] & 1) == 0)
  {
    uint64_t v14 = [*(id *)(a1 + 40) nextDateAfterDate:v11 matchingComponents:v19 options:5120];

    uint64_t v15 = [*(id *)(a1 + 40) nextDateAfterDate:v12 matchingComponents:v9 options:9216];

    v12 = (void *)v15;
    v11 = (void *)v14;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void *)(v16 + 40);
  BOOL v18 = v17 != 0;
  if (!v17) {
    goto LABEL_15;
  }
  if (objc_msgSend(v11, "compare:") == -1)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_15:
    objc_storeStrong((id *)(v16 + 40), v11);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);
    goto LABEL_16;
  }
  BOOL v18 = 0;
LABEL_16:
  *a3 = v18;
}

void __102__NSDateInterval_Schedule__dnds_dateIntervalUntilEndOfScheduleForScheduleSettings_startDate_calendar___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v6 = *(void *)(a1 + 64);
  if ((DNDWeekdaysFromDay() & v6) == 0) {
    return;
  }
  v7 = [*(id *)(a1 + 32) startTime];
  id v19 = [v7 dateComponents];

  v8 = [*(id *)(a1 + 32) endTime];
  v9 = [v8 dateComponents];

  if ([*(id *)(a1 + 40) date:*(void *)(a1 + 48) matchesComponents:v19])
  {
    id v10 = *(id *)(a1 + 48);
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) nextDateAfterDate:*(void *)(a1 + 48) matchingComponents:v19 options:5124];
  }
  v11 = v10;
  v12 = [*(id *)(a1 + 40) nextDateAfterDate:v10 matchingComponents:v9 options:9216];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v13 setWeekday:a2];
  while (DNDSGetLifetimePhase(*(void **)(a1 + 48), *(void *)(a1 + 48), v12) == 2
       || ([*(id *)(a1 + 40) date:v11 matchesComponents:v13] & 1) == 0)
  {
    uint64_t v14 = [*(id *)(a1 + 40) nextDateAfterDate:v11 matchingComponents:v19 options:5120];

    uint64_t v15 = [*(id *)(a1 + 40) nextDateAfterDate:v12 matchingComponents:v9 options:9216];

    v12 = (void *)v15;
    v11 = (void *)v14;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void *)(v16 + 40);
  BOOL v18 = v17 != 0;
  if (!v17) {
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "compare:") == -1)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_14:
    objc_storeStrong((id *)(v16 + 40), v12);
    goto LABEL_15;
  }
  BOOL v18 = 0;
LABEL_15:
  *a3 = v18;
}

@end