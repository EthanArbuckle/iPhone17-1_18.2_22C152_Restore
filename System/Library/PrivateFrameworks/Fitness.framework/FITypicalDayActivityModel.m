@interface FITypicalDayActivityModel
+ (id)_emptySimpleHistogram;
- (BOOL)_queue_enumerateActivitySummariesOrderedByCacheIndexWithCalendar:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)_willCompleteGoalWithType:(int64_t)a3 bufferPercentage:(double)a4;
- (BOOL)isSleepAlarmEnabledForToday;
- (BOOL)projectedToBeatMoveRecordByEndOfDay;
- (BOOL)shouldSuggestWalkWithActivitySettingsController:(id)a3;
- (BOOL)willCompleteExerciseGoalWithBufferPercentage:(double)a3;
- (BOOL)willCompleteMoveGoalWithBufferPercentage:(double)a3;
- (BOOL)willCompleteStandGoalOrItIsTooLateWithBufferPercentage:(double)a3;
- (BOOL)willCompletingMoveRingEarnStreakAchievement;
- (FITypicalDayActivityModelDelegate)delegate;
- (NSString)debugDescription;
- (double)_percentageOfTypicalDayComparedToNowForGoal:(int64_t)a3;
- (double)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 height:(id)a5 weight:(id)a6 wheelchairUse:(int64_t)a7 experienceType:(unint64_t)a8;
- (double)_queue_currentValueForHistogram:(id)a3;
- (double)briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:(id)a3;
- (double)currentExerciseGoalPercentage;
- (double)currentMoveGoalPercentage;
- (double)currentStandGoalPercentage;
- (double)percentageOfTypicalDayBriskMinutesEarnedComparedToNow;
- (double)percentageOfTypicalDayMoveComparedToNow;
- (double)projectedDayDuration;
- (double)valueOfTypicalDayBriskMinutesEarnedByNow;
- (double)valueOfTypicalDayMoveEarnedByNow;
- (id)_bucketDateForIndex:(unint64_t)a3 startOfDay:(id)a4;
- (id)_goodMorningAlertDismissedDateForToday;
- (id)_queue_calculateProjectedOffWristDateFromHistogram:(id)a3 activeDays:(int64_t)a4;
- (id)_sleepDataProvider;
- (id)currentCalendar;
- (id)currentDate;
- (id)endOfToday;
- (id)initForDateInterval:(id)a3 delegate:(id)a4;
- (id)initForDateInterval:(id)a3 delegate:(id)a4 sleepDataProvider:(id)a5;
- (id)projectedOffWrist;
- (id)sleepUserDay;
- (id)startOfToday;
- (id)userEndOfDay;
- (id)userStartOfDay;
- (id)userWakeUpDateForToday;
- (int64_t)_bucketIndexForDate:(id)a3 startOfDay:(id)a4 bucketDates:(id)a5;
- (int64_t)totalActiveDays;
- (void)_queue_populateHistogramsAndOffWristDateForToday;
- (void)_queue_updateHistogram:(id)a3 goalType:(int64_t)a4 activitySummary:(id)a5;
- (void)_queue_updateProjectedOffWristDateHistogram:(id)a3 activitySummary:(id)a4 activeDays:(int64_t *)a5;
- (void)_setProjectedOffWristDateToday:(id)a3;
- (void)_setSleepUserDay:(id)a3;
- (void)_updateSleepUserDay;
- (void)_waitUntilActivitySummaryLoaded;
- (void)handleUpdatedCurrentActivitySummary:(id)a3;
- (void)projectedToBeatMoveRecordByEndOfDay;
- (void)rebuildWithInterval:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sleepDataProviderLastAlarmWakeUpDateDidChange;
- (void)sleepDataProviderLastGoodMorningDismissedDateDidChange;
- (void)sleepDataProviderUserDayDidUpdate;
- (void)willCompletingMoveRingEarnStreakAchievement;
@end

@implementation FITypicalDayActivityModel

- (id)initForDateInterval:(id)a3 delegate:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F75EA8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [[FISleepDataProvider alloc] initWithSleepStore:v9 delegate:self];
  id v11 = [(FITypicalDayActivityModel *)self initForDateInterval:v8 delegate:v7 sleepDataProvider:v10];

  return v11;
}

- (id)initForDateInterval:(id)a3 delegate:(id)a4 sleepDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FITypicalDayActivityModel;
  v12 = [(FITypicalDayActivityModel *)&v23 init];
  v13 = v12;
  if (v12)
  {
    [(FITypicalDayActivityModel *)v12 setDelegate:v10];
    objc_storeStrong((id *)&v13->_interval, a3);
    objc_storeStrong((id *)&v13->_sleepDataProvider, a5);
    v13->_sleepUserDayLock._os_unfair_lock_opaque = 0;
    [(FISleepDataProvider *)v13->_sleepDataProvider activate];
    [(FITypicalDayActivityModel *)v13 _updateSleepUserDay];
    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = v13->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__FITypicalDayActivityModel_initForDateInterval_delegate_sleepDataProvider___block_invoke;
    block[3] = &unk_26441CBA0;
    v17 = v13;
    v22 = v17;
    dispatch_sync(v16, block);
    *((unsigned char *)v17 + 48) = 0;
    dispatch_group_t v18 = dispatch_group_create();
    dispatch_group_t v19 = v17[7];
    v17[7] = v18;

    dispatch_group_enter(v17[7]);
  }

  return v13;
}

uint64_t __76__FITypicalDayActivityModel_initForDateInterval_delegate_sleepDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateHistogramsAndOffWristDateForToday");
}

- (void)_updateSleepUserDay
{
  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  v4 = [(FISleepDataProvider *)self->_sleepDataProvider sleepUserDay];
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;

  os_unfair_lock_unlock(p_sleepUserDayLock);
}

- (id)sleepUserDay
{
  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  v4 = self->_sleepUserDay;
  os_unfair_lock_unlock(p_sleepUserDayLock);
  return v4;
}

- (id)startOfToday
{
  v3 = [(FITypicalDayActivityModel *)self delegate];
  v4 = [v3 currentCalendar];
  v5 = [(FITypicalDayActivityModel *)self delegate];
  v6 = [v5 currentDate];
  id v7 = [v4 startOfDayForDate:v6];

  return v7;
}

