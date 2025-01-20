@interface ATXContextualActionManager
- (ATXContextualActionManager)init;
- (ATXContextualActionManager)initWithStaticActions:(id)a3;
- (double)getIntervalSinceOldestEvent;
- (id)getAllCounts;
- (id)getCountsForContext:(id)a3;
- (void)_getActionsFromLastMonth;
- (void)_updateCacheIfNeeded;
@end

@implementation ATXContextualActionManager

- (ATXContextualActionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXContextualActionManager;
  v2 = [(ATXContextualActionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    actionCountCache = v2->actionCountCache;
    v2->actionCountCache = (ATXContextualActionCountCache *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    actionCountCacheCreationDate = v2->actionCountCacheCreationDate;
    v2->actionCountCacheCreationDate = (NSDate *)v5;
  }
  return v2;
}

- (id)getCountsForContext:(id)a3
{
  id v4 = a3;
  [(ATXContextualActionManager *)self _updateCacheIfNeeded];
  uint64_t v5 = [(ATXContextualActionCountCache *)self->actionCountCache getCountsForContext:v4];

  return v5;
}

- (id)getAllCounts
{
  [(ATXContextualActionManager *)self _updateCacheIfNeeded];
  actionCountCache = self->actionCountCache;
  return [(ATXContextualActionCountCache *)actionCountCache getAllCounts];
}

- (double)getIntervalSinceOldestEvent
{
  [(ATXContextualActionManager *)self _updateCacheIfNeeded];
  uint64_t v3 = [(ATXContextualActionCountCache *)self->actionCountCache oldestAction];
  [v3 timeIntervalSinceNow];
  double v5 = -v4;

  return v5;
}

- (void)_updateCacheIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  [v3 timeIntervalSinceDate:self->actionCountCacheCreationDate];
  double v5 = v4;
  p_super = __atxlog_handle_dailyroutines();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_INFO);
  if (v5 <= 3600.0)
  {
    if (v7)
    {
      int v9 = 134217984;
      double v10 = v5;
      _os_log_impl(&dword_1D0FA3000, p_super, OS_LOG_TYPE_INFO, "Using cached counts. Cache age: %f", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v9 = 134217984;
      double v10 = v5;
      _os_log_impl(&dword_1D0FA3000, p_super, OS_LOG_TYPE_INFO, "Updating cached counts. Cache age: %f", (uint8_t *)&v9, 0xCu);
    }

    [(ATXContextualActionManager *)self _getActionsFromLastMonth];
    objc_super v8 = v3;
    p_super = &self->actionCountCacheCreationDate->super;
    self->actionCountCacheCreationDate = v8;
  }
}

- (void)_getActionsFromLastMonth
{
  id v7 = +[_ATXDataStore sharedInstance];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  double v4 = [v3 dateByAddingTimeInterval:-2419200.0];
  double v5 = [v7 minimalActionParametersforActionsBetweenStartDate:v4 endDate:v3 limit:2000];
  actionCountCache = self->actionCountCache;
  self->actionCountCache = v5;
}

- (ATXContextualActionManager)initWithStaticActions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ATXContextualActionManager;
  double v5 = [(ATXContextualActionManager *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    actionCountCache = v5->actionCountCache;
    v5->actionCountCache = (ATXContextualActionCountCache *)v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          -[ATXContextualActionCountCache addMinimalActionParameter:](v5->actionCountCache, "addMinimalActionParameter:", *(void *)(*((void *)&v16 + 1) + 8 * v12++), (void)v16);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
    actionCountCacheCreationDate = v5->actionCountCacheCreationDate;
    v5->actionCountCacheCreationDate = (NSDate *)v13;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->actionCountCacheCreationDate, 0);
  objc_storeStrong((id *)&self->actionCountCache, 0);
}

@end