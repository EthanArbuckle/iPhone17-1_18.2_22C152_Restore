@interface EDLocalActionPersistence
+ (OS_os_log)log;
+ (id)actionFlagsTableSchema;
+ (id)actionLabelsTableSchema;
+ (id)actionMessagesTableSchema;
+ (id)localMessageActionsTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_addActionMessageForMessage:(id)a3 destinationMessage:(id)a4 actionID:(int64_t)a5 actionPhase:(int64_t)a6 connection:(id)a7;
- (BOOL)_addActionMessageForSourceRemoteID:(id)a3 actionID:(int64_t)a4 connection:(id)a5;
- (BOOL)_addFlagChange:(id)a3 actionID:(int64_t)a4 connection:(id)a5;
- (BOOL)_setLabelsOnAction:(int64_t)a3 labels:(id)a4 add:(BOOL)a5 connection:(id)a6;
- (BOOL)mailboxURLIsInRemoteAccount:(id)a3;
- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4;
- (BOOL)persistFlagChangeAction:(id)a3;
- (BOOL)persistFlagChangeUndownloadedAction:(id)a3;
- (BOOL)persistLabelChangeAction:(id)a3;
- (BOOL)persistTransferAction:(id)a3;
- (BOOL)persistTransferUndownloadedAction:(id)a3;
- (BOOL)updateTransferAction:(id)a3 withResults:(id)a4;
- (BOOL)updateTransferUndownloadedMessageAction:(id)a3 withResults:(id)a4;
- (ECLocalMessageActionID)latestActionID;
- (EDGmailLabelPersistence)gmailLabelPersistence;
- (EDLocalActionPersistence)init;
- (EDLocalActionPersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4;
- (EDPersistenceDatabase)database;
- (id)_flagChangeActionForRow:(id)a3 connection:(id)a4;
- (id)_flagChangeAllActionForRow:(id)a3 connection:(id)a4;
- (id)_flagChangeForAction:(int64_t)a3 connection:(id)a4;
- (id)_labelChangeActionForRow:(id)a3 connection:(id)a4;
- (id)_sourceRemoteIDListForCopyItems:(id)a3;
- (id)_transferActionForRow:(id)a3 connection:(id)a4 failedMessages:(id)a5;
- (id)_transferUndownloadedActionForRow:(id)a3 connection:(id)a4;
- (id)_whereClauseToFindCopyItems:(id)a3;
- (id)messageActionsForAccountURL:(id)a3 previousActionID:(int64_t)a4;
- (id)messageForDatabaseID:(int64_t)a3;
- (void)_deleteCopyItems:(id)a3 actionID:(int64_t)a4 connection:(id)a5;
- (void)_findMessagesForAction:(int64_t)a3 remoteIDs:(id)a4 messages:(id)a5 connection:(id)a6;
- (void)_updateCopyItems:(id)a3 toPhase:(int64_t)a4 actionID:(int64_t)a5 connection:(id)a6;
- (void)removeMessageAction:(int64_t)a3;
- (void)removeMessageActions:(id)a3;
- (void)updateFlagChangeAction:(id)a3 withRemainingUIDs:(id)a4;
@end

@implementation EDLocalActionPersistence

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDLocalActionPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_43 != -1) {
    dispatch_once(&log_onceToken_43, block);
  }
  v2 = (void *)log_log_43;

  return (OS_os_log *)v2;
}

void __31__EDLocalActionPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_43;
  log_log_43 = (uint64_t)v1;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v37[6] = *MEMORY[0x1E4F143B8];
  v5 = [a1 localMessageActionsTableSchema];
  v33 = [a1 actionMessagesTableSchema];
  v35 = [a1 actionLabelsTableSchema];
  v32 = [a1 actionFlagsTableSchema];
  v6 = [v33 columnForName:@"action"];
  [v6 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v7 = [v35 columnForName:@"action"];
  [v7 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v8 = [v32 columnForName:@"action"];
  [v8 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v34 = +[EDMessagePersistence messagesTableName];
  v9 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  v10 = [EDPersistenceForeignKeyPlaceholder alloc];
  v28 = [v5 columnForName:@"mailbox"];
  v29 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v10, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[0] = v29;
  v11 = [EDPersistenceForeignKeyPlaceholder alloc];
  v26 = [v5 columnForName:@"source_mailbox"];
  v27 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v11, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[1] = v27;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  v25 = [v5 columnForName:@"destination_mailbox"];
  v13 = -[EDPersistenceForeignKeyPlaceholder initWithColumn:tableName:onDelete:onUpdate:](v12, "initWithColumn:tableName:onDelete:onUpdate:");
  v37[2] = v13;
  v14 = [EDPersistenceForeignKeyPlaceholder alloc];
  v15 = [v33 columnForName:@"message"];
  v16 = [(EDPersistenceForeignKeyPlaceholder *)v14 initWithColumn:v15 tableName:v34 onDelete:3 onUpdate:0];
  v37[3] = v16;
  v17 = [EDPersistenceForeignKeyPlaceholder alloc];
  v18 = [v33 columnForName:@"destination_message"];
  v19 = [(EDPersistenceForeignKeyPlaceholder *)v17 initWithColumn:v18 tableName:v34 onDelete:2 onUpdate:0];
  v37[4] = v19;
  v20 = [EDPersistenceForeignKeyPlaceholder alloc];
  v21 = [v35 columnForName:@"label"];
  v22 = [(EDPersistenceForeignKeyPlaceholder *)v20 initWithColumn:v21 tableName:v9 onDelete:2 onUpdate:0];
  v37[5] = v22;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];

  *a4 = (id)MEMORY[0x1E4F1CBF0];
  v36[0] = v5;
  v36[1] = v33;
  v36[2] = v35;
  v36[3] = v32;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];

  return v23;
}

+ (id)localMessageActionsTableSchema
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v14[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"source_mailbox" nullable:1];
  v14[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"destination_mailbox" nullable:1];
  v14[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action_type" nullable:1];
  v14[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"user_initiated" nullable:1];
  v14[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  v9 = (void *)[v2 initWithName:@"local_message_actions" rowIDType:2 columns:v8];

  uint64_t v10 = *MEMORY[0x1E4F60D08];
  v13[0] = @"mailbox";
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v9 addIndexForColumns:v11];

  return v9;
}

+ (id)actionMessagesTableSchema
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v17[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action_phase" nullable:1];
  v17[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v17[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_id" nullable:1];
  v17[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"destination_message" nullable:1];
  v17[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v9 = (void *)[v2 initWithName:@"action_messages" rowIDType:1 columns:v8];

  v16 = @"action";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v9 addIndexForColumns:v10];

  v15 = @"message";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v9 addIndexForColumns:v11];

  v14 = @"destination_message";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v9 addIndexForColumns:v12];

  return v9;
}

+ (id)actionLabelsTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"do_add" nullable:1];
  v13[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"label" nullable:1];
  void v13[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v7 = (void *)[v2 initWithName:@"action_labels" rowIDType:1 columns:v6];

  v12 = @"action";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addIndexForColumns:v8];

  v11 = @"label";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return v7;
}

+ (id)actionFlagsTableSchema
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v11[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_type" nullable:1];
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_value" nullable:1];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v7 = (void *)[v2 initWithName:@"action_flags" rowIDType:1 columns:v6];

  uint64_t v10 = @"action";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v7 addIndexForColumns:v8];

  return v7;
}

- (EDLocalActionPersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDLocalActionPersistence;
  v9 = [(EDLocalActionPersistence *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_gmailLabelPersistence, a4);
  }

  return v10;
}

- (EDLocalActionPersistence)init
{
}

- (id)messageActionsForAccountURL:(id)a3 previousActionID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  v9 = objc_opt_new();
  uint64_t v10 = [(EDLocalActionPersistence *)self database];
  v11 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence messageActionsForAccountURL:previousActionID:]"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke;
  v23[3] = &unk_1E6C01748;
  id v12 = v6;
  int64_t v29 = a4;
  id v24 = v12;
  v25 = self;
  id v13 = v9;
  id v26 = v13;
  id v14 = v7;
  id v27 = v14;
  id v15 = v8;
  id v28 = v15;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v23);

  if ([v15 count])
  {
    v16 = [(EDLocalActionPersistence *)self database];
    v17 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence messageActionsForAccountURL:previousActionID:]"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_3;
    v21[3] = &unk_1E6C00AF0;
    id v22 = v15;
    objc_msgSend(v16, "__performWriteWithCaller:usingBlock:", v17, v21);
  }
  if ([v13 count]) {
    [(EDLocalActionPersistence *)self handledFailedCopyForMessages:v13];
  }
  v18 = v28;
  id v19 = v14;

  return v19;
}