- (id)endOfToday
{
  v3 = [(FITypicalDayActivityModel *)self startOfToday];
  v4 = [(FITypicalDayActivityModel *)self delegate];
  v5 = [v4 currentCalendar];
  v6 = [v5 dateByAddingUnit:16 value:1 toDate:v3 options:0];

  return v6;
}

- (double)_queue_currentValueForHistogram:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(FITypicalDayActivityModel *)self delegate];
  v6 = [v5 currentDate];

  id v7 = [(HKActivitySummary *)self->_queue_currentActivitySummary _startDate];
  int64_t v8 = [(FITypicalDayActivityModel *)self _bucketIndexForDate:v6 startOfDay:v7 bucketDates:self->_queue_bucketDates];

  double v9 = 0.0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    [v6 timeIntervalSinceReferenceDate];
    double v13 = v12;
    uint64_t v14 = [(NSMutableArray *)self->_queue_bucketDates objectAtIndex:v8];
    [v14 timeIntervalSinceReferenceDate];
    double v11 = v13 - v15;

    if (v8 < 0 || [v4 bucketCount] < 1)
    {
      double v10 = 0.0;
    }
    else
    {
      uint64_t v16 = 0;
      do
      {
        [v4 valueForBucketAtIndex:v16];
        double v10 = v17;
        double v9 = v9 + v17;
        if (v8 == v16) {
          break;
        }
        ++v16;
      }
      while (v16 < [v4 bucketCount]);
    }
  }
  double v18 = v9 - v10 * (1.0 - v11 / (double)(60 * (0x5A0uLL / [(NSMutableArray *)self->_queue_bucketDates count])));

  return v18;
}

- (double)_percentageOfTypicalDayComparedToNowForGoal:(int64_t)a3
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__FITypicalDayActivityModel__percentageOfTypicalDayComparedToNowForGoal___block_invoke;
  block[3] = &unk_26441D1D8;
  block[5] = &v9;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __73__FITypicalDayActivityModel__percentageOfTypicalDayComparedToNowForGoal___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
      case 3:
      case 4:
        return;
      case 1:
        double v4 = MoveValueForActivitySummary(v2);
        uint64_t v5 = 24;
        goto LABEL_7;
      case 2:
        double v6 = [v2 appleExerciseTime];
        id v7 = [MEMORY[0x263F0A830] minuteUnit];
        [v6 doubleValueForUnit:v7];
        double v4 = v8;

        uint64_t v5 = 32;
LABEL_7:
        id v3 = *(id *)(*(void *)(a1 + 32) + v5);
        goto LABEL_8;
      default:
        id v3 = 0;
        double v4 = 0.0;
LABEL_8:
        id v10 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", v3);
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 / v9;

        break;
    }
  }
}

- (double)percentageOfTypicalDayMoveComparedToNow
{
  [(FITypicalDayActivityModel *)self _percentageOfTypicalDayComparedToNowForGoal:1];
  return result;
}

- (double)percentageOfTypicalDayBriskMinutesEarnedComparedToNow
{
  [(FITypicalDayActivityModel *)self _percentageOfTypicalDayComparedToNowForGoal:2];
  return result;
}

- (double)valueOfTypicalDayBriskMinutesEarnedByNow
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__FITypicalDayActivityModel_valueOfTypicalDayBriskMinutesEarnedByNow__block_invoke;
  v5[3] = &unk_26441D200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__FITypicalDayActivityModel_valueOfTypicalDayBriskMinutesEarnedByNow__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(void *)(*(void *)(a1 + 32) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)valueOfTypicalDayMoveEarnedByNow
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__FITypicalDayActivityModel_valueOfTypicalDayMoveEarnedByNow__block_invoke;
  v5[3] = &unk_26441D200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__FITypicalDayActivityModel_valueOfTypicalDayMoveEarnedByNow__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(void *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)_willCompleteGoalWithType:(int64_t)a3 bufferPercentage:(double)a4
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__FITypicalDayActivityModel__willCompleteGoalWithType_bufferPercentage___block_invoke;
  v9[3] = &unk_26441D228;
  v9[5] = &v10;
  v9[6] = a3;
  *(double *)&v9[7] = a4;
  v9[4] = self;
  dispatch_sync(queue, v9);
  LOBYTE(a3) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a3;
}

void __72__FITypicalDayActivityModel__willCompleteGoalWithType_bufferPercentage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
      case 3:
      case 4:
        return;
      case 1:
        double v6 = MoveValueForActivitySummary(v2);
        double v10 = MoveGoalValueForActivitySummary(*(void **)(*(void *)(a1 + 32) + 16));
        uint64_t v11 = 24;
        goto LABEL_7;
      case 2:
        uint64_t v3 = [v2 appleExerciseTime];
        double v4 = [MEMORY[0x263F0A830] minuteUnit];
        [v3 doubleValueForUnit:v4];
        double v6 = v5;

        id v7 = [*(id *)(*(void *)(a1 + 32) + 16) appleExerciseTimeGoal];
        uint64_t v8 = [MEMORY[0x263F0A830] minuteUnit];
        [v7 doubleValueForUnit:v8];
        double v10 = v9;

        uint64_t v11 = 32;
LABEL_7:
        id v12 = *(id *)(*(void *)(a1 + 32) + v11);
        if (v6 >= v10) {
          goto LABEL_12;
        }
        id v29 = v12;
        char v13 = [*(id *)(a1 + 32) delegate];
        uint64_t v14 = [v13 currentDate];

        double v15 = *(id **)(a1 + 32);
        uint64_t v16 = [v15[2] _startDate];
        uint64_t v17 = [v15 _bucketIndexForDate:v14 startOfDay:v16 bucketDates:*(void *)(*(void *)(a1 + 32) + 40)];

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = v17 + 1;
          uint64_t v19 = [v29 bucketCount];
          double v20 = 0.0;
          while (v18 < v19)
          {
            [v29 valueForBucketAtIndex:v18];
            double v20 = v20 + v21;
            ++v18;
            uint64_t v19 = [v29 bucketCount];
          }
          [v14 timeIntervalSinceReferenceDate];
          double v23 = v22;
          v24 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndex:v17];
          [v24 timeIntervalSinceReferenceDate];
          double v26 = v23 - v25;

          double v27 = (double)(60 * (0x5A0uLL / [*(id *)(*(void *)(a1 + 32) + 40) count]));
          [v29 valueForBucketAtIndex:v17];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6 + v20 + v28 * (1.0 - v26 / v27) >= v10 * (*(double *)(a1 + 56) + 1.0);
        }

        id v12 = v29;
        break;
      default:
        id v12 = 0;
