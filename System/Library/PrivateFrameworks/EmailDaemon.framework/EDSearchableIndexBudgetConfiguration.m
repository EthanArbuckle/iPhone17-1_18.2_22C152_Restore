@interface EDSearchableIndexBudgetConfiguration
+ (id)defaultConfiguration;
+ (id)nonSchedulingBudgetConfiguration;
- (BOOL)allowBacklogIndexingOnPower;
- (BOOL)autoStartMaintenanceIndexing;
- (BOOL)enableActivityBasedScheduling;
- (EDSearchableIndexBudgetConfiguration)init;
- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5;
- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5 enableActivityBasedScheduling:(BOOL)a6 autoStartMaintenanceIndexing:(BOOL)a7 allowBacklogIndexingOnPower:(BOOL)a8;
- (NSString)ef_publicDescription;
- (double)periodDuration;
- (double)time;
- (int64_t)numberOfItemsToIndexOnResume;
- (void)setAllowBacklogIndexingOnPower:(BOOL)a3;
- (void)setAutoStartMaintenanceIndexing:(BOOL)a3;
- (void)setEnableActivityBasedScheduling:(BOOL)a3;
@end

@implementation EDSearchableIndexBudgetConfiguration

- (BOOL)allowBacklogIndexingOnPower
{
  return self->_allowBacklogIndexingOnPower;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(EDSearchableIndexBudgetConfiguration);

  return v2;
}

+ (id)nonSchedulingBudgetConfiguration
{
  v2 = [[EDSearchableIndexBudgetConfiguration alloc] initWithTime:0 periodDuration:0 numberOfItemsToIndexOnResume:0 enableActivityBasedScheduling:0 autoStartMaintenanceIndexing:0.0 allowBacklogIndexingOnPower:0.0];

  return v2;
}

- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5 enableActivityBasedScheduling:(BOOL)a6 autoStartMaintenanceIndexing:(BOOL)a7 allowBacklogIndexingOnPower:(BOOL)a8
{
  result = [(EDSearchableIndexBudgetConfiguration *)self initWithTime:a5 periodDuration:a3 numberOfItemsToIndexOnResume:a4];
  if (result)
  {
    result->_enableActivityBasedScheduling = a6;
    result->_autoStartMaintenanceIndexing = a7;
    result->_allowBacklogIndexingOnPower = a8;
  }
  return result;
}

- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexBudgetConfiguration;
  result = [(EDSearchableIndexBudgetConfiguration *)&v9 init];
  if (result)
  {
    result->_time = a3;
    result->_periodDuration = a4;
    result->_numberOfItemsToIndexOnResume = a5;
    *(_WORD *)&result->_enableActivityBasedScheduling = 1;
    result->_allowBacklogIndexingOnPower = 0;
  }
  return result;
}

- (EDSearchableIndexBudgetConfiguration)init
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v10[0] = @"IndexingBudgetInSeconds";
  v10[1] = @"IndexingBudgetPeriodInSeconds";
  v11[0] = &unk_1F35BB750;
  v11[1] = &unk_1F35BB760;
  v10[2] = @"IndexingBudgetNumberOfItemsToIndexOnResume";
  v11[2] = &unk_1F35BAF58;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v3 registerDefaults:v4];
  [v3 doubleForKey:@"IndexingBudgetInSeconds"];
  double v6 = v5;
  [v3 doubleForKey:@"IndexingBudgetPeriodInSeconds"];
  v8 = -[EDSearchableIndexBudgetConfiguration initWithTime:periodDuration:numberOfItemsToIndexOnResume:](self, "initWithTime:periodDuration:numberOfItemsToIndexOnResume:", [v3 integerForKey:@"IndexingBudgetNumberOfItemsToIndexOnResume"], v6, v7);

  return v8;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  [(EDSearchableIndexBudgetConfiguration *)self periodDuration];
  uint64_t v5 = v4;
  [(EDSearchableIndexBudgetConfiguration *)self periodDuration];
  double v7 = v6 / 60.0 / 60.0;
  [(EDSearchableIndexBudgetConfiguration *)self time];
  uint64_t v9 = v8;
  [(EDSearchableIndexBudgetConfiguration *)self time];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"Budget Period:%lfs (%.1fh) Time:%fs (min:%.1fm) numberOfItemsToIndexOnResume:%ld", v5, *(void *)&v7, v9, v10 / 60.0, -[EDSearchableIndexBudgetConfiguration numberOfItemsToIndexOnResume](self, "numberOfItemsToIndexOnResume"));
}

- (double)time
{
  return self->_time;
}

- (double)periodDuration
{
  return self->_periodDuration;
}

- (int64_t)numberOfItemsToIndexOnResume
{
  return self->_numberOfItemsToIndexOnResume;
}

- (BOOL)enableActivityBasedScheduling
{
  return self->_enableActivityBasedScheduling;
}

- (void)setEnableActivityBasedScheduling:(BOOL)a3
{
  self->_enableActivityBasedScheduling = a3;
}

- (BOOL)autoStartMaintenanceIndexing
{
  return self->_autoStartMaintenanceIndexing;
}

- (void)setAutoStartMaintenanceIndexing:(BOOL)a3
{
  self->_autoStartMaintenanceIndexing = a3;
}

- (void)setAllowBacklogIndexingOnPower:(BOOL)a3
{
  self->_allowBacklogIndexingOnPower = a3;
}

@end