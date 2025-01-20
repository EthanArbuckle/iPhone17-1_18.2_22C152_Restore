@interface _EDThreadPersistence_ThreadMessages
- (BOOL)addThreadReplacingExisting:(BOOL)a3 journaled:(BOOL)a4;
- (EDMessagePersistence)messagePersistence;
- (EMThread)thread;
- (EMThreadObjectID)threadObjectID;
- (NSArray)wrappedMessages;
- (_EDThreadPersistence_SQLHelper)sqlHelper;
- (_EDThreadPersistence_ThreadMessages)initWithSQLHelper:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadObjectID:(id)a6 wrappedMessages:(id)a7;
- (id)_displayWrappedMessageWithNewestReadWrappedMessage:(id *)a3;
- (id)_iterateNewestUnreadWrappedMessagesInWrappedMessages:(id)a3 iteratorBlock:(id)a4;
- (id)_newestUnreadWrappedMessagesWithNewestReadWrappedMessage:(id *)a3;
- (id)_threadQuery;
- (id)debugDescription;
- (id)updateThreadTableWithJournaled:(BOOL)a3;
- (int64_t)threadScopeDatabaseID;
- (void)_collectDebuggingInfo;
@end

@implementation _EDThreadPersistence_ThreadMessages

- (_EDThreadPersistence_ThreadMessages)initWithSQLHelper:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadObjectID:(id)a6 wrappedMessages:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_EDThreadPersistence_ThreadMessages;
  v17 = [(_EDThreadPersistence_ThreadMessages *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sqlHelper, a3);
    objc_storeStrong((id *)&v18->_messagePersistence, a4);
    v18->_threadScopeDatabaseID = a5;
    objc_storeStrong((id *)&v18->_threadObjectID, a6);
    uint64_t v19 = [v16 copy];
    wrappedMessages = v18->_wrappedMessages;
    v18->_wrappedMessages = (NSArray *)v19;
  }
  return v18;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  [v3 addObject:v4];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"thread scope DB ID: %lld", -[_EDThreadPersistence_ThreadMessages threadScopeDatabaseID](self, "threadScopeDatabaseID"));
  [v3 addObject:v5];

  v6 = NSString;
  v7 = [(_EDThreadPersistence_ThreadMessages *)self threadObjectID];
  v8 = objc_msgSend(v6, "stringWithFormat:", @"conversation ID: %lld", objc_msgSend(v7, "conversationID"));
  [v3 addObject:v8];

  v9 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
  v10 = objc_msgSend(v9, "ef_map:", &__block_literal_global_85);
  v11 = [v10 componentsJoinedByString:@", "];

  v12 = NSString;
  id v13 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
  id v14 = [v12 stringWithFormat:@"wrapped messages: {%@}(count: %u)", v11, objc_msgSend(v13, "count")];
  [v3 addObject:v14];

  id v15 = [v3 componentsJoinedByString:@" "];

  return v15;
}

- (EMThread)thread
{
  thread = self->_thread;
  if (!thread)
  {
    v4 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
    v5 = objc_msgSend(v4, "ef_mapSelector:", sel_message);

    id v6 = objc_alloc(MEMORY[0x1E4F602D0]);
    v7 = [(_EDThreadPersistence_ThreadMessages *)self _threadQuery];
    v8 = [(_EDThreadPersistence_ThreadMessages *)self threadObjectID];
    v9 = [v8 threadScope];
    v10 = (void *)[v6 initWithMessages:v5 originatingQuery:v7 threadScope:v9];

    v11 = [v10 thread];
    v12 = self->_thread;
    self->_thread = v11;

    thread = self->_thread;
  }

  return thread;
}