LABEL_12:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        break;
    }
  }
}

- (BOOL)willCompleteMoveGoalWithBufferPercentage:(double)a3
{
  return [(FITypicalDayActivityModel *)self _willCompleteGoalWithType:1 bufferPercentage:a3];
}

- (BOOL)willCompleteExerciseGoalWithBufferPercentage:(double)a3
{
  return [(FITypicalDayActivityModel *)self _willCompleteGoalWithType:2 bufferPercentage:a3];
}

- (BOOL)willCompleteStandGoalOrItIsTooLateWithBufferPercentage:(double)a3
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  double v5 = [(FITypicalDayActivityModel *)self userEndOfDay];
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__FITypicalDayActivityModel_willCompleteStandGoalOrItIsTooLateWithBufferPercentage___block_invoke;
  v9[3] = &unk_26441D250;
  v9[4] = self;
  id v10 = v5;
  double v12 = a3;
  uint64_t v11 = &v13;
  id v7 = v5;
  dispatch_sync(queue, v9);
  LOBYTE(queue) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __84__FITypicalDayActivityModel_willCompleteStandGoalOrItIsTooLateWithBufferPercentage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    uint64_t v3 = [v2 delegate];
    id v30 = [v3 currentDate];

    [*(id *)(*(void *)(a1 + 32) + 16) _standHoursCompletionPercentage];
    if (v4 < 1.0)
    {
      [v30 timeIntervalSinceReferenceDate];
      double v6 = v5;
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      double v8 = v7;
      double v9 = [*(id *)(a1 + 32) delegate];
      id v10 = [v9 currentCalendar];
      uint64_t v11 = [v10 component:32 fromDate:v30];

      if (v6 >= v8)
      {
        if (v11) {
          uint64_t v18 = 24 - v11;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      else
      {
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 24;
        }
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = [*(id *)(a1 + 32) delegate];
        uint64_t v15 = [v14 currentCalendar];
        uint64_t v16 = [v15 component:32 fromDate:v13];
        if (v16) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 24;
        }

        uint64_t v18 = v17 - v12;
      }
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 16) appleStandHoursGoal];
      double v20 = [MEMORY[0x263F0A830] countUnit];
      [v19 doubleValueForUnit:v20];
      double v22 = v21;

      double v23 = [*(id *)(*(void *)(a1 + 32) + 16) appleStandHours];
      v24 = [MEMORY[0x263F0A830] countUnit];
      [v23 doubleValueForUnit:v24];
      double v26 = v25;

      uint64_t v27 = (uint64_t)(v22 - v26);
      BOOL v28 = __OFSUB__(v18, v27);
      uint64_t v29 = v18 - v27;
      if (v29 < 0 == v28 && v22 * *(double *)(a1 + 56) >= (double)v29) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- (double)currentMoveGoalPercentage
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__FITypicalDayActivityModel_currentMoveGoalPercentage__block_invoke;
  v6[3] = &unk_26441D200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__FITypicalDayActivityModel_currentMoveGoalPercentage__block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MovePercentageForActivitySummary(*(void **)(*(void *)(a1 + 32) + 16));
}

- (double)currentExerciseGoalPercentage
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__FITypicalDayActivityModel_currentExerciseGoalPercentage__block_invoke;
  v6[3] = &unk_26441D200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__FITypicalDayActivityModel_currentExerciseGoalPercentage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) _exerciseTimeCompletionPercentage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)currentStandGoalPercentage
{
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__FITypicalDayActivityModel_currentStandGoalPercentage__block_invoke;
  v6[3] = &unk_26441D200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__FITypicalDayActivityModel_currentStandGoalPercentage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) _standHoursCompletionPercentage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)willCompletingMoveRingEarnStreakAchievement
{
  uint64_t v3 = [(FITypicalDayActivityModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(FITypicalDayActivityModel *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(FITypicalDayActivityModel *)self delegate];
      if ([v6 bestMoveStreak])
      {
        uint64_t v7 = [(FITypicalDayActivityModel *)self delegate];
        unint64_t v8 = [v7 bestMoveStreak] - 1;
      }
      else
      {
        unint64_t v8 = 0;
      }

      uint64_t v10 = [(FITypicalDayActivityModel *)self delegate];
      BOOL v9 = [v10 currentMoveStreak] >= v8;

      return v9;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
    -[FITypicalDayActivityModel willCompletingMoveRingEarnStreakAchievement]();
  }
  return 0;
}

- (BOOL)projectedToBeatMoveRecordByEndOfDay
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FITypicalDayActivityModel *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_7:
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
      -[FITypicalDayActivityModel projectedToBeatMoveRecordByEndOfDay]();
    }
    return 0;
  }
  double v4 = [(FITypicalDayActivityModel *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_7;
  }
  double v6 = [(FITypicalDayActivityModel *)self delegate];
  unint64_t v7 = [v6 totalMoveGoalsAttempted];

  if (v7 >= 8)
  {
    uint64_t v11 = [(FITypicalDayActivityModel *)self delegate];
    [v11 bestMoveValue];
    double v13 = v12;

    *(void *)buf = 0;
    id v30 = buf;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v25 = 0;
    double v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v21 = 0;
    double v22 = (double *)&v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    queue = self->_queue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__FITypicalDayActivityModel_projectedToBeatMoveRecordByEndOfDay__block_invoke;
    v20[3] = &unk_26441D278;
    v20[4] = self;
    v20[5] = buf;
    v20[6] = &v25;
    v20[7] = &v21;
    dispatch_sync(queue, v20);
    double v15 = v26[3];
    double v16 = v22[3];
    double v17 = *((double *)v30 + 3);
    _HKInitializeLogging();
    double v18 = v15 - v16 + v17;
    uint64_t v19 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218240;
      double v34 = v18;
      __int16 v35 = 2048;
      double v36 = v13;
      _os_log_impl(&dword_21C74B000, v19, OS_LOG_TYPE_DEFAULT, "Projected to earn %f move credit by EOD; current record is %f",
        v33,
        0x16u);
    }
    BOOL v9 = v18 > v13;
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    unint64_t v8 = *MEMORY[0x263F098D8];
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C74B000, v8, OS_LOG_TYPE_DEFAULT, "Not projected to beat move record by EOD because too few days of Activity history to earn achievement", buf, 2u);
      return 0;
    }
  }
  return v9;
}

