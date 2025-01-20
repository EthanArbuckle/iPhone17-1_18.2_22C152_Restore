@interface EDServerMessagePersistence
+ (OS_os_log)log;
+ (id)serverLabelsTableSchema;
+ (id)serverMessagesTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_addLabels:(id)a3 removeLabels:(id)a4 forUID:(unsigned int)a5 connection:(id)a6;
- (BOOL)addLabels:(id)a3 removeLabels:(id)a4 toMessagesWithRemoteIDs:(id)a5;
- (BOOL)addServerMessage:(id)a3 invalidMessage:(BOOL *)a4 duplicateRemoteID:(BOOL *)a5;
- (BOOL)applyFlagChange:(id)a3 toMessagesWithRemoteIDs:(id)a4;
- (BOOL)applySortedFlags:(id)a3;
- (BOOL)attachMessage:(int64_t)a3 toServerMessageWithRemoteID:(id)a4;
- (BOOL)deleteAllServerMessagesInMailbox;
- (BOOL)deleteServerMessagesWithRemoteIDs:(id)a3;
- (BOOL)supportsLabels;
- (BOOL)useNumericSearch;
- (EDGmailLabelPersistence)gmailLabelPersistence;
- (EDPersistenceDatabase)database;
- (EDServerMessagePersistence)init;
- (EDServerMessagePersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4 mailboxID:(int64_t)a5 useNumericSearch:(BOOL)a6 supportsLabels:(BOOL)a7;
- (id)_remoteIDStringForRemoteIDArray:(id)a3;
- (id)_serverMessageForRow:(id)a3 connection:(id)a4;
- (id)_serverMessagesWithWhereClause:(id)a3 limitClause:(id)a4 returnLastEntries:(BOOL)a5;
- (id)deleteAllClearedUIDMessages;
- (id)downloadStateForUIDs:(id)a3;
- (id)serverMessagesForIMAPUIDs:(id)a3 limit:(unint64_t)a4 returnLastEntries:(BOOL)a5;
- (id)serverMessagesForMessageIDHeaders:(id)a3;
- (id)serverMessagesForRemoteIDs:(id)a3;
- (int64_t)mailboxID;
- (unint64_t)messageCount;
- (unint64_t)undeletedMessageCount;
- (unint64_t)unreadMessageCount;
- (unsigned)maximumIMAPUID;
- (unsigned)minimumIMAPUID;
- (void)enumerateMessageBatchLimitUIDsWithWindow:(_NSRange)a3 batchSize:(int64_t)a4 newUIDCount:(int64_t)a5 block:(id)a6;
- (void)enumerateUIDsInIndexSet:(id)a3 includingJSON:(id)a4 excludingJSON:(id)a5 withBlock:(id)a6;
- (void)enumerateUIDsInRanges:(id)a3 withBlock:(id)a4;
- (void)groupInsideWriteTransactionWithDescription:(id)a3 block:(id)a4;
- (void)setDownloadStateForUIDs:(id)a3;
@end

@implementation EDServerMessagePersistence

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDServerMessagePersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_90 != -1) {
    dispatch_once(&log_onceToken_90, block);
  }
  v2 = (void *)log_log_90;

  return (OS_os_log *)v2;
}

void __33__EDServerMessagePersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_90;
  log_log_90 = (uint64_t)v1;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v5 = [a1 serverMessagesTableSchema];
  v6 = [a1 serverLabelsTableSchema];
  v7 = [v6 columnForName:@"server_message"];
  [v7 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v22 = +[EDMessagePersistence messagesTableName];
  v8 = +[EDPersistenceDatabaseSchema mailboxesTableName];
  v9 = [EDPersistenceForeignKeyPlaceholder alloc];
  v10 = [v5 columnForName:@"message"];
  v11 = [(EDPersistenceForeignKeyPlaceholder *)v9 initWithColumn:v10 tableName:v22 onDelete:3 onUpdate:0];
  v24[0] = v11;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  v13 = [v5 columnForName:@"mailbox"];
  v14 = [(EDPersistenceForeignKeyPlaceholder *)v12 initWithColumn:v13 tableName:v8 onDelete:2 onUpdate:0];
  v24[1] = v14;
  v15 = [EDPersistenceForeignKeyPlaceholder alloc];
  v16 = [v6 columnForName:@"label"];
  v17 = [(EDPersistenceForeignKeyPlaceholder *)v15 initWithColumn:v16 tableName:v8 onDelete:2 onUpdate:0];
  v24[2] = v17;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

  *a4 = (id)MEMORY[0x1E4F1CBF0];
  v23[0] = v5;
  v23[1] = v6;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  return v18;
}

+ (id)serverMessagesTableSchema
{
  v24[14] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v21 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v24[0] = v21;
  v20 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:0];
  v24[1] = v20;
  v19 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sequence_identifier" nullable:1];
  v24[2] = v19;
  v18 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0];
  v24[3] = v18;
  v17 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"deleted" nullable:0];
  void v24[4] = v17;
  v16 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0];
  v24[5] = v16;
  v15 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0];
  v24[6] = v15;
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0];
  v24[7] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0];
  v24[8] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0];
  v24[9] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0];
  v24[10] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0];
  v24[11] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_color" nullable:0];
  v24[12] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_id" nullable:0];
  v24[13] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:14];
  v11 = (void *)[v2 initWithName:@"server_messages" rowIDType:2 columns:v10];

  v23[0] = @"mailbox";
  v23[1] = @"remote_id";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v11 addUniquenessConstraintForColumns:v12 conflictResolution:1];

  v22 = @"message";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v11 addIndexForColumns:v13];

  return v11;
}

+ (id)serverLabelsTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"server_message" nullable:1];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"label" nullable:1];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v9[0] = @"server_message";
  v9[1] = @"label";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = (void *)[v2 initWithName:@"server_labels" columns:v5 primaryKeyColumns:v6];

  return v7;
}

- (EDServerMessagePersistence)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4 mailboxID:(int64_t)a5 useNumericSearch:(BOOL)a6 supportsLabels:(BOOL)a7
{
  id v14 = a3;
  id v15 = a4;
  if (*MEMORY[0x1E4F5FCC8] == a5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"EDServerMessagePersistence.m", 155, @"Invalid parameter not satisfying: %@", @"mailboxID != EMDatabaseIDUndefined" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)EDServerMessagePersistence;
  v16 = [(EDServerMessagePersistence *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_database, a3);
    objc_storeStrong((id *)&v17->_gmailLabelPersistence, a4);
    v17->_mailboxID = a5;
    v17->_useNumericSearch = a6;
    v17->_supportsLabels = a7;
  }

  return v17;
}

- (EDServerMessagePersistence)init
{
}

