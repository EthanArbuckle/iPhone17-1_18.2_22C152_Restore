@interface HKSleepDurationGoalContext
@end

@implementation HKSleepDurationGoalContext

void __114___HKSleepDurationGoalContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v6 = [*(id *)(a1 + 32) _goalGivenChartPoints:a2];
    v4 = [*(id *)(a1 + 32) _durationContextItemWithGoal:v6];
    [*(id *)(a1 + 32) setLastUpdatedItem:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

@end