void __64__FITypicalDayActivityModel_projectedToBeatMoveRecordByEndOfDay__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "valueForBucketAtIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "bucketCount") - 1);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(void *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = MoveGoalValueForActivitySummary(*(void **)(*(void *)(a1 + 32) + 16));
}

- (void)rebuildWithInterval:(id)a3
{
  objc_storeStrong((id *)&self->_interval, a3);
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__FITypicalDayActivityModel_rebuildWithInterval___block_invoke;
  block[3] = &unk_26441CBA0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __49__FITypicalDayActivityModel_rebuildWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  double v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_populateHistogramsAndOffWristDateForToday");
}

- (NSString)debugDescription
{
  v32[9] = *MEMORY[0x263EF8340];
  v31[0] = @"startOfToday";
  id v30 = [(FITypicalDayActivityModel *)self startOfToday];
  uint64_t v29 = [v30 description];
  v32[0] = v29;
  v31[1] = @"endOfToday";
  uint64_t v28 = [(FITypicalDayActivityModel *)self endOfToday];
  uint64_t v27 = [v28 description];
  v32[1] = v27;
  v31[2] = @"percentageOfTypicalDayMoveComparedToNow";
  uint64_t v3 = NSNumber;
  [(FITypicalDayActivityModel *)self percentageOfTypicalDayMoveComparedToNow];
  double v26 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v25 = [v26 description];
  v32[2] = v25;
  v31[3] = @"percentageOfTypicalDayBriskMinutesEarnedComparedToNow";
  double v4 = NSNumber;
  [(FITypicalDayActivityModel *)self percentageOfTypicalDayBriskMinutesEarnedComparedToNow];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  double v6 = [v5 description];
  v32[3] = v6;
  v31[4] = @"userEndOfDay";
  unint64_t v7 = [(FITypicalDayActivityModel *)self userEndOfDay];
  uint64_t v8 = [v7 description];
  BOOL v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_26CD0B5F8;
  }
  v32[4] = v10;
  v31[5] = @"userStartOfDay";
  uint64_t v11 = [(FITypicalDayActivityModel *)self userStartOfDay];
  uint64_t v12 = [v11 description];
  double v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_26CD0B5F8;
  }
  v32[5] = v14;
  v31[6] = @"moveHistogram";
  uint64_t v15 = [(FISimpleHistogram *)self->_queue_moveHistogram descriptionArray];
  double v16 = (void *)v15;
  if (v15) {
    double v17 = (__CFString *)v15;
  }
  else {
    double v17 = &stru_26CD0B5F8;
  }
  v32[6] = v17;
  v31[7] = @"exerciseHistogram";
  uint64_t v18 = [(FISimpleHistogram *)self->_queue_exerciseHistogram descriptionArray];
  uint64_t v19 = (void *)v18;
  if (v18) {
    double v20 = (__CFString *)v18;
  }
  else {
    double v20 = &stru_26CD0B5F8;
  }
  v32[7] = v20;
  v31[8] = @"totalActiveDays";
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[FITypicalDayActivityModel totalActiveDays](self, "totalActiveDays"));
  v32[8] = v21;
  double v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:9];

  uint64_t v23 = [v22 description];

  return (NSString *)v23;
}

- (BOOL)shouldSuggestWalkWithActivitySettingsController:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__FITypicalDayActivityModel_shouldSuggestWalkWithActivitySettingsController___block_invoke;
  block[3] = &unk_26441D200;
  void block[4] = self;
  void block[5] = &v25;
  dispatch_sync(queue, block);
  if (v26[3] == 2)
  {
    _HKInitializeLogging();
    double v6 = *MEMORY[0x263F098D8];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      uint64_t v8 = "User is in move minutes mode, not suggesting walk";
LABEL_10:
      _os_log_impl(&dword_21C74B000, v6, OS_LOG_TYPE_DEFAULT, v8, v23, 2u);
      BOOL v7 = 0;
    }
  }
  else if ([v4 experienceType] == 1)
  {
    [(FITypicalDayActivityModel *)self briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:v4];
    double v10 = v9;
    uint64_t v11 = [(FITypicalDayActivityModel *)self delegate];
    uint64_t v12 = [v11 currentCalendar];
    double v13 = [(FITypicalDayActivityModel *)self delegate];
    uint64_t v14 = [v13 currentDate];
    uint64_t v15 = objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", 1, v14);
    double v16 = [(FITypicalDayActivityModel *)self delegate];
    double v17 = [v16 currentDate];
    [v15 timeIntervalSinceDate:v17];
    double v19 = v18;
    unint64_t v20 = vcvtpd_u64_f64(v10 / 60.0);

    unint64_t v21 = vcvtmd_u64_f64(v19 / 60.0);
    if (v21 >= 0x1E) {
      unint64_t v21 = 30;
    }
    BOOL v7 = v20 - 1 < v21;
  }
  else
  {
    _HKInitializeLogging();
    double v6 = *MEMORY[0x263F098D8];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      uint64_t v8 = "User is in the fitness jr. experience, not suggesting walk";
      goto LABEL_10;
    }
  }
  _Block_object_dispose(&v25, 8);

  return v7;
}