- (id)_threadQuery
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F60390];
  v3 = [(_EDThreadPersistence_ThreadMessages *)self threadObjectID];
  v4 = [v3 threadScope];
  v5 = [v2 predicateForMessagesWithThreadScope:v4];

  id v6 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  id v7 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v8 = objc_opt_class();
  v12[0] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10 = (void *)[v7 initWithTargetClass:v8 predicate:v5 sortDescriptors:v9];

  return v10;
}

- (BOOL)addThreadReplacingExisting:(BOOL)a3 journaled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(_EDThreadPersistence_ThreadMessages *)self threadObjectID];
    uint64_t v18 = [v17 conversationID];
    uint64_t v19 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
    *(_DWORD *)buf = 134218752;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    int v26 = [v19 count];
    __int16 v27 = 1024;
    BOOL v28 = v4;
    __int16 v29 = 1024;
    BOOL v30 = v5;
    _os_log_debug_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEBUG, "Adding thread %lld with %u messages. Journaled: %{BOOL}d, replace: %{BOOL}d", buf, 0x1Eu);
  }
  uint64_t v8 = @"INSERT OR IGNORE INTO threads( scope,   conversation,   newest_read_message,   newest_message,   display_message,   date,   display_date,   read_later_date,   read,   flagged,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_unflagged,   has_attachments,   count,   journaled) VALUES( :scope,   :conversation_id,   :newest_read_message,   :newest_message,   :display_message,   :date,   :display_date,   :read_later_date,   :read,   :flagged,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_unflagged,   :has_attachments,   :count,   :journaled);";
  if (v5) {
    uint64_t v8 = @"INSERT OR REPLACE INTO threads( scope,   conversation,   newest_read_message,   newest_message,   display_message,   date,   display_date,   read_later_date,   read,   flagged,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_unflagged,   has_attachments,   count,   journaled) VALUES( :scope,   :conversation_id,   :newest_read_message,   :newest_message,   :display_message,   :date,   :display_date,   :read_later_date,   :read,   :flagged,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_unflagged,   :has_attachments,   :count,   :journaled);";
  }
  v9 = v8;
  v10 = [(_EDThreadPersistence_ThreadMessages *)self sqlHelper];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke;
  v21[3] = &unk_1E6C073A8;
  v21[4] = self;
  BOOL v22 = v4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76___EDThreadPersistence_ThreadMessages_addThreadReplacingExisting_journaled___block_invoke_2;
  v20[3] = &unk_1E6C01E80;
  v20[4] = self;
  unint64_t v11 = [v10 executeUpdateSQL:v9 bindings:v21 errorHandler:v20];

  if (v11 > 1)
  {
    v12 = [_EDThreadPersistence_PersistedThread alloc];
    id v13 = [(_EDThreadPersistence_ThreadMessages *)self sqlHelper];
    id v14 = [v13 connection];
    id v15 = -[_EDThreadPersistence_PersistedThread initWithMessages:threadDatabaseID:](v12, "initWithMessages:threadDatabaseID:", self, [v14 lastInsertedDatabaseID]);

    [(_EDThreadPersistence_PersistedThread *)v15 addMailboxes];
    [(_EDThreadPersistence_PersistedThread *)v15 addSenders];
    [(_EDThreadPersistence_PersistedThread *)v15 addRecipientsForType:1];
    [(_EDThreadPersistence_PersistedThread *)v15 addRecipientsForType:2];
  }
  return v11 > 1;
}

- (void)_collectDebuggingInfo
{
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_4(&dword_1DB39C000, v0, v1, "thread_scopes — count: %d", v2, v3, v4, v5, 0);
}