- (unint64_t)messageCount
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(EDServerMessagePersistence *)self database];
  v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence messageCount]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__EDServerMessagePersistence_messageCount__block_invoke;
  v7[3] = &unk_1E6BFF400;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __42__EDServerMessagePersistence_messageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT count() FROM server_messages WHERE (mailbox = %lld)", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  unint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__EDServerMessagePersistence_messageCount__block_invoke_2;
  void v10[3] = &unk_1E6BFF4C8;
  v10[4] = *(void *)(a1 + 40);
  char v6 = [v5 executeUsingBlock:v10 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Executing count query"];
  }

  return 1;
}

void __42__EDServerMessagePersistence_messageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  char v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntegerValue];

  *a4 = 1;
}

- (unint64_t)unreadMessageCount
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(EDServerMessagePersistence *)self database];
  v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence unreadMessageCount]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EDServerMessagePersistence_unreadMessageCount__block_invoke;
  v7[3] = &unk_1E6BFF400;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__EDServerMessagePersistence_unreadMessageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT count() FROM server_messages WHERE (mailbox = %lld) AND (read = 0)", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  unint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__EDServerMessagePersistence_unreadMessageCount__block_invoke_2;
  void v10[3] = &unk_1E6BFF4C8;
  v10[4] = *(void *)(a1 + 40);
  char v6 = [v5 executeUsingBlock:v10 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Executing unread count query"];
  }

  return 1;
}

void __48__EDServerMessagePersistence_unreadMessageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  char v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntegerValue];

  *a4 = 1;
}

- (unint64_t)undeletedMessageCount
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = [(EDServerMessagePersistence *)self database];
  v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence undeletedMessageCount]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke;
  v7[3] = &unk_1E6BFF400;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT count() FROM server_messages WHERE (mailbox = %lld) AND (deleted = 0)", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  unint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke_2;
  void v10[3] = &unk_1E6BFF4C8;
  v10[4] = *(void *)(a1 + 40);
  char v6 = [v5 executeUsingBlock:v10 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Executing unread count query"];
  }

  return 1;
}

void __51__EDServerMessagePersistence_undeletedMessageCount__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  char v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntegerValue];

  *a4 = 1;
}

- (unsigned)maximumIMAPUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v3 = [(EDServerMessagePersistence *)self database];
  v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence maximumIMAPUID]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke;
  v6[3] = &unk_1E6BFF400;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT MAX(remote_id) FROM server_messages WHERE (mailbox = %lld)", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  unint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke_2;
  void v10[3] = &unk_1E6BFF4C8;
  v10[4] = *(void *)(a1 + 40);
  char v6 = [v5 executeUsingBlock:v10 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Executing max uid query"];
  }

  return 1;
}

void __44__EDServerMessagePersistence_maximumIMAPUID__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  char v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntValue];

  *a4 = 1;
}

- (unsigned)minimumIMAPUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v3 = [(EDServerMessagePersistence *)self database];
  v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence minimumIMAPUID]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke;
  v6[3] = &unk_1E6BFF400;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT MIN(remote_id) FROM server_messages WHERE (mailbox = %lld)", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  unint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke_2;
  void v10[3] = &unk_1E6BFF4C8;
  v10[4] = *(void *)(a1 + 40);
  char v6 = [v5 executeUsingBlock:v10 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0) {
    [v3 handleError:v7 message:@"Executing min uid query"];
  }

  return 1;
}

void __44__EDServerMessagePersistence_minimumIMAPUID__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  char v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntValue];

  *a4 = 1;
}

- (id)serverMessagesForRemoteIDs:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDServerMessagePersistence_serverMessagesForRemoteIDs___block_invoke;
  void v10[3] = &unk_1E6C06378;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  objc_msgSend(v4, "ef_enumerateObjectsInBatchesOfSize:block:", 500, v10);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __57__EDServerMessagePersistence_serverMessagesForRemoteIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) _remoteIDStringForRemoteIDArray:a2];
  id v3 = (void *)[[NSString alloc] initWithFormat:@"remote_id IN (%@)", v5];
  id v4 = [*(id *)(a1 + 32) _serverMessagesWithWhereClause:v3 limitClause:&stru_1F3583658 returnLastEntries:0];
  [*(id *)(a1 + 40) addObjectsFromArray:v4];
}

- (id)serverMessagesForIMAPUIDs:(id)a3 limit:(unint64_t)a4 returnLastEntries:(BOOL)a5
{
  BOOL v5 = a5;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t add_explicit = atomic_fetch_add_explicit(serverMessagesForIMAPUIDsCounter, 1u, memory_order_relaxed);
  if (softLinkPLShouldLogRegisteredEvent(12, @"EDServerMessagePersistence"))
  {
    v41 = @"call";
    int v10 = [NSNumber numberWithUnsignedInt:add_explicit];
    v42[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    softLinkPLLogRegisteredEvent(12, @"EDServerMessagePersistence", v11, MEMORY[0x1E4F1CBF0]);
  }
  if (a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = 100;
  }
  v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __80__EDServerMessagePersistence_serverMessagesForIMAPUIDs_limit_returnLastEntries___block_invoke;
  v29 = &unk_1E6C063A0;
  v32 = &v34;
  v30 = self;
  BOOL v33 = v5;
  id v14 = v13;
  id v31 = v14;
  objc_msgSend(v8, "ed_enumerateUIDsWithLimit:reverseEnumeration:usingBlock:", a4, v5, &v26);
  if (softLinkPLShouldLogRegisteredEvent(12, @"EDServerMessagePersistence"))
  {
    v39[0] = @"call";
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", add_explicit, v26, v27, v28, v29, v30);
    v40[0] = v15;
    v39[1] = @"iterations";
    v16 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v35 + 6)];
    v40[1] = v16;
    v39[2] = @"count";
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v40[2] = v17;
    v39[3] = @"first";
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "firstIndex"));
    v40[3] = v18;
    v39[4] = @"last";
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "lastIndex"));
    v40[4] = v19;
    v39[5] = @"limit";
    objc_super v20 = [NSNumber numberWithUnsignedInteger:a4];
    v40[5] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:6];

    softLinkPLLogRegisteredEvent(12, @"EDServerMessagePersistence", (uint64_t)v21, MEMORY[0x1E4F1CBF0]);
  }
  if (a4 && [v14 count] > a4)
  {
    v22 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[EDServerMessagePersistence serverMessagesForIMAPUIDs:limit:returnLastEntries:](buf, [v14 count], a4, v22);
    }

    objc_msgSend(v14, "subarrayWithRange:", 0, a4);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = v14;
  }
  v24 = v23;

  _Block_object_dispose(&v34, 8);

  return v24;
}