uint64_t __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString alloc];
  v5 = objc_msgSend(*(id *)(a1 + 32), "ef_SQLEscapedString");
  id v6 = (void *)[v4 initWithFormat:@"SELECT ROWID, action_type, user_initiated, mailbox, source_mailbox, destination_mailbox FROM local_message_actions WHERE ((mailbox IN (SELECT ROWID FROM mailboxes WHERE url GLOB '%@*')) AND (ROWID > ?)) ORDER BY ROWID", v5];

  id v7 = [v3 preparedStatementForQueryString:v6];
  id v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 72)];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_2;
  v12[3] = &unk_1E6C01720;
  v12[4] = *(void *)(a1 + 40);
  id v10 = v3;
  id v13 = v10;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  [v7 executeWithIndexedBindings:v9 usingBlock:v12 error:0];

  return 1;
}

void __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"action_type"];
  uint64_t v4 = [v3 integerValue];

  switch(v4)
  {
    case 1:
    case 2:
    case 5:
    case 6:
      uint64_t v5 = [*(id *)(a1 + 32) _transferActionForRow:v10 connection:*(void *)(a1 + 40) failedMessages:*(void *)(a1 + 48)];
      goto LABEL_7;
    case 3:
      uint64_t v5 = [*(id *)(a1 + 32) _flagChangeActionForRow:v10 connection:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 4:
      uint64_t v5 = [*(id *)(a1 + 32) _labelChangeActionForRow:v10 connection:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 7:
      uint64_t v5 = [*(id *)(a1 + 32) _flagChangeAllActionForRow:v10 connection:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 8:
    case 9:
    case 10:
      uint64_t v5 = [*(id *)(a1 + 32) _transferUndownloadedActionForRow:v10 connection:*(void *)(a1 + 40)];
LABEL_7:
      id v6 = (void *)v5;
      if (!v5) {
        goto LABEL_9;
      }
      [*(id *)(a1 + 56) addObject:v5];
      break;
    default:
LABEL_9:
      id v7 = *(void **)(a1 + 64);
      id v8 = [v10 objectForKeyedSubscript:@"ROWID"];
      v9 = [v8 numberValue];
      [v7 addObject:v9];

      id v6 = 0;
      break;
  }
}

uint64_t __73__EDLocalActionPersistence_messageActionsForAccountURL_previousActionID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString alloc];
  uint64_t v5 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
  id v6 = (void *)[v4 initWithFormat:@"DELETE FROM local_message_actions WHERE ROWID IN (%@);", v5];

  id v7 = [v3 preparedStatementForQueryString:v6];
  id v11 = 0;
  char v8 = [v7 executeUsingBlock:0 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0) {
    [v3 handleError:v9 message:@"deleting actions"];
  }

  return 1;
}

- (id)_transferActionForRow:(id)a3 connection:(id)a4 failedMessages:(id)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v39 = a4;
  v40 = v8;
  id v9 = [v8 objectForKeyedSubscript:@"ROWID"];
  uint64_t v37 = [v9 databaseIDValue];

  id v10 = [v8 objectForKeyedSubscript:@"action_type"];
  uint64_t v11 = [v10 integerValue];

  id v12 = [v8 objectForKeyedSubscript:@"mailbox"];
  uint64_t v13 = [v12 databaseIDValue];

  id v14 = [v8 objectForKeyedSubscript:@"source_mailbox"];
  uint64_t v15 = [v14 databaseIDValue];

  id v16 = [v40 objectForKeyedSubscript:@"destination_mailbox"];
  uint64_t v17 = [v16 databaseIDValue];

  v18 = [v40 objectForKeyedSubscript:@"user_initiated"];
  char v19 = [v18 BOOLValue];

  v20 = objc_opt_new();
  char v35 = v19;
  uint64_t v36 = v15;
  v21 = objc_opt_new();
  id v22 = objc_opt_new();
  uint64_t v23 = v11;
  v38 = [v39 preparedStatementForQueryString:@"SELECT action_phase, remote_id, message, destination_message FROM action_messages WHERE action = ?", v22, v21, v20];
  SEL v24 = a2;
  v25 = [NSNumber numberWithLongLong:v37];
  v58[0] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke;
  v53[3] = &unk_1E6C01798;
  v53[4] = self;
  uint64_t v57 = v17;
  id v27 = v20;
  id v54 = v27;
  id v28 = v21;
  id v55 = v28;
  id v29 = v22;
  id v56 = v29;
  [v38 executeWithIndexedBindings:v26 usingBlock:v53 error:0];

  if ([v27 count] || objc_msgSend(v28, "count") || objc_msgSend(v29, "count"))
  {
    v30 = [(EDLocalActionPersistence *)self mailboxURLForDatabaseID:v13];
    id v31 = objc_alloc(MEMORY[0x1E4F60908]);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_2;
    v41[3] = &unk_1E6C017C0;
    uint64_t v47 = v37;
    id v32 = v30;
    char v52 = v35;
    id v42 = v32;
    v43 = self;
    uint64_t v48 = v36;
    uint64_t v49 = v17;
    uint64_t v50 = v23;
    SEL v51 = v24;
    id v44 = v27;
    id v45 = v28;
    id v46 = v29;
    v33 = (void *)[v31 initWithBuilder:v41];
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"action_phase"];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v3 objectForKeyedSubscript:@"remote_id"];
  id v7 = [v6 stringValue];

  if ([v7 length]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v3 objectForKeyedSubscript:@"message"];
  uint64_t v11 = [v10 numberValue];

  id v12 = [v3 objectForKeyedSubscript:@"destination_message"];
  uint64_t v13 = [v12 databaseIDValue];

  uint64_t v14 = [*(id *)(a1 + 32) messageForDatabaseID:v13];
  uint64_t v15 = (void *)v14;
  if (*(void *)(a1 + 64) && !v14)
  {
    id v16 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_cold_1((uint64_t *)(a1 + 64), v16);
    }
  }
  if (v13 || v5 == 4 && v9)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F60910]);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    SEL v24 = __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_86;
    v25 = &unk_1E6C01770;
    id v18 = v11;
    uint64_t v19 = *(void *)(a1 + 32);
    id v26 = v18;
    uint64_t v27 = v19;
    id v28 = v9;
    id v29 = v15;
    v20 = (void *)[v17 initWithBuilder:&v22];
    if (v5 != 1)
    {
      if (v5 == 3)
      {
        if (*(void *)(a1 + 64))
        {
          v21 = (id *)(a1 + 48);
          goto LABEL_19;
        }
      }
      else if (v5 == 4)
      {
        v21 = (id *)(a1 + 56);
LABEL_19:
        objc_msgSend(*v21, "addObject:", v20, v22, v23, v24, v25, v26, v27, v28);
      }

      goto LABEL_21;
    }
    v21 = (id *)(a1 + 40);
    goto LABEL_19;
  }
LABEL_21:
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "messageForDatabaseID:", objc_msgSend(v4, "longLongValue"));
    [v6 setSourceMessage:v5];

    id v3 = v6;
  }
  [v3 setSourceRemoteID:*(void *)(a1 + 48)];
  [v6 setDestinationMessage:*(void *)(a1 + 56)];
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60888]) initWithDatabaseID:*(void *)(a1 + 72)];
  [v8 setPersistentID:v3];

  [v8 setMailboxURL:*(void *)(a1 + 32)];
  [v8 setUserInitiated:*(unsigned __int8 *)(a1 + 112)];
  if (*(void *)(a1 + 80))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:");
  }
  else
  {
    id v4 = 0;
  }
  [v8 setSourceMailboxURL:v4];
  if (*(void *)(a1 + 88))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "mailboxURLForDatabaseID:");
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v8 setDestinationMailboxURL:v5];
  unint64_t v6 = *(void *)(a1 + 96) - 1;
  if (v6 < 6 && ((0x33u >> v6) & 1) != 0)
  {
    [v8 setTransferType:qword_1DB640420[v6]];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 40) file:@"EDLocalActionPersistence.m" lineNumber:309 description:@"Creating a transfer action when we don't have a transfer action type"];
  }
  [v8 setItemsToDownload:*(void *)(a1 + 48)];
  [v8 setItemsToCopy:*(void *)(a1 + 56)];
  [v8 setItemsToDelete:*(void *)(a1 + 64)];
}

