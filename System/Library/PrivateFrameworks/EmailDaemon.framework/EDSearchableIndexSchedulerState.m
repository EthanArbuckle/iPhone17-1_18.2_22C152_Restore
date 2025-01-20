@interface EDSearchableIndexSchedulerState
- (BOOL)_isIndexingEnabledByActivitiesOrTasks;
- (BOOL)hasAvailableIndexingBudget;
- (BOOL)isDataSourceIndexingPermitted;
- (BOOL)isIndexingEnabledByActivities;
- (BOOL)isIndexingEnabledForActivityType:(id)a3;
- (BOOL)isIndexingEnabledForTaskType:(id)a3;
- (BOOL)needsToStopBudgetedIndexing;
- (EDSearchableIndexSchedulerState)initWithBudgetedTimeRemaining:(double)a3;
- (NSDictionary)powerEventData;
- (NSSet)indexingEnabledForActivityTypes;
- (NSSet)indexingEnabledForTaskTypes;
- (double)budgetedTimeRemaining;
- (double)fastPassIndexingTime;
- (double)maintenanceIndexingTime;
- (double)otherIndexingTime;
- (int64_t)budgetedItemCountRemaining;
- (int64_t)fastPassIndexedItemCount;
- (void)didIndexForTime:(double)a3;
- (void)didIndexItemCount:(int64_t)a3;
- (void)disableIndexingForActivityType:(id)a3;
- (void)disableIndexingForTaskType:(id)a3;
- (void)enableIndexingForActivityType:(id)a3;
- (void)enableIndexingForTaskType:(id)a3;
- (void)setBudgetedItemCountRemaining:(int64_t)a3;
- (void)setBudgetedTimeRemaining:(double)a3;
- (void)setDataSourceIndexingPermitted:(BOOL)a3;
- (void)setFastPassIndexingTime:(double)a3;
- (void)setMaintenanceIndexingTime:(double)a3;
- (void)setOtherIndexingTime:(double)a3;
@end

@implementation EDSearchableIndexSchedulerState

- (BOOL)hasAvailableIndexingBudget
{
  if ([(EDSearchableIndexSchedulerState *)self budgetedItemCountRemaining] > 0) {
    return 1;
  }

  return [(EDSearchableIndexSchedulerState *)self isDataSourceIndexingPermitted];
}

- (int64_t)budgetedItemCountRemaining
{
  return self->_budgetedItemCountRemaining;
}

- (void)setOtherIndexingTime:(double)a3
{
  self->_otherIndexingTime = a3;
}

- (BOOL)needsToStopBudgetedIndexing
{
  [(EDSearchableIndexSchedulerState *)self budgetedTimeRemaining];
  if (v3 > 0.0) {
    return 0;
  }

  return [(EDSearchableIndexSchedulerState *)self isIndexingEnabledForActivityType:@"budgeted"];
}

- (double)budgetedTimeRemaining
{
  return self->_budgetedTimeRemaining;
}

