@interface EDRemoveUnusedSchemaTableUpgradeStep
+ (OS_os_log)log;
+ (int)_copyMessagesData:(id)a3;
+ (int)_createTempMessagesTable:(id)a3;
+ (int)_dropTable:(id)a3 connection:(id)a4;
+ (int)_dropThreadCategoriesIndex:(id)a3;
+ (int)_recreateMessagesIndices:(id)a3;
+ (int)_recreateThreadsIndices:(id)a3;
+ (int)_recreateThreadsTable:(id)a3;
+ (int)_swapMessagesTables:(id)a3;
+ (int)_truncateTable:(id)a3 connection:(id)a4;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDRemoveUnusedSchemaTableUpgradeStep

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDRemoveUnusedSchemaTableUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_77 != -1) {
    dispatch_once(&log_onceToken_77, block);
  }
  v2 = (void *)log_log_77;

  return (OS_os_log *)v2;
}

void __43__EDRemoveUnusedSchemaTableUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_77;
  log_log_77 = (uint64_t)v1;
}

+ (int)_createTempMessagesTable:(id)a3
{
  v15[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sqlConnection];
  v15[0] = 0;
  char v5 = objc_msgSend(v4, "executeStatementString:error:", @"CREATE TABLE IF NOT EXISTS messages_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,message_id INTEGER NOT NULL DEFAULT 0,remote_id INTEGER,document_id TEXT COLLATE BINARY,sender INTEGER,subject_prefix TEXT COLLATE BINARY,subject INTEGER NOT NULL,summary INTEGER,date_sent INTEGER,date_received INTEGER,mailbox INTEGER NOT NULL,remote_mailbox INTEGER,flags INTEGER NOT NULL DEFAULT 0,read INTEGER NOT NULL DEFAULT 0,flagged INTEGER NOT NULL DEFAULT 0,deleted INTEGER NOT NULL DEFAULT 0,size INTEGER NOT NULL DEFAULT 0,conversation_id INTEGER NOT NULL DEFAULT 0,date_last_viewed INTEGER,original_mailbox INTEGER,visible INTEGER,sender_vip INTEGER,encoding INTEGER,content_type INTEGER,sequence_identifier INTEGER DEFAULT 0,external_id TEXT COLLATE BINARY,unique_id INTEGER,content_index_transaction_id INTEGER,list_id_hash INTEGER,journaled INTEGER,flag_color INTEGER);",
         v15);
  id v6 = v15[0];

  if (v5)
  {
    v7 = [v3 sqlConnection];
    id v14 = v6;
    char v8 = [v7 executeStatementString:@"ALTER TABLE messages RENAME TO messages_old" error:&v14];
    id v9 = v14;

    if (v8)
    {
      int v10 = 0;
    }
    else
    {
      v12 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EDRemoveUnusedSchemaTableUpgradeStep _createTempMessagesTable:]();
      }

      int v10 = [v9 code];
    }
    id v6 = v9;
  }
  else
  {
    v11 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _createTempMessagesTable:]();
    }

    int v10 = [v6 code];
  }

  return v10;
}

+ (int)_recreateMessagesIndices:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [&unk_1F35BB6C0 allKeys];
  id obj = v3;
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      char v8 = v4;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        int v10 = [NSString stringWithFormat:@"DROP INDEX IF EXISTS %@;", v9];
        v11 = [v20 sqlConnection];
        id v25 = v8;
        char v12 = [v11 executeStatementString:v10 error:&v25];
        id v4 = v25;

        if ((v12 & 1) == 0)
        {
          v13 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = objc_msgSend(v4, "ef_publicDescription");
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v14;
            _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "Failed to drop index: %{public}@ %{public}@", buf, 0x16u);
          }
        }

        ++v7;
        char v8 = v4;
      }
      while (v5 != v7);
      id v3 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v31 = 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke;
  v21[3] = &unk_1E6C05150;
  v24 = buf;
  id v15 = v20;
  id v22 = v15;
  id v16 = v4;
  id v23 = v16;
  [&unk_1F35BB6C0 enumerateKeysAndObjectsUsingBlock:v21];
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    int v17 = 0;
  }
  else {
    int v17 = [v16 code];
  }

  _Block_object_dispose(buf, 8);
  return v17;
}

void __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  int v10 = [*(id *)(a1 + 32) sqlConnection];
  v14[0] = 0;
  char v11 = [v10 executeStatementString:v9 error:v14];
  id v12 = v14[0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v13 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1();
    }

    *a4 = 1;
  }
}