- (id)_transferUndownloadedActionForRow:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"ROWID"];
  uint64_t v8 = [v7 databaseIDValue];

  id v9 = [v6 objectForKeyedSubscript:@"action_type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"mailbox"];
  uint64_t v12 = [v11 databaseIDValue];

  uint64_t v13 = [v6 objectForKeyedSubscript:@"source_mailbox"];
  uint64_t v14 = [v13 databaseIDValue];

  uint64_t v15 = [v6 objectForKeyedSubscript:@"destination_mailbox"];
  uint64_t v25 = [v15 databaseIDValue];

  id v16 = [v6 objectForKeyedSubscript:@"user_initiated"];
  char v17 = [v16 BOOLValue];

  id v18 = objc_opt_new();
  [(EDLocalActionPersistence *)self _findMessagesForAction:v8 remoteIDs:v18 messages:0 connection:v28];
  if ([v18 count] != 1)
  {
    SEL v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"EDLocalActionPersistence.m" lineNumber:328 description:@"A transfer all action should always have exactly one remote ID associated with it"];
  }
  uint64_t v19 = objc_msgSend(v18, "anyObject", v25);
  v20 = [(EDLocalActionPersistence *)self mailboxURLForDatabaseID:v12];
  if ([v19 isEqualToString:@"1"])
  {
    v21 = 0;
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x1E4F60928]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__EDLocalActionPersistence__transferUndownloadedActionForRow_connection___block_invoke;
    v29[3] = &unk_1E6C017E8;
    uint64_t v33 = v8;
    char v38 = v17;
    id v30 = v20;
    id v31 = self;
    uint64_t v34 = v14;
    uint64_t v35 = v26;
    uint64_t v36 = v10;
    SEL v37 = a2;
    id v32 = v19;
    v21 = (void *)[v22 initWithBuilder:v29];
  }

  return v21;
}

void __73__EDLocalActionPersistence__transferUndownloadedActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60888]) initWithDatabaseID:*(void *)(a1 + 56)];
  [v8 setPersistentID:v3];

  [v8 setMailboxURL:*(void *)(a1 + 32)];
  [v8 setUserInitiated:*(unsigned __int8 *)(a1 + 96)];
  id v4 = [*(id *)(a1 + 40) mailboxURLForDatabaseID:*(void *)(a1 + 64)];
  [v8 setSourceMailboxURL:v4];
  uint64_t v5 = [*(id *)(a1 + 40) mailboxURLForDatabaseID:*(void *)(a1 + 72)];
  [v8 setDestinationMailboxURL:v5];
  unint64_t v6 = *(void *)(a1 + 80) - 8;
  if (v6 >= 3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 40) file:@"EDLocalActionPersistence.m" lineNumber:356 description:@"Creating a transfer action when we don't have a transfer action type"];
  }
  else
  {
    [v8 setTransferType:qword_1DB640450[v6]];
  }
  [v8 setOldestPersistedRemoteID:*(void *)(a1 + 48)];
}

- (id)_flagChangeActionForRow:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"ROWID"];
  uint64_t v9 = [v8 databaseIDValue];

  uint64_t v10 = [v6 objectForKeyedSubscript:@"mailbox"];
  uint64_t v11 = [v10 databaseIDValue];

  uint64_t v12 = [v6 objectForKeyedSubscript:@"user_initiated"];
  char v13 = [v12 BOOLValue];

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = objc_opt_new();
  [(EDLocalActionPersistence *)self _findMessagesForAction:v9 remoteIDs:v14 messages:v15 connection:v7];
  id v16 = [(EDLocalActionPersistence *)self _flagChangeForAction:v9 connection:v7];
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    char v17 = [(EDLocalActionPersistence *)self mailboxURLForDatabaseID:v11];
    id v18 = objc_alloc(MEMORY[0x1E4F60828]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__EDLocalActionPersistence__flagChangeActionForRow_connection___block_invoke;
    v22[3] = &unk_1E6C01810;
    uint64_t v27 = v9;
    id v19 = v17;
    id v23 = v19;
    char v28 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    v20 = (void *)[v18 initWithBuilder:v22];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __63__EDLocalActionPersistence__flagChangeActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60888]) initWithDatabaseID:*(void *)(a1 + 64)];
  [v4 setPersistentID:v3];

  [v4 setMailboxURL:*(void *)(a1 + 32)];
  [v4 setUserInitiated:*(unsigned __int8 *)(a1 + 72)];
  [v4 setRemoteIDs:*(void *)(a1 + 40)];
  [v4 setMessages:*(void *)(a1 + 48)];
  [v4 setFlagChange:*(void *)(a1 + 56)];
}

- (id)_flagChangeAllActionForRow:(id)a3 connection:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"ROWID"];
  uint64_t v9 = [v8 databaseIDValue];

  uint64_t v10 = [v6 objectForKeyedSubscript:@"mailbox"];
  uint64_t v11 = [v10 databaseIDValue];

  uint64_t v12 = [v6 objectForKeyedSubscript:@"user_initiated"];
  char v13 = [v12 BOOLValue];

  uint64_t v14 = objc_opt_new();
  uint64_t v15 = objc_opt_new();
  [(EDLocalActionPersistence *)self _findMessagesForAction:v9 remoteIDs:v14 messages:v15 connection:v7];
  if ([v14 count] == 1)
  {
    id v16 = [v14 anyObject];
    char v17 = [(EDLocalActionPersistence *)self _flagChangeForAction:v9 connection:v7];
    id v18 = [(EDLocalActionPersistence *)self mailboxURLForDatabaseID:v11];
    if ([v16 isEqualToString:@"1"])
    {
      id v19 = 0;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F60838]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__EDLocalActionPersistence__flagChangeAllActionForRow_connection___block_invoke;
      v22[3] = &unk_1E6C01838;
      uint64_t v26 = v9;
      id v23 = v18;
      char v27 = v13;
      id v24 = v16;
      id v25 = v17;
      id v19 = (void *)[v20 initWithBuilder:v22];
    }
  }
  else
  {
    id v16 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[EDLocalActionPersistence _flagChangeAllActionForRow:connection:](buf, [v14 count], v16);
    }
    id v19 = 0;
  }

  return v19;
}

void __66__EDLocalActionPersistence__flagChangeAllActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60888]) initWithDatabaseID:*(void *)(a1 + 56)];
  [v4 setPersistentID:v3];

  [v4 setMailboxURL:*(void *)(a1 + 32)];
  [v4 setUserInitiated:*(unsigned __int8 *)(a1 + 64)];
  [v4 setOldestPersistedRemoteID:*(void *)(a1 + 40)];
  [v4 setFlagChange:*(void *)(a1 + 48)];
}

- (id)_labelChangeActionForRow:(id)a3 connection:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  char v27 = v6;
  id v7 = [v6 objectForKeyedSubscript:@"ROWID"];
  uint64_t v8 = [v7 databaseIDValue];

  uint64_t v9 = [v6 objectForKeyedSubscript:@"mailbox"];
  uint64_t v10 = [v9 databaseIDValue];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"user_initiated"];
  char v12 = [v11 BOOLValue];

  char v13 = objc_opt_new();
  uint64_t v29 = objc_opt_new();
  -[EDLocalActionPersistence _findMessagesForAction:remoteIDs:messages:connection:](self, "_findMessagesForAction:remoteIDs:messages:connection:", v8, v13);
  uint64_t v26 = objc_opt_new();
  id v25 = objc_opt_new();
  char v28 = [v30 preparedStatementForQueryString:@"SELECT label, do_add FROM action_labels WHERE action = ?"];
  uint64_t v14 = [(EDLocalActionPersistence *)self gmailLabelPersistence];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", v8, v14);
  v43[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke;
  v39[3] = &unk_1E6C01860;
  id v17 = v14;
  id v40 = v17;
  id v18 = v26;
  id v41 = v18;
  id v19 = v25;
  id v42 = v19;
  [v28 executeWithIndexedBindings:v16 usingBlock:v39 error:0];

  if (([v13 count] || objc_msgSend(v29, "count"))
    && ([v18 count] || objc_msgSend(v19, "count")))
  {
    id v20 = [(EDLocalActionPersistence *)self mailboxURLForDatabaseID:v10];
    id v21 = objc_alloc(MEMORY[0x1E4F60878]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke_2;
    v31[3] = &unk_1E6C01888;
    uint64_t v37 = v8;
    id v22 = v20;
    id v32 = v22;
    char v38 = v12;
    id v33 = v13;
    id v34 = v29;
    id v35 = v18;
    id v36 = v19;
    id v23 = (void *)[v21 initWithBuilder:v31];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

void __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"label"];
  uint64_t v4 = [v3 integerValue];

  uint64_t v5 = [*(id *)(a1 + 32) labelForDatabaseID:v4];
  if (v5)
  {
    id v6 = [v10 objectForKeyedSubscript:@"do_add"];
    id v7 = [v6 numberValue];
    int v8 = [v7 BOOLValue];

    uint64_t v9 = 48;
    if (v8) {
      uint64_t v9 = 40;
    }
    [*(id *)(a1 + v9) addObject:v5];
  }
}

void __64__EDLocalActionPersistence__labelChangeActionForRow_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60888]) initWithDatabaseID:*(void *)(a1 + 72)];
  [v4 setPersistentID:v3];

  [v4 setMailboxURL:*(void *)(a1 + 32)];
  [v4 setUserInitiated:*(unsigned __int8 *)(a1 + 80)];
  [v4 setRemoteIDs:*(void *)(a1 + 40)];
  [v4 setMessages:*(void *)(a1 + 48)];
  [v4 setLabelsToAdd:*(void *)(a1 + 56)];
  [v4 setLabelsToRemove:*(void *)(a1 + 64)];
}

