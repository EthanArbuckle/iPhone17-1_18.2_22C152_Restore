@interface _EDThreadPersistence_PersistedThread
- (BOOL)_dropTemporaryView;
- (BOOL)_ensureTempMessagesView;
- (BOOL)addMailboxes;
- (BOOL)addRecipients:(id)a3 ofType:(unint64_t)a4;
- (BOOL)addRecipientsForType:(unint64_t)a3;
- (BOOL)addSenders;
- (BOOL)addSenders:(id)a3;
- (BOOL)recipientDatabaseIDsAndDatesForRecipientType:(unint64_t)a3 recipients:(id *)a4;
- (BOOL)senderDatabaseIDsAndDates:(id *)a3;
- (BOOL)setPriorityForDisplayMessageSender;
- (BOOL)updateDisplayMessageWithUnreadWrappedMessages:(id)a3;
- (BOOL)updateNewestReadMessage:(id)a3;
- (EDMessagePersistence)messagePersistence;
- (EMThread)thread;
- (EMThreadObjectID)threadObjectID;
- (NSArray)wrappedMessages;
- (_EDThreadPersistence_PersistedThread)initWithMessages:(id)a3 threadDatabaseID:(int64_t)a4;
- (_EDThreadPersistence_SQLHelper)sqlHelper;
- (_EDThreadPersistence_ThreadMessages)messages;
- (id)_mailboxDatabaseIDsForWrappedMessages;
- (id)debugDescription;
- (id)updateNewestReadAndDisplayMessage;
- (int64_t)threadDatabaseID;
- (int64_t)threadScopeDatabaseID;
- (unint64_t)currentSenderCounts;
- (void)_dropTemporaryView;
- (void)_ensureTempMessagesView;
- (void)addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3;
- (void)addMailboxes;
@end

@implementation _EDThreadPersistence_PersistedThread

- (_EDThreadPersistence_PersistedThread)initWithMessages:(id)a3 threadDatabaseID:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EDThreadPersistence_PersistedThread;
  v8 = [(_EDThreadPersistence_PersistedThread *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messages, a3);
    v9->_threadDatabaseID = a4;
    uint64_t v10 = [v7 sqlHelper];
    sqlHelper = v9->_sqlHelper;
    v9->_sqlHelper = (_EDThreadPersistence_SQLHelper *)v10;
  }
  return v9;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  [v3 addObject:v4];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"thread DB ID: %lld", -[_EDThreadPersistence_PersistedThread threadDatabaseID](self, "threadDatabaseID"));
  [v3 addObject:v5];

  v6 = NSString;
  id v7 = [(_EDThreadPersistence_PersistedThread *)self messages];
  v8 = objc_msgSend(v6, "stringWithFormat:", @"thread scope DB ID: %lld", objc_msgSend(v7, "threadScopeDatabaseID"));
  [v3 addObject:v8];

  v9 = NSString;
  uint64_t v10 = [(_EDThreadPersistence_PersistedThread *)self threadObjectID];
  v11 = objc_msgSend(v9, "stringWithFormat:", @"conversation ID: %lld", objc_msgSend(v10, "conversationID"));
  [v3 addObject:v11];

  v12 = [(_EDThreadPersistence_PersistedThread *)self messages];
  objc_super v13 = [v12 wrappedMessages];
  v14 = objc_msgSend(v13, "ef_map:", &__block_literal_global_229);
  v15 = [v14 componentsJoinedByString:@", "];

  v16 = NSString;
  v17 = [(_EDThreadPersistence_PersistedThread *)self messages];
  v18 = [v17 wrappedMessages];
  v19 = [v16 stringWithFormat:@"%u wrapped messages: {%@}", objc_msgSend(v18, "count"), v15];
  [v3 addObject:v19];

  v20 = [v3 componentsJoinedByString:@" "];

  return v20;
}

