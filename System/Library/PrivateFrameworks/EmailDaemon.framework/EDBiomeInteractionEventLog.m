@interface EDBiomeInteractionEventLog
+ (OS_os_log)log;
+ (id)payloadFromData:(id)a3 message:(id)a4;
- (EDBiomeInteractionEventLog)init;
- (void)donateToBiomeWithEvent:(id)a3;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5;
- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6;
@end

@implementation EDBiomeInteractionEventLog

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDBiomeInteractionEventLog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1) {
    dispatch_once(&log_onceToken_12, block);
  }
  v2 = (void *)log_log_12;

  return (OS_os_log *)v2;
}

void __33__EDBiomeInteractionEventLog_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;
}

- (EDBiomeInteractionEventLog)init
{
  v10.receiver = self;
  v10.super_class = (Class)EDBiomeInteractionEventLog;
  id v2 = [(EDBiomeInteractionEventLog *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("em_biome_stream", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__EDBiomeInteractionEventLog_init__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    id v9 = v2;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(*((dispatch_queue_t *)v2 + 1), v6);
  }
  return (EDBiomeInteractionEventLog *)v2;
}

void __34__EDBiomeInteractionEventLog_init__block_invoke(uint64_t a1)
{
  id v12 = [MEMORY[0x1E4F60208] url];
  id v2 = objc_alloc(MEMORY[0x1E4F50278]);
  id v3 = [v12 path];
  dispatch_queue_t v4 = (void *)[v2 initWithStoreBasePath:v3 segmentSize:*MEMORY[0x1E4F502B8]];

  id v5 = objc_alloc(MEMORY[0x1E4F50490]);
  uint64_t v6 = [v5 initWithPrivateStreamIdentifier:*MEMORY[0x1E4F60538] storeConfig:v4];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) source];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v9;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:date:message:data:]();
  }

  v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F60548], *MEMORY[0x1E4F60540], 0);
  if (([v13 containsObject:v9] & 1) == 0)
  {
    v14 = +[EDBiomeInteractionEventLog payloadFromData:v11 message:v10];
    v15 = [v10 messageIDHeader];
    v16 = objc_msgSend(v15, "ec_messageIDSubstring");

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v9 messageId:v16 payload:v14];
    [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v17];
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:date:conversationID:data:]();
  }

  id v12 = +[EDBiomeInteractionEventLog payloadFromData:v10 message:0];
  v13 = [NSNumber numberWithLongLong:a5];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F60568]];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v9 messageId:0 payload:v12];
  [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v14];
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:dataFromMessage:]();
  }

  id v9 = [v7 messageIDHeader];
  id v10 = objc_msgSend(v9, "ec_messageIDSubstring");

  id v11 = +[EDBiomeInteractionEventLog payloadFromData:MEMORY[0x1E4F1CC08] message:v7];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v6 messageId:v10 payload:v11];
  [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v12];
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:dataFromMessage:account:]();
  }

  id v12 = [v9 messageIDHeader];
  v13 = objc_msgSend(v12, "ec_messageIDSubstring");

  v14 = +[EDBiomeInteractionEventLog payloadFromData:MEMORY[0x1E4F1CC08] message:v9];
  v15 = [v10 identifier];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F60560]];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v8 messageId:v13 payload:v14];
  [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v16];
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:date:message:mailbox:]();
  }

  v13 = [v10 messageIDHeader];
  v14 = objc_msgSend(v13, "ec_messageIDSubstring");

  v15 = +[EDBiomeInteractionEventLog payloadFromData:MEMORY[0x1E4F1CC08] message:v10];
  if ([v9 isEqualToString:*MEMORY[0x1E4F60550]])
  {
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "type"));
    [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F60580]];
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v9 messageId:v14 payload:v15];
  [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v17];
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = +[EDBiomeInteractionEventLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EDBiomeInteractionEventLog persistEvent:date:message:mailboxType:]();
  }

  id v12 = [v10 messageIDHeader];
  v13 = objc_msgSend(v12, "ec_messageIDSubstring");

  v14 = +[EDBiomeInteractionEventLog payloadFromData:MEMORY[0x1E4F1CC08] message:v10];
  if ([v9 isEqualToString:*MEMORY[0x1E4F60550]])
  {
    v15 = [NSNumber numberWithInteger:a6];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F60580]];
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F60200]) initWithEventName:v9 messageId:v13 payload:v14];
  [(EDBiomeInteractionEventLog *)self donateToBiomeWithEvent:v16];
}

- (void)donateToBiomeWithEvent:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__EDBiomeInteractionEventLog_donateToBiomeWithEvent___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);
}

uint64_t __53__EDBiomeInteractionEventLog_donateToBiomeWithEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sendEvent:*(void *)(a1 + 40)];
}

+ (id)payloadFromData:(id)a3 message:(id)a4
{
  id v5 = a4;
  dispatch_block_t v6 = (void *)[a3 mutableCopy];
  id v7 = [v5 persistentID];

  if (v7)
  {
    id v8 = [v5 persistentID];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F60588]];
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = v5;
    id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "globalMessageID"));
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F60578]];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)persistEvent:date:message:data:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:data:] .. %@", v2, v3, v4, v5, v6);
}

- (void)persistEvent:date:conversationID:data:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:conversationID:data:] .. %@", v2, v3, v4, v5, v6);
}

- (void)persistEvent:dataFromMessage:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:dataFromMessage:] .. %@", v2, v3, v4, v5, v6);
}

- (void)persistEvent:dataFromMessage:account:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:dataFromMessage:account:] .. %@", v2, v3, v4, v5, v6);
}

- (void)persistEvent:date:message:mailbox:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:mailbox:] .. %@", v2, v3, v4, v5, v6);
}

- (void)persistEvent:date:message:mailboxType:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_1DB39C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:mailboxType:] .. %@", v2, v3, v4, v5, v6);
}

@end