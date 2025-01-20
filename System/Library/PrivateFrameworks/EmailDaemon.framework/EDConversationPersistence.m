@interface EDConversationPersistence
+ (EFSQLTableSchema)conversationIDMessageIDTableSchema;
+ (EFSQLTableSchema)conversationsTableSchema;
+ (NSString)conversationsTableName;
+ (id)log;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
+ (int64_t)conversationNotificationLevelForConversationFlags:(unint64_t)a3;
+ (unint64_t)conversationFlagsForConversationNotificationLevel:(int64_t)a3;
- (BOOL)hasSubscribedConversations;
- (EDConversationPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDUbiquitousConversationManager)conversationManager;
- (OS_dispatch_queue)notificationQueue;
- (id)flaggedConversationsChangedBetweenStartAnchor:(int64_t)a3 endAnchor:(int64_t)a4;
- (id)messageIDsForConversationID:(int64_t)a3 limit:(unint64_t)a4;
- (id)syncedConversationIDsBySyncKey;
- (int64_t)conversationIDForMessageIDs:(id)a3;
- (int64_t)createConversationWithFlags:(unint64_t)a3;
- (int64_t)currentSyncAnchorForDailyExport;
- (int64_t)previousSyncAnchorForDailyExport;
- (unint64_t)persistenceConversationFlagsForConversationID:(int64_t)a3;
- (void)_notifyOfFlagChangeForConversationID:(int64_t)a3 oldFlags:(unint64_t)a4 newFlags:(unint64_t)a5 reason:(int64_t)a6 generationWindow:(id)a7;
- (void)_postChangeNotificationForConversationID:(int64_t)a3 flags:(unint64_t)a4 oldFlags:(unint64_t)a5 reason:(int64_t)a6;
- (void)clearConversationFlagsAndSyncKeyForConversationIDs:(id)a3;
- (void)initializeConversationManagerAndPerformInitialSync;
- (void)markConversationWithIDs:(id)a3 mute:(BOOL)a4;
- (void)markConversationWithIDs:(id)a3 notify:(BOOL)a4;
- (void)pruneConversationTables:(double)a3;
- (void)setNewPreviousSyncAnchorForDailyExport:(int64_t)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setPersistenceConversationFlags:(unint64_t)a3 forConversationIDs:(id)a4 reason:(int64_t)a5;
- (void)setPersistenceConversationFlags:(unint64_t)a3 syncKey:(id)a4 forConversationID:(int64_t)a5 reason:(int64_t)a6;
- (void)updateAssociationTableForMessageID:(id)a3 dateSent:(id)a4 conversationID:(int64_t)a5;
- (void)updateAssociationTableForMessageIDs:(id)a3 conversationID:(int64_t)a4;
- (void)updateAssociationTableForMessagePersistentIDs:(id)a3 conversationID:(int64_t)a4;
- (void)updateConversationNotificationLevel:(int64_t)a3 forConversationIDs:(id)a4;
@end

@implementation EDConversationPersistence

+ (int64_t)conversationNotificationLevelForConversationFlags:(unint64_t)a3
{
  if ((a3 & 4) != 0) {
    return 1;
  }
  else {
    return 2 * (a3 & 1);
  }
}

- (BOOL)hasSubscribedConversations
{
  v2 = [(EDConversationPersistence *)self conversationManager];
  char v3 = [v2 hasSubscribedConversations];

  return v3;
}

- (EDUbiquitousConversationManager)conversationManager
{
  return self->_conversationManager;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EDConversationPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1) {
    dispatch_once(&log_onceToken_27, block);
  }
  v2 = (void *)log_log_27;

  return v2;
}

void __32__EDConversationPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;
}

+ (NSString)conversationsTableName
{
  return (NSString *)@"conversations";
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v7 = [a1 conversationsTableSchema];
  v8 = [a1 conversationIDMessageIDTableSchema];
  v9 = [v8 columnForName:@"conversation_id"];
  [v9 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:2];

  v10 = (void *)MEMORY[0x1E4F1CBF0];
  *a3 = (id)MEMORY[0x1E4F1CBF0];
  *a4 = v10;
  v13[0] = v7;
  v13[1] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

+ (EFSQLTableSchema)conversationsTableSchema
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:0 defaultValue:&unk_1F35BABE0];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"sync_key" collation:1 nullable:1];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithName:@"conversations" rowIDType:2 rowIDAlias:@"conversation_id" columns:v5];

  [v6 addIndexForColumns:&unk_1F35BB408];

  return (EFSQLTableSchema *)v6;
}