+ (int)_copyMessagesData:(id)a3
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [&unk_1F35BB510 componentsJoinedByString:@", "];
  uint64_t v5 = [NSString stringWithFormat:@"INSERT INTO messages_new (%@) SELECT %@ FROM messages_old", v4, v4];
  uint64_t v6 = [v3 sqlConnection];
  v12[0] = 0;
  char v7 = [v6 executeStatementString:v5 error:v12];
  id v8 = v12[0];

  if (v7)
  {
    int v9 = 0;
  }
  else
  {
    int v10 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _copyMessagesData:]();
    }

    int v9 = [v8 code];
  }

  return v9;
}

+ (int)_swapMessagesTables:(id)a3
{
  v11[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 _dropTable:@"messages_old" connection:v4];
  if (!v5)
  {
    uint64_t v6 = [v4 sqlConnection];
    v11[0] = 0;
    int v7 = [v6 executeStatementString:@"ALTER TABLE messages_new RENAME TO messages" error:v11];
    id v8 = v11[0];

    if (v7)
    {
      int v5 = 0;
    }
    else
    {
      int v9 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EDRemoveUnusedSchemaTableUpgradeStep _swapMessagesTables:]();
      }

      int v5 = [v8 code];
    }
  }
  return v5;
}

+ (int)_recreateThreadsTable:(id)a3
{
  v10[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 sqlConnection];
  v10[0] = 0;
  char v5 = objc_msgSend(v4, "executeStatementString:error:", @"CREATE TABLE IF NOT EXISTS threads (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,scope INTEGER NOT NULL REFERENCES thread_scopes(ROWID) ON DELETE CASCADE,conversation INTEGER NOT NULL REFERENCES conversations(conversation_id) ON DELETE CASCADE,newest_read_message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL,display_message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL,date INTEGER NOT NULL,read INTEGER NOT NULL DEFAULT 0,deleted INTEGER NOT NULL DEFAULT 0,flagged INTEGER NOT NULL DEFAULT 0,has_red_flag INTEGER NOT NULL DEFAULT 0,has_orange_flag INTEGER NOT NULL DEFAULT 0,has_yellow_flag INTEGER NOT NULL DEFAULT 0,has_green_flag INTEGER NOT NULL DEFAULT 0,has_blue_flag INTEGER NOT NULL DEFAULT 0,has_purple_flag INTEGER NOT NULL DEFAULT 0,has_gray_flag INTEGER NOT NULL DEFAULT 0,draft INTEGER NOT NULL DEFAULT 0,replied INTEGER NOT NULL DEFAULT 0,forwarded INTEGER NOT NULL DEFAULT 0,redirected INTEGER NOT NULL DEFAULT 0,junk_level_set_by_user INTEGER NOT NULL DEFAULT 0,junk_level INTEGER NOT NULL DEFAULT 0,has_unflagged INTEGER NOT NULL DEFAULT 0,has_attachments INTEGER NOT NULL DEFAULT 0,count INTEGER NOT NULL,journaled INTEGER NOT NULL DEFAULT 0,UNIQUE(scope, conversation) ON CONFLICT ABORT);",
         v10);
  id v6 = v10[0];

  if (v5)
  {
    int v7 = 0;
  }
  else
  {
    id v8 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _recreateThreadsTable:]();
    }

    int v7 = [v6 code];
  }

  return v7;
}

+ (int)_recreateThreadsIndices:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [&unk_1F35BB6E8 allKeys];
  id obj = v3;
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      id v8 = v4;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        int v10 = [NSString stringWithFormat:@"DROP INDEX IF EXISTS %@;", v9];
        char v11 = [v20 sqlConnection];
        id v25 = v8;
        char v12 = [v11 executeStatementString:v10 error:&v25];
        id v4 = v25;

        if ((v12 & 1) == 0)
        {
          v13 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = objc_msgSend(v4, "ef_publicDescription");
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v14;
            _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "Failed to drop index: %{public}@ %{public}@", buf, 0x16u);
          }
        }

        ++v7;
        id v8 = v4;
      }
      while (v5 != v7);
      id v3 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v31 = 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__EDRemoveUnusedSchemaTableUpgradeStep__recreateThreadsIndices___block_invoke;
  v21[3] = &unk_1E6C05150;
  v24 = buf;
  id v15 = v20;
  id v22 = v15;
  id v16 = v4;
  id v23 = v16;
  [&unk_1F35BB6E8 enumerateKeysAndObjectsUsingBlock:v21];
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    int v17 = 0;
  }
  else {
    int v17 = [v16 code];
  }

  _Block_object_dispose(buf, 8);
  return v17;
}

void __64__EDRemoveUnusedSchemaTableUpgradeStep__recreateThreadsIndices___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  int v10 = [*(id *)(a1 + 32) sqlConnection];
  v14[0] = 0;
  char v11 = [v10 executeStatementString:v9 error:v14];
  id v12 = v14[0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v13 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1();
    }

    *a4 = 1;
  }
}

