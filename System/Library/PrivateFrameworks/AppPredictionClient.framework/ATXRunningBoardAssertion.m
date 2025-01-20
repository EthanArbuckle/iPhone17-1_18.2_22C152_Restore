@interface ATXRunningBoardAssertion
+ (void)performWorkWithFinishTaskAssertionName:(id)a3 block:(id)a4;
@end

@implementation ATXRunningBoardAssertion

+ (void)performWorkWithFinishTaskAssertionName:(id)a3 block:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [MEMORY[0x1E4F28F80] processInfo];
  v9 = [v8 processName];
  int v10 = [v9 isEqualToString:@"duetexpertd"];

  if (v10)
  {
    v7[2](v7);
  }
  else
  {
    if (performWorkWithFinishTaskAssertionName_block__onceToken != -1) {
      dispatch_once(&performWorkWithFinishTaskAssertionName_block__onceToken, &__block_literal_global_12);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v12 = performWorkWithFinishTaskAssertionName_block__target;
    v33[0] = performWorkWithFinishTaskAssertionName_block__attribute;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    v14 = (void *)[v11 initWithExplanation:v6 target:v12 attributes:v13];

    id v28 = 0;
    char v15 = [v14 acquireWithError:&v28];
    id v16 = v28;
    v17 = __atxlog_handle_default();
    v18 = v17;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2048;
        id v32 = a1;
        id v20 = v19;
        _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@ %p] Acquired Process assertion", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:]();
    }

    v7[2](v7);
    id v27 = 0;
    char v21 = [v14 invalidateSyncWithError:&v27];
    id v22 = v27;

    v23 = __atxlog_handle_default();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        __int16 v31 = 2048;
        id v32 = a1;
        id v26 = v25;
        _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@ %p] invalidated Process assertion", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:]();
    }
  }
}

uint64_t __73__ATXRunningBoardAssertion_performWorkWithFinishTaskAssertionName_block___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F96478] targetWithPid:getpid()];
  v1 = (void *)performWorkWithFinishTaskAssertionName_block__target;
  performWorkWithFinishTaskAssertionName_block__target = v0;

  uint64_t v2 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
  uint64_t v3 = performWorkWithFinishTaskAssertionName_block__attribute;
  performWorkWithFinishTaskAssertionName_block__attribute = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

+ (void)performWorkWithFinishTaskAssertionName:block:.cold.1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v2, v3, "[%{public}@ %p] Failed to invalidate Process assertion with error: %@", v4, v5, v6, v7, v8);
}

+ (void)performWorkWithFinishTaskAssertionName:block:.cold.2()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v2, v3, "[%{public}@ %p] Failed to acquire Process assertion with error: %@", v4, v5, v6, v7, v8);
}

@end