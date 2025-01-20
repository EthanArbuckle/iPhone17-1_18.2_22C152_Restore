@interface EMInteractionLogger
+ (OS_os_log)log;
+ (id)remoteInterface;
- (BOOL)appLaunched;
- (EMInteractionLogger)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (NSMutableDictionary)messageListMessages;
- (NSMutableDictionary)viewedMessages;
- (OS_dispatch_queue)stateTrackingQueue;
- (_NSRange)messageListVisibleRows;
- (id)_rescopedMessageObjectID:(id)a3;
- (id)_stateForObjectID:(id)a3 container:(id)a4;
- (id)messageListTypeForMailboxes:(id)a3;
- (void)_appDidEnterBackground;
- (void)_appWillEnterForeground;
- (void)_logMessageListDisplayEndedForState:(id)a3 now:(id)a4;
- (void)_logMessageListDisplayStartedMessageID:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7;
- (void)_viewingEndedForAllMessages;
- (void)_xpcLogEvent:(id)a3 date:(id)a4 data:(id)a5;
- (void)_xpcLogEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6;
- (void)applicationLaunched;
- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4;
- (void)composeFowardStartedForMessage:(id)a3;
- (void)composeReplyStartedForMessage:(id)a3;
- (void)messageListDisplayEndedForAllListItems;
- (void)messageListDisplayEndedForListItem:(id)a3 cellStyle:(id)a4;
- (void)messageListDisplayStartedForListItem:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6;
- (void)scrolledToEndOfMessage:(id)a3;
- (void)setAppLaunched:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setMessageListMessages:(id)a3;
- (void)setMessageListVisibleRows:(_NSRange)a3;
- (void)setStateTrackingQueue:(id)a3;
- (void)setViewedMessages:(id)a3;
- (void)viewingEndedForMessage:(id)a3;
- (void)viewingStartedForMessage:(id)a3 messageListScope:(id)a4;
@end

@implementation EMInteractionLogger

+ (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86C18];
}

- (EMInteractionLogger)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  if (EMInteractionLoggerShouldLog())
  {
    v20.receiver = self;
    v20.super_class = (Class)EMInteractionLogger;
    v6 = [(EMInteractionLogger *)&v20 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.EMInteractionLogger", v9);
      stateTrackingQueue = v7->_stateTrackingQueue;
      v7->_stateTrackingQueue = (OS_dispatch_queue *)v10;

      uint64_t v12 = objc_opt_new();
      viewedMessages = v7->_viewedMessages;
      v7->_viewedMessages = (NSMutableDictionary *)v12;

      uint64_t v14 = objc_opt_new();
      messageListMessages = v7->_messageListMessages;
      v7->_messageListMessages = (NSMutableDictionary *)v14;

      v7->_messageListVisibleRows = (_NSRange)kMaxRange;
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 addObserver:v7 selector:sel__appWillEnterForeground name:@"UIApplicationWillEnterForegroundNotification" object:0];

      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v7 selector:sel__appDidEnterBackground name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListMessages, 0);
  objc_storeStrong((id *)&self->_viewedMessages, 0);
  objc_storeStrong((id *)&self->_stateTrackingQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EMInteractionLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1) {
    dispatch_once(&log_onceToken_20, block);
  }
  v2 = (void *)log_log_20;
  return (OS_os_log *)v2;
}

void __26__EMInteractionLogger_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;
}

- (id)_stateForObjectID:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:v5];
  if (!v7)
  {
    v7 = objc_alloc_init(_EMUserActionState);
    [(_EMUserActionState *)v7 setKey:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_EMUserActionState *)v7 setMessageObjectID:v5];
    }
    [v6 setObject:v7 forKeyedSubscript:v5];
  }

  return v7;
}

- (void)_xpcLogEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"EMInteractionLogger.m", 114, @"Invalid parameter not satisfying: %@", @"messageID" object file lineNumber description];

  if (!v11)
  {
LABEL_3:
    id v11 = [MEMORY[0x1E4F1C9C8] now];
  }
LABEL_4:
  uint64_t v14 = [(EMInteractionLogger *)self connection];
  v15 = [v14 reattemptingRemoteObjectProxy];
  [v15 logEvent:v17 date:v11 messageID:v12 data:v13];
}

- (void)_xpcLogEvent:(id)a3 date:(id)a4 data:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] now];
  }
  dispatch_queue_t v10 = [(EMInteractionLogger *)self connection];
  id v11 = [v10 reattemptingRemoteObjectProxy];
  [v11 logEvent:v12 date:v8 data:v9];
}