- (void)_findMessagesForAction:(int64_t)a3 remoteIDs:(id)a4 messages:(id)a5 connection:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  char v12 = [a6 preparedStatementForQueryString:@"SELECT remote_id, message FROM action_messages WHERE action = ?"];
  char v13 = [NSNumber numberWithLongLong:a3];
  v20[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __81__EDLocalActionPersistence__findMessagesForAction_remoteIDs_messages_connection___block_invoke;
  v17[3] = &unk_1E6C01860;
  v17[4] = self;
  id v15 = v11;
  id v18 = v15;
  id v16 = v10;
  id v19 = v16;
  [v12 executeWithIndexedBindings:v14 usingBlock:v17 error:0];
}

void __81__EDLocalActionPersistence__findMessagesForAction_remoteIDs_messages_connection___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"remote_id"];
  id v4 = [v3 stringValue];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v10 objectForKeyedSubscript:@"message"];
  id v7 = objc_msgSend(v5, "messageForDatabaseID:", objc_msgSend(v6, "databaseIDValue"));

  if (v7)
  {
    int v8 = (id *)(a1 + 40);
    uint64_t v9 = v7;
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    int v8 = (id *)(a1 + 48);
    uint64_t v9 = v4;
  }
  [*v8 addObject:v9];
LABEL_6:
}

- (id)_flagChangeForAction:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F608B8]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke;
  v10[3] = &unk_1E6C018B0;
  id v7 = v5;
  id v11 = v7;
  int64_t v12 = a3;
  int v8 = (void *)[v6 initWithBuilder:v10];

  return v8;
}

void __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) preparedStatementForQueryString:@"SELECT flag_type, flag_value FROM action_flags WHERE action = ?"];
  id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke_2;
  v10[3] = &unk_1E6BFF3B0;
  id v7 = v3;
  id v11 = v7;
  id v9 = 0;
  [v4 executeWithIndexedBindings:v6 usingBlock:v10 error:&v9];
  id v8 = v9;
}

void __60__EDLocalActionPersistence__flagChangeForAction_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 objectForKeyedSubscript:@"flag_type"];
  id v4 = [v3 numberValue];
  uint64_t v5 = [v4 unsignedIntegerValue];

  switch(v5)
  {
    case 1:
      id v6 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v6, "changesReadTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 2:
      id v9 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v9, "changesDeletedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 3:
      id v10 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v10, "changesRepliedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 4:
      id v11 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v11, "changesFlaggedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 5:
      int64_t v12 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v12, "changesDraftTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 6:
      char v13 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v13, "changesForwardedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 7:
      uint64_t v14 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v14, "changesRedirectedTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 8:
      id v15 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v15, "changesJunkLevelSetByUserTo:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 9:
      id v16 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v16, "changesJunkLevelTo:", objc_msgSend(v8, "unsignedIntegerValue"));
      goto LABEL_12;
    case 10:
      id v17 = *(void **)(a1 + 32);
      id v7 = [v18 objectForKeyedSubscript:@"flag_value"];
      id v8 = [v7 numberValue];
      objc_msgSend(v17, "changesFlagColorTo:", objc_msgSend(v8, "unsignedIntegerValue"));
LABEL_12:

      break;
    default:
      break;
  }
}

- (id)messageForDatabaseID:(int64_t)a3
{
}

- (BOOL)persistFlagChangeAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mailboxURL];
  uint64_t v6 = [(EDLocalActionPersistence *)self mailboxDatabaseIDForURL:v5];

  id v7 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 messages];
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Creating flag change action for %lu messages in mailbox %{public}llu", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v19 = 1;
  id v9 = [(EDLocalActionPersistence *)self database];
  id v10 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence persistFlagChangeAction:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__EDLocalActionPersistence_persistFlagChangeAction___block_invoke;
  v14[3] = &unk_1E6C00008;
  id v16 = buf;
  uint64_t v17 = v6;
  v14[4] = self;
  id v11 = v4;
  id v15 = v11;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

BOOL __52__EDLocalActionPersistence_persistFlagChangeAction___block_invoke(uint64_t a1, void *a2)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox) VALUES (?, ?)"];
  v30[0] = &unk_1F35BAC88;
  uint64_t v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  v30[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v26 = 0;
  char v7 = [v4 executeWithIndexedBindings:v6 usingBlock:0 error:&v26];
  id v8 = v26;

  if (v7)
  {
    uint64_t v9 = [v3 lastInsertedDatabaseID];
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) flagChange];
    [v10 _addFlagChange:v11 actionID:v9 connection:v3];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v12 = objc_msgSend(*(id *)(a1 + 40), "messages", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(a1 + 32) _addActionMessageForMessage:*(void *)(*((void *)&v22 + 1) + 8 * v15++) destinationMessage:0 actionID:v9 actionPhase:0 connection:v3];
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    goto LABEL_17;
  }
  id v16 = [v8 domain];
  if (![v16 isEqualToString:*MEMORY[0x1E4F60D10]])
  {

    goto LABEL_16;
  }
  BOOL v17 = [v8 code] == 19;

  if (!v17)
  {
LABEL_16:
    [v3 handleError:v8 message:@"Adding flag change action"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_17;
  }
  id v18 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134349056;
    uint64_t v29 = v19;
    _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Got foreign key constraint error adding action for mailbox %{public}llu", buf, 0xCu);
  }

LABEL_17:
  BOOL v20 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;

  return v20;
}

- (BOOL)persistFlagChangeUndownloadedAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mailboxURL];
  uint64_t v6 = [(EDLocalActionPersistence *)self mailboxDatabaseIDForURL:v5];

  char v7 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Creating flag change all action in mailbox %{public}llu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v8 = [(EDLocalActionPersistence *)self database];
  uint64_t v9 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence persistFlagChangeUndownloadedAction:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__EDLocalActionPersistence_persistFlagChangeUndownloadedAction___block_invoke;
  v13[3] = &unk_1E6C00008;
  p_long long buf = &buf;
  uint64_t v16 = v6;
  void v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v13);

  BOOL v11 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v11;
}

BOOL __64__EDLocalActionPersistence_persistFlagChangeUndownloadedAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"local_message_actions" conflictResolution:4];
  [v4 setObject:&unk_1F35BACA0 forKeyedSubscript:@"action_type"];
  uint64_t v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  [v4 setObject:v5 forKeyedSubscript:@"mailbox"];

  uint64_t v18 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 executeInsertStatement:v4 rowsChanged:&v18];
  uint64_t v6 = v18;
  int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v8 = v18 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F5FCC8];
  }
  else
  {
    uint64_t v9 = [v3 lastInsertedDatabaseID];
    id v10 = *(void **)(a1 + 32);
    BOOL v11 = [*(id *)(a1 + 40) flagChange];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 _addFlagChange:v11 actionID:v9 connection:v3];

    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v7) {
    BOOL v12 = v6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"action_messages"];
    id v14 = [NSNumber numberWithLongLong:v9];
    [v13 setObject:v14 forKeyedSubscript:@"action"];

    uint64_t v15 = [*(id *)(a1 + 40) oldestPersistedRemoteID];
    [v13 setObject:v15 forKeyedSubscript:@"remote_id"];

    [v13 setObject:&unk_1F35BACB8 forKeyedSubscript:@"action_phase"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 executeInsertStatement:v13 error:0];

    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  BOOL v16 = v7 != 0;

  return v16;
}