uint64_t __77__FITypicalDayActivityModel_shouldSuggestWalkWithActivitySettingsController___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) activityMoveMode];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:(id)a3
{
  id v4 = a3;
  [(FITypicalDayActivityModel *)self _waitUntilActivitySummaryLoaded];
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__FITypicalDayActivityModel_briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController___block_invoke;
  block[3] = &unk_26441D2A0;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __92__FITypicalDayActivityModel_briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) dateOfBirth];
  uint64_t v3 = [*(id *)(a1 + 40) biologicalSex];
  id v4 = [*(id *)(a1 + 40) height];
  id v5 = [*(id *)(a1 + 40) weight];
  objc_msgSend(v2, "_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:biologicalSex:height:weight:wheelchairUse:experienceType:", v7, v3, v4, v5, objc_msgSend(*(id *)(a1 + 40), "wheelchairUse"), objc_msgSend(*(id *)(a1 + 40), "experienceType"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

- (double)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 height:(id)a5 weight:(id)a6 wheelchairUse:(int64_t)a7 experienceType:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if ([(HKActivitySummary *)self->_queue_currentActivitySummary activityMoveMode] == HKActivityMoveModeAppleMoveTime)
  {
    _HKInitializeLogging();
    double v17 = *MEMORY[0x263F098D8];
    double v18 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v69) = 0;
      double v19 = "Not computing brisk walk time for user in move minutes mode.";
LABEL_22:
      _os_log_impl(&dword_21C74B000, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v69, 2u);
    }
  }
  else if (a8 == 1)
  {
    if ([(HKActivitySummary *)self->_queue_currentActivitySummary _hasEnergyBurnedGoal])
    {
      unint64_t v20 = [(HKActivitySummary *)self->_queue_currentActivitySummary activeEnergyBurnedGoal];
      unint64_t v21 = [MEMORY[0x263F0A830] smallCalorieUnit];
      [v20 doubleValueForUnit:v21];
      double v23 = v22;

      uint64_t v24 = [(HKActivitySummary *)self->_queue_currentActivitySummary activeEnergyBurned];
      uint64_t v25 = [MEMORY[0x263F0A830] smallCalorieUnit];
      [v24 doubleValueForUnit:v25];
      double v27 = v26;

      if (v23 - v27 >= 0.0) {
        double v28 = v23 - v27;
      }
      else {
        double v28 = 0.0;
      }
      uint64_t v29 = [(FITypicalDayActivityModel *)self delegate];
      id v30 = [v29 currentDate];
      uint64_t v31 = [(FITypicalDayActivityModel *)self delegate];
      uint64_t v32 = [v31 currentCalendar];
      uint64_t v33 = FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar((uint64_t)v14, (uint64_t)v30, v32);

      BOOL v34 = a4 != 2;
      __int16 v35 = [MEMORY[0x263F0A830] meterUnit];
      [v15 doubleValueForUnit:v35];
      double v37 = v36;

      v38 = [MEMORY[0x263F0A830] gramUnitWithMetricPrefix:9];
      [v16 doubleValueForUnit:v38];
      double v40 = v39;

      uint64_t v41 = FICMotionConditionForWheelchairUse(a7);
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2050000000;
      v42 = (void *)getCMCalorieUserInfoClass_softClass;
      uint64_t v77 = getCMCalorieUserInfoClass_softClass;
      if (!getCMCalorieUserInfoClass_softClass)
      {
        uint64_t v69 = MEMORY[0x263EF8330];
        uint64_t v70 = 3221225472;
        v71 = __getCMCalorieUserInfoClass_block_invoke;
        v72 = &unk_26441D318;
        v73 = &v74;
        __getCMCalorieUserInfoClass_block_invoke((uint64_t)&v69);
        v42 = (void *)v75[3];
      }
      v43 = v42;
      _Block_object_dispose(&v74, 8);
      v44 = (void *)[[v43 alloc] initWithAge:v34 gender:v41 height:(double)v33 weight:v37 condition:v40];
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x2050000000;
      v45 = (void *)getCMNatalimeterClass_softClass;
      uint64_t v77 = getCMNatalimeterClass_softClass;
      if (!getCMNatalimeterClass_softClass)
      {
        uint64_t v69 = MEMORY[0x263EF8330];
        uint64_t v70 = 3221225472;
        v71 = __getCMNatalimeterClass_block_invoke;
        v72 = &unk_26441D318;
        v73 = &v74;
        __getCMNatalimeterClass_block_invoke((uint64_t)&v69);
        v45 = (void *)v75[3];
      }
      id v46 = v45;
      _Block_object_dispose(&v74, 8);
      v47 = [NSNumber numberWithDouble:v28];
      [v46 computeTimeToActiveCalories:v47 user:v44 workoutType:1];
      double v49 = v48;

      _HKInitializeLogging();
      v50 = (os_log_t *)MEMORY[0x263F098D8];
      v51 = *MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEBUG)) {
        [(FITypicalDayActivityModel *)v51 _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:v53 biologicalSex:v54 height:v55 weight:v56 wheelchairUse:v57 experienceType:v58];
      }
      _HKInitializeLogging();
      v59 = *v50;
      BOOL v60 = os_log_type_enabled(*v50, OS_LOG_TYPE_DEBUG);
      if (v49 >= 1200.0)
      {
        double v18 = ceil(v49 / 300.0) * 300.0;
        if (v60) {
          [(FITypicalDayActivityModel *)v59 _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:v62 biologicalSex:v63 height:v64 weight:v65 wheelchairUse:v66 experienceType:v67];
        }
      }
      else
      {
        double v18 = ceil(v49 / 60.0) * 60.0;
        if (v60) {
          [(FITypicalDayActivityModel *)v59 _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:v62 biologicalSex:v63 height:v64 weight:v65 wheelchairUse:v66 experienceType:v67];
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      double v17 = *MEMORY[0x263F098D8];
      double v18 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v69) = 0;
        double v19 = "Not computing brisk walk time because activity summary has no energy burned goal set.";
        goto LABEL_22;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    double v17 = *MEMORY[0x263F098D8];
    double v18 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v69) = 0;
      double v19 = "Not computing brisk walk time for user in the fitness jr. experience.";
      goto LABEL_22;
    }
  }

  return v18;
}

- (id)userStartOfDay
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (id v6 = objc_loadWeakRetained((id *)p_delegate),
        [v6 clientProvidedUserStartOfDay],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    os_unfair_lock_lock(&self->_sleepUserDayLock);
    id v7 = [(FISleepUserDay *)self->_sleepUserDay startOfDay];
    os_unfair_lock_unlock(&self->_sleepUserDayLock);
    if (!v7)
    {
      uint64_t v8 = [(FITypicalDayActivityModel *)self delegate];
      id v7 = [v8 firstOnWristDateToday];
    }
  }
  return v7;
}

