@interface EDAddSenderCategoryColumnUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddSenderCategoryColumnUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDAddSenderCategoryColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v2 = (void *)log_log_8;

  return v2;
}

void __43__EDAddSenderCategoryColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  v4 = +[EDSenderPersistence sendersCategoryColumnName];
  v5 = +[EDSenderPersistence sendersTableName];
  char v6 = [v3 columnExists:v4 inTable:v5 type:0];

  if (v6)
  {
    v7 = +[EDAddSenderCategoryColumnUpgradeStep log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "senders.category column already exists", v11, 2u);
    }

    int v8 = 0;
  }
  else
  {
    v9 = +[EDAddSenderCategoryColumnUpgradeStep log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Create category column in senders", buf, 2u);
    }

    int v8 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE senders ADD COLUMN category INTEGER;CREATE INDEX IF NOT EXISTS senders_category_index ON senders(category);",
           0,
           0,
           0);
  }

  return v8;
}

@end