id __80__EDServerMessagePersistence_serverMessagesForIMAPUIDs_limit_returnLastEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v5 = objc_msgSend(a2, "ed_uidQueryExpression");
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @" LIMIT %llu", a3);
  id v7 = [*(id *)(a1 + 32) _serverMessagesWithWhereClause:v5 limitClause:v6 returnLastEntries:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 40) addObjectsFromArray:v7];
  id v8 = [MEMORY[0x1E4F28E60] indexSet];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "imapUID"));
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)deleteAllClearedUIDMessages
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1E0190280]();
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT message AS message_row_id FROM server_messages WHERE mailbox = %lld AND remote_id < 0", -[EDServerMessagePersistence mailboxID](self, "mailboxID"));
  id v6 = [(EDServerMessagePersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence deleteAllClearedUIDMessages]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke;
  v14[3] = &unk_1E6BFF3D8;
  id v8 = v5;
  id v15 = v8;
  long long v16 = v3;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v14);

  id v9 = [(EDServerMessagePersistence *)self database];
  uint64_t v10 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence deleteAllClearedUIDMessages]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169;
  v13[3] = &unk_1E6BFF3D8;
  v13[4] = self;
  v13[5] = v3;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v13);

  id v11 = v3;
  return v11;
}

uint64_t __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 preparedStatementForQueryString:*(void *)(a1 + 32)];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_2;
  void v10[3] = &unk_1E6BFF3B0;
  v10[4] = *(void *)(a1 + 40);
  char v4 = [v3 executeUsingBlock:v10 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      id v7 = objc_msgSend(v5, "ef_publicDescription");
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_cold_1(v7, (uint64_t)v11, v6);
    }
  }
  return 1;
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectForKeyedSubscript:@"message_row_id"];
  uint64_t v4 = [v3 int64Value];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithLongLong:v4];
    [v5 addObject:v6];
  }
}

uint64_t __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM server_messages WHERE server_messages.mailbox = %lld AND server_messages.remote_id < 0", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  id v5 = [v3 preparedStatementForQueryString:v4];
  uint64_t v14 = 0;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionary];
  id v13 = 0;
  char v7 = [v5 executeWithNamedBindings:v6 rowsChanged:&v14 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v11 = objc_msgSend(v8, "ef_publicDescription");
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169_cold_2(v11, (uint64_t)buf, v10);
    }
    goto LABEL_7;
  }
  uint64_t v9 = v14;
  if (v9 != [*(id *)(a1 + 40) count])
  {
    uint64_t v10 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169_cold_1(v14, [*(id *)(a1 + 40) count], buf, v10);
    }
LABEL_7:
  }
  return 1;
}

- (id)serverMessagesForMessageIDHeaders:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = (void *)MEMORY[0x1E0190280]();
  char v7 = objc_msgSend(v4, "ef_map:", &__block_literal_global_79);
  id v8 = [v7 componentsJoinedByString:@", "];
  uint64_t v9 = [NSString stringWithFormat:@"SELECT server_messages.ROWID, server_messages.message, server_messages.mailbox, server_messages.read, server_messages.deleted, server_messages.replied, server_messages.flagged, server_messages.draft, server_messages.forwarded, server_messages.redirected, server_messages.junk_level_set_by_user, server_messages.junk_level, server_messages.flag_color, server_messages.remote_id, messages.message_id AS message_id_header, messages.ROWID AS message_row_id FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE (server_messages.mailbox = %lld AND messages.message_id IN (%@) AND server_messages.remote_id < 0)", -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v8];

  uint64_t v10 = [(EDServerMessagePersistence *)self database];
  id v11 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence serverMessagesForMessageIDHeaders:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2;
  v15[3] = &unk_1E6BFF4F0;
  id v12 = v9;
  id v16 = v12;
  long long v17 = self;
  v18 = v5;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v15);

  id v13 = v5;
  return v13;
}

id __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithString:v2];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v3, "int64Value"));

  return v4;
}

uint64_t __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:a1[4]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_3;
  v13[3] = &unk_1E6C01860;
  v13[4] = a1[5];
  id v5 = v3;
  uint64_t v6 = a1[6];
  id v14 = v5;
  uint64_t v15 = v6;
  id v12 = 0;
  char v7 = [v4 executeUsingBlock:v13 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = objc_msgSend(v8, "ef_publicDescription");
      __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2_cold_1(v10, (uint64_t)v16, v9);
    }
  }
  return 1;
}

void __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_serverMessageForRow:connection:");
  id v4 = [v11 objectForKeyedSubscript:@"message_id_header"];
  uint64_t v5 = [v4 int64Value];

  uint64_t v6 = [v11 objectForKeyedSubscript:@"message_row_id"];
  uint64_t v7 = [v6 int64Value];

  if (v3 && v5 && v7)
  {
    id v8 = [EDExistingMessageWithMessageIDHeader alloc];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithHash:v5];
    uint64_t v10 = [(EDExistingMessageWithMessageIDHeader *)v8 initWithMessageIDHash:v9 serverMessage:v3 messagePersistentID:v7];

    [*(id *)(a1 + 48) addObject:v10];
  }
}

- (id)_serverMessagesWithWhereClause:(id)a3 limitClause:(id)a4 returnLastEntries:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = &stru_1F3583658;
  if (v5) {
    uint64_t v10 = @" DESC";
  }
  id v11 = v10;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM server_messages WHERE (mailbox = %lld) AND (%@) ORDER BY remote_id%@%@", @"ROWID, message, mailbox, read, deleted, replied, flagged, draft, forwarded, redirected, junk_level_set_by_user, junk_level, flag_color, remote_id", -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v8, v11, v9];
  id v14 = [(EDServerMessagePersistence *)self database];
  uint64_t v15 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence _serverMessagesWithWhereClause:limitClause:returnLastEntries:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke;
  v20[3] = &unk_1E6C063C8;
  id v16 = v13;
  id v21 = v16;
  BOOL v24 = v5;
  id v17 = v12;
  id v22 = v17;
  id v23 = self;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v20);

  id v18 = v17;
  return v18;
}

uint64_t __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke_2;
  v9[3] = &unk_1E6C06250;
  char v13 = *(unsigned char *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  id v12 = v7;
  [v4 executeUsingBlock:v9 error:0];

  return 1;
}

void __91__EDServerMessagePersistence__serverMessagesWithWhereClause_limitClause_returnLastEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = [v4 _serverMessageForRow:v3 connection:v6];
    [v5 insertObject:v7 atIndex:0];
  }
  else
  {
    id v7 = [v4 _serverMessageForRow:v3 connection:v6];
    [v5 addObject:v7];
  }
}