+ (EFSQLTableSchema)conversationIDMessageIDTableSchema
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation_id" nullable:0];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "integerColumnWithName:nullable:defaultValue:", @"message_id", 0, &unk_1F35BABE0, v3);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_sent" nullable:0 defaultValue:&unk_1F35BABE0];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v7 = (void *)[v2 initWithName:@"conversation_id_message_id" columns:v6 primaryKeyColumns:&unk_1F35BB420];

  [v7 addIndexForColumns:&unk_1F35BB438];

  return (EFSQLTableSchema *)v7;
}

+ (unint64_t)conversationFlagsForConversationNotificationLevel:(int64_t)a3
{
  if (a3 == 1) {
    return 4;
  }
  else {
    return a3 == 2;
  }
}

- (EDConversationPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EDConversationPersistence;
  v8 = [(EDConversationPersistence *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_database, v6);
    objc_storeStrong((id *)&v9->_hookRegistry, a4);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.ConversationPersistenceNotification", MEMORY[0x1E4F14430]);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v10;
  }
  return v9;
}

- (void)initializeConversationManagerAndPerformInitialSync
{
  id v3 = [[EDUbiquitousConversationManager alloc] initWithDelegate:self];
  conversationManager = self->_conversationManager;
  self->_conversationManager = v3;

  +[EDConversationDailyCloudExportActivityManager scheduleWithConversationExportDelegate:self conversationManager:self->_conversationManager];
  +[EDConversationPruningActivityManager scheduleWithConversationManager:self->_conversationManager];
  id v5 = [(EDConversationPersistence *)self conversationManager];
  [v5 performInitialSync];

  id v6 = [(EDConversationPersistence *)self hookRegistry];
  [v6 persistenceDidInitializeConversationSubscriptionProvider];
}

- (id)syncedConversationIDsBySyncKey
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(EDConversationPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDConversationPersistence syncedConversationIDsBySyncKey]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke;
  void v8[3] = &unk_1E6C00AF0;
  id v6 = v3;
  id v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

uint64_t __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 preparedStatementForQueryString:@"SELECT conversation_id, sync_key FROM conversations WHERE sync_key NOT NULL"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke_2;
  void v8[3] = &unk_1E6BFF3B0;
  id v9 = *(id *)(a1 + 32);
  id v7 = 0;
  [v4 executeUsingBlock:v8 error:&v7];
  id v5 = v7;
  [v3 handleError:v5 message:@"Selecting synced conversations"];

  return 1;
}

void __59__EDConversationPersistence_syncedConversationIDsBySyncKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectForKeyedSubscript:@"conversation_id"];
  v4 = [v3 numberValue];

  id v5 = [v7 objectForKeyedSubscript:@"sync_key"];
  id v6 = [v5 stringValue];

  if (v4 && v6) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v6];
  }
}

- (id)messageIDsForConversationID:(int64_t)a3 limit:(unint64_t)a4
{
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(EDConversationPersistence *)self database];
  v8 = [NSString stringWithUTF8String:"-[EDConversationPersistence messageIDsForConversationID:limit:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke;
  v11[3] = &unk_1E6C00B18;
  v11[5] = a3;
  v11[6] = a4;
  v11[4] = &v12;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke(void *a1, void *a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v12[0] = @":conversation_id";
  v4 = [NSNumber numberWithLongLong:a1[5]];
  v12[1] = @":limit";
  v13[0] = v4;
  id v5 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v7 = [v3 preparedStatementForQueryString:@"SELECT message_id FROM conversation_id_message_id WHERE conversation_id = :conversation_id ORDER BY date_sent DESC LIMIT :limit"];
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke_2;
  v11[3] = &unk_1E6BFF4C8;
  v11[4] = a1[4];
  [v7 executeWithNamedBindings:v6 usingBlock:v11 error:&v10];
  id v8 = v10;
  [v3 handleError:v8 message:@"Selecting message IDs for conversation ID"];

  return 1;
}

void __63__EDConversationPersistence_messageIDsForConversationID_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"message_id"];
  id v4 = [v3 numberValue];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