- (void)_viewingEndedForAllMessages
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(EMInteractionLogger *)self stateTrackingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__EMInteractionLogger__viewingEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E63E2760;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __50__EMInteractionLogger__viewingEndedForAllMessages__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [*(id *)(a1 + 32) viewedMessages];
  id v3 = [v2 allValues];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 viewingStarted];

        if (v8)
        {
          id v9 = *(void **)(a1 + 40);
          dispatch_queue_t v10 = [v7 viewingStarted];
          [v9 timeIntervalSinceDate:v10];
          double v12 = v11;

          id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "scrolledToEnd"));
          v15 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(a1 + 40);
          v16 = [v15 _rescopedMessageObjectID:v7];
          v25[0] = @"duration";
          id v17 = [NSNumber numberWithDouble:v12];
          v25[1] = @"scrolled_to_end";
          v26[0] = v17;
          v26[1] = v13;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
          [v15 _xpcLogEvent:@"message_view_end" date:v14 messageID:v16 data:v18];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }

  v19 = [*(id *)(a1 + 32) viewedMessages];
  [v19 removeAllObjects];
}

- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v6 objectID];
  if (v7) {
    dispatch_queue_t v10 = v7;
  }
  else {
    dispatch_queue_t v10 = &stru_1F1A3DFB0;
  }
  double v12 = @"scheme";
  v13[0] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [(EMInteractionLogger *)self _xpcLogEvent:@"link_clicked" date:v8 messageID:v9 data:v11];
}

- (void)scrolledToEndOfMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMInteractionLogger *)self stateTrackingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EMInteractionLogger_scrolledToEndOfMessage___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__EMInteractionLogger_scrolledToEndOfMessage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectID];
  id v4 = [*(id *)(a1 + 32) viewedMessages];
  id v5 = [v2 _stateForObjectID:v3 container:v4];

  [v5 setScrolledToEnd:1];
}

- (id)_rescopedMessageObjectID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageObjectID];
  id v5 = [v3 mailboxScope];
  if (v5 && (uint64_t v6 = [v4 globalMessageID], v5, v6))
  {
    id v7 = [EMMessageObjectID alloc];
    uint64_t v8 = [v4 globalMessageID];
    id v9 = [v3 mailboxScope];
    dispatch_queue_t v10 = [(EMMessageObjectID *)v7 initWithGlobalMessageID:v8 mailboxScope:v9];
  }
  else
  {
    dispatch_queue_t v10 = v4;
  }

  return v10;
}

- (void)viewingStartedForMessage:(id)a3 messageListScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(EMInteractionLogger *)self stateTrackingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __65__EMInteractionLogger_viewingStartedForMessage_messageListScope___block_invoke;
  v13[3] = &unk_1E63E4008;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __65__EMInteractionLogger_viewingStartedForMessage_messageListScope___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectID];
  id v4 = [*(id *)(a1 + 32) viewedMessages];
  id v9 = [v2 _stateForObjectID:v3 container:v4];

  id v5 = [v9 viewingStarted];

  if (!v5)
  {
    [v9 setViewingStarted:*(void *)(a1 + 48)];
    [v9 setMailboxScope:*(void *)(a1 + 56)];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [v6 _rescopedMessageObjectID:v9];
    [v6 _xpcLogEvent:@"message_view_start" date:v7 messageID:v8 data:MEMORY[0x1E4F1CC08]];
  }
}

- (void)viewingEndedForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(EMInteractionLogger *)self stateTrackingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EMInteractionLogger_viewingEndedForMessage___block_invoke;
  block[3] = &unk_1E63E2848;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __46__EMInteractionLogger_viewingEndedForMessage___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectID];
  id v5 = [*(id *)(a1 + 32) viewedMessages];
  id v6 = [v3 _stateForObjectID:v4 container:v5];

  id v7 = [v6 viewingStarted];

  if (v7)
  {
    id v8 = *(void **)(a1 + 48);
    id v9 = [v6 viewingStarted];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    if (v11 > 0.1)
    {
      id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "scrolledToEnd"));
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = [v13 _rescopedMessageObjectID:v6];
      v22[0] = @"duration";
      id v16 = [NSNumber numberWithDouble:v11];
      v22[1] = @"scrolled_to_end";
      v23[0] = v16;
      v23[1] = v12;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v13 _xpcLogEvent:@"message_view_end" date:v14 messageID:v15 data:v17];
    }
    v18 = [*(id *)(a1 + 32) viewedMessages];
    v19 = [v6 key];
    [v18 removeObjectForKey:v19];
  }
  else
  {
    objc_super v20 = [*(id *)(a1 + 32) viewedMessages];
    long long v21 = [v6 key];
    [v20 removeObjectForKey:v21];
  }
}

- (void)composeReplyStartedForMessage:(id)a3
{
  id v6 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v6 objectID];
  [(EMInteractionLogger *)self _xpcLogEvent:@"reply_draft_started" date:v4 messageID:v5 data:MEMORY[0x1E4F1CC08]];
}