- (id)_serverMessageForRow:(id)a3 connection:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F608C0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke;
  v45[3] = &unk_1E6C063F0;
  id v9 = v6;
  id v46 = v9;
  id v10 = (void *)[v8 initWithBuilder:v45];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"remote_id"];
  id v12 = [v11 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v13 = [v9 objectForKeyedSubscript:@"ROWID"];
    uint64_t v14 = [v13 databaseIDValue];

    uint64_t v15 = [v9 objectForKeyedSubscript:@"ROWID"];
    id v31 = [v15 stringValue];

    if ([(EDServerMessagePersistence *)self supportsLabels])
    {
      v30 = [v7 preparedStatementForQueryString:@"SELECT label FROM server_labels WHERE server_message = ?"];
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v28 = [(EDServerMessagePersistence *)self gmailLabelPersistence];
      id v16 = [NSNumber numberWithLongLong:v14];
      v47[0] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2;
      void v42[3] = &unk_1E6C001E8;
      id v18 = v28;
      id v43 = v18;
      id v19 = v29;
      id v44 = v19;
      id v41 = 0;
      char v20 = [v30 executeWithIndexedBindings:v17 usingBlock:v42 error:&v41];
      id v21 = v41;

      if ((v20 & 1) == 0) {
        [v7 handleError:v21 message:@"Fetching server labels"];
      }
    }
    else
    {
      id v19 = 0;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F608D8]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_211;
    v35[3] = &unk_1E6C06418;
    id v24 = v31;
    id v36 = v24;
    id v37 = v9;
    id v38 = v12;
    id v39 = v10;
    id v40 = v19;
    id v26 = v19;
    id v23 = (void *)[v25 initWithIMAPServerMessageBuilder:v35];
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x1E4F608D8]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2_213;
    v32[3] = &unk_1E6C06440;
    id v33 = v9;
    id v34 = v10;
    id v23 = (void *)[v22 initWithServerMessageBuilder:v32];

    id v24 = v33;
  }

  return v23;
}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"read"];
  objc_msgSend(v13, "setRead:", objc_msgSend(v3, "BOOLValue"));

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"deleted"];
  objc_msgSend(v13, "setDeleted:", objc_msgSend(v4, "BOOLValue"));

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"replied"];
  objc_msgSend(v13, "setReplied:", objc_msgSend(v5, "BOOLValue"));

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"flagged"];
  objc_msgSend(v13, "setFlagged:", objc_msgSend(v6, "BOOLValue"));

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"draft"];
  objc_msgSend(v13, "setDraft:", objc_msgSend(v7, "BOOLValue"));

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forwarded"];
  objc_msgSend(v13, "setForwarded:", objc_msgSend(v8, "BOOLValue"));

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"redirected"];
  objc_msgSend(v13, "setRedirected:", objc_msgSend(v9, "BOOLValue"));

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level_set_by_user"];
  objc_msgSend(v13, "setJunkLevelSetByUser:", objc_msgSend(v10, "BOOLValue"));

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"junk_level"];
  objc_msgSend(v13, "setJunkLevel:", objc_msgSend(v11, "int64Value"));

  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"flag_color"];
  objc_msgSend(v13, "setFlagColor:", objc_msgSend(v12, "int64Value"));
}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 databaseIDValue];

  id v6 = [*(id *)(a1 + 32) labelForDatabaseID:v5];
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) labelURLForDatabaseID:v5];
    id v8 = +[EDServerMessagePersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      if (v7)
      {
        id v9 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_redactedStringForMailboxURL:", v7);
      }
      else
      {
        id v9 = 0;
      }
      int v10 = 134218242;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_fault_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_FAULT, "Unable to find label: %lld, %@", (uint8_t *)&v10, 0x16u);
      if (v7) {
    }
      }
  }
}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_211(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setPersistentID:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"message"];
  id v4 = [v3 stringValue];
  [v5 setMessagePersistentID:v4];

  objc_msgSend(v5, "setImapUID:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  [v5 setServerFlags:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 64)) {
    objc_msgSend(v5, "setLabels:");
  }
}

void __62__EDServerMessagePersistence__serverMessageForRow_connection___block_invoke_2_213(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ROWID"];
  id v4 = [v3 stringValue];
  [v9 setPersistentID:v4];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"message"];
  id v6 = [v5 stringValue];
  [v9 setMessagePersistentID:v6];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"remote_id"];
  id v8 = [v7 stringValue];
  [v9 setRemoteID:v8];

  [v9 setServerFlags:*(void *)(a1 + 40)];
}