- (int64_t)conversationIDForMessageIDs:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = *MEMORY[0x1E4F5FCC8];
  id v5 = [(EDConversationPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDConversationPersistence conversationIDForMessageIDs:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke;
  v10[3] = &unk_1E6BFF400;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  int64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSString;
  id v5 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
  id v6 = [v4 stringWithFormat:@"SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE message_id IN (%@)", v5];

  id v7 = [v3 preparedStatementForQueryString:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2;
  void v13[3] = &unk_1E6BFF208;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v11;
  long long v14 = v11;
  id v12 = 0;
  [v7 executeUsingBlock:v13 error:&v12];
  id v9 = v12;
  [v3 handleError:v9 message:@"Selecting conversation ID for message IDs"];

  return 1;
}

void __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= *MEMORY[0x1E4F5FCC8])
  {
    id v9 = [v6 objectForKeyedSubscript:@"conversation_id"];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 databaseIDValue];
  }
  else
  {
    id v8 = +[EDConversationPersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2_cold_1(a1, v8);
    }

    *a4 = 1;
  }
}

- (unint64_t)persistenceConversationFlagsForConversationID:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v4 = [(EDConversationPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDConversationPersistence persistenceConversationFlagsForConversationID:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke;
  void v8[3] = &unk_1E6BFFE38;
  void v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"SELECT flags FROM conversations WHERE conversations.conversation_id = :conversation_id"];
  uint64_t v11 = @":conversation_id";
  id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v12[0] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke_2;
  v10[3] = &unk_1E6BFF4C8;
  void v10[4] = *(void *)(a1 + 32);
  [v4 executeWithNamedBindings:v6 usingBlock:v10 error:&v9];
  id v7 = v9;

  [v3 handleError:v7 message:@"Selecting flags for conversation ID"];
  return 1;
}

void __75__EDConversationPersistence_persistenceConversationFlagsForConversationID___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKeyedSubscript:@"flags"];
  id v4 = [v3 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 unsignedIntegerValue];
}

- (int64_t)createConversationWithFlags:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v4 = [(EDConversationPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDConversationPersistence createConversationWithFlags:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__EDConversationPersistence_createConversationWithFlags___block_invoke;
  void v8[3] = &unk_1E6BFFE38;
  void v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v8);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __57__EDConversationPersistence_createConversationWithFlags___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"INSERT INTO conversations (flags) values (:flags)"];
  uint64_t v11 = @":flags";
  id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v12[0] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = 0;
  uint64_t v7 = [v4 executeWithNamedBindings:v6 usingBlock:0 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"Creating conversation."];
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 lastInsertedDatabaseID];

  return v7;
}

- (void)markConversationWithIDs:(id)a3 mute:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }
  [(EDConversationPersistence *)self setPersistenceConversationFlags:v5 forConversationIDs:a3 reason:4];
}

- (void)markConversationWithIDs:(id)a3 notify:(BOOL)a4
{
}

- (void)setPersistenceConversationFlags:(unint64_t)a3 forConversationIDs:(id)a4 reason:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v16;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 longLongValue];
        uint64_t v13 = [(EDConversationPersistence *)self conversationManager];
        long long v14 = [v13 syncKeyForUpdatedConversation:v12 flags:a3];

        if (v14) {
          [v18 setObject:v11 forKeyedSubscript:v14];
        }
        if (!a3)
        {

          long long v14 = 0;
        }
        [(EDConversationPersistence *)self setPersistenceConversationFlags:a3 syncKey:v14 forConversationID:v12 reason:a5];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [(EDConversationPersistence *)self conversationManager];
  [v15 setFlags:a3 forConversations:v18];
}

