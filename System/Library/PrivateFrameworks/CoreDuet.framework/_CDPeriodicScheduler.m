@interface _CDPeriodicScheduler
+ (id)sharedInstance;
- (void)registerJob:(id)a3;
- (void)unregisterJob:(id)a3;
- (void)updateExecutionCriteriaOnJob:(id)a3;
@end

@implementation _CDPeriodicScheduler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

- (void)registerJob:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[_CDPeriodicScheduler registerJob:](v3);
  }
  id v4 = [v3 jobName];
  v5 = (const char *)[v4 UTF8String];
  v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __36___CDPeriodicScheduler_registerJob___block_invoke;
  handler[3] = &unk_1E560D780;
  id v9 = v3;
  id v7 = v3;
  xpc_activity_register(v5, v6, handler);
}

- (void)unregisterJob:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  xpc_activity_unregister(v3);
}

- (void)updateExecutionCriteriaOnJob:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activity];
  v5 = v4;
  if (v4)
  {
    xpc_object_t v6 = xpc_activity_copy_criteria(v4);
    id v7 = [v3 executionCriteria];
    if (!v6 || !xpc_equal(v6, v7))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_CDPeriodicScheduler updateExecutionCriteriaOnJob:](v3);
      }
      xpc_activity_set_criteria(v5, v7);
    }
  }
}

- (void)registerJob:(void *)a1 .cold.1(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [a1 jobName];
  id v3 = NSNumber;
  [a1 interval];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  int v5 = 138412802;
  xpc_object_t v6 = a1;
  __int16 v7 = 2112;
  v8 = v2;
  __int16 v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Registered CTS job %@ %@ with interval of %@ seconds", (uint8_t *)&v5, 0x20u);
}

- (void)updateExecutionCriteriaOnJob:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 jobName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Updating criteria on activity %@", v3, v4, v5, v6, v7);
}

@end