- (BOOL)addServerMessage:(id)a3 invalidMessage:(BOOL *)a4 duplicateRemoteID:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  id v9 = [(EDServerMessagePersistence *)self database];
  int v10 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence addServerMessage:invalidMessage:duplicateRemoteID:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__EDServerMessagePersistence_addServerMessage_invalidMessage_duplicateRemoteID___block_invoke;
  v14[3] = &unk_1E6C06468;
  id v11 = v8;
  id v15 = v11;
  id v16 = self;
  id v17 = &v20;
  id v18 = a4;
  id v19 = a5;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v14);

  char v12 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __80__EDServerMessagePersistence_addServerMessage_invalidMessage_duplicateRemoteID___block_invoke(uint64_t a1, void *a2)
{
  v56[13] = *MEMORY[0x1E4F143B8];
  id v51 = a2;
  v53 = [v51 preparedStatementForQueryString:@"INSERT INTO server_messages (message, mailbox, read, deleted, replied, flagged, draft, forwarded, redirected, junk_level_set_by_user, junk_level, flag_color, remote_id) VALUES (:message, :mailbox, :read, :deleted, :replied, :flagged, :draft, :forwarded, :redirected, :junk_level_set_by_user, :junk_level, :flag_color, :remote_id)"];
  id v3 = [*(id *)(a1 + 32) messagePersistentID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  id v6 = v5;

  v56[0] = v6;
  v55[0] = @":message";
  v55[1] = @":mailbox";
  id v40 = v6;
  v48 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v56[1] = v48;
  v55[2] = @":remote_id";
  v49 = [*(id *)(a1 + 32) remoteIDObject];
  v56[2] = v49;
  v55[3] = @":read";
  id v7 = NSNumber;
  v50 = [*(id *)(a1 + 32) serverFlags];
  id v46 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v50, "read"));
  v56[3] = v46;
  v55[4] = @":deleted";
  id v8 = NSNumber;
  v47 = [*(id *)(a1 + 32) serverFlags];
  id v44 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v47, "deleted"));
  v56[4] = v44;
  v55[5] = @":replied";
  id v9 = NSNumber;
  v45 = [*(id *)(a1 + 32) serverFlags];
  v42 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v45, "replied"));
  v56[5] = v42;
  v55[6] = @":flagged";
  int v10 = NSNumber;
  id v43 = [*(id *)(a1 + 32) serverFlags];
  id v39 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v43, "flagged"));
  v56[6] = v39;
  v55[7] = @":draft";
  id v11 = NSNumber;
  id v41 = [*(id *)(a1 + 32) serverFlags];
  id v37 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v41, "draft"));
  v56[7] = v37;
  v55[8] = @":forwarded";
  char v12 = NSNumber;
  id v38 = [*(id *)(a1 + 32) serverFlags];
  id v13 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v38, "forwarded"));
  v56[8] = v13;
  v55[9] = @":redirected";
  uint64_t v14 = NSNumber;
  id v15 = [*(id *)(a1 + 32) serverFlags];
  id v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "redirected"));
  v56[9] = v16;
  v55[10] = @":junk_level_set_by_user";
  id v17 = NSNumber;
  id v18 = [*(id *)(a1 + 32) serverFlags];
  id v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "junkLevelSetByUser"));
  v56[10] = v19;
  v55[11] = @":junk_level";
  uint64_t v20 = NSNumber;
  id v21 = [*(id *)(a1 + 32) serverFlags];
  uint64_t v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "junkLevel"));
  v56[11] = v22;
  v55[12] = @":flag_color";
  char v23 = NSNumber;
  id v24 = [*(id *)(a1 + 32) serverFlags];
  id v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "flagColor"));
  v56[12] = v25;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:13];

  id v54 = 0;
  LODWORD(v15) = [v53 executeWithNamedBindings:v52 usingBlock:0 error:&v54];
  id v26 = v54;
  uint64_t v27 = v26;
  if (!v15)
  {
    v30 = [v26 domain];
    if ([v30 isEqualToString:*MEMORY[0x1E4F60D10]])
    {
      BOOL v31 = [v27 code] == 19;

      if (v31)
      {
        v32 = [v27 userInfo];
        id v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F60D18]];
        uint64_t v34 = [v33 integerValue];

        v35 = *(unsigned char **)(a1 + 56);
        if (v35 && v34 == 787 || (v35 = *(unsigned char **)(a1 + 64)) != 0 && v34 == 2067) {
          unsigned char *v35 = 1;
        }

        uint64_t v29 = 1;
        goto LABEL_20;
      }
    }
    else
    {
    }
    [v51 handleError:v27 message:@"Adding server message"];
    uint64_t v29 = 0;
LABEL_20:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_21;
  }
  v28 = [*(id *)(a1 + 32) labels];
  if ([*(id *)(a1 + 40) supportsLabels] && objc_msgSend(v28, "count")) {
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 40), "_addLabels:removeLabels:forUID:connection:", v28, 0, objc_msgSend(*(id *)(a1 + 32), "imapUID"), v51);
  }
  else {
    uint64_t v29 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v29;

LABEL_21:
  return v29;
}

- (BOOL)attachMessage:(int64_t)a3 toServerMessageWithRemoteID:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  if ([(EDServerMessagePersistence *)self useNumericSearch])
  {
    id v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "ef_quotedSQLEscapedString");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;
  id v9 = [(EDServerMessagePersistence *)self database];
  int v10 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence attachMessage:toServerMessageWithRemoteID:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__EDServerMessagePersistence_attachMessage_toServerMessageWithRemoteID___block_invoke;
  v13[3] = &unk_1E6C00008;
  id v15 = &v17;
  int64_t v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v13);

  LOBYTE(v8) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v8;
}

uint64_t __72__EDServerMessagePersistence_attachMessage_toServerMessageWithRemoteID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString stringWithFormat:@"UPDATE server_messages SET message = %lld WHERE (mailbox = %lld) AND (remote_id = %@)", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "mailboxID"), *(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 executeStatementString:v4 errorMessage:@"updating server message"];

  uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v5;
}

- (BOOL)deleteServerMessagesWithRemoteIDs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v5 = [(EDServerMessagePersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence deleteServerMessagesWithRemoteIDs:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __64__EDServerMessagePersistence_deleteServerMessagesWithRemoteIDs___block_invoke;
  v9[3] = &unk_1E6BFF338;
  void v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

uint64_t __64__EDServerMessagePersistence_deleteServerMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _remoteIDStringForRemoteIDArray:*(void *)(a1 + 40)];
  uint64_t v5 = [NSString stringWithFormat:@"DELETE FROM server_messages WHERE (mailbox = %lld) AND (remote_id in (%@))", objc_msgSend(*(id *)(a1 + 32), "mailboxID"), v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 executeStatementString:v5 errorMessage:@"removing server messages"];

  uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v6;
}

- (BOOL)deleteAllServerMessagesInMailbox
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  id v3 = [(EDServerMessagePersistence *)self database];
  id v4 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence deleteAllServerMessagesInMailbox]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__EDServerMessagePersistence_deleteAllServerMessagesInMailbox__block_invoke;
  v6[3] = &unk_1E6BFFF68;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v6);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __62__EDServerMessagePersistence_deleteAllServerMessagesInMailbox__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM server_messages WHERE mailbox = %llu", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 executeStatementString:v4 errorMessage:@"removing all server messages"];

  uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return v5;
}

- (BOOL)applyFlagChange:(id)a3 toMessagesWithRemoteIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasChanges])
  {
    id v8 = objc_opt_new();
    if ([v6 readChanged])
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"read = %d", objc_msgSend(v6, "read"));
      [v8 addObject:v9];
    }
    if ([v6 deletedChanged])
    {
      char v10 = objc_msgSend(NSString, "stringWithFormat:", @"deleted = %d", objc_msgSend(v6, "deleted"));
      [v8 addObject:v10];
    }
    if ([v6 repliedChanged])
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"replied = %d", objc_msgSend(v6, "replied"));
      [v8 addObject:v11];
    }
    if ([v6 flaggedChanged])
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"flagged = %d", objc_msgSend(v6, "flagged"));
      [v8 addObject:v12];
    }
    if ([v6 draftChanged])
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"draft = %d", objc_msgSend(v6, "draft"));
      [v8 addObject:v13];
    }
    if ([v6 forwardedChanged])
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"forwarded = %d", objc_msgSend(v6, "forwarded"));
      [v8 addObject:v14];
    }
    if ([v6 redirectedChanged])
    {
      char v15 = objc_msgSend(NSString, "stringWithFormat:", @"redirected = %d", objc_msgSend(v6, "redirected"));
      [v8 addObject:v15];
    }
    if ([v6 junkLevelSetByUserChanged])
    {
      int64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"junk_level_set_by_user = %d", objc_msgSend(v6, "junkLevelSetByUser"));
      [v8 addObject:v16];
    }
    if ([v6 junkLevelChanged])
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"junk_level = %d", objc_msgSend(v6, "junkLevel"));
      [v8 addObject:v17];
    }
    if ([v6 flagColorChanged])
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"flag_color = %d", objc_msgSend(v6, "flagColor"));
      [v8 addObject:v18];
    }
    uint64_t v19 = [(EDServerMessagePersistence *)self _remoteIDStringForRemoteIDArray:v7];
    char v20 = NSString;
    id v21 = [v8 componentsJoinedByString:@","];
    uint64_t v22 = [v20 stringWithFormat:@"UPDATE server_messages SET %@ WHERE (mailbox = %lld) AND (remote_id in (%@))", v21, -[EDServerMessagePersistence mailboxID](self, "mailboxID"), v19];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    char v23 = [(EDServerMessagePersistence *)self database];
    id v24 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence applyFlagChange:toMessagesWithRemoteIDs:]"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__EDServerMessagePersistence_applyFlagChange_toMessagesWithRemoteIDs___block_invoke;
    v28[3] = &unk_1E6BFFF68;
    v30 = &v31;
    id v25 = v22;
    id v29 = v25;
    objc_msgSend(v23, "__performWriteWithCaller:usingBlock:", v24, v28);

    BOOL v26 = *((unsigned char *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    BOOL v26 = 1;
  }

  return v26;
}