- (id)updateThreadTableWithJournaled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EDThreadPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v20 = [(_EDThreadPersistence_ThreadMessages *)self threadObjectID];
    uint64_t v21 = [v20 conversationID];
    BOOL v22 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v22 count];
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    _os_log_debug_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEBUG, "Updating thread %lld with %u messages. Journaled: %{BOOL}d", buf, 0x18u);
  }
  id v6 = [(_EDThreadPersistence_ThreadMessages *)self thread];
  id v7 = [v6 objectID];
  uint64_t v8 = [v7 conversationID];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  v9 = [(_EDThreadPersistence_ThreadMessages *)self sqlHelper];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke;
  v26[3] = &unk_1E6C07418;
  v26[4] = self;
  v26[5] = v8;
  BOOL v27 = v3;
  uint64_t v10 = objc_msgSend(v9, "executeUpsertSQL:bindings:errorHandler:", @"INSERT INTO threads( scope,   conversation,   date,   display_date,   read_later_date,   count,   journaled,   has_unflagged,   has_attachments,   read,   flagged,   draft,   replied,   forwarded,   redirected,   junk_level_set_by_user,   junk_level,   has_red_flag,   has_orange_flag,   has_yellow_flag,   has_green_flag,   has_blue_flag,   has_purple_flag,   has_gray_flag) VALUES( :scope,   :conversation_id,   :date,   :display_date,   :read_later_date,   (SELECT count(DISTINCT ifnull(message_id, ROWID || '-fake-message-id')) FROM temp_thread_scope_message WHERE conversation_id = :conversation_id),   :journaled,   :has_unflagged,   :has_attachments,   :read,   :flagged,   :draft,   :replied,   :forwarded,   :redirected,   :junk_level_set_by_user,   :junk_level,   :has_Red_flag,   :has_Orange_flag,   :has_Yellow_flag,   :has_Green_flag,   :has_Blue_flag,   :has_Purple_flag,   :has_Gray_flag) ON CONFLICT (scope, conversation) DO UPDATE SET   date = max(date, excluded.date),   display_date = max(display_date, excluded.display_date),   read_later_date = max(read_later_date, excluded.read_later_date),   count = excluded.count,   journaled = journaled OR excluded.journaled,   has_attachments = has_attachments OR excluded.has_attachments,   has_attachments = has_attachments OR excluded.has_attachments,   read = read AND excluded.read,   flagged = flagged OR excluded.flagged,   draft = draft OR excluded.draft,   replied = replied OR excluded.replied,   forwarded = forwarded OR excluded.forwarded,   redirected = redirected OR excluded.redirected,   junk_level_set_by_user = junk_level_set_by_user OR excluded.junk_level_set_by_user,   junk_level = min(junk_level, excluded.junk_level),   has_red_flag = has_red_flag OR excluded.has_red_flag,   has_orange_flag = has_orange_flag OR excluded.has_orange_flag,   has_yellow_flag = has_yellow_flag OR excluded.has_yellow_flag,   has_green_flag = has_green_flag OR excluded.has_green_flag,   has_blue_flag = has_blue_flag OR excluded.has_blue_flag,   has_purple_flag = has_purple_flag OR excluded.has_purple_flag,   has_gray_flag = has_gray_flag OR excluded.has_gray_flag WHERE count != excluded.count;",
          v26,
          &__block_literal_global_161);

  unint64_t v30 = v10;
  if (*(void *)(*(void *)&buf[8] + 24)) {
    goto LABEL_5;
  }
  unint64_t v11 = [(_EDThreadPersistence_ThreadMessages *)self sqlHelper];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_165;
  v25[3] = &unk_1E6BFFCB8;
  v25[4] = self;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_2_166;
  v24[3] = &unk_1E6C07440;
  v24[4] = buf;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70___EDThreadPersistence_ThreadMessages_updateThreadTableWithJournaled___block_invoke_167;
  v23[3] = &unk_1E6BFF4C8;
  v23[4] = buf;
  objc_msgSend(v11, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT ROWID FROM threads WHERE scope = :scope AND conversation = :conversation_id;",
    v25,
    v24,
    v23);

  if (*(void *)(*(void *)&buf[8] + 24))
  {
LABEL_5:
    v12 = [_EDThreadPersistence_PersistedThread alloc];
    id v13 = [(_EDThreadPersistence_PersistedThread *)v12 initWithMessages:self threadDatabaseID:*(void *)(*(void *)&buf[8] + 24)];
    id v14 = [(_EDThreadPersistence_PersistedThread *)v13 updateNewestReadAndDisplayMessage];
    uint64_t v15 = *MEMORY[0x1E4F5FE38];
    v28[0] = *MEMORY[0x1E4F5FE30];
    v28[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F5FE48];
    v28[2] = *MEMORY[0x1E4F5FE50];
    v28[3] = v16;
    uint64_t v17 = *MEMORY[0x1E4F5FE90];
    v28[4] = *MEMORY[0x1E4F5FE98];
    v28[5] = v17;
    v28[6] = *MEMORY[0x1E4F5FE28];
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
    [v14 addObjectsFromArray:v18];

    if ([(_EDThreadPersistence_PersistedThread *)v13 addMailboxes]) {
      [v14 addObject:*MEMORY[0x1E4F5FED8]];
    }
    if ([(_EDThreadPersistence_PersistedThread *)v13 addSenders]) {
      [v14 addObject:*MEMORY[0x1E4F5FF30]];
    }
    if ([(_EDThreadPersistence_PersistedThread *)v13 addRecipientsForType:1]) {
      [v14 addObject:*MEMORY[0x1E4F5FF60]];
    }
    if ([(_EDThreadPersistence_PersistedThread *)v13 addRecipientsForType:2]) {
      [v14 addObject:*MEMORY[0x1E4F5FDF0]];
    }
  }
  else
  {
    id v14 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)_newestUnreadWrappedMessagesWithNewestReadWrappedMessage:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96___EDThreadPersistence_ThreadMessages__newestUnreadWrappedMessagesWithNewestReadWrappedMessage___block_invoke;
  v11[3] = &unk_1E6C07468;
  id v7 = v5;
  id v12 = v7;
  uint64_t v8 = [(_EDThreadPersistence_ThreadMessages *)self _iterateNewestUnreadWrappedMessagesInWrappedMessages:v6 iteratorBlock:v11];

  if (a3) {
    *a3 = v8;
  }
  id v9 = v7;

  return v9;
}

