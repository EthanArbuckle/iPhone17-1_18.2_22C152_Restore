@interface EDInteractionEventLogPersistence
+ (OS_os_log)log;
- (EDInteractionEventLogPersistence)initWithDatabase:(id)a3;
- (EDPersistenceDatabase)database;
- (OS_dispatch_queue)writeQueue;
- (id)_partialEventForMessage:(id)a3;
- (id)recentRecipients;
- (void)_asyncPersistEvent:(id)a3;
- (void)persistEvent:(id)a3;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5;
- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6;
- (void)setDatabase:(id)a3;
- (void)setWriteQueue:(id)a3;
@end

@implementation EDInteractionEventLogPersistence

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EDInteractionEventLogPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_40 != -1) {
    dispatch_once(&log_onceToken_40, block);
  }
  v2 = (void *)log_log_40;

  return (OS_os_log *)v2;
}

void __39__EDInteractionEventLogPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_40;
  log_log_40 = (uint64_t)v1;
}

- (EDInteractionEventLogPersistence)initWithDatabase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDInteractionEventLogPersistence;
  v6 = [(EDInteractionEventLogPersistence *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.EDDatabaseInteractionEventLog.writeQueue", v9);
    writeQueue = v7->_writeQueue;
    v7->_writeQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:a5];
  [v12 setName:v13];
  [v12 setDate:v10];
  [v12 setData:v11];
  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v12];
}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:0];
  [v12 setConversationID:a5];
  [v12 setName:v13];
  [v12 setDate:v10];
  [v12 setData:v11];
  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v12];
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v7 = a3;
  v6 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:a4];
  [v6 setName:v7];
  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v6];
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  v9 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:a4];
  [v9 setName:v11];
  if (v8)
  {
    id v10 = [v8 identifier];
    [v9 setAccountID:v10];
  }
  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v9];
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:a5];
  [v13 setName:v10];
  [v13 setDate:v11];
  v18 = @"mailbox_id";
  v14 = NSNumber;
  v15 = [v12 persistentID];
  v16 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
  v19[0] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v13 setData:v17];

  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v13];
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(EDInteractionEventLogPersistence *)self _partialEventForMessage:a5];
  [v12 setName:v10];
  [v12 setDate:v11];
  v15 = @"mailbox_type";
  id v13 = [NSNumber numberWithInteger:a6];
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v12 setData:v14];

  [(EDInteractionEventLogPersistence *)self _asyncPersistEvent:v12];
}

- (id)_partialEventForMessage:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(EDInteractionEvent);
  [(EDInteractionEvent *)v4 setVersion:15];
  id v5 = [v3 account];
  v6 = [v5 identifier];
  [(EDInteractionEvent *)v4 setAccountID:v6];

  id v7 = [v3 mailbox];
  id v8 = [v7 persistentID];
  -[EDInteractionEvent setMailboxID:](v4, "setMailboxID:", [v8 longLongValue]);

  -[EDInteractionEvent setConversationID:](v4, "setConversationID:", [v3 conversationID]);
  v9 = [v3 messageIDHeaderHash];
  -[EDInteractionEvent setMessageIDHash:](v4, "setMessageIDHash:", [v9 int64Value]);

  id v10 = [v3 persistentID];
  -[EDInteractionEvent setMessagePersistentID:](v4, "setMessagePersistentID:", [v10 longLongValue]);

  return v4;
}

- (void)_asyncPersistEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 date];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setDate:v6];
  }
  id v7 = [(EDInteractionEventLogPersistence *)self writeQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__EDInteractionEventLogPersistence__asyncPersistEvent___block_invoke;
  v9[3] = &unk_1E6BFFAF0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __55__EDInteractionEventLogPersistence__asyncPersistEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistEvent:*(void *)(a1 + 40)];
}