uint64_t __70__EDServerMessagePersistence_applyFlagChange_toMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 executeStatementString:*(void *)(a1 + 32) errorMessage:@"Setting flags"];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v4;
}

- (BOOL)applySortedFlags:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v5 = [(EDServerMessagePersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence applySortedFlags:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __47__EDServerMessagePersistence_applySortedFlags___block_invoke;
  v9[3] = &unk_1E6BFF338;
  void v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

BOOL __47__EDServerMessagePersistence_applySortedFlags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDServerMessagePersistence_applySortedFlags___block_invoke_2;
  aBlock[3] = &unk_1E6C06490;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v9 + 24))
        {
          id v10 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v8));
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "executeStatementString:errorMessage:", v10, @"Setting flags", (void)v13);
        }
        else
        {
          *(unsigned char *)(v9 + 24) = 0;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }

  BOOL v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  return v11;
}

id __47__EDServerMessagePersistence_applySortedFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:100];
  [v4 appendString:@"UPDATE server_messages SET "];
  id v5 = [v3 second];
  if ([v5 read]) {
    uint64_t v6 = @"read = 1";
  }
  else {
    uint64_t v6 = @"read = 0";
  }
  [v4 appendString:v6];

  uint64_t v7 = [v3 second];
  if ([v7 deleted]) {
    uint64_t v8 = @", deleted = 1";
  }
  else {
    uint64_t v8 = @", deleted = 0";
  }
  [v4 appendString:v8];

  uint64_t v9 = [v3 second];
  if ([v9 replied]) {
    id v10 = @", replied = 1";
  }
  else {
    id v10 = @", replied = 0";
  }
  [v4 appendString:v10];

  BOOL v11 = [v3 second];
  if ([v11 flagged]) {
    uint64_t v12 = @", flagged = 1";
  }
  else {
    uint64_t v12 = @", flagged = 0";
  }
  [v4 appendString:v12];

  long long v13 = [v3 second];
  if ([v13 draft]) {
    long long v14 = @", draft = 1";
  }
  else {
    long long v14 = @", draft = 0";
  }
  [v4 appendString:v14];

  long long v15 = [v3 second];
  if ([v15 forwarded]) {
    long long v16 = @", forwarded = 1";
  }
  else {
    long long v16 = @", forwarded = 0";
  }
  [v4 appendString:v16];

  uint64_t v17 = [v3 second];
  if ([v17 redirected]) {
    id v18 = @", redirected = 1";
  }
  else {
    id v18 = @", redirected = 0";
  }
  [v4 appendString:v18];

  uint64_t v19 = [v3 second];
  [v4 appendFormat:@", junk_level = %d", objc_msgSend(v19, "junkLevel")];

  char v20 = [v3 second];
  [v4 appendFormat:@", flag_color = %d", objc_msgSend(v20, "flagColor")];

  uint64_t v21 = [*(id *)(a1 + 32) mailboxID];
  uint64_t v22 = [v3 first];
  [v4 appendFormat:@" WHERE (mailbox = %lld) AND (remote_id = %@)", v21, v22];

  return v4;
}

- (void)enumerateUIDsInRanges:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(EDServerMessagePersistence *)self database];
    uint64_t v9 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence enumerateUIDsInRanges:withBlock:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke;
    void v10[3] = &unk_1E6C064B8;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v10);
  }
}

uint64_t __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke(id *a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; i < [a1[4] count]; ++i)
    [v3 addObject:@"(? <= remote_id AND remote_id < ?)"];
  id v5 = [v3 componentsJoinedByString:@" OR "];
  id v6 = [NSString stringWithFormat:@"SELECT remote_id FROM server_messages WHERE mailbox = ? AND (%@) ORDER BY remote_id", v5];
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1[5], "mailboxID"));
  v26[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v10 = [v7 arrayWithArray:v9];

  for (unint64_t j = 0; j < [a1[4] count]; ++j)
  {
    uint64_t v12 = [a1[4] objectAtIndexedSubscript:j];
    uint64_t v13 = [v12 rangeValue];
    uint64_t v15 = v14;

    long long v16 = [NSNumber numberWithUnsignedInteger:v13];
    [v10 addObject:v16];

    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v13 + v15];
    [v10 addObject:v17];
  }
  id v18 = [v22 preparedStatementForQueryString:v6];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke_2;
  v24[3] = &unk_1E6BFF588;
  id v25 = a1[6];
  id v23 = 0;
  uint64_t v19 = [v18 executeWithIndexedBindings:v10 usingBlock:v24 error:&v23];
  id v20 = v23;

  return v19;
}

void __62__EDServerMessagePersistence_enumerateUIDsInRanges_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 int64Value];

  if (v4 <= 0xFFFFFFFFLL) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateUIDsInIndexSet:(id)a3 includingJSON:(id)a4 excludingJSON:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(EDServerMessagePersistence *)self database];
  uint64_t v15 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence enumerateUIDsInIndexSet:includingJSON:excludingJSON:withBlock:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke;
  v20[3] = &unk_1E6C064E0;
  id v16 = v10;
  id v21 = v16;
  id v22 = self;
  id v17 = v11;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  id v19 = v13;
  id v25 = v19;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v20);
}