- (void)setPersistenceConversationFlags:(unint64_t)a3 syncKey:(id)a4 forConversationID:(int64_t)a5 reason:(int64_t)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (!a5 || *MEMORY[0x1E4F5FCC8] == a5)
  {
    uint64_t v15 = +[EDConversationPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218754;
      *(void *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2114;
      id v23 = v10;
      __int16 v24 = 2048;
      int64_t v25 = a6;
      _os_log_fault_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_FAULT, "Invalid conversation ID (%lld) when setting conversation flags (%llu) for sync key \"%{public}@\" with reason: %lld", buf, 0x2Au);
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v23 = 0;
    uint64_t v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    uint64_t v12 = [(EDConversationPersistence *)self database];
    uint64_t v13 = [NSString stringWithUTF8String:"-[EDConversationPersistence setPersistenceConversationFlags:syncKey:forConversationID:reason:]"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke;
    v16[3] = &unk_1E6C00B40;
    long long v14 = v11;
    id v17 = v14;
    long long v19 = buf;
    int64_t v20 = a5;
    unint64_t v21 = a3;
    id v18 = v10;
    objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v16);

    [(EDConversationPersistence *)self _notifyOfFlagChangeForConversationID:a5 oldFlags:*(void *)(*(void *)&buf[8] + 24) newFlags:a3 reason:a6 generationWindow:v14];
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v4 = [v3 preparedStatementForQueryString:@"SELECT flags FROM conversations WHERE conversation_id = :conversation_id LIMIT 1"];
  long long v19 = @":conversation_id";
  uint64_t v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  v20[0] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v17 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke_2;
  v18[3] = &unk_1E6BFF4C8;
  v18[4] = *(void *)(a1 + 48);
  char v7 = [v4 executeWithNamedBindings:v6 usingBlock:v18 error:&v17];
  id v8 = v17;

  if (v7)
  {
    uint64_t v9 = [v3 preparedStatementForQueryString:@"UPDATE conversations SET flags = :flags, sync_key = :sync_key WHERE conversation_id = :conversation_id"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
    [v10 setObject:v11 forKeyedSubscript:@":flags"];

    [v10 setObject:*(void *)(a1 + 40) forKeyedSubscript:@":sync_key"];
    uint64_t v12 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
    [v10 setObject:v12 forKeyedSubscript:@":conversation_id"];

    id v16 = v8;
    uint64_t v13 = [v9 executeWithNamedBindings:v10 usingBlock:0 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0) {
      [v3 handleError:v14 message:@"Setting conversation flags"];
    }

    id v8 = v14;
  }
  else
  {
    [v3 handleError:v8 message:@"Finding old conversation flags"];
    uint64_t v13 = 0;
  }

  return v13;
}

void __94__EDConversationPersistence_setPersistenceConversationFlags_syncKey_forConversationID_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 unsignedLongLongValue];
}

- (void)updateAssociationTableForMessagePersistentIDs:(id)a3 conversationID:(int64_t)a4
{
  id v6 = a3;
  char v7 = [(EDConversationPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDConversationPersistence updateAssociationTableForMessagePersistentIDs:conversationID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke;
  v10[3] = &unk_1E6BFF360;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = self;
  int64_t v13 = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);
}

uint64_t __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSString;
  id v5 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
  id v6 = [v4 stringWithFormat:@"SELECT message_id, date_sent from messages where ROWID IN (%@)", v5];

  char v7 = [v3 preparedStatementForQueryString:v6];
  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke_2;
  v12[3] = &unk_1E6C00B68;
  uint64_t v8 = *(void *)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  v12[5] = v8;
  [v7 executeUsingBlock:v12 error:&v11];
  id v9 = v11;
  [v3 handleError:v9 message:@"Selecting message IDs to update conversation association table."];

  return 1;
}

void __90__EDConversationPersistence_updateAssociationTableForMessagePersistentIDs_conversationID___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"message_id"];
  id v4 = [v3 objectValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v10 objectForKeyedSubscript:@"message_id"];
    char v7 = [v6 numberValue];

    uint64_t v8 = [v10 objectForKeyedSubscript:@"date_sent"];
    id v9 = [v8 numberValue];

    if (v7) {
      [*(id *)(a1 + 32) updateAssociationTableForMessageID:v7 dateSent:v9 conversationID:*(void *)(a1 + 40)];
    }
  }
}