- (id)userEndOfDay
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FITypicalDayActivityModel *)self delegate];
  id v4 = [v3 currentDate];

  char v5 = [(FITypicalDayActivityModel *)self delegate];
  id v6 = [v5 currentCalendar];

  id v7 = objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v4);
  uint64_t v8 = [(FITypicalDayActivityModel *)self userStartOfDay];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || (id v12 = objc_loadWeakRetained((id *)&self->_delegate),
        [v12 clientProvidedUserEndOfDay],
        double v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    os_unfair_lock_lock(&self->_sleepUserDayLock);
    double v13 = [(FISleepUserDay *)self->_sleepUserDay endOfDay];
    os_unfair_lock_unlock(&self->_sleepUserDayLock);
  }
  if (objc_msgSend(v13, "hk_isAfterDate:", v7))
  {
    id v14 = v7;

    double v13 = v14;
  }
  if (!v13)
  {
    double v13 = [(FITypicalDayActivityModel *)self projectedOffWrist];
    if (!v13)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)p_delegate);
        double v13 = [v17 clientProvidedDefaultEndOfDay];
      }
      else
      {
        double v18 = [v8 dateByAddingTimeInterval:43200.0];
        double v13 = [v7 earlierDate:v18];

        _HKInitializeLogging();
        double v19 = *MEMORY[0x263F098D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          double v22 = v13;
          _os_log_impl(&dword_21C74B000, v19, OS_LOG_TYPE_DEFAULT, "Projected off wrist date is nil, using earliest of default day length or midnight: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }

  return v13;
}

- (id)projectedOffWrist
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__FITypicalDayActivityModel_projectedOffWrist__block_invoke;
  v5[3] = &unk_26441D200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__FITypicalDayActivityModel_projectedOffWrist__block_invoke(uint64_t a1)
{
}

- (double)projectedDayDuration
{
  id v3 = [(FITypicalDayActivityModel *)self userStartOfDay];
  id v4 = [(FITypicalDayActivityModel *)self userEndOfDay];
  char v5 = v4;
  double v6 = 43200.0;
  if (v3 && v4)
  {
    [v4 timeIntervalSinceDate:v3];
    double v6 = v7;
  }

  return v6;
}

- (BOOL)isSleepAlarmEnabledForToday
{
  uint64_t v2 = [(FISleepDataProvider *)self->_sleepDataProvider sleepUserDay];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_goodMorningAlertDismissedDateForToday
{
  BOOL v3 = [(FISleepDataProvider *)self->_sleepDataProvider lastGoodMorningDismissedDate];
  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  char v5 = [(FISleepUserDay *)self->_sleepUserDay startOfDay];
  int v6 = objc_msgSend(v3, "hk_isAfterOrEqualToDate:", v5);

  os_unfair_lock_unlock(p_sleepUserDayLock);
  if (v6) {
    double v7 = v3;
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)userWakeUpDateForToday
{
  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  id v4 = [(FISleepUserDay *)self->_sleepUserDay startOfDay];
  os_unfair_lock_unlock(p_sleepUserDayLock);
  if (![(FISleepDataProvider *)self->_sleepDataProvider isGoodMorningAlertNotificationEnabled]|| ([(FITypicalDayActivityModel *)self _goodMorningAlertDismissedDateForToday], (char v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v5 = [(FISleepDataProvider *)self->_sleepDataProvider lastAlarmWakeUpDate];
  }
  char v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", v4);
  double v7 = v5;
  if ((v6 & 1) == 0)
  {
    if ([(FISleepDataProvider *)self->_sleepDataProvider isUserAwake]) {
      double v7 = v4;
    }
    else {
      double v7 = 0;
    }
  }
  id v8 = v7;

  return v8;
}

- (void)handleUpdatedCurrentActivitySummary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke;
  v7[3] = &unk_26441CE08;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && ([v2 _isDataLoading] & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (!*(void *)(v5 + 16))
    {
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 56));
      uint64_t v5 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(v5 + 16), *(id *)(a1 + 32));
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke_2;
    block[3] = &unk_26441CBA0;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(v6, block);
  }
  else
  {
    _HKInitializeLogging();
    BOOL v3 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_21C74B000, v3, OS_LOG_TYPE_DEFAULT, "Activity Summary (%@) is still loading.", buf, 0xCu);
    }
  }
}

void __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"FITypicalDayActivityModelTodayActivityDidChange" object:*(void *)(a1 + 32)];
}

- (void)sleepDataProviderUserDayDidUpdate
{
  [(FITypicalDayActivityModel *)self _updateSleepUserDay];
  BOOL v3 = [(FITypicalDayActivityModel *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(FITypicalDayActivityModel *)self delegate];
    [v5 typicalDayActivityModelDidUpdate];
  }
}

- (void)sleepDataProviderLastGoodMorningDismissedDateDidChange
{
  BOOL v3 = [(FITypicalDayActivityModel *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(FITypicalDayActivityModel *)self delegate];
    [v5 typicalDayActivityModelDidUpdate];
  }
}

- (void)sleepDataProviderLastAlarmWakeUpDateDidChange
{
  BOOL v3 = [(FITypicalDayActivityModel *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(FITypicalDayActivityModel *)self delegate];
    [v5 typicalDayActivityModelDidUpdate];
  }
}

- (id)currentDate
{
  id v2 = [(FITypicalDayActivityModel *)self delegate];
  BOOL v3 = [v2 currentDate];

  return v3;
}

- (id)currentCalendar
{
  id v2 = [(FITypicalDayActivityModel *)self delegate];
  BOOL v3 = [v2 currentCalendar];

  return v3;
}

- (void)_waitUntilActivitySummaryLoaded
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_21C74B000, v0, OS_LOG_TYPE_DEBUG, "Waiting for initial activity summary to load", v1, 2u);
}

+ (id)_emptySimpleHistogram
{
  id v2 = [FISimpleHistogram alloc];
  BOOL v3 = [(FISimpleHistogram *)v2 initWithNumberOfBuckets:0x5A0uLL / *MEMORY[0x263F0AC90]];
  return v3;
}

- (void)_queue_updateHistogram:(id)a3 goalType:(int64_t)a4 activitySummary:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((unint64_t)a4 <= 4 && ((1 << a4) & 0x19) != 0)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v55 = a4;
      _os_log_impl(&dword_21C74B000, v10, OS_LOG_TYPE_DEFAULT, "Cannot build histogram for goal type %lu", buf, 0xCu);
    }
    goto LABEL_36;
  }
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEBUG)) {
    -[FITypicalDayActivityModel _queue_updateHistogram:goalType:activitySummary:](v11, v9, a4);
  }
  if (a4 == 2)
  {
    id v12 = [v9 _dailyBriskMinutesStatistics];
    uint64_t v13 = [MEMORY[0x263F0A830] minuteUnit];
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    id v12 = MoveStatisticsForActivitySummary(v9);
    uint64_t v13 = UnitForMoveGoal((void *)[v9 activityMoveMode]);
LABEL_11:
    v47 = (void *)v13;
    goto LABEL_13;
  }
  v47 = 0;
  id v12 = 0;