uint64_t __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "ed_uidQueryExpression");
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v22 = @":mailbox";
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v23[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  uint64_t v8 = [v5 dictionaryWithDictionary:v7];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    [v8 setObject:v9 forKeyedSubscript:@":include"];
    id v10 = @"remote_id IN (SELECT value FROM json_each(:include))";
  }
  else
  {
    id v10 = @"0";
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11)
  {
    [v8 setObject:v11 forKeyedSubscript:@":exclude"];
    id v12 = @"(SELECT value FROM json_each(:exclude))";
  }
  else
  {
    id v12 = @"()";
  }
  id v13 = [NSString stringWithFormat:@"SELECT remote_id FROM server_messages WHERE mailbox = :mailbox AND ((%@) OR (%@)) AND (NOT remote_id IN %@) ORDER BY remote_id", v4, v10, v12];
  uint64_t v14 = +[EDServerMessagePersistence log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_cold_1((uint64_t)v13, (uint64_t)v8, v14);
  }

  uint64_t v15 = [v3 preparedStatementForQueryString:v13];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_405;
  v20[3] = &unk_1E6BFF588;
  id v21 = *(id *)(a1 + 64);
  id v19 = 0;
  uint64_t v16 = [v15 executeWithNamedBindings:v8 usingBlock:v20 error:&v19];
  id v17 = v19;

  return v16;
}

void __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_405(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 int64Value];

  if (v4 <= 0xFFFFFFFFLL) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)downloadStateForUIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [(EDServerMessagePersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence downloadStateForUIDs:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke;
  v13[3] = &unk_1E6BFF4F0;
  id v8 = v4;
  id v14 = v8;
  uint64_t v15 = self;
  id v9 = v5;
  id v16 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  id v10 = v16;
  id v11 = v9;

  return v11;
}

uint64_t __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke(id *a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(a1[4], "ed_uidQueryExpressionWithTableName:", @"server_messages");
  id v5 = [NSString stringWithFormat:@"SELECT message_global_data.download_state, server_messages.remote_id FROM message_global_data JOIN messages ON message_global_data.rowid == messages.global_message_id JOIN server_messages ON messages.rowid == server_messages.message WHERE server_messages.mailbox == :mailbox AND %@", v4];
  id v6 = [v3 preparedStatementForQueryString:v5];
  uint64_t v15 = @":mailbox";
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1[5], "mailboxID"));
  v16[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke_2;
  v13[3] = &unk_1E6BFF3B0;
  id v14 = a1[6];
  id v12 = 0;
  uint64_t v9 = [v6 executeWithNamedBindings:v8 usingBlock:v13 error:&v12];
  id v10 = v12;

  return v9;
}

void __51__EDServerMessagePersistence_downloadStateForUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];

  id v5 = [v9 objectAtIndexedSubscript:1];
  uint64_t v6 = [v5 int64Value];

  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFD)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:v6];
    [v7 setObject:v4 forKeyedSubscript:v8];
  }
}

- (void)setDownloadStateForUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = [(EDServerMessagePersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence setDownloadStateForUIDs:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke;
  void v10[3] = &unk_1E6BFF338;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  id v13 = &v14;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v10);

  id v8 = +[EDServerMessagePersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v15[3];
    *(_DWORD *)buf = 134218240;
    id v19 = self;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Updated download_state for %u rows.", buf, 0x12u);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke_2;
  v7[3] = &unk_1E6C06508;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return 1;
}

void __54__EDServerMessagePersistence_setDownloadStateForUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a2, "ed_uidQueryExpressionWithTableName:", @"server_messages");
  id v7 = [NSString stringWithFormat:@"UPDATE message_global_data SET download_state = :new_state WHERE rowid in (SELECT messages.global_message_id FROM server_messages JOIN messages ON messages.rowid == server_messages.message WHERE server_messages.mailbox == :mailbox AND %@)", v6];
  id v8 = [*(id *)(a1 + 32) preparedStatementForQueryString:v7];
  v15[1] = @":mailbox";
  v16[0] = v5;
  uint64_t v14 = 0;
  v15[0] = @":new_state";
  long long v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v16[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v13 = 0;
  char v11 = [v8 executeWithNamedBindings:v10 rowsChanged:&v14 error:&v13];
  id v12 = v13;

  if (v11) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v14;
  }
  else {
    [*(id *)(a1 + 32) handleError:v12 message:@"Updating download state."];
  }
}

- (void)enumerateMessageBatchLimitUIDsWithWindow:(_NSRange)a3 batchSize:(int64_t)a4 newUIDCount:(int64_t)a5 block:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a6;
  if (a4 >= 1)
  {
    id v12 = [(EDServerMessagePersistence *)self database];
    id v13 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence enumerateMessageBatchLimitUIDsWithWindow:batchSize:newUIDCount:block:]"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke;
    v14[3] = &unk_1E6C06530;
    void v14[4] = self;
    int64_t v16 = a4;
    NSUInteger v17 = location;
    NSUInteger v18 = length;
    int64_t v19 = a5;
    id v15 = v11;
    objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, v14);
  }
}

uint64_t __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke(uint64_t a1, void *a2)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v17[0] = @":mailbox";
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "mailboxID"));
  v18[0] = v4;
  v17[1] = @":batch_size";
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v18[1] = v5;
  v17[2] = @":lower";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v18[2] = v6;
  v17[3] = @":upper";
  id v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56) + *(void *)(a1 + 64) - 1];
  v18[3] = v7;
  v17[4] = @":new_uid_count";
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v18[4] = v8;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  id v10 = [v3 preparedStatementForQueryString:@"WITH cte AS NOT materialized   (SELECT remote_id   FROM server_messages   WHERE mailbox = :mailbox    AND remote_id IS NOT NULL    AND remote_id >= :lower    AND remote_id <= :upper  ORDER BY remote_id DESC) SELECT remote_id, rn FROM   (SELECT *, row_number() OVER () AS rn FROM cte) WHERE rn == 1   OR (rn + :new_uid_count) % :batch_size == 1   OR rn == (SELECT count(*) FROM cte) "];;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke_2;
  v15[3] = &unk_1E6BFF588;
  id v16 = *(id *)(a1 + 40);
  id v14 = 0;
  uint64_t v11 = [v10 executeWithNamedBindings:v9 usingBlock:v15 error:&v14];
  id v12 = v14;

  return v11;
}

void __99__EDServerMessagePersistence_enumerateMessageBatchLimitUIDsWithWindow_batchSize_newUIDCount_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 int64Value];

  id v5 = [v6 objectAtIndexedSubscript:1];
  [v5 int64Value];

  if (v4 <= 0xFFFFFFFFLL) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)groupInsideWriteTransactionWithDescription:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDServerMessagePersistence *)self database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__EDServerMessagePersistence_groupInsideWriteTransactionWithDescription_block___block_invoke;
  void v10[3] = &unk_1E6BFFED0;
  id v9 = v7;
  id v11 = v9;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v6, v10);
}

