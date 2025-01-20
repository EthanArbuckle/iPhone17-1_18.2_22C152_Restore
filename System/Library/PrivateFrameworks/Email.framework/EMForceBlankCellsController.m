@interface EMForceBlankCellsController
+ (BOOL)shouldBlockSQLQueries;
+ (BOOL)shouldBlockXPCQueue;
+ (double)_maximumDelay;
+ (double)_minimumDelay;
+ (id)log;
+ (void)_blockRate;
+ (void)blockForRandomDurationWithMessage:(id)a3;
@end

@implementation EMForceBlankCellsController

+ (BOOL)shouldBlockSQLQueries
{
  return +[EMInternalPreferences preferenceEnabled:26];
}

+ (BOOL)shouldBlockXPCQueue
{
  return +[EMInternalPreferences preferenceEnabled:25];
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EMForceBlankCellsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1) {
    dispatch_once(&log_onceToken_14, block);
  }
  v2 = (void *)log_log_14;
  return v2;
}

void __34__EMForceBlankCellsController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;
}

+ (void)blockForRandomDurationWithMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t v5 = arc4random();
  [a1 _blockRate];
  double v7 = v6;
  if ((double)v5 / 4294967300.0 <= v6)
  {
    [a1 _minimumDelay];
    double v10 = v9;
    [a1 _maximumDelay];
    double v12 = v11;
    if (v10 > v11)
    {
      v13 = +[EMForceBlankCellsController log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[EMForceBlankCellsController blockForRandomDurationWithMessage:v12];
      }

      double v10 = 0.25;
      double v12 = 2.0;
    }
    uint32_t v14 = arc4random();
    v15 = +[EMForceBlankCellsController log];
    double v16 = v10 + (v12 - v10) * ((double)v14 / 4294967300.0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218242;
      double v18 = v16;
      __int16 v19 = 2112;
      double v20 = *(double *)&v4;
      _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "Sleep for %.2fs (%@)", (uint8_t *)&v17, 0x16u);
    }

    [MEMORY[0x1E4F29060] sleepForTimeInterval:v16];
  }
  else
  {
    v8 = +[EMForceBlankCellsController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      double v18 = (double)v5 / 4294967300.0;
      __int16 v19 = 2048;
      double v20 = v7;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "Skip sleep (%.2f > %.2f)", (uint8_t *)&v17, 0x16u);
    }
  }
}

+ (double)_minimumDelay
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = [v2 objectForKey:@"BlankCellMinimumBlockDuration"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

+ (double)_maximumDelay
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = [v2 objectForKey:@"BlankCellMaximumBlockDuration"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2.0;
  }

  return v5;
}

+ (void)blockForRandomDurationWithMessage:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Minimum delay (%.2f) cannot be greater than maximum delay (%.2f) - fall back to default values", (uint8_t *)&v3, 0x16u);
}

+ (void)_blockRate
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Block rate has to be between 0 and 1 - fall back to default value", v1, 2u);
}

@end