- (BOOL)_addFlagChange:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 preparedStatementForQueryString:@"INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, ?, ?)"];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__14;
  id v26 = __Block_byref_object_dispose__14;
  id v27 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __63__EDLocalActionPersistence__addFlagChange_actionID_connection___block_invoke;
  BOOL v17 = &unk_1E6C018D8;
  char v19 = &v28;
  id v10 = v9;
  uint64_t v20 = &v22;
  int64_t v21 = a4;
  id v18 = v10;
  BOOL v11 = (void (**)(void *, uint64_t, uint64_t, void))_Block_copy(&v14);
  v11[2](v11, objc_msgSend(v7, "readChanged", v14, v15, v16, v17), 1, objc_msgSend(v7, "read"));
  v11[2](v11, [v7 deletedChanged], 2, objc_msgSend(v7, "deleted"));
  v11[2](v11, [v7 repliedChanged], 3, objc_msgSend(v7, "replied"));
  v11[2](v11, [v7 flaggedChanged], 4, objc_msgSend(v7, "flagged"));
  v11[2](v11, [v7 draftChanged], 5, objc_msgSend(v7, "draft"));
  v11[2](v11, [v7 forwardedChanged], 6, objc_msgSend(v7, "forwarded"));
  v11[2](v11, [v7 redirectedChanged], 7, objc_msgSend(v7, "redirected"));
  v11[2](v11, [v7 junkLevelSetByUserChanged], 8, objc_msgSend(v7, "junkLevelSetByUser"));
  v11[2](v11, [v7 junkLevelChanged], 9, objc_msgSend(v7, "junkLevel"));
  v11[2](v11, [v7 flagColorChanged], 10, objc_msgSend(v7, "flagColor"));
  if (*((unsigned char *)v29 + 24))
  {
    BOOL v12 = 1;
  }
  else
  {
    [v8 handleError:v23[5] message:@"Adding flag change records"];
    BOOL v12 = *((unsigned char *)v29 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __63__EDLocalActionPersistence__addFlagChange_actionID_connection___block_invoke(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = [NSNumber numberWithLongLong:a1[7]];
    v15[0] = v9;
    id v10 = [NSNumber numberWithInteger:a3];
    v15[1] = v10;
    BOOL v11 = [NSNumber numberWithInteger:a4];
    v15[2] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    uint64_t v13 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v13 + 40);
    LOBYTE(v8) = [v8 executeWithIndexedBindings:v12 usingBlock:0 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v8;
  }
}

- (BOOL)persistTransferAction:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFString *)a3;
  uint64_t v5 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v53 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Persisting the transferAction: %@", buf, 0xCu);
  }

  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 1;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = *MEMORY[0x1E4F5FCC8];
  uint64_t v6 = [(__CFString *)v4 sourceMailboxURL];
  if (v6)
  {
    id v7 = NSNumber;
    id v8 = [(__CFString *)v4 sourceMailboxURL];
    uint64_t v9 = objc_msgSend(v7, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v8));
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }

  id v10 = [(__CFString *)v4 destinationMailboxURL];
  if (v10)
  {
    BOOL v11 = NSNumber;
    BOOL v12 = [(__CFString *)v4 destinationMailboxURL];
    id v36 = objc_msgSend(v11, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v12));
  }
  else
  {
    id v36 = [MEMORY[0x1E4F1CA98] null];
  }

  uint64_t v13 = [(EDLocalActionPersistence *)self database];
  uint64_t v14 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence persistTransferAction:]"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __50__EDLocalActionPersistence_persistTransferAction___block_invoke;
  v37[3] = &unk_1E6C01900;
  uint64_t v15 = v4;
  char v38 = v15;
  id v39 = self;
  id v42 = &v48;
  id v16 = v9;
  id v40 = v16;
  id v17 = v36;
  id v41 = v17;
  v43 = &v44;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v37);

  unint64_t v18 = [(__CFString *)v15 transferType];
  if (v18 >= 4) {
    id v35 = 0;
  }
  else {
    id v35 = off_1E6C01990[v18];
  }
  char v19 = [(__CFString *)v15 itemsToDownload];
  uint64_t v34 = [v19 count];
  uint64_t v20 = [(__CFString *)v15 itemsToCopy];
  uint64_t v33 = [v20 count];
  int64_t v21 = [(__CFString *)v15 itemsToDelete];
  uint64_t v22 = [v21 count];

  long long v23 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v45[3];
    id v32 = [(__CFString *)v15 itemsToDownload];
    uint64_t v25 = [v32 count];
    id v26 = [(__CFString *)v15 itemsToCopy];
    uint64_t v27 = [v26 count];
    uint64_t v28 = [(__CFString *)v15 itemsToDelete];
    uint64_t v29 = [v28 count];
    *(_DWORD *)long long buf = 138545154;
    v53 = v35;
    __int16 v54 = 2048;
    uint64_t v55 = v24;
    __int16 v56 = 2048;
    uint64_t v57 = v33 + v34 + v22;
    __int16 v58 = 2048;
    uint64_t v59 = v25;
    __int16 v60 = 2048;
    uint64_t v61 = v27;
    __int16 v62 = 2048;
    uint64_t v63 = v29;
    __int16 v64 = 2112;
    id v65 = v16;
    __int16 v66 = 2112;
    id v67 = v17;
    _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Created %{public}@ action %lld for %lu messages (%lu download, %lu copy, %lu delete) in source mailbox %@, destination %@", buf, 0x52u);
  }
  BOOL v30 = *((unsigned char *)v49 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

BOOL __50__EDLocalActionPersistence_persistTransferAction___block_invoke(uint64_t a1, void *a2)
{
  v61[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v44 = [v3 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, user_initiated, mailbox, source_mailbox, destination_mailbox) VALUES (?, ?, ?, ?, ?)"];
  unint64_t v4 = [*(id *)(a1 + 32) transferType];
  if (v4 >= 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1DB640468[v4];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) mailboxURL];
  uint64_t v8 = [v6 mailboxDatabaseIDForURL:v7];

  uint64_t v9 = [NSNumber numberWithInteger:v5];
  v61[0] = v9;
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "userInitiated"));
  v61[1] = v10;
  BOOL v11 = [NSNumber numberWithLongLong:v8];
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  v61[2] = v11;
  v61[3] = v12;
  v61[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];
  id v57 = 0;
  char v15 = [v44 executeWithIndexedBindings:v14 usingBlock:0 error:&v57];
  id v16 = v57;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_31;
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 lastInsertedDatabaseID];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = [*(id *)(a1 + 32) itemsToDownload];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v17);
        }
        int64_t v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v22 = *(void **)(a1 + 40);
        long long v23 = [v21 sourceMessage];
        uint64_t v24 = [v21 destinationMessage];
        [v22 _addActionMessageForMessage:v23 destinationMessage:v24 actionID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) actionPhase:1 connection:v3];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v18);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v25 = [*(id *)(a1 + 32) itemsToCopy];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        BOOL v30 = *(void **)(a1 + 40);
        char v31 = [v29 sourceMessage];
        id v32 = [v29 destinationMessage];
        [v30 _addActionMessageForMessage:v31 destinationMessage:v32 actionID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) actionPhase:3 connection:v3];
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v26);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v33 = [*(id *)(a1 + 32) itemsToDelete];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        char v38 = [v37 sourceMessage];

        id v39 = *(void **)(a1 + 40);
        if (v38)
        {
          id v40 = [v37 sourceMessage];
          id v41 = [v37 destinationMessage];
          [v39 _addActionMessageForMessage:v40 destinationMessage:v41 actionID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) actionPhase:4 connection:v3];
        }
        else
        {
          id v40 = [v37 sourceRemoteID];
          [v39 _addActionMessageForSourceRemoteID:v40 actionID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) connection:v3];
        }
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v34);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    BOOL v42 = 1;
  }
  else
  {
LABEL_31:
    [v3 handleError:v16 message:@"Adding copy action"];
    BOOL v42 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }

  return v42;
}

- (BOOL)persistTransferUndownloadedAction:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = *MEMORY[0x1E4F5FCC8];
  uint64_t v5 = [v4 sourceMailboxURL];
  if (v5)
  {
    uint64_t v6 = NSNumber;
    id v7 = [v4 sourceMailboxURL];
    uint64_t v8 = objc_msgSend(v6, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v7));
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v9 = [v4 destinationMailboxURL];
  if (v9)
  {
    id v10 = NSNumber;
    BOOL v11 = [v4 destinationMailboxURL];
    uint64_t v12 = objc_msgSend(v10, "numberWithLongLong:", -[EDLocalActionPersistence mailboxDatabaseIDForURL:](self, "mailboxDatabaseIDForURL:", v11));
  }
  else
  {
    uint64_t v12 = 0;
  }

  uint64_t v13 = [(EDLocalActionPersistence *)self database];
  uint64_t v14 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence persistTransferUndownloadedAction:]"];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __62__EDLocalActionPersistence_persistTransferUndownloadedAction___block_invoke;
  uint64_t v28 = &unk_1E6C01928;
  id v15 = v4;
  id v29 = v15;
  BOOL v30 = self;
  id v16 = v8;
  id v31 = v16;
  id v17 = v12;
  id v32 = v17;
  uint64_t v33 = &v39;
  uint64_t v34 = &v35;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, &v25);

  unint64_t v18 = objc_msgSend(v15, "transferType", v25, v26, v27, v28);
  if (v18 >= 4) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = off_1E6C01990[v18];
  }
  uint64_t v20 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v36[3];
    int v22 = *((unsigned __int8 *)v40 + 24);
    *(_DWORD *)long long buf = 138544130;
    uint64_t v44 = v19;
    __int16 v45 = 2048;
    uint64_t v46 = v21;
    __int16 v47 = 2112;
    id v48 = v17;
    __int16 v49 = 1024;
    int v50 = v22;
    _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Created %{public}@ action %lld for undownloaded message in mailbox %@ (success = %d)", buf, 0x26u);
  }

  BOOL v23 = *((unsigned char *)v40 + 24) != 0;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