- (void)persistEvent:(id)a3
{
  id v4 = a3;
  if (persistEvent__onceToken != -1) {
    dispatch_once(&persistEvent__onceToken, &__block_literal_global_27);
  }
  id v5 = [(EDInteractionEventLogPersistence *)self database];
  id v6 = [v5 propertyMapper];
  id WeakRetained = objc_loadWeakRetained(&persistEvent__propertyMapper);

  if (v6 != WeakRetained)
  {
    [(id)persistEvent__nameCache removeAllObjects];
    id v8 = [(EDInteractionEventLogPersistence *)self database];
    v9 = [v8 propertyMapper];
    objc_storeWeak(&persistEvent__propertyMapper, v9);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_2;
  aBlock[3] = &unk_1E6C015F8;
  aBlock[4] = self;
  id v10 = (void (**)(void *, char *))_Block_copy(aBlock);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"interaction_log"];
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "version"));
  id v13 = v10[2](v10, sel_version);
  [v11 setObject:v12 forKeyedSubscript:v13];

  v14 = [v4 date];
  v15 = v10[2](v10, sel_date);
  [v11 setObject:v14 forKeyedSubscript:v15];

  v16 = [v4 name];
  v17 = v10[2](v10, sel_name);
  [v11 setObject:v16 forKeyedSubscript:v17];

  v18 = [v4 accountID];
  v19 = v18;
  if (!v18)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = v10[2](v10, sel_accountID);
  [v11 setObject:v19 forKeyedSubscript:v20];

  if (!v18) {
  if ([v4 mailboxID])
  }
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "mailboxID"));
  else {
  v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = v10[2](v10, sel_mailboxID);
  [v11 setObject:v21 forKeyedSubscript:v22];

  if ([v4 conversationID]) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  }
  else {
  v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = v10[2](v10, sel_conversationID);
  [v11 setObject:v23 forKeyedSubscript:v24];

  if ([v4 messageIDHash]) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "messageIDHash"));
  }
  else {
  v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = v10[2](v10, sel_messageIDHash);
  [v11 setObject:v25 forKeyedSubscript:v26];

  if ([v4 messagePersistentID]) {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "messagePersistentID"));
  }
  else {
  v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = v10[2](v10, sel_messagePersistentID);
  [v11 setObject:v27 forKeyedSubscript:v28];

  v29 = [v4 data];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E4F28D90];
    v32 = [v4 data];
    v33 = [v31 dataWithJSONObject:v32 options:0 error:0];

    v34 = v10[2](v10, sel_data);
    [v11 setObject:v33 forKeyedSubscript:v34];
  }
  v35 = [(EDInteractionEventLogPersistence *)self database];
  v36 = [NSString stringWithUTF8String:"-[EDInteractionEventLogPersistence persistEvent:]"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_4;
  v38[3] = &unk_1E6C00AF0;
  id v37 = v11;
  id v39 = v37;
  objc_msgSend(v35, "__performWriteWithCaller:usingBlock:", v36, v38);
}

void __49__EDInteractionEventLogPersistence_persistEvent___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F60D88]);
  os_log_t v1 = (void *)persistEvent__nameCache;
  persistEvent__nameCache = (uint64_t)v0;
}

id __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_2(uint64_t a1, SEL aSelector)
{
  id v4 = (void *)persistEvent__nameCache;
  id v5 = NSStringFromSelector(aSelector);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_3;
  v8[3] = &unk_1E6C015D0;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = aSelector;
  id v6 = [v4 objectForKey:v5 generator:v8];

  return v6;
}

id __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) database];
  id v3 = [v2 propertyMapper];
  id v4 = [v3 columnNameForClass:objc_opt_class() property:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 executeInsertStatement:*(void *)(a1 + 32) error:0];
}

- (id)recentRecipients
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__13;
  v42 = __Block_byref_object_dispose__13;
  id v43 = 0;
  v2 = [(EDInteractionEventLogPersistence *)self database];
  id v3 = [v2 schema];
  v28 = [v3 tableForName:@"recipients"];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [v28 columns];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (!v5)
  {

    id v6 = 0;
    v29 = 0;
    goto LABEL_17;
  }
  v29 = 0;
  id v6 = 0;
  uint64_t v7 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      id v10 = [v9 name];
      int v11 = [v10 hasPrefix:@"address"];

      if (v11)
      {
        uint64_t v12 = [v9 name];
        id v13 = v6;
        id v6 = (void *)v12;
      }
      else
      {
        v14 = [v9 name];
        int v15 = [v14 hasPrefix:@"message"];

        if (!v15) {
          continue;
        }
        uint64_t v16 = [v9 name];
        id v13 = v29;
        v29 = (void *)v16;
      }
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
  }
  while (v5);

  if (!v29 || !v6)
  {
LABEL_17:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"EDInteractionEventLogPersistence-BlackPearl.m" lineNumber:188 description:@"Could not find message and address columns in schema"];
  }
  v18 = [(EDInteractionEventLogPersistence *)self database];
  v19 = [NSString stringWithUTF8String:"-[EDInteractionEventLogPersistence recentRecipients]"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke;
  v30[3] = &unk_1E6BFF338;
  id v20 = v29;
  id v31 = v20;
  id v21 = v6;
  id v32 = v21;
  v33 = &v38;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v30);

  v22 = (void *)v39[5];
  if (v22)
  {
    id v23 = v22;
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CAD0] set];
  }
  v24 = v23;

  _Block_object_dispose(&v38, 8);

  return v24;
}

uint64_t __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke(void *a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString stringWithFormat:@"select distinct AD.address from interaction_log LOG join mailboxes MB on MB.rowid = LOG.mailbox join messages MSG on MSG.message_id = LOG.message_id_hash join recipients RE on RE.%@ = MSG.rowID join addresses AD on AD.rowid = RE.%@ where MB.url like '%%/Sent%%' and LOG.name = 'message_fetched' and MSG.date_received >= ?", a1[4], a1[5]];
  uint64_t v5 = [v3 preparedStatementForQueryString:v4];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v17[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke_2;
  v15[3] = &unk_1E6BFF3B0;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = [v5 executeWithIndexedBindings:v8 usingBlock:v15 error:0];

  if ([v9 count])
  {
    uint64_t v11 = [v9 copy];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  return v10;
}

void __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];
  id v5 = [v4 emailAddressValue];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end