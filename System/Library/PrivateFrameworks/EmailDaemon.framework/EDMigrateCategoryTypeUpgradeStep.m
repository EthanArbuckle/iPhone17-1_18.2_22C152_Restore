@interface EDMigrateCategoryTypeUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDMigrateCategoryTypeUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EDMigrateCategoryTypeUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_62 != -1) {
    dispatch_once(&log_onceToken_62, block);
  }
  v2 = (void *)log_log_62;

  return v2;
}

void __39__EDMigrateCategoryTypeUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_62;
  log_log_62 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 columnExists:@"model_category" inTable:@"message_global_data" type:0])
  {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "UPDATE message_global_data SET model_category = null;",
           0,
           0,
           0);
    if (v4) {
      goto LABEL_19;
    }
  }
  else
  {
    v5 = +[EDMigrateCategoryTypeUpgradeStep log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "model_category column does not exist in message_global_data table", buf, 2u);
    }
  }
  if ([v3 columnExists:@"model_subcategory" inTable:@"message_global_data" type:0])
  {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "UPDATE message_global_data SET model_subcategory = null;",
           0,
           0,
           0);
    if (v4) {
      goto LABEL_19;
    }
  }
  else
  {
    v6 = +[EDMigrateCategoryTypeUpgradeStep log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "model_subcategory column does not exist in message_global_data table", v10, 2u);
    }
  }
  if ([v3 columnExists:@"model_high_impact" inTable:@"message_global_data" type:0])
  {
    v7 = +[EDMigrateCategoryTypeUpgradeStep log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "model_high_impact column already exists in message_global_data table", v9, 2u);
    }

    goto LABEL_18;
  }
  int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE message_global_data ADD COLUMN model_high_impact INTEGER NOT NULL DEFAULT 0;",
         0,
         0,
         0);
  if (!v4) {
LABEL_18:
  }
    int v4 = 0;
LABEL_19:

  return v4;
}

@end