- (id)_displayWrappedMessageWithNewestReadWrappedMessage:(id *)a3
{
  uint64_t v12 = 0;
  id v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__43;
  uint64_t v16 = __Block_byref_object_dispose__43;
  id v17 = 0;
  id v6 = [(_EDThreadPersistence_ThreadMessages *)self wrappedMessages];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90___EDThreadPersistence_ThreadMessages__displayWrappedMessageWithNewestReadWrappedMessage___block_invoke;
  v11[3] = &unk_1E6C07490;
  void v11[4] = &v12;
  id v7 = [(_EDThreadPersistence_ThreadMessages *)self _iterateNewestUnreadWrappedMessagesInWrappedMessages:v6 iteratorBlock:v11];

  if (v13[5] || (objc_storeStrong(v13 + 5, v7), v13[5]))
  {
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"EDThreadPersistence_ThreadMessages.m" lineNumber:586 description:@"Unable to find display message"];

  if (a3) {
LABEL_4:
  }
    *a3 = v7;
LABEL_5:
  id v8 = v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)_iterateNewestUnreadWrappedMessagesInWrappedMessages:(id)a3 iteratorBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "message", (void)v16);
        id v13 = [v12 flags];
        int v14 = [v13 read];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
        v6[2](v6, v11);
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (int64_t)threadScopeDatabaseID
{
  return self->_threadScopeDatabaseID;
}

- (EMThreadObjectID)threadObjectID
{
  return self->_threadObjectID;
}

- (NSArray)wrappedMessages
{
  return self->_wrappedMessages;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);
  objc_storeStrong((id *)&self->_wrappedMessages, 0);
  objc_storeStrong((id *)&self->_threadObjectID, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_thread, 0);
}

@end