- (void)updateAssociationTableForMessageIDs:(id)a3 conversationID:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[EDConversationPersistence updateAssociationTableForMessageID:dateSent:conversationID:](self, "updateAssociationTableForMessageID:dateSent:conversationID:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), 0, a4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateAssociationTableForMessageID:(id)a3 dateSent:(id)a4 conversationID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(EDConversationPersistence *)self database];
  long long v11 = [NSString stringWithUTF8String:"-[EDConversationPersistence updateAssociationTableForMessageID:dateSent:conversationID:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke;
  v14[3] = &unk_1E6BFF360;
  int64_t v17 = a5;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);
}

uint64_t __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v4 = NSString;
  id v5 = [NSNumber numberWithLongLong:a1[6]];
  id v6 = [v4 stringWithFormat:@"SELECT conversation_id FROM conversations where conversation_id = %@", v5];

  uint64_t v7 = [v3 preparedStatementForQueryString:v6];
  id v18 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_2;
  v19[3] = &unk_1E6BFF4C8;
  v19[4] = &v20;
  char v8 = [v7 executeUsingBlock:v19 error:&v18];
  id v9 = v18;
  if ((v8 & 1) == 0) {
    [v3 handleError:v9 message:@"Executing querying for conversation id"];
  }
  if (*((unsigned char *)v21 + 24))
  {
    long long v10 = [v3 preparedStatementForQueryString:@"INSERT OR REPLACE INTO conversation_id_message_id (conversation_id, message_id, date_sent) VALUES (:conversation_id, :message_id, :date_sent)"];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:a1[4] forKeyedSubscript:@":message_id"];
    id v12 = [NSNumber numberWithLongLong:a1[6]];
    [v11 setObject:v12 forKeyedSubscript:@":conversation_id"];

    [v11 setObject:a1[5] forKeyedSubscript:@":date_sent"];
    id v17 = v9;
    uint64_t v13 = [v10 executeWithNamedBindings:v11 usingBlock:0 error:&v17];
    id v14 = v17;

    if ((v13 & 1) == 0) {
      [v3 handleError:v14 message:@"Setting conversation association table entries"];
    }
  }
  else
  {
    long long v10 = +[EDConversationPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v15 = [NSNumber numberWithLongLong:a1[6]];
      __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_cold_1(v15, buf, v10);
    }
    uint64_t v13 = 1;
    id v14 = v9;
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (void)updateConversationNotificationLevel:(int64_t)a3 forConversationIDs:(id)a4
{
  id v6 = a4;
  [(EDConversationPersistence *)self setPersistenceConversationFlags:+[EDConversationPersistence conversationFlagsForConversationNotificationLevel:a3] forConversationIDs:v6 reason:4];
}

- (void)pruneConversationTables:(double)a3
{
  id v4 = [(EDConversationPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDConversationPersistence pruneConversationTables:]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EDConversationPersistence_pruneConversationTables___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  *(double *)&v6[4] = a3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);
}

uint64_t __53__EDConversationPersistence_pruneConversationTables___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"DELETE FROM conversations WHERE conversation_id NOT IN (SELECT DISTINCT conversation_id from messages) AND (sync_key IS NULL AND conversation_id NOT IN (SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE date_sent > :older_than));"];
  id v11 = @":older_than";
  id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = 0;
  uint64_t v7 = [v4 executeWithNamedBindings:v6 usingBlock:0 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"Pruning conversations table"];
  }

  return v7;
}

- (void)clearConversationFlagsAndSyncKeyForConversationIDs:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  id v5 = [(EDConversationPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDConversationPersistence clearConversationFlagsAndSyncKeyForConversationIDs:]"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__EDConversationPersistence_clearConversationFlagsAndSyncKeyForConversationIDs___block_invoke;
  v23[3] = &unk_1E6BFF3D8;
  id v7 = v4;
  id v24 = v7;
  id v8 = v18;
  uint64_t v25 = v8;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v23);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    uint64_t v12 = *MEMORY[0x1E4F5FCC8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) longLongValue];
        uint64_t v15 = v14;
        if (v14) {
          BOOL v16 = v14 == v12;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {
          id v17 = +[EDConversationPersistence log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v27 = v15;
            _os_log_fault_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_FAULT, "Invalid conversation ID (%lld) when clearing conversation flags", buf, 0xCu);
          }
        }
        else
        {
          [(EDConversationPersistence *)self _notifyOfFlagChangeForConversationID:v14 oldFlags:0 newFlags:0 reason:0 generationWindow:v8];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v10);
  }
}