BOOL __62__EDLocalActionPersistence_persistTransferUndownloadedAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) transferType];
  if (v4 >= 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1DB640488[v4];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) mailboxURL];
  uint64_t v8 = [v6 mailboxDatabaseIDForURL:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"local_message_actions" conflictResolution:4];
  id v10 = [NSNumber numberWithInteger:v5];
  [v9 setObject:v10 forKeyedSubscript:@"action_type"];

  BOOL v11 = [NSNumber numberWithLongLong:v8];
  [v9 setObject:v11 forKeyedSubscript:@"mailbox"];

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:@"source_mailbox"];
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    [v9 setObject:v13 forKeyedSubscript:@"destination_mailbox"];
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "userInitiated"));
  [v9 setObject:v14 forKeyedSubscript:@"user_initiated"];

  uint64_t v23 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeInsertStatement:v9 rowsChanged:&v23];
  int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && v23)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 lastInsertedDatabaseID];
    if ([*(id *)(a1 + 32) transferType] == 3) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = 3;
    }
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"action_messages"];
    unint64_t v18 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [v17 setObject:v18 forKeyedSubscript:@"action"];

    uint64_t v19 = [*(id *)(a1 + 32) oldestPersistedRemoteID];
    [v17 setObject:v19 forKeyedSubscript:@"remote_id"];

    uint64_t v20 = [NSNumber numberWithInteger:v16];
    [v17 setObject:v20 forKeyedSubscript:@"action_phase"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeInsertStatement:v17 error:0];
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  BOOL v21 = v15 != 0;

  return v21;
}

- (BOOL)persistLabelChangeAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mailboxURL];
  uint64_t v6 = [(EDLocalActionPersistence *)self mailboxDatabaseIDForURL:v5];

  id v7 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 messages];
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Creating label change action for %lu messages in mailbox %{public}llu", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v20 = 1;
  uint64_t v9 = [(EDLocalActionPersistence *)self database];
  id v10 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence persistLabelChangeAction:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__EDLocalActionPersistence_persistLabelChangeAction___block_invoke;
  v14[3] = &unk_1E6C00008;
  id v17 = buf;
  uint64_t v18 = v6;
  id v11 = v4;
  id v15 = v11;
  uint64_t v16 = self;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

BOOL __53__EDLocalActionPersistence_persistLabelChangeAction___block_invoke(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox) VALUES (?, ?)"];
  v23[0] = &unk_1F35BACD0;
  uint64_t v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  v23[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 executeWithIndexedBindings:v6 usingBlock:0 error:0];

  uint64_t v7 = [v3 lastInsertedDatabaseID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "messages", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v8);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) _addActionMessageForMessage:*(void *)(*((void *)&v18 + 1) + 8 * v11) destinationMessage:0 actionID:v7 actionPhase:0 connection:v3];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && (BOOL v12 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) labelsToAdd],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 _setLabelsOnAction:v7 labels:v13 add:1 connection:v3], v13, *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    uint64_t v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) labelsToRemove];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v14 _setLabelsOnAction:v7 labels:v15 add:0 connection:v3];

    BOOL v16 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_setLabelsOnAction:(int64_t)a3 labels:(id)a4 add:(BOOL)a5 connection:(id)a6
{
  BOOL v24 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v26 = a6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v23 = *(void *)v29;
    unint64_t v9 = 0x1E4F28000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL v12 = [v26 preparedStatementForQueryString:@"INSERT INTO action_labels (action, label, do_add) VALUES (?, ?, ?)"];
        uint64_t v13 = [*(id *)(v9 + 3792) numberWithLongLong:a3];
        v32[0] = v13;
        uint64_t v14 = [v11 persistentID];
        v32[1] = v14;
        unint64_t v15 = v9;
        BOOL v16 = [*(id *)(v9 + 3792) numberWithBool:v24];
        v32[2] = v16;
        id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
        id v27 = 0;
        char v18 = [v12 executeWithIndexedBindings:v17 usingBlock:0 error:&v27];
        id v19 = v27;

        unint64_t v9 = v15;
        if ((v18 & 1) == 0)
        {
          [v26 handleError:v19 message:@"Adding flag change messages"];

          BOOL v20 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

- (BOOL)_addActionMessageForMessage:(id)a3 destinationMessage:(id)a4 actionID:(int64_t)a5 actionPhase:(int64_t)a6 connection:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v34 = v13;
  uint64_t v14 = [v12 persistentID];
  uint64_t v15 = [v14 longLongValue];

  if ((a6 & 0xFFFFFFFFFFFFFFFDLL) != 1 || v15)
  {
    char v18 = [v11 persistentID];
    uint64_t v19 = [v18 longLongValue];

    if (v19) {
      [NSNumber numberWithLongLong:v19];
    }
    else {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
    }
    BOOL v20 = [v11 remoteID];
    long long v21 = v20;
    if (v20)
    {
      id v33 = v20;
    }
    else
    {
      id v33 = [MEMORY[0x1E4F1CA98] null];
    }
    if (v15) {
      [NSNumber numberWithLongLong:v15];
    }
    else {
    int v22 = [MEMORY[0x1E4F1CA98] null];
    }
    if (a6) {
      [NSNumber numberWithInteger:a6];
    }
    else {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
    }
    BOOL v24 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"action_messages"];
    uint64_t v25 = [NSNumber numberWithLongLong:a5];
    [v24 setObject:v25 forKeyedSubscript:@"action"];

    [v24 setObject:v16 forKeyedSubscript:@"message"];
    [v24 setObject:v33 forKeyedSubscript:@"remote_id"];
    [v24 setObject:v22 forKeyedSubscript:@"destination_message"];
    [v24 setObject:v23 forKeyedSubscript:@"action_phase"];
    id v35 = 0;
    char v26 = [v13 executeInsertStatement:v24 error:&v35];
    id v27 = v35;
    long long v28 = v27;
    if (v26) {
      goto LABEL_19;
    }
    long long v29 = [v27 domain];
    if ([v29 isEqualToString:*MEMORY[0x1E4F60D10]])
    {
      BOOL v30 = [v28 code] == 19;

      if (v30)
      {
LABEL_19:
        BOOL v17 = 1;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    [v34 handleError:v28 message:@"Adding flag change messages"];
    BOOL v17 = 0;
    goto LABEL_25;
  }
  BOOL v16 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)long long buf = 134218754;
    int64_t v37 = a5;
    __int16 v38 = 2114;
    id v39 = v12;
    __int16 v40 = 2114;
    id v41 = v11;
    __int16 v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "Adding action message for transfer without destination message ID - action ID: %lld, destination message: %{public}@, source message: %{public}@\n%{public}@", buf, 0x2Au);
  }
  BOOL v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)_addActionMessageForSourceRemoteID:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = (void *)MEMORY[0x1E0190280]();
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"action_messages"];
  id v11 = [NSNumber numberWithLongLong:a4];
  [v10 setObject:v11 forKeyedSubscript:@"action"];

  [v10 setObject:v7 forKeyedSubscript:@"remote_id"];
  [v10 setObject:&unk_1F35BACD0 forKeyedSubscript:@"action_phase"];
  id v15 = 0;
  char v12 = [v8 executeInsertStatement:v10 error:&v15];
  id v13 = v15;
  if ((v12 & 1) == 0) {
    [v8 handleError:v13 message:@"Adding flag change messages"];
  }

  return v12;
}

- (BOOL)updateTransferAction:(id)a3 withResults:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  id v8 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [v7 completedItems];
    uint64_t v10 = [v9 count];
    id v11 = [v7 failedItems];
    uint64_t v12 = [v11 count];
    uint64_t v13 = [v7 phaseForResults];
    *(_DWORD *)long long buf = 138544130;
    id v30 = v6;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    __int16 v35 = 2048;
    uint64_t v36 = v13;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Persisting results for action %{public}@, completed %lu, failed %lu for phase %lu", buf, 0x2Au);
  }
  uint64_t v14 = [(EDLocalActionPersistence *)self database];
  id v15 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence updateTransferAction:withResults:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __61__EDLocalActionPersistence_updateTransferAction_withResults___block_invoke;
  v20[3] = &unk_1E6C01950;
  id v16 = v6;
  id v21 = v16;
  id v17 = v7;
  id v22 = v17;
  uint64_t v23 = self;
  BOOL v24 = &v25;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v20);

  BOOL v18 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  return v18;
}

uint64_t __61__EDLocalActionPersistence_updateTransferAction_withResults___block_invoke(uint64_t a1, void *a2)
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) persistentID];
  uint64_t v5 = [v4 databaseID];

  id v6 = [*(id *)(a1 + 40) failedItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = *(void **)(a1 + 48);
    unint64_t v9 = [*(id *)(a1 + 40) failedItems];
    [v8 _deleteCopyItems:v9 actionID:v5 connection:v3];

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) failedItems];
    objc_msgSend(v10, "updateWithFailedItems:forPhase:", v11, objc_msgSend(*(id *)(a1 + 40), "phaseForResults"));

    uint64_t v12 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 32) persistentID];
      uint64_t v14 = [*(id *)(a1 + 40) failedItems];
      *(_DWORD *)long long buf = 138543618;
      v74 = v13;
      __int16 v75 = 2048;
      uint64_t v76 = [v14 count];
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Action %{public}@ had %lu failed items", buf, 0x16u);
    }
  }
  id v15 = [*(id *)(a1 + 32) itemsToDownload];
  if ([v15 count]) {
    goto LABEL_8;
  }
  id v16 = [*(id *)(a1 + 32) itemsToCopy];
  if ([v16 count])
  {

LABEL_8:
    goto LABEL_9;
  }
  id v41 = [*(id *)(a1 + 32) itemsToDelete];
  BOOL v42 = [v41 count] == 0;

  if (v42)
  {
    [*(id *)(a1 + 48) removeMessageAction:v5];
    goto LABEL_29;
  }