- (void)composeFowardStartedForMessage:(id)a3
{
  id v6 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v6 objectID];
  [(EMInteractionLogger *)self _xpcLogEvent:@"forward_draft_started" date:v4 messageID:v5 data:MEMORY[0x1E4F1CC08]];
}

- (void)_logMessageListDisplayStartedMessageID:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = (__CFString *)a5;
  id v16 = (__CFString *)a7;
  if (!v13)
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"EMInteractionLogger.m", 248, @"Invalid parameter not satisfying: %@", @"messageID" object file lineNumber description];
  }
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = &stru_1F1A3DFB0;
  }
  v24[0] = v17;
  v23[0] = @"message_list_type";
  v23[1] = @"position";
  uint64_t v18 = [NSNumber numberWithInteger:a6];
  v19 = (void *)v18;
  v23[2] = @"cell_style";
  if (v16) {
    objc_super v20 = v16;
  }
  else {
    objc_super v20 = &stru_1F1A3DFB0;
  }
  v24[1] = v18;
  v24[2] = v20;
  long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [(EMInteractionLogger *)self _xpcLogEvent:@"message_list_display_started" date:v14 messageID:v13 data:v21];
}

- (void)_logMessageListDisplayEndedForState:(id)a3 now:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 viewingStarted];

  if (v8)
  {
    id v9 = [v6 viewingStarted];
    [v7 timeIntervalSinceDate:v9];
    double v11 = v10;

    id v12 = [v6 messageObjectID];
    v18[0] = @"duration";
    id v13 = [NSNumber numberWithDouble:v11];
    v19[0] = v13;
    v18[1] = @"cell_style";
    uint64_t v14 = [v6 cellStyle];
    id v15 = (void *)v14;
    id v16 = &stru_1F1A3DFB0;
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    v19[1] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(EMInteractionLogger *)self _xpcLogEvent:@"message_list_display_ended" date:v7 messageID:v12 data:v17];
  }
}

- (void)messageListDisplayStartedForListItem:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [(EMInteractionLogger *)self stateTrackingQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__EMInteractionLogger_messageListDisplayStartedForListItem_messageListType_row_cellStyle___block_invoke;
  void v19[3] = &unk_1E63E4030;
  v19[4] = self;
  id v20 = v10;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  int64_t v24 = a5;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, v19);
}

void __90__EMInteractionLogger_messageListDisplayStartedForListItem_messageListType_row_cellStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectID];
  id v4 = [*(id *)(a1 + 32) messageListMessages];
  id v12 = [v2 _stateForObjectID:v3 container:v4];

  id v5 = [v12 viewingStarted];

  if (!v5)
  {
    [v12 setViewingStarted:*(void *)(a1 + 48)];
    [v12 setCellStyle:*(void *)(a1 + 56)];
    [v12 setRow:*(void *)(a1 + 72)];
    [v12 setMessageListType:*(void *)(a1 + 64)];
    id v6 = [*(id *)(a1 + 40) displayMessageObjectID];
    [v12 setMessageObjectID:v6];

    unint64_t v7 = *(void *)(a1 + 72);
    unint64_t v8 = [*(id *)(a1 + 32) messageListVisibleRows];
    if (v7 >= v8 && v7 - v8 < v9)
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = [v12 messageObjectID];
      [v10 _logMessageListDisplayStartedMessageID:v11 now:*(void *)(a1 + 48) type:*(void *)(a1 + 64) row:*(void *)(a1 + 72) cellStyle:*(void *)(a1 + 56)];
    }
  }
}

- (void)messageListDisplayEndedForListItem:(id)a3 cellStyle:(id)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v7 = [(EMInteractionLogger *)self stateTrackingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EMInteractionLogger_messageListDisplayEndedForListItem_cellStyle___block_invoke;
  block[3] = &unk_1E63E2848;
  block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __68__EMInteractionLogger_messageListDisplayEndedForListItem_cellStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectID];
  id v4 = [*(id *)(a1 + 32) messageListMessages];
  id v7 = [v2 _stateForObjectID:v3 container:v4];

  id v5 = [*(id *)(a1 + 32) messageListMessages];
  id v6 = [v7 key];
  [v5 removeObjectForKey:v6];

  [*(id *)(a1 + 32) _logMessageListDisplayEndedForState:v7 now:*(void *)(a1 + 48)];
}