LABEL_13:
  if ([v12 count] && v47)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v15 = [v9 _startDate];
    if ([v8 bucketCount] >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        id v17 = [(FITypicalDayActivityModel *)self _bucketDateForIndex:v16 startOfDay:v15];
        [v14 addObject:v17];

        ++v16;
      }
      while (v16 < [v8 bucketCount]);
    }
    int64_t v42 = a4;
    v44 = v8;
    id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v43 = v12;
    id obj = v12;
    uint64_t v18 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v46 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v46) {
            objc_enumerationMutation(obj);
          }
          int v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          double v22 = (void *)MEMORY[0x21D4AFB50]();
          uint64_t v23 = [v21 startDate];
          int64_t v24 = [(FITypicalDayActivityModel *)self _bucketIndexForDate:v23 startOfDay:v15 bucketDates:v14];
          uint64_t v25 = v15;
          id v26 = v14;
          double v27 = self;
          int64_t v28 = v24;

          uint64_t v29 = [v21 quantityValue];
          [v29 doubleValueForUnit:v47];
          double v31 = v30;

          uint64_t v32 = [NSNumber numberWithDouble:v31];
          int64_t v33 = v28;
          self = v27;
          id v14 = v26;
          id v15 = v25;
          BOOL v34 = [NSNumber numberWithInteger:v33];
          [v48 setObject:v32 forKey:v34];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v19);
    }

    __int16 v35 = v48;
    double v36 = [v48 objectForKeyedSubscript:&unk_26CD12450];

    if (v36)
    {
      _HKInitializeLogging();
      double v37 = (void *)*MEMORY[0x263F098D8];
      id v8 = v44;
      id v12 = v43;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[FITypicalDayActivityModel _queue_updateHistogram:goalType:activitySummary:](v37, v9);
      }
    }
    else
    {
      id v8 = v44;
      id v12 = v43;
      if ([v44 bucketCount] >= 1)
      {
        uint64_t v38 = 0;
        do
        {
          double v39 = objc_msgSend(NSNumber, "numberWithInteger:", v38, v42);
          uint64_t v40 = [v35 objectForKey:v39];

          if (v40) {
            uint64_t v41 = (void *)v40;
          }
          else {
            uint64_t v41 = &unk_26CD12560;
          }
          __int16 v35 = v48;
          [v41 doubleValue];
          objc_msgSend(v44, "addValue:toBucketAtIndex:", v38);

          ++v38;
        }
        while (v38 < [v44 bucketCount]);
      }
    }
  }
LABEL_36:
}

- (void)_queue_updateProjectedOffWristDateHistogram:(id)a3 activitySummary:(id)a4 activeDays:(int64_t *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = MoveStatisticsForActivitySummary(v9);
  id v11 = (void *)MEMORY[0x263F08A98];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __100__FITypicalDayActivityModel__queue_updateProjectedOffWristDateHistogram_activitySummary_activeDays___block_invoke;
  v29[3] = &unk_26441D2C8;
  id v12 = v9;
  id v30 = v12;
  uint64_t v13 = [v11 predicateWithBlock:v29];
  id v14 = [v10 filteredArrayUsingPredicate:v13];

  if ([v14 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v16 = [v12 _startDate];
    if ([v8 bucketCount] >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        uint64_t v18 = [(FITypicalDayActivityModel *)self _bucketDateForIndex:v17 startOfDay:v16];
        [v15 addObject:v18];

        ++v17;
      }
      while (v17 < [v8 bucketCount]);
    }
    uint64_t v19 = [v14 lastObject];
    unint64_t v20 = [v19 startDate];
    int64_t v21 = [(FITypicalDayActivityModel *)self _bucketIndexForDate:v20 startOfDay:v16 bucketDates:v15];

    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _HKInitializeLogging();
      double v22 = (void *)*MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[FITypicalDayActivityModel _queue_updateProjectedOffWristDateHistogram:activitySummary:activeDays:](v22, v12, v19);
      }
    }
    else
    {
      ++*a5;
      _HKInitializeLogging();
      uint64_t v23 = (void *)*MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        log = v23;
        double v27 = [v12 _startDate];
        int64_t v24 = [v19 startDate];
        *(_DWORD *)buf = 134218498;
        int64_t v32 = v21;
        __int16 v33 = 2114;
        BOOL v34 = v27;
        __int16 v35 = 2114;
        double v36 = v24;
        _os_log_impl(&dword_21C74B000, log, OS_LOG_TYPE_DEFAULT, "Last active index: %ld, for start date: %{public}@, object date: %{public}@", buf, 0x20u);
      }
      if ((v21 & 0x8000000000000000) == 0)
      {
        uint64_t v25 = 0;
        int64_t v26 = v21 + 1;
        do
          [v8 addValue:v25++ toBucketAtIndex:1.0];
        while (v26 != v25);
      }
    }
  }
}

BOOL __100__FITypicalDayActivityModel__queue_updateProjectedOffWristDateHistogram_activitySummary_activeDays___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 quantityValue];
  char v4 = UnitForMoveGoal((void *)[*(id *)(a1 + 32) activityMoveMode]);
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  return v6 >= 1.0;
}

- (id)_queue_calculateProjectedOffWristDateFromHistogram:(id)a3 activeDays:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((unint64_t)a4 < 7)
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C74B000, v11, OS_LOG_TYPE_DEFAULT, "Not enough activity data to predict off wrist time", buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = [v6 bucketCount];
    while (v7-- >= 1)
    {
      if ((double)a4 * 0.5 <= (double)[v6 numberOfValuesInBucketAtIndex:v7])
      {
        id v9 = [(FITypicalDayActivityModel *)self startOfToday];
        uint64_t v10 = [(FITypicalDayActivityModel *)self _bucketDateForIndex:v7 + 1 startOfDay:v9];

        goto LABEL_9;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_9:
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __91__FITypicalDayActivityModel__queue_calculateProjectedOffWristDateFromHistogram_activeDays___block_invoke;
  v13[3] = &unk_26441CB78;
  v13[4] = self;
  v13[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  return v10;
}

uint64_t __91__FITypicalDayActivityModel__queue_calculateProjectedOffWristDateFromHistogram_activeDays___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80) = *(void *)(result + 40);
  return result;
}

