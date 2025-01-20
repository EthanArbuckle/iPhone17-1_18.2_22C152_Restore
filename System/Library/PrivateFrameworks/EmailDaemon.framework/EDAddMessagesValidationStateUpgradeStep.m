@interface EDAddMessagesValidationStateUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMessagesValidationStateUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EDAddMessagesValidationStateUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;

  return v2;
}

void __46__EDAddMessagesValidationStateUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if (![v3 columnExists:@"validation_state" inTable:@"messages" type:0])
  {
    v6 = +[EDAddMessagesValidationStateUpgradeStep log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "validation_state column does not exist in messages table", v12, 2u);
    }

    goto LABEL_9;
  }
  v4 = +[EDAddMessagesValidationStateUpgradeStep log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Drop validation_state column in messages table", buf, 2u);
  }

  int v5 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE messages DROP COLUMN validation_state;",
         0,
         0,
         0);
  if (!v5)
  {
LABEL_9:
    if ([v3 columnExists:@"validation_state" inTable:@"message_global_data" type:0])
    {
      v7 = +[EDAddMessagesValidationStateUpgradeStep log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "validation_state column already exists in message_global_data table", v10, 2u);
      }

      int v5 = 0;
    }
    else
    {
      v8 = +[EDAddMessagesValidationStateUpgradeStep log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Add validation_state column in message_global_data table", v11, 2u);
      }

      int v5 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE message_global_data ADD COLUMN validation_state INTEGER NOT NULL DEFAULT 0;",
             0,
             0,
             0);
    }
  }

  return v5;
}

@end