uint64_t __79__EDServerMessagePersistence_groupInsideWriteTransactionWithDescription_block___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)addLabels:(id)a3 removeLabels:(id)a4 toMessagesWithRemoteIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  id v11 = [(EDServerMessagePersistence *)self database];
  id v12 = [NSString stringWithUTF8String:"-[EDServerMessagePersistence addLabels:removeLabels:toMessagesWithRemoteIDs:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__EDServerMessagePersistence_addLabels_removeLabels_toMessagesWithRemoteIDs___block_invoke;
  v17[3] = &unk_1E6C06558;
  id v13 = v10;
  uint64_t v22 = &v23;
  id v18 = v13;
  int64_t v19 = self;
  id v14 = v8;
  id v20 = v14;
  id v15 = v9;
  id v21 = v15;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

  LOBYTE(v8) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v8;
}

BOOL __77__EDServerMessagePersistence_addLabels_removeLabels_toMessagesWithRemoteIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v4);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_addLabels:removeLabels:forUID:connection:", *(void *)(a1 + 48), *(void *)(a1 + 56), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "integerValue", (void)v10), v3);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  return v8;
}

- (BOOL)_addLabels:(id)a3 removeLabels:(id)a4 forUID:(unsigned int)a5 connection:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v63[2] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v36 = a4;
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__38;
  v57 = __Block_byref_object_dispose__38;
  id v58 = 0;
  id v40 = a6;
  id v39 = [v40 preparedStatementForQueryString:@"SELECT ROWID FROM server_messages WHERE remote_id = ? AND mailbox = ? LIMIT 1"];
  long long v10 = [NSNumber numberWithUnsignedInt:v7];
  v63[0] = v10;
  long long v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[EDServerMessagePersistence mailboxID](self, "mailboxID"));
  v63[1] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  id v51 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __72__EDServerMessagePersistence__addLabels_removeLabels_forUID_connection___block_invoke;
  v52[3] = &unk_1E6BFF4C8;
  v52[4] = &v53;
  char v37 = [v39 executeWithIndexedBindings:v12 usingBlock:v52 error:&v51];
  id v13 = v51;

  if (v37)
  {
    if (!v54[5])
    {
LABEL_3:
      BOOL v14 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v40, "handleError:message:", v13, @"Getting server message ID", v36);
    if (!v54[5])
    {
LABEL_27:
      BOOL v14 = 0;
      goto LABEL_28;
    }
  }
  uint64_t v15 = [v40 preparedStatementForQueryString:@"INSERT OR IGNORE INTO server_labels (server_message, label) VALUES (?, ?)", v36];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v16 = v38;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    while (2)
    {
      uint64_t v19 = 0;
      id v20 = v13;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v47 + 1) + 8 * v19) persistentID];
        uint64_t v22 = [v21 longLongValue];

        v61[0] = v54[5];
        uint64_t v23 = [NSNumber numberWithLongLong:v22];
        v61[1] = v23;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
        id v46 = v20;
        char v25 = [v15 executeWithIndexedBindings:v24 usingBlock:0 error:&v46];
        id v13 = v46;

        if ((v25 & 1) == 0)
        {
          [v40 handleError:v13 message:@"Adding server label"];
LABEL_25:
          BOOL v14 = 0;
          goto LABEL_26;
        }
        ++v19;
        id v20 = v13;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  if ((v37 & 1) == 0) {
    goto LABEL_27;
  }
  if (!v54[5]) {
    goto LABEL_3;
  }
  uint64_t v15 = [v40 preparedStatementForQueryString:@"DELETE FROM server_labels WHERE server_message = ? AND label = ?"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v36;
  uint64_t v26 = [v16 countByEnumeratingWithState:&v42 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v43;
    while (2)
    {
      uint64_t v28 = 0;
      id v29 = v13;
      do
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v16);
        }
        v30 = [*(id *)(*((void *)&v42 + 1) + 8 * v28) persistentID];
        uint64_t v31 = [v30 longLongValue];

        v59[0] = v54[5];
        v32 = [NSNumber numberWithLongLong:v31];
        v59[1] = v32;
        uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
        id v41 = v29;
        char v34 = [v15 executeWithIndexedBindings:v33 usingBlock:0 error:&v41];
        id v13 = v41;

        if ((v34 & 1) == 0)
        {
          [v40 handleError:v13 message:@"Removing server label"];
          goto LABEL_25;
        }
        ++v28;
        id v29 = v13;
      }
      while (v26 != v28);
      uint64_t v26 = [v16 countByEnumeratingWithState:&v42 objects:v60 count:16];
      BOOL v14 = 1;
      if (v26) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_26:

LABEL_28:
  _Block_object_dispose(&v53, 8);

  return v14;
}

void __72__EDServerMessagePersistence__addLabels_removeLabels_forUID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_remoteIDStringForRemoteIDArray:(id)a3
{
  id v4 = a3;
  if ([(EDServerMessagePersistence *)self useNumericSearch]) {
    objc_msgSend(v4, "ef_filter:", &__block_literal_global_454);
  }
  else {
  uint64_t v5 = [v4 valueForKey:@"ef_quotedSQLEscapedString"];
  }
  uint64_t v6 = [v5 componentsJoinedByString:@", "];

  return v6;
}

uint64_t __62__EDServerMessagePersistence__remoteIDStringForRemoteIDArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_isUnsignedIntegerString");
}

- (BOOL)supportsLabels
{
  return self->_supportsLabels;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return self->_gmailLabelPersistence;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (BOOL)useNumericSearch
{
  return self->_useNumericSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (void)serverMessagesForIMAPUIDs:(uint64_t)a3 limit:(os_log_t)log returnLastEntries:.cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Returned more results (%lu) than requested (%lu)", buf, 0x16u);
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, a2, a3, "Unable to read server messages with 'cleared' UIDs: %{public}@", (uint8_t *)a2);
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169_cold_1(int a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Number of deleted rows (%u) does not match server messages previously found (%u).", buf, 0xEu);
}

void __57__EDServerMessagePersistence_deleteAllClearedUIDMessages__block_invoke_169_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, a2, a3, "Unable to delete server messages with 'cleared' UIDs: %{public}@", (uint8_t *)a2);
}

void __64__EDServerMessagePersistence_serverMessagesForMessageIDHeaders___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, a2, a3, "Unable to look up existing messages based on message-id header: %{public}@", (uint8_t *)a2);
}

void __92__EDServerMessagePersistence_enumerateUIDsInIndexSet_includingJSON_excludingJSON_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "enumerateUIDs query '%{public}@', bindings: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end