- (NSDictionary)powerEventData
{
  v41[4] = *MEMORY[0x1E4F143B8];
  v40[0] = @"budgetedTimeRemaining";
  double v3 = NSNumber;
  [(EDSearchableIndexSchedulerState *)self budgetedTimeRemaining];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v41[0] = v4;
  v40[1] = @"budgetedItemCountRemaining";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDSearchableIndexSchedulerState budgetedItemCountRemaining](self, "budgetedItemCountRemaining"));
  v41[1] = v5;
  v40[2] = @"maintenanceIndexingTime";
  v6 = NSNumber;
  [(EDSearchableIndexSchedulerState *)self maintenanceIndexingTime];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v41[2] = v7;
  v40[3] = @"extraIndexingTime";
  v8 = NSNumber;
  [(EDSearchableIndexSchedulerState *)self otherIndexingTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v41[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
  v11 = (void *)[v10 mutableCopy];

  [(EDSearchableIndexSchedulerState *)self fastPassIndexingTime];
  if (v12 != 0.0)
  {
    v13 = NSNumber;
    [(EDSearchableIndexSchedulerState *)self fastPassIndexingTime];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v11 setObject:v14 forKeyedSubscript:@"fastPassIndexingTime"];
  }
  if ([(EDSearchableIndexSchedulerState *)self fastPassIndexedItemCount])
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDSearchableIndexSchedulerState fastPassIndexedItemCount](self, "fastPassIndexedItemCount"));
    [v11 setObject:v15 forKeyedSubscript:@"fastPassIndexedItemCount"];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v16 = +[EDSearchableIndexScheduler activityTypes];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        BOOL v21 = [(EDSearchableIndexSchedulerState *)self isIndexingEnabledForActivityType:v20];
        v22 = [NSNumber numberWithBool:v21];
        [v11 setObject:v22 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v17);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = +[EDSearchableIndexScheduler taskTypes];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v31;
    uint64_t v26 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if ([(EDSearchableIndexSchedulerState *)self isIndexingEnabledForTaskType:v28])
        {
          [v11 setObject:v26 forKeyedSubscript:v28];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }

  return (NSDictionary *)v11;
}

- (double)maintenanceIndexingTime
{
  return self->_maintenanceIndexingTime;
}

- (double)fastPassIndexingTime
{
  return self->_fastPassIndexingTime;
}

- (int64_t)fastPassIndexedItemCount
{
  return self->_fastPassIndexedItemCount;
}

- (void)didIndexForTime:(double)a3
{
  if ([(EDSearchableIndexSchedulerState *)self isIndexingEnabledForActivityType:@"maintenance"])
  {
    [(EDSearchableIndexSchedulerState *)self maintenanceIndexingTime];
    [(EDSearchableIndexSchedulerState *)self setMaintenanceIndexingTime:v5 + a3];
  }
  else if ([(EDSearchableIndexSchedulerState *)self isIndexingEnabledForActivityType:@"budgeted"])
  {
    [(EDSearchableIndexSchedulerState *)self budgetedTimeRemaining];
    [(EDSearchableIndexSchedulerState *)self setBudgetedTimeRemaining:v6 - a3];
  }
  if ([(EDSearchableIndexSchedulerState *)self isIndexingEnabledForTaskType:@"fastpass"])
  {
    [(EDSearchableIndexSchedulerState *)self fastPassIndexingTime];
    [(EDSearchableIndexSchedulerState *)self setFastPassIndexingTime:v7 + a3];
  }
  if (![(EDSearchableIndexSchedulerState *)self _isIndexingEnabledByActivitiesOrTasks])
  {
    [(EDSearchableIndexSchedulerState *)self otherIndexingTime];
    double v9 = v8 + a3;
    [(EDSearchableIndexSchedulerState *)self setOtherIndexingTime:v9];
  }
}

- (BOOL)isIndexingEnabledForActivityType:(id)a3
{
  id v4 = a3;
  double v5 = [(EDSearchableIndexSchedulerState *)self indexingEnabledForActivityTypes];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)indexingEnabledForActivityTypes
{
  return &self->_indexingEnabledForActivityTypes->super;
}

- (double)otherIndexingTime
{
  return self->_otherIndexingTime;
}

- (BOOL)_isIndexingEnabledByActivitiesOrTasks
{
  double v3 = [(EDSearchableIndexSchedulerState *)self indexingEnabledForActivityTypes];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(EDSearchableIndexSchedulerState *)self indexingEnabledForTaskTypes];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)isIndexingEnabledForTaskType:(id)a3
{
  id v4 = a3;
  double v5 = [(EDSearchableIndexSchedulerState *)self indexingEnabledForTaskTypes];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)indexingEnabledForTaskTypes
{
  return &self->_indexingEnabledForTaskTypes->super;
}

