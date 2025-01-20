@interface HDSleepPeriodArrayBuilder
- (HDSleepPeriodArrayBuilder)initWithInfo:(id)a3 options:(unint64_t)a4;
- (id)_createPeriodAndReset;
- (id)finish;
- (void)addOrderedSegment:(id)a3;
@end

@implementation HDSleepPeriodArrayBuilder

- (HDSleepPeriodArrayBuilder)initWithInfo:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSleepPeriodArrayBuilder;
  v8 = [(HDSleepPeriodArrayBuilder *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_info, a3);
    v9->_options = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    periods = v9->_periods;
    v9->_periods = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentPeriodSegments = v9->_currentPeriodSegments;
    v9->_currentPeriodSegments = v12;

    v9->_currentUserSetScheduleIndex = 0;
  }

  return v9;
}

- (void)addOrderedSegment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v28 = v4;
  if (self)
  {
    id v5 = v4;
    if (self->_currentPeriodEndDate)
    {
      v6 = [v4 dateInterval];
      id v7 = [v6 startDate];
      [v7 timeIntervalSinceDate:self->_currentPeriodEndDate];
      double v9 = v8;

      id v5 = v28;
      if (v9 >= 3600.0)
      {
        unint64_t currentUserSetScheduleIndex = self->_currentUserSetScheduleIndex;
        id v5 = v28;
        while (1)
        {
          unint64_t v11 = self->_currentUserSetScheduleIndex;
          v12 = [(HDSleepPeriodInfo *)self->_info userSetSchedules];
          unint64_t v13 = [v12 count];

          if (v11 >= v13)
          {
            unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_10;
          }
          v14 = [(HDSleepPeriodInfo *)self->_info userSetSchedules];
          objc_super v15 = [v14 objectAtIndexedSubscript:self->_currentUserSetScheduleIndex];

          v16 = [v5 dateInterval];
          int v17 = [v15 intersectsDateInterval:v16];

          unint64_t v18 = self->_currentUserSetScheduleIndex;
          if (v17) {
            break;
          }
          self->_unint64_t currentUserSetScheduleIndex = v18 + 1;
        }
LABEL_10:

        if (v18 != currentUserSetScheduleIndex)
        {

          periods = self->_periods;
          -[HDSleepPeriodArrayBuilder _createPeriodAndReset]((uint64_t)self);
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          [(NSMutableArray *)periods hk_addNonNilObject:v5];
        }
      }
    }
  }

  v20 = [v28 dateInterval];
  v21 = [v20 endDate];
  HKDateMax();
  v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentPeriodEndDate = self->_currentPeriodEndDate;
  self->_currentPeriodEndDate = v22;

  v24 = [v28 dateInterval];
  v25 = [v24 startDate];
  HKDateMin();
  v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentPeriodStartDate = self->_currentPeriodStartDate;
  self->_currentPeriodStartDate = v26;

  if ([v28 category] != 2 || (self->_options & 1) != 0) {
    [(NSMutableArray *)self->_currentPeriodSegments addObject:v28];
  }
}

- (id)_createPeriodAndReset
{
  if (a1 && *(void *)(a1 + 40) && *(void *)(a1 + 48) && [*(id *)(a1 + 32) count])
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48)];
    v3 = [MEMORY[0x1E4F2B540] sleepPeriodWithDateInterval:v2 segments:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v6;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)finish
{
  periods = self->_periods;
  id v4 = -[HDSleepPeriodArrayBuilder _createPeriodAndReset]((uint64_t)self);
  [(NSMutableArray *)periods hk_addNonNilObject:v4];

  id v5 = (void *)[(NSMutableArray *)self->_periods copy];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPeriodEndDate, 0);
  objc_storeStrong((id *)&self->_currentPeriodStartDate, 0);
  objc_storeStrong((id *)&self->_currentPeriodSegments, 0);
  objc_storeStrong((id *)&self->_periods, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end