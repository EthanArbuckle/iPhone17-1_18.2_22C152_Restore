@interface ATXContextualActionCountCache
- (ATXContextualActionCountCache)init;
- (BOOL)isHeadingHomeActionTime:(id)a3;
- (BOOL)isHeadingToWorkActionTime:(id)a3;
- (BOOL)isOtherActionTime:(id)a3;
- (NSDate)oldestAction;
- (id)getAllCounts;
- (id)getCountsForContext:(id)a3;
- (void)addMinimalActionParameter:(id)a3;
@end

@implementation ATXContextualActionCountCache

- (ATXContextualActionCountCache)init
{
  v18.receiver = self;
  v18.super_class = (Class)ATXContextualActionCountCache;
  v2 = [(ATXContextualActionCountCache *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    oldestAction = v2->_oldestAction;
    v2->_oldestAction = (NSDate *)v3;

    uint64_t v5 = objc_opt_new();
    headingToWorkActions = v2->headingToWorkActions;
    v2->headingToWorkActions = (NSCountedSet *)v5;

    uint64_t v7 = objc_opt_new();
    headingHomeActions = v2->headingHomeActions;
    v2->headingHomeActions = (NSCountedSet *)v7;

    uint64_t v9 = objc_opt_new();
    unspecifiedActions = v2->unspecifiedActions;
    v2->unspecifiedActions = (NSCountedSet *)v9;

    objc_storeStrong((id *)&v2->allActions, v2->unspecifiedActions);
    uint64_t v11 = [MEMORY[0x1E4F4AF68] defaultTimeWindowForContextType:2];
    headingToWorkDateInterval = v2->headingToWorkDateInterval;
    v2->headingToWorkDateInterval = (NSDateInterval *)v11;

    uint64_t v13 = [MEMORY[0x1E4F4AF68] defaultTimeWindowForContextType:1];
    headingHomeDateInterval = v2->headingHomeDateInterval;
    v2->headingHomeDateInterval = (NSDateInterval *)v13;

    uint64_t v15 = [MEMORY[0x1E4F4AF68] defaultTimeWindowForContextType:0];
    otherDateInterval = v2->otherDateInterval;
    v2->otherDateInterval = (NSDateInterval *)v15;
  }
  return v2;
}

- (void)addMinimalActionParameter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 actionTime];

  if (v5)
  {
    v6 = [v4 actionTime];
    [v4 setActionTime:0];
    uint64_t v7 = [(NSDate *)self->_oldestAction earlierDate:v6];
    oldestAction = self->_oldestAction;
    self->_oldestAction = v7;

    BOOL v9 = [(ATXContextualActionCountCache *)self isHeadingToWorkActionTime:v6];
    BOOL v10 = [(ATXContextualActionCountCache *)self isHeadingHomeActionTime:v6];
    BOOL v11 = [(ATXContextualActionCountCache *)self isOtherActionTime:v6];
    if (v9)
    {
      [(NSCountedSet *)self->headingToWorkActions addObject:v4];
      if (!v10)
      {
LABEL_4:
        if (!v11)
        {
LABEL_6:

          goto LABEL_10;
        }
LABEL_5:
        [(NSCountedSet *)self->unspecifiedActions addObject:v4];
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_4;
    }
    [(NSCountedSet *)self->headingHomeActions addObject:v4];
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[ATXContextualActionCountCache addMinimalActionParameter:](v4, v12);
  }

LABEL_10:
}

- (BOOL)isHeadingToWorkActionTime:(id)a3
{
  headingToWorkDateInterval = self->headingToWorkDateInterval;
  if (!headingToWorkDateInterval) {
    return 1;
  }
  id v5 = a3;
  v6 = [(NSDateInterval *)headingToWorkDateInterval startDate];
  uint64_t v7 = [(NSDateInterval *)self->headingToWorkDateInterval endDate];
  BOOL v8 = +[ATXTimeUtil time:v5 isBetweenStartTime:v6 andEndTime:v7];

  return v8;
}

- (BOOL)isHeadingHomeActionTime:(id)a3
{
  headingHomeDateInterval = self->headingHomeDateInterval;
  if (!headingHomeDateInterval) {
    return 1;
  }
  id v5 = a3;
  v6 = [(NSDateInterval *)headingHomeDateInterval startDate];
  uint64_t v7 = [(NSDateInterval *)self->headingHomeDateInterval endDate];
  BOOL v8 = +[ATXTimeUtil time:v5 isBetweenStartTime:v6 andEndTime:v7];

  return v8;
}

- (BOOL)isOtherActionTime:(id)a3
{
  otherDateInterval = self->otherDateInterval;
  if (!otherDateInterval) {
    return 1;
  }
  id v5 = a3;
  v6 = [(NSDateInterval *)otherDateInterval startDate];
  uint64_t v7 = [(NSDateInterval *)self->otherDateInterval endDate];
  BOOL v8 = +[ATXTimeUtil time:v5 isBetweenStartTime:v6 andEndTime:v7];

  return v8;
}

- (id)getCountsForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contextType];
  switch(v5)
  {
    case 0:
      unspecifiedActions = self->unspecifiedActions;
      goto LABEL_7;
    case 1:
      unspecifiedActions = self->headingHomeActions;
      goto LABEL_7;
    case 2:
      unspecifiedActions = self->headingToWorkActions;
LABEL_7:
      uint64_t v7 = [(NSCountedSet *)unspecifiedActions copy];
      goto LABEL_11;
  }
  BOOL v8 = __atxlog_handle_default();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ATXContextualActionCountCache getCountsForContext:](v4, v8);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unsupported context type was given: %lu", objc_msgSend(v4, "contextType"));
  uint64_t v7 = objc_opt_new();
LABEL_11:
  BOOL v9 = (void *)v7;

  return v9;
}

- (id)getAllCounts
{
  v2 = (void *)[(NSCountedSet *)self->allActions copy];
  return v2;
}

- (NSDate)oldestAction
{
  return self->_oldestAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestAction, 0);
  objc_storeStrong((id *)&self->otherDateInterval, 0);
  objc_storeStrong((id *)&self->headingHomeDateInterval, 0);
  objc_storeStrong((id *)&self->headingToWorkDateInterval, 0);
  objc_storeStrong((id *)&self->allActions, 0);
  objc_storeStrong((id *)&self->unspecifiedActions, 0);
  objc_storeStrong((id *)&self->headingHomeActions, 0);
  objc_storeStrong((id *)&self->headingToWorkActions, 0);
}

- (void)addMinimalActionParameter:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 bundleId];
  uint64_t v5 = [a1 actionType];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Cannot process action %@:%@ without valid actionTime", (uint8_t *)&v6, 0x16u);
}

- (void)getCountsForContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 contextType];
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unsupported context type was given: %lu", (uint8_t *)&v3, 0xCu);
}

@end