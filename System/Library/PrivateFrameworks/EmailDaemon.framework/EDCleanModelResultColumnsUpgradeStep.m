@interface EDCleanModelResultColumnsUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDCleanModelResultColumnsUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDCleanModelResultColumnsUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1) {
    dispatch_once(&log_onceToken_20, block);
  }
  v2 = (void *)log_log_20;

  return v2;
}

void __43__EDCleanModelResultColumnsUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "UPDATE message_global_data SET category_model_version = null, model_category = null, model_subcategory = null, model_analytics = null, model_high_impact = 0;",
         0,
         0,
         0);

  return v4;
}

@end