+ (int)_dropTable:(id)a3 connection:(id)a4
{
  v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", v5];
  id v8 = [v6 sqlConnection];
  v14[0] = 0;
  char v9 = [v8 executeStatementString:v7 error:v14];
  id v10 = v14[0];

  if (v9)
  {
    int v11 = 0;
  }
  else
  {
    id v12 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _dropTable:connection:]();
    }

    int v11 = [v10 code];
  }

  return v11;
}

+ (int)_truncateTable:(id)a3 connection:(id)a4
{
  v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithFormat:@"DELETE FROM %@", v5];
  id v8 = [v6 sqlConnection];
  v14[0] = 0;
  char v9 = [v8 executeStatementString:v7 error:v14];
  id v10 = v14[0];

  if (v9)
  {
    int v11 = 0;
  }
  else
  {
    id v12 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _truncateTable:connection:]();
    }

    int v11 = [v10 code];
  }

  return v11;
}

+ (int)_dropThreadCategoriesIndex:(id)a3
{
  v10[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 sqlConnection];
  v10[0] = 0;
  char v5 = objc_msgSend(v4, "executeStatementString:error:", @"DROP INDEX IF EXISTS thread_categories_type_active_user_override_thread_index;",
         v10);
  id v6 = v10[0];

  if (v5)
  {
    int v7 = 0;
  }
  else
  {
    id v8 = +[EDRemoveUnusedSchemaTableUpgradeStep log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDRemoveUnusedSchemaTableUpgradeStep _dropThreadCategoriesIndex:]();
    }

    int v7 = [v6 code];
  }

  return v7;
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _dropTable:@"interaction_log" connection:v4];
  if (!v5)
  {
    int v5 = [a1 _dropTable:@"thread_categories" connection:v4];
    if (!v5)
    {
      int v5 = [a1 _dropTable:@"read_later" connection:v4];
      if (!v5)
      {
        int v5 = [a1 _dropThreadCategoriesIndex:v4];
        if (!v5)
        {
          int v5 = [a1 _dropTable:@"categorization_sender_rules" connection:v4];
          if (!v5)
          {
            int v5 = [a1 _dropTable:@"categorization_conversation_rules" connection:v4];
            if (!v5)
            {
              int v5 = [a1 _dropTable:@"categorization_group_rules" connection:v4];
              if (!v5)
              {
                int v7 = [v4 columnExists:@"category_active_types" inTable:@"messages" type:0];
                if (((v7 | [v4 columnExists:@"times_viewed" inTable:@"messages" type:0]) != 1|| (int v5 = objc_msgSend(a1, "_createTempMessagesTable:", v4)) == 0&& (int v5 = objc_msgSend(a1, "_recreateMessagesIndices:", v4)) == 0&& (int v5 = objc_msgSend(a1, "_copyMessagesData:", v4)) == 0&& (int v5 = objc_msgSend(a1, "_swapMessagesTables:", v4)) == 0)&& (!objc_msgSend(v4, "columnExists:inTable:type:", @"read_later_date", @"threads", 0)|| (int v5 = objc_msgSend(a1, "_dropTable:connection:", @"threads", v4)) == 0&& (int v5 = objc_msgSend(a1, "_truncateTable:connection:", @"thread_senders", v4)) == 0&& (int v5 = objc_msgSend(a1, "_truncateTable:connection:", @"thread_mailboxes", v4)) == 0&& (int v5 = objc_msgSend(a1, "_truncateTable:connection:", @"thread_scopes", v4)) == 0
                   && (int v5 = [a1 _truncateTable:@"thread_recipients" connection:v4]) == 0
                   && (int v5 = [a1 _recreateThreadsTable:v4]) == 0
                   && (int v5 = [a1 _recreateThreadsIndices:v4]) == 0))
                {
                  int v5 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

+ (void)_createTempMessagesTable:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to rename messages_old: %{public}@", v5);
}

+ (void)_createTempMessagesTable:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to create new messages table: %{public}@", v5);
}

void __65__EDRemoveUnusedSchemaTableUpgradeStep__recreateMessagesIndices___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to create index: %{public}@ %{public}@", v4, v5);
}

+ (void)_copyMessagesData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to drop copy messages data: %{public}@", v5);
}

+ (void)_swapMessagesTables:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to rename new messages: %{public}@", v5);
}

+ (void)_recreateThreadsTable:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to create new threads table: %{public}@", v5);
}

+ (void)_dropTable:connection:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to drop table %{public}@: %{public}@", v4, v5);
}

+ (void)_truncateTable:connection:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to truncate table %{public}@: %{public}@", v4, v5);
}

+ (void)_dropThreadCategoriesIndex:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to drop thread_categories_type_active_user_override_thread_index: %{public}@", v5);
}

@end