LABEL_9:
  id v17 = *(void **)(a1 + 32);
  BOOL v18 = [*(id *)(a1 + 40) completedItems];
  objc_msgSend(v17, "updateWithCompletedItems:forPhase:", v18, objc_msgSend(*(id *)(a1 + 40), "phaseForResults"));

  if ([*(id *)(a1 + 40) phaseForResults] != 1)
  {
    if ([*(id *)(a1 + 40) phaseForResults] == 3)
    {
      id v22 = [*(id *)(a1 + 32) sourceMailboxURL];
      if ([*(id *)(a1 + 32) transferType] == 1
        && (uint64_t v23 = *(void **)(a1 + 48),
            [*(id *)(a1 + 32) destinationMailboxURL],
            BOOL v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v23 moveSupportedFromMailboxURL:v22 toURL:v24],
            v24,
            (v25 & 1) == 0))
      {
        id v48 = *(void **)(a1 + 48);
        __int16 v49 = [*(id *)(a1 + 40) completedItems];
        [v48 _updateCopyItems:v49 toPhase:4 actionID:v5 connection:v3];

        int v50 = [*(id *)(a1 + 32) itemsToCopy];
        BOOL v51 = [v50 count] == 0;

        if (v51)
        {
          id v65 = *(void **)(a1 + 48);
          __int16 v66 = [*(id *)(a1 + 32) sourceMailboxURL];
          int v67 = [v65 mailboxURLIsInRemoteAccount:v66];

          if (!v67)
          {
            v70 = +[EDLocalActionPersistence log];
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v71 = [*(id *)(a1 + 32) persistentID];
              *(_DWORD *)long long buf = 138543362;
              v74 = v71;
              _os_log_impl(&dword_1DB39C000, v70, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);
            }
            [*(id *)(a1 + 48) removeMessageAction:v5];
            id v30 = 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            goto LABEL_41;
          }
          id v30 = v22;
          uint64_t v68 = +[EDLocalActionPersistence log];
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v69 = [*(id *)(a1 + 32) persistentID];
            *(_DWORD *)long long buf = 138543362;
            v74 = v69;
            _os_log_impl(&dword_1DB39C000, v68, OS_LOG_TYPE_DEFAULT, "Action %{public}@ finished copying items", buf, 0xCu);
          }
          goto LABEL_19;
        }
      }
      else
      {
        char v26 = *(void **)(a1 + 48);
        uint64_t v27 = [*(id *)(a1 + 40) completedItems];
        [v26 _deleteCopyItems:v27 actionID:v5 connection:v3];

        char v28 = [*(id *)(a1 + 32) itemsToCopy];
        BOOL v29 = [v28 count] == 0;

        if (v29)
        {
          id v30 = v22;
          __int16 v31 = +[EDLocalActionPersistence log];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [*(id *)(a1 + 32) persistentID];
            *(_DWORD *)long long buf = 138543362;
            v74 = v32;
            _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);
          }
          [*(id *)(a1 + 48) removeMessageAction:v5];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_19:
          id v22 = v30;
          goto LABEL_41;
        }
      }
      id v30 = 0;
      goto LABEL_41;
    }
    if ([*(id *)(a1 + 40) phaseForResults] != 4) {
      goto LABEL_49;
    }
    __int16 v33 = *(void **)(a1 + 48);
    uint64_t v34 = [*(id *)(a1 + 40) completedItems];
    [v33 _deleteCopyItems:v34 actionID:v5 connection:v3];

    __int16 v35 = [*(id *)(a1 + 32) itemsToDelete];
    LODWORD(v33) = [v35 count] == 0;

    if (!v33) {
      goto LABEL_49;
    }
    uint64_t v36 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [*(id *)(a1 + 32) persistentID];
      *(_DWORD *)long long buf = 138543362;
      v74 = v37;
      _os_log_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 48) removeMessageAction:v5];
LABEL_29:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_49;
  }
  uint64_t v19 = [*(id *)(a1 + 32) destinationMailboxURL];

  if (v19)
  {
    BOOL v20 = *(void **)(a1 + 48);
    id v21 = [*(id *)(a1 + 40) completedItems];
    [v20 _updateCopyItems:v21 toPhase:3 actionID:v5 connection:v3];
  }
  else
  {
    uint64_t v38 = [*(id *)(a1 + 32) transferType];
    id v39 = *(void **)(a1 + 40);
    __int16 v40 = *(void **)(a1 + 48);
    if (v38 == 1)
    {
      id v21 = [v39 completedItems];
      [v40 _updateCopyItems:v21 toPhase:4 actionID:v5 connection:v3];
    }
    else
    {
      id v21 = [v39 completedItems];
      [v40 _deleteCopyItems:v21 actionID:v5 connection:v3];
    }
  }

  v43 = [*(id *)(a1 + 32) itemsToDownload];
  BOOL v44 = [v43 count] == 0;

  if (!v44) {
    goto LABEL_49;
  }
  id v30 = [*(id *)(a1 + 32) destinationMailboxURL];
  if (!v30 && [*(id *)(a1 + 32) transferType] != 1)
  {
    __int16 v45 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = [*(id *)(a1 + 32) persistentID];
      *(_DWORD *)long long buf = 138543362;
      v74 = v46;
      _os_log_impl(&dword_1DB39C000, v45, OS_LOG_TYPE_DEFAULT, "Finished action %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 48) removeMessageAction:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  id v22 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v47 = [*(id *)(a1 + 32) persistentID];
    *(_DWORD *)long long buf = 138543362;
    v74 = v47;
    _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Action %{public}@ finished downloading items", buf, 0xCu);
  }
LABEL_41:

  if (v30)
  {
    uint64_t v52 = [*(id *)(a1 + 48) mailboxDatabaseIDForURL:v30];
    long long v53 = [v3 preparedStatementForQueryString:@"UPDATE local_message_actions SET mailbox = :mailbox WHERE ROWID = :action"];
    v79[0] = @":action";
    long long v54 = [NSNumber numberWithLongLong:v5];
    v79[1] = @":mailbox";
    v80[0] = v54;
    uint64_t v55 = [NSNumber numberWithLongLong:v52];
    v80[1] = v55;
    long long v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];

    id v72 = 0;
    LOBYTE(v55) = [v53 executeWithNamedBindings:v56 usingBlock:0 error:&v72];
    id v57 = v72;
    if ((v55 & 1) == 0) {
      [v3 handleError:v57 message:@"Updating action phase"];
    }
    __int16 v58 = [*(id *)(a1 + 32) sourceMailboxURL];
    int v59 = [v30 isEqual:v58];
    __int16 v60 = @"destination mailbox";
    if (v59) {
      __int16 v60 = @"source mailbox";
    }
    uint64_t v61 = v60;

    __int16 v62 = +[EDLocalActionPersistence log];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = [*(id *)(a1 + 32) persistentID];
      *(_DWORD *)long long buf = 138543874;
      v74 = v63;
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v61;
      __int16 v77 = 2048;
      uint64_t v78 = v52;
      _os_log_impl(&dword_1DB39C000, v62, OS_LOG_TYPE_DEFAULT, "Updating action %{public}@ to %@ (%lu)", buf, 0x20u);
    }
  }
LABEL_49:

  return 1;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDLocalActionPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDLocalActionPersistence moveSupportedFromMailboxURL:toURL:]", "EDLocalActionPersistence.m", 962, "0");
}

- (BOOL)mailboxURLIsInRemoteAccount:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "ef_hasScheme:", *MEMORY[0x1E4F5FC38]) & 1) != 0
      || (objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E4F5FC30]) & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = objc_msgSend(v4, "ef_hasScheme:", *MEMORY[0x1E4F5FC28]);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateCopyItems:(id)a3 toPhase:(int64_t)a4 actionID:(int64_t)a5 connection:(id)a6
{
  id v12 = a6;
  uint64_t v10 = [(EDLocalActionPersistence *)self _whereClauseToFindCopyItems:a3];
  id v11 = [NSString stringWithFormat:@"UPDATE action_messages SET action_phase = %ld WHERE action = %llu AND %@", a4, a5, v10];
  [v12 executeStatementString:v11 errorMessage:@"Updating copy item phase"];
}