- (EDMessagePersistence)messagePersistence
{
  v2 = [(_EDThreadPersistence_PersistedThread *)self messages];
  v3 = [v2 messagePersistence];

  return (EDMessagePersistence *)v3;
}

- (int64_t)threadScopeDatabaseID
{
  v2 = [(_EDThreadPersistence_PersistedThread *)self messages];
  int64_t v3 = [v2 threadScopeDatabaseID];

  return v3;
}

- (EMThreadObjectID)threadObjectID
{
  v2 = [(_EDThreadPersistence_PersistedThread *)self messages];
  int64_t v3 = [v2 threadObjectID];

  return (EMThreadObjectID *)v3;
}

- (NSArray)wrappedMessages
{
  v2 = [(_EDThreadPersistence_PersistedThread *)self messages];
  int64_t v3 = [v2 wrappedMessages];

  return (NSArray *)v3;
}

- (EMThread)thread
{
  v2 = [(_EDThreadPersistence_PersistedThread *)self messages];
  int64_t v3 = [v2 thread];

  return (EMThread *)v3;
}

- (id)updateNewestReadAndDisplayMessage
{
  int64_t v3 = [(_EDThreadPersistence_PersistedThread *)self messages];
  id v8 = 0;
  v4 = [v3 _newestUnreadWrappedMessagesWithNewestReadWrappedMessage:&v8];
  id v5 = v8;

  v6 = [MEMORY[0x1E4F1CA48] array];
  [(_EDThreadPersistence_PersistedThread *)self updateNewestReadMessage:v5];
  if ([(_EDThreadPersistence_PersistedThread *)self updateDisplayMessageWithUnreadWrappedMessages:v4])
  {
    [(_EDThreadPersistence_PersistedThread *)self addKeyPathsForDisplayMessageChangeToKeyPaths:v6];
    if ([(_EDThreadPersistence_PersistedThread *)self setPriorityForDisplayMessageSender])
    {
      objc_msgSend(v6, "ef_addObjectIfAbsent:", *MEMORY[0x1E4F5FF30]);
    }
  }

  return v6;
}

