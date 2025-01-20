@interface EDUpdateOthersCategoryTypeUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDUpdateOthersCategoryTypeUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EDUpdateOthersCategoryTypeUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_99 != -1) {
    dispatch_once(&log_onceToken_99, block);
  }
  v2 = (void *)log_log_99;

  return v2;
}

void __44__EDUpdateOthersCategoryTypeUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_99;
  log_log_99 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 columnExists:@"model_category" inTable:@"message_global_data" type:0])
  {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "UPDATE message_global_data SET model_category = 2 where model_subcategory == 6;",
           0,
           0,
           0);
  }
  else
  {
    v5 = +[EDUpdateOthersCategoryTypeUpgradeStep log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "model_category column does not exist in message_global_data table", v7, 2u);
    }

    int v4 = 0;
  }

  return v4;
}

@end