uint64_t __80__EDConversationPersistence_clearConversationFlagsAndSyncKeyForConversationIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSString;
  id v5 = [*(id *)(a1 + 32) componentsJoinedByString:@", "];
  id v6 = [v4 stringWithFormat:@"UPDATE conversation SET flags = :flags, sync_key = NULL WHERE conversation_id IN (%@)", v5];
  id v7 = [v3 preparedStatementForQueryString:v6];

  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v11 = 0;
  uint64_t v8 = [v7 executeWithNamedBindings:&unk_1F35BB648 usingBlock:0 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0) {
    [v3 handleError:v9 message:@"Pruning conversations table"];
  }

  return v8;
}

- (void)_notifyOfFlagChangeForConversationID:(int64_t)a3 oldFlags:(unint64_t)a4 newFlags:(unint64_t)a5 reason:(int64_t)a6 generationWindow:(id)a7
{
  id v14 = a7;
  int64_t v12 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:a5];
  uint64_t v13 = [(EDConversationPersistence *)self hookRegistry];
  [v13 persistenceDidChangeConversationNotificationLevel:v12 conversationID:a3 generationWindow:v14];

  [(EDConversationPersistence *)self _postChangeNotificationForConversationID:a3 flags:a5 oldFlags:a4 reason:a6];
}

- (void)_postChangeNotificationForConversationID:(int64_t)a3 flags:(unint64_t)a4 oldFlags:(unint64_t)a5 reason:(int64_t)a6
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__EDConversationPersistence__postChangeNotificationForConversationID_flags_oldFlags_reason___block_invoke;
  block[3] = &unk_1E6C00BB0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(notificationQueue, block);
}

void __92__EDConversationPersistence__postChangeNotificationForConversationID_flags_oldFlags_reason___block_invoke(void *a1)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"MessageConversationIsVIP";
  id v2 = a1 + 5;
  id v3 = [NSNumber numberWithBool:a1[5] & 1];
  v16[1] = @"MessageConversationIsMuted";
  v17[0] = v3;
  id v4 = [NSNumber numberWithBool:(*v2 >> 2) & 1];
  v17[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = EDConversationFlagsChanged;
  uint64_t v8 = a1[4];
  v14[0] = @"EDConversationFlagsChangedConversationIDKey";
  id v9 = [NSNumber numberWithLongLong:a1[6]];
  v15[0] = v9;
  v15[1] = v5;
  v14[1] = @"EDConversationFlagsChangesKey";
  v14[2] = @"EDConversationFlagsKey";
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a1[5]];
  v15[2] = v10;
  v14[3] = @"EDConversationFlagsOldFlags";
  id v11 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  v15[3] = v11;
  void v14[4] = @"EDConversationFlagsReason";
  int64_t v12 = [NSNumber numberWithInteger:a1[8]];
  v15[4] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  [v6 postNotificationName:v7 object:v8 userInfo:v13];
}

- (int64_t)previousSyncAnchorForDailyExport
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = *MEMORY[0x1E4F5FCC8];
  id v2 = [(EDConversationPersistence *)self database];
  id v3 = [NSString stringWithUTF8String:"-[EDConversationPersistence previousSyncAnchorForDailyExport]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke;
  v6[3] = &unk_1E6BFFFB8;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [NSString stringWithFormat:@"SELECT value FROM properties WHERE key = '%@'", @"SyncAnchorForLastDailyConversationExport"];
  id v5 = [v3 preparedStatementForQueryString:v4];

  id v8 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke_2;
  v9[3] = &unk_1E6BFF4C8;
  void v9[4] = *(void *)(a1 + 32);
  [v5 executeUsingBlock:v9 error:&v8];
  id v6 = v8;
  [v3 handleError:v6 message:@"Selecting previous conversation daily export sync anchor"];

  return 1;
}