- (BOOL)updateNewestReadMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_EDThreadPersistence_PersistedThread *)self _ensureTempMessagesView];
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v7 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64___EDThreadPersistence_PersistedThread_updateNewestReadMessage___block_invoke;
    v11[3] = &unk_1E6BFFC90;
    v11[4] = self;
    id v12 = v4;
    uint64_t v8 = objc_msgSend(v7, "executeUpdateSQL:bindings:errorHandler:", @"UPDATE OR IGNORE threads SET  newest_read_message = :newest_read_message WHERE   rowid = :thread AND   :date > (SELECT date_received FROM temp_persisted_messages WHERE temp_persisted_messages.ROWID = threads.newest_read_message);",
           v11,
           &__block_literal_global_240);

    BOOL v9 = v8 == 2;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)updateDisplayMessageWithUnreadWrappedMessages:(id)a3
{
  id v4 = a3;
  if ([(_EDThreadPersistence_PersistedThread *)self _ensureTempMessagesView])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__43;
    v33 = __Block_byref_object_dispose__43;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__43;
    v27 = __Block_byref_object_dispose__43;
    id v28 = 0;
    BOOL v5 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke;
    v22[3] = &unk_1E6BFFCB8;
    v22[4] = self;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_246;
    v21[3] = &unk_1E6C04FF0;
    v21[4] = &v29;
    v21[5] = &v23;
    char v6 = objc_msgSend(v5, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT   (SELECT date_received FROM temp_persisted_messages    WHERE temp_persisted_messages.ROWID = threads.newest_read_message),   (SELECT date_received FROM temp_persisted_messages    WHERE temp_persisted_messages.ROWID = threads.display_message) FROM threads WHERE threads.ROWID = :thread;",
           v22,
           &__block_literal_global_245,
           v21);

    if ((v6 & 1) == 0)
    {
      BOOL v11 = 0;
LABEL_13:
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
      goto LABEL_14;
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = *MEMORY[0x1E4F5FCC8];
    uint64_t v7 = v20;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_2_247;
    v16[3] = &unk_1E6C074B8;
    v16[4] = &v29;
    v16[5] = &v23;
    v16[6] = &v17;
    [v4 enumerateObjectsWithOptions:2 usingBlock:v16];
    uint64_t v8 = v18[3];
    if (v8 == v7 || !v8)
    {
      if (!objc_msgSend((id)v30[5], "ef_isLaterThanDate:", v24[5]))
      {
        BOOL v11 = 0;
        goto LABEL_12;
      }
      BOOL v9 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_258;
      v14[3] = &unk_1E6BFFCB8;
      v14[4] = self;
      uint64_t v10 = objc_msgSend(v9, "executeUpdateSQL:bindings:errorHandler:", @"UPDATE OR IGNORE threads SET   display_message = threads.newest_read_message WHERE threads.ROWID = :thread ;",
              v14,
              &__block_literal_global_261);
    }
    else
    {
      BOOL v9 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __86___EDThreadPersistence_PersistedThread_updateDisplayMessageWithUnreadWrappedMessages___block_invoke_3;
      v15[3] = &unk_1E6C007B0;
      v15[4] = self;
      v15[5] = &v17;
      uint64_t v10 = objc_msgSend(v9, "executeUpdateSQL:bindings:errorHandler:", @"UPDATE OR IGNORE threads SET   display_message = :display_message WHERE ROWID = :thread ;",
              v15,
              &__block_literal_global_253_0);
    }
    uint64_t v12 = v10;

    BOOL v11 = v12 == 2;
LABEL_12:
    _Block_object_dispose(&v17, 8);
    goto LABEL_13;
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)addKeyPathsForDisplayMessageChangeToKeyPaths:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5FF48];
  v6[0] = *MEMORY[0x1E4F5FF40];
  v6[1] = v4;
  v6[2] = *MEMORY[0x1E4F5FE40];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  objc_msgSend(v3, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v5);
}

- (BOOL)addMailboxes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(_EDThreadPersistence_PersistedThread *)self _mailboxDatabaseIDsForWrappedMessages];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  BOOL v14 = v4 != 0;
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F5FCC8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __52___EDThreadPersistence_PersistedThread_addMailboxes__block_invoke;
        v16[3] = &unk_1E6BFFC90;
        v16[4] = self;
        v16[5] = v9;
        uint64_t v11 = objc_msgSend(v10, "executeUpsertSQL:bindings:errorHandler:", @"INSERT OR IGNORE INTO thread_mailboxes (thread, mailbox) VALUES (:thread, :mailbox);",
                v16,
                &__block_literal_global_269);

        if (v11) {
          BOOL v12 = v11 == v7;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          ++v5;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);

    if (v5 < 1)
    {
      BOOL v14 = 0;
      goto LABEL_18;
    }
    id v3 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(_EDThreadPersistence_PersistedThread *)(uint64_t)v21 addMailboxes];
    }
  }

LABEL_18:
  return v14;
}

- (id)_mailboxDatabaseIDsForWrappedMessages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(_EDThreadPersistence_PersistedThread *)self wrappedMessages];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) message];
        uint64_t v9 = [v8 mailboxObjectIDs];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(_EDThreadPersistence_PersistedThread *)self messagePersistence];
  uint64_t v11 = [v10 mailboxPersistence];
  BOOL v12 = [v11 mailboxDatabaseIDsForMailboxObjectIDs:v3 createIfNecessary:0];
  objc_super v13 = [v12 allObjects];

  return v13;
}

