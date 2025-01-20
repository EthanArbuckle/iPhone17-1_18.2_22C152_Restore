@interface EDMessageGlobalDataBlackPearlUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDMessageGlobalDataBlackPearlUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EDMessageGlobalDataBlackPearlUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_54 != -1) {
    dispatch_once(&log_onceToken_54, block);
  }
  v2 = (void *)log_log_54;

  return v2;
}

void __47__EDMessageGlobalDataBlackPearlUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_54;
  log_log_54 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if (sqlite3_exec((sqlite3 *)[v3 sqlDB], "DROP INDEX IF EXISTS message_global_data_model_version_model_category_index;",
         0,
         0,
         0))
  {
    v4 = +[EDMessageGlobalDataBlackPearlUpgradeStep log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if ([v3 columnExists:@"model_category" inTable:@"message_global_data" type:0])
  {
    v12 = +[EDMessageGlobalDataBlackPearlUpgradeStep log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "category schema already up to date", v31, 2u);
    }

    int v13 = 0;
  }
  else
  {
    if ([v3 columnExists:@"category" inTable:@"message_global_data" type:0])
    {
      if (sqlite3_exec((sqlite3 *)[v3 sqlDB], "UPDATE message_global_data SET category = NULL, categorizedBy = NULL", 0, 0, 0))
      {
        v14 = +[EDMessageGlobalDataBlackPearlUpgradeStep log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:](v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      if (sqlite3_exec((sqlite3 *)[v3 sqlDB], "DROP TABLE IF EXISTS category_model_versions;DROP INDEX IF EXISTS message_global_data_category_categorizedB"
             "y_index;DROP INDEX IF EXISTS message_global_data_category_categorized_by_user_index;DROP INDEX IF EXISTS me"
             "ssage_global_data_category_category_model_version_index;",
             0,
             0,
             0))
      {
        v22 = +[EDMessageGlobalDataBlackPearlUpgradeStep log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[EDMessageGlobalDataBlackPearlUpgradeStep runWithConnection:](v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    +[EDCategoryPersistence initializeCategorizationVersion:v3];
    int v13 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE message_global_data ADD COLUMN model_analytics TEXT COLLATE BINARY;ALTER TABLE message_global_da"
            "ta ADD COLUMN model_category INTEGER;ALTER TABLE message_global_data ADD COLUMN category_model_version INTEG"
            "ER;ALTER TABLE message_global_data ADD COLUMN model_subcategory INTEGER;CREATE INDEX IF NOT EXISTS message_g"
            "lobal_data_model_category_index ON message_global_data(model_category);CREATE INDEX IF NOT EXISTS message_gl"
            "obal_data_category_model_version_model_category_index ON message_global_data(category_model_version, model_category);",
            0,
            0,
            0);
  }

  return v13;
}

+ (void)runWithConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)runWithConnection:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)runWithConnection:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end