void __61__EDConversationPersistence_previousSyncAnchorForDailyExport__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:@"value"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (int64_t)currentSyncAnchorForDailyExport
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = *MEMORY[0x1E4F5FCC8];
  id v2 = [(EDConversationPersistence *)self database];
  id v3 = [NSString stringWithUTF8String:"-[EDConversationPersistence currentSyncAnchorForDailyExport]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke;
  v6[3] = &unk_1E6BFFFB8;
  v6[4] = &v7;
  objc_msgSend(v2, "__performReadWithCaller:usingBlock:", v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [v3 preparedStatementForQueryString:@"SELECT max(ROWID) as syncAnchor from messages"];
  id v7 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke_2;
  void v8[3] = &unk_1E6BFF4C8;
  void v8[4] = *(void *)(a1 + 32);
  [v4 executeUsingBlock:v8 error:&v7];
  id v5 = v7;
  [v3 handleError:v5 message:@"Selecting current conversation sync anchor for daily export"];

  return 1;
}

void __60__EDConversationPersistence_currentSyncAnchorForDailyExport__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:@"syncAnchor"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (void)setNewPreviousSyncAnchorForDailyExport:(int64_t)a3
{
  id v4 = [(EDConversationPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDConversationPersistence setNewPreviousSyncAnchorForDailyExport:]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__EDConversationPersistence_setNewPreviousSyncAnchorForDailyExport___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v6[4] = a3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);
}

uint64_t __68__EDConversationPersistence_setNewPreviousSyncAnchorForDailyExport___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:@"SyncAnchorForLastDailyConversationExport" forKeyedSubscript:@":key"];
  id v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  [v5 setObject:v6 forKeyedSubscript:@":value"];

  id v10 = 0;
  uint64_t v7 = [v4 executeWithNamedBindings:v5 usingBlock:0 error:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"Updating previous conversation sync anchor for daily export"];
  }

  return v7;
}

- (id)flaggedConversationsChangedBetweenStartAnchor:(int64_t)a3 endAnchor:(int64_t)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  BOOL v16 = __Block_byref_object_dispose__6;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(EDConversationPersistence *)self database];
  id v8 = [NSString stringWithUTF8String:"-[EDConversationPersistence flaggedConversationsChangedBetweenStartAnchor:endAnchor:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke;
  v11[3] = &unk_1E6C00B18;
  void v11[5] = a3;
  v11[6] = a4;
  v11[4] = &v12;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"SELECT DISTINCT conversations.conversation_id AS conversation_id FROM conversations LEFT JOIN messages on messages.conversation_id = conversations.conversation_id WHERE messages.ROWID > :start AND messages.ROWID < :end AND conversations.flags != 0"];;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithLongLong:a1[5]];
  [v5 setObject:v6 forKeyedSubscript:@":start"];

  uint64_t v7 = [NSNumber numberWithLongLong:a1[6]];
  [v5 setObject:v7 forKeyedSubscript:@":end"];

  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke_2;
  v11[3] = &unk_1E6BFF4C8;
  v11[4] = a1[4];
  [v4 executeWithNamedBindings:v5 usingBlock:v11 error:&v10];
  id v8 = v10;
  [v3 handleError:v8 message:@"Selecting current conversation sync anchor for daily export"];

  return 1;
}

void __85__EDConversationPersistence_flaggedConversationsChangedBetweenStartAnchor_endAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = NSNumber;
  id v5 = [a2 objectForKeyedSubscript:@"conversation_id"];
  id v4 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  [v2 addObject:v4];
}

- (EDPersistenceDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);

  return (EDPersistenceDatabase *)WeakRetained;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);

  objc_destroyWeak((id *)&self->_database);
}

void __57__EDConversationPersistence_conversationIDForMessageIDs___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Multiple conversations found for message_ids %@", (uint8_t *)&v3, 0xCu);
}

void __88__EDConversationPersistence_updateAssociationTableForMessageID_dateSent_conversationID___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Attempting to update association table for conversation that does not exist %@", buf, 0xCu);
}

@end