- (BOOL)addSenders
{
  unint64_t v3 = [(_EDThreadPersistence_PersistedThread *)self currentSenderCounts];
  id v8 = 0;
  BOOL v4 = [(_EDThreadPersistence_PersistedThread *)self senderDatabaseIDsAndDates:&v8];
  id v5 = v8;
  BOOL v6 = v4
    && [(_EDThreadPersistence_PersistedThread *)self addSenders:v5]
    && (-[_EDThreadPersistence_PersistedThread setPriorityForDisplayMessageSender](self, "setPriorityForDisplayMessageSender")|| v3 != [v5 count]);

  return v6;
}

- (unint64_t)currentSenderCounts
{
  v2 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  unint64_t v3 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke;
  v7[3] = &unk_1E6BFFCB8;
  v7[4] = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___EDThreadPersistence_PersistedThread_currentSenderCounts__block_invoke_276;
  v6[3] = &unk_1E6BFF4C8;
  void v6[4] = &v8;
  LOBYTE(v2) = objc_msgSend(v3, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT count(address) as count FROM thread_senders WHERE thread == :thread;",
                 v7,
                 &__block_literal_global_275,
                 v6);

  if (v2) {
    unint64_t v4 = v9[3];
  }
  else {
    unint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)senderDatabaseIDsAndDates:(id *)a3
{
  int v5 = [(_EDThreadPersistence_PersistedThread *)self _ensureTempMessagesView];
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v5)
  {
    uint64_t v7 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66___EDThreadPersistence_PersistedThread_senderDatabaseIDsAndDates___block_invoke_285;
    v11[3] = &unk_1E6BFF3B0;
    id v8 = v6;
    id v12 = v8;
    LOBYTE(v5) = objc_msgSend(v7, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT temp_persisted_messages.sender, temp_persisted_messages.date_received FROM temp_persisted_messages;",
                   &__block_literal_global_282,
                   &__block_literal_global_284,
                   v11);

    char v9 = v5 ^ 1;
    if (!a3) {
      char v9 = 1;
    }
    if ((v9 & 1) == 0) {
      *a3 = v8;
    }
  }
  return v5;
}

- (BOOL)addSenders:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___EDThreadPersistence_PersistedThread_addSenders___block_invoke;
  v7[3] = &unk_1E6C074E0;
  v7[4] = self;
  id v8 = @"INSERT INTO thread_senders( thread,   address,   date) VALUES( :thread,   :address,   :date) ON CONFLICT (thread, address) DO UPDATE SET   date = max(date, excluded.date) ;";
  char v9 = &v10;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
  int v4 = *((_DWORD *)v11 + 6);
  if (v4 >= 1)
  {
    int v5 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(_EDThreadPersistence_PersistedThread *)(uint64_t)v14 addSenders:[(_EDThreadPersistence_PersistedThread *)self threadDatabaseID]];
    }
  }
  _Block_object_dispose(&v10, 8);
  return v4 > 0;
}