- (EDSearchableIndexSchedulerState)initWithBudgetedTimeRemaining:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EDSearchableIndexSchedulerState;
  id v4 = [(EDSearchableIndexSchedulerState *)&v10 init];
  if (v4)
  {
    double v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    indexingEnabledForActivityTypes = v4->_indexingEnabledForActivityTypes;
    v4->_indexingEnabledForActivityTypes = v5;

    double v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    indexingEnabledForTaskTypes = v4->_indexingEnabledForTaskTypes;
    v4->_indexingEnabledForTaskTypes = v7;

    v4->_budgetedItemCountRemaining = 0;
    v4->_budgetedTimeRemaining = a3;
    *(_OWORD *)&v4->_otherIndexingTime = 0u;
    *(_OWORD *)&v4->_fastPassIndexedItemCount = 0u;
  }
  return v4;
}

- (void)setDataSourceIndexingPermitted:(BOOL)a3
{
  if (self->_dataSourceIndexingPermitted != a3)
  {
    self->_dataSourceIndexingPermitted = a3;
    if (a3)
    {
      [(EDSearchableIndexSchedulerState *)self setOtherIndexingTime:0.0];
      [(EDSearchableIndexSchedulerState *)self setFastPassIndexingTime:0.0];
    }
  }
}

- (BOOL)isIndexingEnabledByActivities
{
  v2 = [(EDSearchableIndexSchedulerState *)self indexingEnabledForActivityTypes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)enableIndexingForActivityType:(id)a3
{
  id v4 = a3;
  -[NSMutableSet addObject:](self->_indexingEnabledForActivityTypes, "addObject:");
  [(EDSearchableIndexSchedulerState *)self setDataSourceIndexingPermitted:[(EDSearchableIndexSchedulerState *)self _isIndexingEnabledByActivitiesOrTasks]];
}

- (void)disableIndexingForActivityType:(id)a3
{
  id v4 = a3;
  -[NSMutableSet removeObject:](self->_indexingEnabledForActivityTypes, "removeObject:");
  [(EDSearchableIndexSchedulerState *)self setDataSourceIndexingPermitted:[(EDSearchableIndexSchedulerState *)self _isIndexingEnabledByActivitiesOrTasks]];
}

- (void)enableIndexingForTaskType:(id)a3
{
  id v4 = a3;
  -[NSMutableSet addObject:](self->_indexingEnabledForTaskTypes, "addObject:");
  [(EDSearchableIndexSchedulerState *)self setDataSourceIndexingPermitted:[(EDSearchableIndexSchedulerState *)self _isIndexingEnabledByActivitiesOrTasks]];
}

- (void)disableIndexingForTaskType:(id)a3
{
  id v4 = a3;
  -[NSMutableSet removeObject:](self->_indexingEnabledForTaskTypes, "removeObject:");
  [(EDSearchableIndexSchedulerState *)self setDataSourceIndexingPermitted:[(EDSearchableIndexSchedulerState *)self _isIndexingEnabledByActivitiesOrTasks]];
}

- (void)didIndexItemCount:(int64_t)a3
{
  if ([(EDSearchableIndexSchedulerState *)self isIndexingEnabledForTaskType:@"fastpass"])
  {
    self->_fastPassIndexedItemCount += a3;
  }
  else
  {
    int64_t v5 = [(EDSearchableIndexSchedulerState *)self budgetedItemCountRemaining] - a3;
    [(EDSearchableIndexSchedulerState *)self setBudgetedItemCountRemaining:v5];
  }
}

- (BOOL)isDataSourceIndexingPermitted
{
  return self->_dataSourceIndexingPermitted;
}

- (void)setBudgetedItemCountRemaining:(int64_t)a3
{
  self->_budgetedItemCountRemaining = a3;
}

- (void)setBudgetedTimeRemaining:(double)a3
{
  self->_budgetedTimeRemaining = a3;
}

- (void)setMaintenanceIndexingTime:(double)a3
{
  self->_maintenanceIndexingTime = a3;
}

- (void)setFastPassIndexingTime:(double)a3
{
  self->_fastPassIndexingTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingEnabledForTaskTypes, 0);

  objc_storeStrong((id *)&self->_indexingEnabledForActivityTypes, 0);
}

@end