- (int64_t)totalActiveDays
{
  if ([MEMORY[0x263F08B88] isMainThread]) {
    return self->_totalActiveDays;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__FITypicalDayActivityModel_totalActiveDays__block_invoke;
  v5[3] = &unk_26441D200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(MEMORY[0x263EF83A0], v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__FITypicalDayActivityModel_totalActiveDays__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)_queue_populateHistogramsAndOffWristDateForToday
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Error enumerating activity summaries %{public}@", (uint8_t *)&v2, 0xCu);
}

void __77__FITypicalDayActivityModel__queue_populateHistogramsAndOffWristDateForToday__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 activityMoveMode] == *(void *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistogram:goalType:activitySummary:", *(void *)(a1 + 40), 1, v3);
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistogram:goalType:activitySummary:", *(void *)(a1 + 48), 2, v3);
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateProjectedOffWristDateHistogram:activitySummary:activeDays:", *(void *)(a1 + 56), v3, *(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
}

- (BOOL)_queue_enumerateActivitySummariesOrderedByCacheIndexWithCalendar:(id)a3 error:(id *)a4 handler:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v11 = *MEMORY[0x263F0AC18];
  id v12 = [(NSDateInterval *)self->_interval startDate];
  uint64_t v13 = [v10 components:v11 fromDate:v12];

  id v14 = [(NSDateInterval *)self->_interval endDate];
  id v15 = [v10 components:v11 fromDate:v14];

  uint64_t v16 = [(FITypicalDayActivityModel *)self delegate];
  LOBYTE(a4) = [v16 enumerateActivitySummariesFromDateComponents:v13 toDateComponents:v15 error:a4 handler:v9];

  return (char)a4;
}

- (id)_bucketDateForIndex:(unint64_t)a3 startOfDay:(id)a4
{
  return (id)[a4 dateByAddingTimeInterval:(double)(60 * a3 * *MEMORY[0x263F0AC90])];
}

- (int64_t)_bucketIndexForDate:(id)a3 startOfDay:(id)a4 bucketDates:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    unint64_t v12 = 0;
    *(void *)&long long v11 = 138544130;
    long long v21 = v11;
    do
    {
      uint64_t v13 = objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v21);
      unint64_t v14 = v12 + 1;
      if (v12 >= [v10 count] - 1) {
        [(FITypicalDayActivityModel *)self _bucketDateForIndex:v12 + 1 startOfDay:v9];
      }
      else {
      uint64_t v15 = [v10 objectAtIndexedSubscript:v12 + 1];
      }
      uint64_t v16 = (void *)v15;
      if (v13 && v15)
      {
        if ([v13 compare:v15] == 1)
        {
          _HKInitializeLogging();
          uint64_t v17 = *MEMORY[0x263F098D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            uint64_t v23 = v13;
            __int16 v24 = 2114;
            uint64_t v25 = v16;
            __int16 v26 = 2114;
            id v27 = v10;
            __int16 v28 = 2048;
            unint64_t v29 = v12;
            _os_log_impl(&dword_21C74B000, v17, OS_LOG_TYPE_DEFAULT, "TypicalDayModel: binDate later than nextDate! %{public}@, %{public}@, %{public}@, %ld", buf, 0x2Au);
          }
        }
        else
        {
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:v16];
          char v19 = [v18 containsDate:v8];

          if (v19)
          {

            goto LABEL_14;
          }
        }
      }

      ++v12;
    }
    while (v14 < [v10 count]);
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v12;
}

- (void)_setSleepUserDay:(id)a3
{
  uint64_t v4 = (FISleepUserDay *)a3;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;

  os_unfair_lock_unlock(&self->_sleepUserDayLock);
}

- (void)_setProjectedOffWristDateToday:(id)a3
{
}

- (id)_sleepDataProvider
{
  return self->_sleepDataProvider;
}

- (FITypicalDayActivityModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FITypicalDayActivityModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sleepUserDay, 0);
  objc_storeStrong((id *)&self->_sleepDataProvider, 0);
  objc_storeStrong((id *)&self->_projectedOffWristDateToday, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activitySummaryBarrierGroup, 0);
  objc_storeStrong((id *)&self->_queue_bucketDates, 0);
  objc_storeStrong((id *)&self->_queue_exerciseHistogram, 0);
  objc_storeStrong((id *)&self->_queue_moveHistogram, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

- (void)willCompletingMoveRingEarnStreakAchievement
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_21C74B000, v0, OS_LOG_TYPE_ERROR, "TypicalDayActivityModel cannot answer achievements question because delegate does not implement necessary achievements methods: 'bestMoveStreak' & 'currentMoveStreak'", v1, 2u);
}

- (void)projectedToBeatMoveRecordByEndOfDay
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_21C74B000, v0, OS_LOG_TYPE_ERROR, "TypicalDayActivityModel cannot answer achievements question because delegate does not implement necessary achievements methods: 'totalMoveGoalsAttempted' & 'bestMoveValue'", v1, 2u);
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21C74B000, a1, a3, "Walk is under 20 minutes, returning rounded to nearest 1 minute: %f", a5, a6, a7, a8, 0);
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21C74B000, a1, a3, "Walk is over 20 minutes, returning rounded to nearest 5 minutes: %f", a5, a6, a7, a8, 0);
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_updateHistogram:(void *)a1 goalType:(void *)a2 activitySummary:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 _startDate];
  OUTLINED_FUNCTION_2_1(&dword_21C74B000, v5, v6, "Skipping summary with start date %{public}@ for ring type %lu because it has more data then we have buckets (over 24 hour day)", v7, v8, v9, v10, 2u);
}

- (void)_queue_updateHistogram:(void *)a1 goalType:(void *)a2 activitySummary:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 _startDate];
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEBUG, "Building typical-day histogram (goaltype=%lu) with activity summary for date: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_queue_updateProjectedOffWristDateHistogram:(void *)a1 activitySummary:(void *)a2 activeDays:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 _startDate];
  uint64_t v13 = [a3 startDate];
  OUTLINED_FUNCTION_2_1(&dword_21C74B000, v7, v8, "Last active index is NOT FOUND, for start date: %{public}@, object date: %{public}@", v9, v10, v11, v12, 2u);
}

@end