- (BOOL)setPriorityForDisplayMessageSender
{
  if (![(_EDThreadPersistence_PersistedThread *)self _ensureTempMessagesView]) {
    return 0;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v3 = *MEMORY[0x1E4F5FCC8];
  uint64_t v26 = *MEMORY[0x1E4F5FCC8];
  int v4 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke;
  v22[3] = &unk_1E6BFFCB8;
  v22[4] = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_306;
  v21[3] = &unk_1E6BFF4C8;
  v21[4] = &v23;
  char v5 = objc_msgSend(v4, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT address FROM thread_senders WHERE thread == :thread AND priority == 1;",
         v22,
         &__block_literal_global_305,
         v21);

  if (v5)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = v3;
    BOOL v6 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v15[4] = &v17;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_310;
    v16[3] = &unk_1E6BFFCB8;
    v16[4] = self;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_313;
    v15[3] = &unk_1E6BFF4C8;
    char v7 = objc_msgSend(v6, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT sender FROM temp_persisted_messages WHERE ROWID IN (SELECT display_message FROM threads WHERE ROWID == :thread);",
           v16,
           &__block_literal_global_312,
           v15);

    if ((v7 & 1) != 0 && v24[3] != v18[3])
    {
      char v9 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_2_317;
      v14[3] = &unk_1E6BFFCB8;
      v14[4] = self;
      uint64_t v10 = objc_msgSend(v9, "executeUpdateSQL:bindings:errorHandler:", @"UPDATE thread_senders SET priority = 0 WHERE thread == :thread AND priority == 1;",
              v14,
              &__block_literal_global_320_0);

      if (v10)
      {
        uint64_t v11 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __74___EDThreadPersistence_PersistedThread_setPriorityForDisplayMessageSender__block_invoke_324;
        v13[3] = &unk_1E6C007B0;
        v13[4] = self;
        v13[5] = &v17;
        objc_msgSend(v11, "executeUpdateSQL:bindings:errorHandler:", @"UPDATE thread_senders SET priority = 1 WHERE thread == :thread AND address == :address;",
          v13,
          &__block_literal_global_327);
      }
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v8 = 0;
  }
  _Block_object_dispose(&v23, 8);
  return v8;
}

- (BOOL)addRecipientsForType:(unint64_t)a3
{
  id v9 = 0;
  BOOL v5 = [(_EDThreadPersistence_PersistedThread *)self recipientDatabaseIDsAndDatesForRecipientType:a3 recipients:&v9];
  id v6 = v9;
  BOOL v7 = v5 && [(_EDThreadPersistence_PersistedThread *)self addRecipients:v6 ofType:a3];

  return v7;
}

- (BOOL)recipientDatabaseIDsAndDatesForRecipientType:(unint64_t)a3 recipients:(id *)a4
{
  BOOL v7 = [(_EDThreadPersistence_PersistedThread *)self _ensureTempMessagesView];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v7)
  {
    id v9 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke;
    v16[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
    v16[4] = a3;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96___EDThreadPersistence_PersistedThread_recipientDatabaseIDsAndDatesForRecipientType_recipients___block_invoke_337;
    v14[3] = &unk_1E6BFF3B0;
    id v10 = v8;
    id v15 = v10;
    char v11 = objc_msgSend(v9, "executeSelectSQL:bindings:errorHandler:rowHandler:", @"SELECT recipients.address, temp_persisted_messages.date_received FROM recipients JOIN temp_persisted_messages ON recipients.message = temp_persisted_messages.ROWID WHERE recipients.type = :recipients_type;",
            v16,
            &__block_literal_global_336_0,
            v14);

    char v12 = v11 ^ 1;
    if (!a4) {
      char v12 = 1;
    }
    if ((v12 & 1) == 0) {
      *a4 = v10;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)addRecipients:(id)a3 ofType:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61___EDThreadPersistence_PersistedThread_addRecipients_ofType___block_invoke;
    v13[3] = &unk_1E6C07550;
    v13[5] = &v14;
    void v13[6] = a4;
    v13[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];
    int v7 = *((_DWORD *)v15 + 6);
    BOOL v8 = v7 > 0;
    if (v7 >= 1)
    {
      id v9 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = *((_DWORD *)v15 + 6);
        int64_t v12 = [(_EDThreadPersistence_PersistedThread *)self threadDatabaseID];
        *(_DWORD *)buf = 67109632;
        int v19 = v11;
        __int16 v20 = 1024;
        int v21 = a4;
        __int16 v22 = 2048;
        int64_t v23 = v12;
        _os_log_debug_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEBUG, "Added/updated %u type %u recipient(s) for thread DB ID %lld.", buf, 0x18u);
      }
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_ensureTempMessagesView
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v2 = 1;
  if (!self->_didCreateTempMessagesView)
  {
    self->_didCreateTempMessagesView = 1;
    int v4 = (void *)MEMORY[0x1E0190280]();
    if (![(_EDThreadPersistence_PersistedThread *)self _dropTemporaryView])
    {
      BOOL v2 = 0;
LABEL_24:
      return v2;
    }
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke;
    v25[3] = &unk_1E6BFFCB8;
    v25[4] = self;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63___EDThreadPersistence_PersistedThread__ensureTempMessagesView__block_invoke_354;
    v23[3] = &unk_1E6BFF3B0;
    id v7 = v5;
    id v24 = v7;
    int v8 = [v6 executeSelectSQL:@"SELECT ROWID FROM temp_thread_scope_message WHERE (conversation_id = :conversation_id)" bindings:v25 errorHandler:&__block_literal_global_353 rowHandler:v23];

    if ([v7 count])
    {
      id v9 = [v7 componentsJoinedByString:@", "];
      objc_msgSend(NSString, "stringWithFormat:", @"CREATE TEMP VIEW temp_persisted_messages AS SELECT * FROM messages WHERE ROWID IN (%@);",
      id v10 = v9);
      if (v8
        && ([(_EDThreadPersistence_PersistedThread *)self sqlHelper],
            int v11 = objc_claimAutoreleasedReturnValue(),
            [v11 connection],
            int64_t v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v12 executeStatementString:v10 errorMessage:@"CREATE TEMP VIEW"],
            v12,
            v11,
            (v13 & 1) != 0))
      {
        BOOL v2 = 1;
      }
      else
      {
        uint64_t v14 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView]();
        }

        BOOL v2 = 0;
      }
      id v15 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v21 = [v7 count];
        int64_t v22 = [(_EDThreadPersistence_PersistedThread *)self threadDatabaseID];
        *(_DWORD *)buf = 67109634;
        int v27 = v21;
        __int16 v28 = 2114;
        uint64_t v29 = v9;
        __int16 v30 = 2048;
        int64_t v31 = v22;
        _os_log_debug_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEBUG, "Found %u rows {%{public}@} for thread DB ID %lld.", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v16 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(_EDThreadPersistence_PersistedThread *)(uint64_t)buf _ensureTempMessagesView];
      }

      if (v8)
      {
        int v17 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
        long long v18 = [v17 connection];
        char v19 = objc_msgSend(v18, "executeStatementString:errorMessage:", @"CREATE TEMP VIEW temp_persisted_messages AS SELECT * FROM messages LIMIT 0;",
                @"CREATE TEMP VIEW");

        if (v19)
        {
          BOOL v2 = 1;
LABEL_23:

          goto LABEL_24;
        }
      }
      id v9 = +[EDThreadPersistence log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[_EDThreadPersistence_PersistedThread _ensureTempMessagesView]();
      }
      BOOL v2 = 0;
    }

    goto LABEL_23;
  }
  return v2;
}