- (void)_deleteCopyItems:(id)a3 actionID:(int64_t)a4 connection:(id)a5
{
  id v10 = a5;
  id v8 = [(EDLocalActionPersistence *)self _whereClauseToFindCopyItems:a3];
  unint64_t v9 = [NSString stringWithFormat:@"DELETE FROM action_messages WHERE action = %llu AND %@", a4, v8];
  [v10 executeStatementString:v9 errorMessage:@"Deleting copy items"];
}

- (id)_whereClauseToFindCopyItems:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  char v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v24;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        id v12 = [v11 destinationMessage];

        if (v12)
        {
          uint64_t v13 = [v11 destinationMessage];
          uint64_t v14 = [v13 persistentID];
          [v6 addObject:v14];
LABEL_10:

          goto LABEL_11;
        }
        id v15 = [v11 sourceRemoteID];

        if (v15)
        {
          uint64_t v13 = [v11 sourceRemoteID];
          uint64_t v14 = objc_msgSend(v13, "ef_quotedSQLEscapedString");
          [v5 addObject:v14];
          goto LABEL_10;
        }
        uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"EDLocalActionPersistence.m" lineNumber:993 description:@"Copy item had neither a source remoteID or a destination message"];
LABEL_11:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v8 = v16;
    }
    while (v16);
  }

  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v17 = NSString;
    BOOL v18 = [v5 componentsJoinedByString:@", "];
    uint64_t v19 = [v6 componentsJoinedByString:@", "];
    BOOL v20 = objc_msgSend(v17, "stringWithFormat:", @"(remote_id IN (%@) OR destination_message IN (%@)"), v18, v19;
  }
  else
  {
    uint64_t v21 = [v5 count];
    id v22 = NSString;
    if (v21)
    {
      BOOL v18 = [v5 componentsJoinedByString:@", "];
      [v22 stringWithFormat:@"remote_id IN (%@)", v18];
    }
    else
    {
      BOOL v18 = [v6 componentsJoinedByString:@", "];
      [v22 stringWithFormat:@"destination_message IN (%@)", v18];
    BOOL v20 = };
  }

  return v20;
}

- (id)_sourceRemoteIDListForCopyItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sourceRemoteID", (void)v12);
        uint64_t v10 = objc_msgSend(v9, "ef_quotedSQLEscapedString");
        [v4 addObject:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)updateTransferUndownloadedMessageAction:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 completedItems];
  if ([v7 phaseForResults] != 3 || objc_msgSend(v6, "transferType") != 1) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 sourceMailboxURL];
  uint64_t v10 = [v6 destinationMailboxURL];
  if ([(EDLocalActionPersistence *)self moveSupportedFromMailboxURL:v9 toURL:v10])
  {

LABEL_7:
    uint64_t v17 = [v6 persistentID];
    -[EDLocalActionPersistence removeMessageAction:](self, "removeMessageAction:", [v17 databaseID]);

    BOOL v16 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = [v8 count];

  if (!v11) {
    goto LABEL_7;
  }
  [v6 updateWithCompletedCopyItems:v8];
  long long v12 = [v6 persistentID];
  uint64_t v13 = [v12 databaseID];

  long long v14 = [(EDLocalActionPersistence *)self database];
  long long v15 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence updateTransferUndownloadedMessageAction:withResults:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__EDLocalActionPersistence_updateTransferUndownloadedMessageAction_withResults___block_invoke;
  v19[3] = &unk_1E6BFFF40;
  id v20 = v8;
  uint64_t v21 = self;
  uint64_t v23 = v13;
  id v22 = v6;
  objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v19);

  BOOL v16 = 1;
LABEL_8:

  return v16;
}

uint64_t __80__EDLocalActionPersistence_updateTransferUndownloadedMessageAction_withResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v7), "sourceRemoteID", (void)v19);
        [v8 _addActionMessageForSourceRemoteID:v9 actionID:*(void *)(a1 + 56) connection:v3];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 48) sourceMailboxURL];
  uint64_t v12 = [v10 mailboxDatabaseIDForURL:v11];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"local_message_actions"];
  [v13 setObject:&unk_1F35BAC88 forKeyedSubscript:@"action_type"];
  long long v14 = [NSNumber numberWithLongLong:v12];
  [v13 setObject:v14 forKeyedSubscript:@"mailbox"];

  long long v15 = [MEMORY[0x1E4F60E78] column:@"ROWID"];
  BOOL v16 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  uint64_t v17 = [v15 equalTo:v16];
  [v13 setWhereClause:v17];

  [v3 executeUpdateStatement:v13 error:0];
  return 1;
}

- (void)updateFlagChangeAction:(id)a3 withRemainingUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDLocalActionPersistence *)self database];
  uint64_t v9 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence updateFlagChangeAction:withRemainingUIDs:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __69__EDLocalActionPersistence_updateFlagChangeAction_withRemainingUIDs___block_invoke;
  v12[3] = &unk_1E6BFF3D8;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);
}

uint64_t __69__EDLocalActionPersistence_updateFlagChangeAction_withRemainingUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) persistentID];
  uint64_t v5 = [v4 databaseID];

  id v6 = NSString;
  id v7 = objc_msgSend(*(id *)(a1 + 40), "ed_uidQueryExpression");
  uint64_t v8 = [v6 stringWithFormat:@"DELETE FROM action_messages WHERE action = %lld AND NOT (%@)", v5, v7];

  [v3 executeStatementString:v8 errorMessage:@"Deleting flag change messages."];
  return 1;
}

- (void)removeMessageAction:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EDLocalActionPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v10 = a3;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Action %llu finished", buf, 0xCu);
  }

  id v6 = [(EDLocalActionPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence removeMessageAction:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__EDLocalActionPersistence_removeMessageAction___block_invoke;
  v8[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v8[4] = a3;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v8);
}

uint64_t __48__EDLocalActionPersistence_removeMessageAction___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"DELETE FROM local_message_actions WHERE ROWID = ?"];
  uint64_t v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v10 = 0;
  uint64_t v7 = [v4 executeWithIndexedBindings:v6 usingBlock:0 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"Removing completed action"];
  }

  return v7;
}

- (void)removeMessageActions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      uint64_t v5 = [v4 firstObject];
      -[EDLocalActionPersistence removeMessageAction:](self, "removeMessageAction:", [v5 databaseID]);
    }
    else
    {
      id v6 = objc_msgSend(v4, "ef_map:", &__block_literal_global_30);
      uint64_t v7 = [v6 componentsJoinedByString:@", "];

      id v8 = +[EDLocalActionPersistence log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218242;
        uint64_t v15 = [v4 count];
        __int16 v16 = 2114;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%llu Actions finished %{public}@", buf, 0x16u);
      }

      uint64_t v9 = [(EDLocalActionPersistence *)self database];
      id v10 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence removeMessageActions:]"];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __49__EDLocalActionPersistence_removeMessageActions___block_invoke_233;
      v12[3] = &unk_1E6C00AF0;
      id v11 = v7;
      id v13 = v11;
      objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v12);
    }
  }
}

id __49__EDLocalActionPersistence_removeMessageActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 stringValue];

  return v2;
}

uint64_t __49__EDLocalActionPersistence_removeMessageActions___block_invoke_233(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString stringWithFormat:@"DELETE FROM local_message_actions WHERE ROWID IN (%@)", *(void *)(a1 + 32)];
  uint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  uint64_t v6 = [v5 executeUsingBlock:0 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Removing completed action"];
  }

  return v6;
}

- (ECLocalMessageActionID)latestActionID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  id v2 = [(EDLocalActionPersistence *)self database];
  id v3 = [NSString stringWithUTF8String:"-[EDLocalActionPersistence latestActionID]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__EDLocalActionPersistence_latestActionID__block_invoke;
  v6[3] = &unk_1E6BFFFB8;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ECLocalMessageActionID *)v4;
}

uint64_t __42__EDLocalActionPersistence_latestActionID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[[NSString alloc] initWithFormat:@"SELECT MAX(ROWID) as latest FROM local_message_actions"];
  uint64_t v5 = [v3 preparedStatementForQueryString:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__EDLocalActionPersistence_latestActionID__block_invoke_2;
  v7[3] = &unk_1E6BFF4C8;
  v7[4] = *(void *)(a1 + 32);
  [v5 executeUsingBlock:v7 error:0];

  return 1;
}

void __42__EDLocalActionPersistence_latestActionID__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60888]);
  id v4 = [v8 objectForKeyedSubscript:@"latest"];
  uint64_t v5 = objc_msgSend(v3, "initWithDatabaseID:", objc_msgSend(v4, "databaseIDValue"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

void __76__EDLocalActionPersistence__transferActionForRow_connection_failedMessages___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Could not find destination message for database ID %lld", (uint8_t *)&v3, 0xCu);
}

- (void)_flagChangeAllActionForRow:(os_log_t)log connection:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)long long buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Flag change all action expected to have exactly one remote ID associated with it, but had %lu", buf, 0xCu);
}

@end