- (void)messageListDisplayEndedForAllListItems
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(EMInteractionLogger *)self stateTrackingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__EMInteractionLogger_messageListDisplayEndedForAllListItems__block_invoke;
  v6[3] = &unk_1E63E2760;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __61__EMInteractionLogger_messageListDisplayEndedForAllListItems__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "messageListMessages", 0);
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _logMessageListDisplayEndedForState:*(void *)(*((void *)&v8 + 1) + 8 * v6++) now:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  id v7 = [*(id *)(a1 + 32) messageListMessages];
  [v7 removeAllObjects];
}

- (id)messageListTypeForMailboxes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 firstObject];
  if ([v3 count])
  {
    if ([v3 count] == 1 && objc_msgSend(v4, "isSmartMailbox"))
    {
      unint64_t v5 = [v4 smartMailboxType];
      if (v5 < 0xE)
      {
        uint64_t v6 = off_1E63E40D8[v5];
        goto LABEL_13;
      }
      id v7 = &stru_1F1A3DFB0;
    }
    else if ((unint64_t)[v3 count] <= 1)
    {
      id v7 = &stru_1F1A3DFB0;
    }
    else
    {
      id v7 = @"all_";
    }
    unint64_t v8 = [v4 type] - 1;
    if (v8 > 6)
    {
      uint64_t v6 = @"mailbox";
    }
    else
    {
      uint64_t v6 = [(__CFString *)v7 stringByAppendingString:off_1E63E4148[v8]];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_13:

  return v6;
}

- (void)applicationLaunched
{
  v17[4] = *MEMORY[0x1E4F143B8];
  [(EMInteractionLogger *)self setAppLaunched:1];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 dictionaryRepresentation];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ConversationViewExcludesRelatedMessages", @"ConversationViewShowsNewestAtTop", @"LinesOfPreview", @"NumberOfActiveAccounts", @"DisableThreading", @"LeftEdgeSwipeAction", @"RightEdgeSwipeAction", @"ColumnLayoutMessageList", 0);
  v16[0] = @"NumberOfSnippetLines";
  v16[1] = @"ConversationViewSortDescending";
  v17[0] = &__block_literal_global_21;
  v17[1] = &__block_literal_global_239;
  v16[2] = @"ConversationViewSpansMailboxes";
  v16[3] = @"AccountOrdering";
  v17[2] = &__block_literal_global_245;
  v17[3] = &__block_literal_global_251;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__EMInteractionLogger_applicationLaunched__block_invoke_5;
  v12[3] = &unk_1E63E40B8;
  id v9 = v7;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  [(EMInteractionLogger *)self _xpcLogEvent:@"app_launch" date:v3 data:v10];
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v5 = @"LinesOfPreview";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v5 = @"ConversationViewShowsNewestAtTop";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_3(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v6 = @"ConversationViewExcludesRelatedMessages";
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "BOOLValue") ^ 1);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

id __42__EMInteractionLogger_applicationLaunched__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v6 = @"NumberOfActiveAccounts";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count") - 1);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

void __42__EMInteractionLogger_applicationLaunched__block_invoke_5(id *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([a1[4] containsObject:v10])
  {
    [a1[5] setObject:v5 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v6 = [a1[6] objectForKeyedSubscript:v10];
    id v7 = (void *)v6;
    if (v6)
    {
      id v8 = a1[5];
      id v9 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
      [v8 addEntriesFromDictionary:v9];
    }
  }
}

- (void)_appWillEnterForeground
{
  if ([(EMInteractionLogger *)self appLaunched])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    -[EMInteractionLogger _xpcLogEvent:date:data:](self, "_xpcLogEvent:date:data:", @"app_resume");
  }
}

- (void)_appDidEnterBackground
{
  if ([(EMInteractionLogger *)self appLaunched])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [(EMInteractionLogger *)self messageListDisplayEndedForAllListItems];
    [(EMInteractionLogger *)self _viewingEndedForAllMessages];
    [(EMInteractionLogger *)self _xpcLogEvent:@"app_background" date:v3 data:MEMORY[0x1E4F1CC08]];
  }
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)stateTrackingQueue
{
  return self->_stateTrackingQueue;
}

- (void)setStateTrackingQueue:(id)a3
{
}

- (NSMutableDictionary)viewedMessages
{
  return self->_viewedMessages;
}

- (void)setViewedMessages:(id)a3
{
}

- (NSMutableDictionary)messageListMessages
{
  return self->_messageListMessages;
}

- (void)setMessageListMessages:(id)a3
{
}

- (_NSRange)messageListVisibleRows
{
  NSUInteger length = self->_messageListVisibleRows.length;
  NSUInteger location = self->_messageListVisibleRows.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMessageListVisibleRows:(_NSRange)a3
{
  self->_messageListVisibleRows = a3;
}

- (BOOL)appLaunched
{
  return self->_appLaunched;
}

- (void)setAppLaunched:(BOOL)a3
{
  self->_appLaunched = a3;
}

@end