- (BOOL)_dropTemporaryView
{
  BOOL v2 = [(_EDThreadPersistence_PersistedThread *)self sqlHelper];
  uint64_t v3 = [v2 connection];
  char v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP VIEW IF EXISTS temp_persisted_messages;",
         @"DROP TEMP VIEW");

  if ((v4 & 1) == 0)
  {
    BOOL v5 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_EDThreadPersistence_PersistedThread _dropTemporaryView]();
    }
  }
  return v4;
}

- (_EDThreadPersistence_ThreadMessages)messages
{
  return self->_messages;
}

- (int64_t)threadDatabaseID
{
  return self->_threadDatabaseID;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

- (void)addMailboxes
{
  OUTLINED_FUNCTION_9_1(a1, a2, a3, 1.5047e-36);
  _os_log_debug_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEBUG, "Added %u mailbox(es) for thread DB ID %lld.", v3, 0x12u);
}

- (void)addSenders:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9_1(a1, a2, a3, 1.5047e-36);
  _os_log_debug_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEBUG, "Added/changed %u sender(s) for thread DB ID %lld.", v3, 0x12u);
}

- (void)_ensureTempMessagesView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Unable to create temp_persisted_messages", v2, v3, v4, v5, v6);
}

- (void)_dropTemporaryView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Failed to drop temp_persisted_messages temp view", v2, v3, v4, v5, v6);
}

@end