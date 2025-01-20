@interface EDInteractionLogger
- (EDInteractionEventLog)_eventLog;
- (EDInteractionLogger)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 eventLog:(id)a5;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMessagePersistence)messagePersistence;
- (NSMutableDictionary)_messageListMessages;
- (NSMutableDictionary)_viewedMessages;
- (OS_dispatch_queue)_stateTrackingQueue;
- (OS_dispatch_queue)processingQueue;
- (_NSRange)_messageListVisibleRows;
- (id)_range:(_NSRange)a3 minusRange:(_NSRange)a4;
- (id)_stateForMessage:(id)a3 extra:(id)a4 container:(id)a5;
- (void)_composeStartedForMessage:(id)a3 eventName:(id)a4;
- (void)_conversationFlagsChanged:(id)a3;
- (void)_logMessageListDisplayEndedForState:(id)a3 now:(id)a4;
- (void)_logMessageListDisplayStartedMessage:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7;
- (void)_viewingEndedForAllMessages;
- (void)applicationLaunched;
- (void)applicationWillResume;
- (void)applicationWillSuspend;
- (void)archivedMessages:(id)a3;
- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4;
- (void)composeFowardStartedForMessage:(id)a3;
- (void)composeReplyStartedForMessage:(id)a3;
- (void)copiedMessages:(id)a3 toMailbox:(id)a4;
- (void)deletedMessages:(id)a3;
- (void)deliveredMessage:(id)a3 account:(id)a4;
- (void)logEvent:(id)a3 date:(id)a4 data:(id)a5;
- (void)logEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6;
- (void)messageListDisplayEndedForAllMessages;
- (void)messageListDisplayEndedForMessage:(id)a3 cellStyle:(id)a4;
- (void)messageListDisplayStartedForMessage:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6;
- (void)messageListDisplayVisibleRowsChanged:(_NSRange)a3;
- (void)movedMessages:(id)a3 toMailbox:(id)a4;
- (void)movedMessages:(id)a3 toMailboxType:(int64_t)a4;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4;
- (void)persistenceWillTransferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6;
- (void)scrolledToEndOfMessage:(id)a3;
- (void)setMailboxPersistence:(id)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)set_eventLog:(id)a3;
- (void)set_messageListMessages:(id)a3;
- (void)set_messageListVisibleRows:(_NSRange)a3;
- (void)set_stateTrackingQueue:(id)a3;
- (void)set_viewedMessages:(id)a3;
- (void)viewingEndedForMessage:(id)a3;
- (void)viewingStartedForMessage:(id)a3;
- (void)waitForPendingStateChanges;
@end

@implementation EDInteractionLogger

- (EDInteractionLogger)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 eventLog:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)EDInteractionLogger;
  v12 = [(EDInteractionLogger *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messagePersistence, a3);
    objc_storeStrong((id *)&v13->_mailboxPersistence, a4);
    objc_storeStrong((id *)&v13->_eventLog, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewedMessages = v13->_viewedMessages;
    v13->_viewedMessages = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    messageListMessages = v13->_messageListMessages;
    v13->_messageListMessages = v16;

    v13->_messageListVisibleRows = (_NSRange)kMaxRange;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mail.EDInteractionLoggerStateTracking", v19);
    stateTrackingQueue = v13->_stateTrackingQueue;
    v13->_stateTrackingQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.email.EDInteractionLoggerProcessing", v19);
    processingQueue = v13->_processingQueue;
    v13->_processingQueue = (OS_dispatch_queue *)v22;

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v13 selector:sel__conversationFlagsChanged_ name:EDConversationFlagsChanged object:0];
  }
  return v13;
}

- (void)logEvent:(id)a3 date:(id)a4 messageID:(id)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(EDInteractionLogger *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EDInteractionLogger_logEvent_date_messageID_data___block_invoke;
  block[3] = &unk_1E6BFFAA0;
  block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __52__EDInteractionLogger_logEvent_date_messageID_data___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) messagePersistence];
  v16[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v4 = [v2 persistedMessagesForMessageObjectIDs:v3 requireProtectedData:0 temporarilyUnavailableMessageObjectIDs:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_msgSend(*(id *)(a1 + 32), "_eventLog", (void)v11);
        [v10 persistEvent:*(void *)(a1 + 48) date:*(void *)(a1 + 56) message:v9 data:*(void *)(a1 + 64)];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)logEvent:(id)a3 date:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(EDInteractionLogger *)self processingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__EDInteractionLogger_logEvent_date_data___block_invoke;
  v15[3] = &unk_1E6BFFA78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __42__EDInteractionLogger_logEvent_date_data___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _eventLog];
  [v2 persistEvent:*(void *)(a1 + 40) date:*(void *)(a1 + 48) message:0 data:*(void *)(a1 + 56)];
}

- (void)composeReplyStartedForMessage:(id)a3
{
}

- (void)composeFowardStartedForMessage:(id)a3
{
}

- (void)_composeStartedForMessage:(id)a3 eventName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [(EDInteractionLogger *)self _eventLog];
  [v8 persistEvent:v6 date:v7 message:v9 data:MEMORY[0x1E4F1CC08]];
}

- (void)scrolledToEndOfMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(EDInteractionLogger *)self _stateTrackingQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__EDInteractionLogger_scrolledToEndOfMessage___block_invoke;
    v6[3] = &unk_1E6BFFAF0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __46__EDInteractionLogger_scrolledToEndOfMessage___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [v1 _viewedMessages];
  id v4 = [v1 _stateForMessage:v2 extra:&stru_1F3583658 container:v3];

  [v4 setScrolledToEnd:1];
}

- (void)viewingStartedForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(EDInteractionLogger *)self _stateTrackingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDInteractionLogger_viewingStartedForMessage___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __48__EDInteractionLogger_viewingStartedForMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 _viewedMessages];
  id v8 = [v2 _stateForMessage:v3 extra:&stru_1F3583658 container:v4];

  id v5 = v8;
  if (v8)
  {
    id v6 = [v8 viewingStarted];

    id v5 = v8;
    if (!v6)
    {
      [v8 setViewingStarted:*(void *)(a1 + 48)];
      id v7 = [*(id *)(a1 + 32) _eventLog];
      [v7 persistEvent:@"message_view_start" date:*(void *)(a1 + 48) message:*(void *)(a1 + 40) data:MEMORY[0x1E4F1CC08]];

      id v5 = v8;
    }
  }
}

- (void)viewingEndedForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(EDInteractionLogger *)self _stateTrackingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EDInteractionLogger_viewingEndedForMessage___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __46__EDInteractionLogger_viewingEndedForMessage___block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 _viewedMessages];
  id v5 = [v2 _stateForMessage:v3 extra:&stru_1F3583658 container:v4];

  if (v5)
  {
    id v6 = [v5 viewingStarted];

    if (v6)
    {
      id v7 = *(void **)(a1 + 48);
      id v8 = [v5 viewingStarted];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;

      id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "scrolledToEnd"));
      id v12 = [*(id *)(a1 + 32) _eventLog];
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      v21[0] = @"duration";
      id v15 = [NSNumber numberWithDouble:v10];
      v21[1] = @"scrolled_to_end";
      v22[0] = v15;
      v22[1] = v11;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v12 persistEvent:@"message_view_end" date:v13 message:v14 data:v16];

      id v17 = [*(id *)(a1 + 32) _viewedMessages];
      id v18 = [v5 key];
      [v17 removeObjectForKey:v18];
    }
    else
    {
      v19 = [*(id *)(a1 + 32) _viewedMessages];
      id v20 = [v5 key];
      [v19 removeObjectForKey:v20];
    }
  }
}

- (void)_logMessageListDisplayStartedMessage:(id)a3 now:(id)a4 type:(id)a5 row:(int64_t)a6 cellStyle:(id)a7
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (__CFString *)a5;
  id v15 = (__CFString *)a7;
  id v16 = [(EDInteractionLogger *)self _eventLog];
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = &stru_1F3583658;
  }
  v23[0] = v17;
  v22[0] = @"message_list_type";
  v22[1] = @"position";
  uint64_t v18 = [NSNumber numberWithInteger:a6];
  v19 = (void *)v18;
  v22[2] = @"cell_style";
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = &stru_1F3583658;
  }
  v23[1] = v18;
  v23[2] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v16 persistEvent:@"message_list_display_started" date:v13 message:v12 data:v21];
}

- (void)_logMessageListDisplayEndedForState:(id)a3 now:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 viewingStarted];

  if (v8)
  {
    double v9 = [v6 viewingStarted];
    [v7 timeIntervalSinceDate:v9];
    double v11 = v10;

    id v12 = [(EDInteractionLogger *)self _eventLog];
    id v13 = [v6 message];
    v19[0] = @"duration";
    uint64_t v14 = [NSNumber numberWithDouble:v11];
    v19[1] = @"cell_style";
    v20[0] = v14;
    uint64_t v15 = [v6 cellStyle];
    id v16 = (void *)v15;
    id v17 = &stru_1F3583658;
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    v20[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v12 persistEvent:@"message_list_display_ended" date:v7 message:v13 data:v18];
  }
}

- (id)_range:(_NSRange)a3 minusRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", a3.location, a3.length);
  objc_msgSend(v6, "removeIndexesInRange:", location, length);
  id v7 = (void *)[v6 copy];

  return v7;
}

- (void)messageListDisplayVisibleRowsChanged:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [(EDInteractionLogger *)self _stateTrackingQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__EDInteractionLogger_messageListDisplayVisibleRowsChanged___block_invoke;
  v9[3] = &unk_1E6C01620;
  NSUInteger v11 = location;
  NSUInteger v12 = length;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __60__EDInteractionLogger_messageListDisplayVisibleRowsChanged___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) != [*(id *)(a1 + 32) _messageListVisibleRows] || *(void *)(a1 + 56) != v2)
  {
    if ([*(id *)(a1 + 32) _messageListVisibleRows]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = v4 == -1;
    }
    if (v5)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28D60]);
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v6 _messageListVisibleRows];
      objc_msgSend(v6, "_range:minusRange:", v7, v8, *(void *)(a1 + 48), *(void *)(a1 + 56));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v10 _messageListVisibleRows];
      uint64_t v13 = objc_msgSend(v10, "_range:minusRange:", *(void *)(a1 + 48), *(void *)(a1 + 56), v11, v12);
    }
    v27 = (void *)v13;
    v28 = v9;
    objc_msgSend(*(id *)(a1 + 32), "set_messageListVisibleRows:", *(void *)(a1 + 48), *(void *)(a1 + 56));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = [*(id *)(a1 + 32) _messageListMessages];
    uint64_t v15 = [v14 allValues];

    id obj = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v28, "containsIndex:", objc_msgSend(v19, "row")))
          {
            [*(id *)(a1 + 32) _logMessageListDisplayEndedForState:v19 now:*(void *)(a1 + 40)];
            [v19 setViewingStarted:0];
          }
          if (objc_msgSend(v27, "containsIndex:", objc_msgSend(v19, "row")))
          {
            [v19 setViewingStarted:*(void *)(a1 + 40)];
            id v20 = *(void **)(a1 + 32);
            id v21 = [v19 message];
            uint64_t v22 = *(void *)(a1 + 40);
            id v23 = [v19 messageListType];
            uint64_t v24 = [v19 row];
            v25 = [v19 cellStyle];
            [v20 _logMessageListDisplayStartedMessage:v21 now:v22 type:v23 row:v24 cellStyle:v25];
          }
        }
        uint64_t v15 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }
  }
}

- (void)messageListDisplayStartedForMessage:(id)a3 messageListType:(id)a4 row:(int64_t)a5 cellStyle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [(EDInteractionLogger *)self _stateTrackingQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __89__EDInteractionLogger_messageListDisplayStartedForMessage_messageListType_row_cellStyle___block_invoke;
  v19[3] = &unk_1E6C01500;
  v19[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  int64_t v24 = a5;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, v19);
}

void __89__EDInteractionLogger_messageListDisplayStartedForMessage_messageListType_row_cellStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = [v2 _messageListMessages];
  id v12 = [v2 _stateForMessage:v3 extra:v4 container:v5];

  id v6 = v12;
  if (v12)
  {
    uint64_t v7 = [v12 viewingStarted];

    id v6 = v12;
    if (!v7)
    {
      uint64_t v8 = (__CFString *)*(id *)(a1 + 56);
      if (![(__CFString *)v8 length])
      {

        uint64_t v8 = @"none";
      }
      [v12 setViewingStarted:*(void *)(a1 + 64)];
      [v12 setCellStyle:*(void *)(a1 + 48)];
      [v12 setRow:*(void *)(a1 + 72)];
      [v12 setMessageListType:v8];
      unint64_t v9 = *(void *)(a1 + 72);
      unint64_t v10 = [*(id *)(a1 + 32) _messageListVisibleRows];
      if (v9 >= v10 && v9 - v10 < v11) {
        [*(id *)(a1 + 32) _logMessageListDisplayStartedMessage:*(void *)(a1 + 40) now:*(void *)(a1 + 64) type:v8 row:*(void *)(a1 + 72) cellStyle:*(void *)(a1 + 48)];
      }

      id v6 = v12;
    }
  }
}

- (void)messageListDisplayEndedForMessage:(id)a3 cellStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v9 = [(EDInteractionLogger *)self _stateTrackingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__EDInteractionLogger_messageListDisplayEndedForMessage_cellStyle___block_invoke;
  v13[3] = &unk_1E6BFFA78;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __67__EDInteractionLogger_messageListDisplayEndedForMessage_cellStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = [v2 _messageListMessages];
  id v8 = [v2 _stateForMessage:v3 extra:v4 container:v5];

  if (v8)
  {
    id v6 = [*(id *)(a1 + 32) _messageListMessages];
    id v7 = [v8 key];
    [v6 removeObjectForKey:v7];

    [*(id *)(a1 + 32) _logMessageListDisplayEndedForState:v8 now:*(void *)(a1 + 56)];
  }
}

- (void)messageListDisplayEndedForAllMessages
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(EDInteractionLogger *)self _stateTrackingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E6BFFAF0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _messageListMessages];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke_2;
  id v8 = &unk_1E6C01648;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:&v5];

  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_messageListMessages", v5, v6, v7, v8, v9);
  [v4 removeAllObjects];
}

uint64_t __60__EDInteractionLogger_messageListDisplayEndedForAllMessages__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _logMessageListDisplayEndedForState:a3 now:*(void *)(a1 + 40)];
}

- (void)movedMessages:(id)a3 toMailbox:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        id v14 = [(EDInteractionLogger *)self _eventLog];
        [v14 persistEvent:@"message_moved" date:v8 message:v13 mailbox:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)movedMessages:(id)a3 toMailboxType:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v13;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [(EDInteractionLogger *)self _eventLog];
        [v12 persistEvent:@"message_moved" date:v6 message:v11 mailboxType:a4];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)archivedMessages:(id)a3
{
}

- (void)deletedMessages:(id)a3
{
}

- (void)copiedMessages:(id)a3 toMailbox:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        long long v14 = [(EDInteractionLogger *)self _eventLog];
        [v14 persistEvent:@"message_copied" date:v8 message:v13 mailbox:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)clickedLinkInMessage:(id)a3 scheme:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(EDInteractionLogger *)self _eventLog];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 persistEvent:@"link_clicked" date:v6 message:v7 data:MEMORY[0x1E4F1CC08]];
}

- (id)_stateForMessage:(id)a3 extra:(id)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 persistentID];

  if (v10)
  {
    uint64_t v11 = [v7 persistentID];
    uint64_t v12 = [v11 stringByAppendingFormat:@"\x01%@", v8];

    uint64_t v13 = [v9 objectForKeyedSubscript:v12];
    if (!v13)
    {
      uint64_t v13 = objc_alloc_init(_EDUserActionState);
      [(_EDUserActionState *)v13 setMessage:v7];
      [(_EDUserActionState *)v13 setKey:v12];
      [v9 setObject:v13 forKeyedSubscript:v12];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)applicationLaunched
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 dictionaryRepresentation];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ConversationViewExcludesRelatedMessages", @"ConversationViewShowsNewestAtTop", @"LinesOfPreview", @"NumberOfActiveAccounts", @"DisableThreading", @"LeftEdgeSwipeAction", @"RightEdgeSwipeAction", @"ColumnLayoutMessageList", 0);
  v17[0] = @"NumberOfSnippetLines";
  v17[1] = @"ConversationViewSortDescending";
  v18[0] = &__block_literal_global_29;
  v18[1] = &__block_literal_global_144;
  v17[2] = @"ConversationViewSpansMailboxes";
  v17[3] = @"AccountOrdering";
  v18[2] = &__block_literal_global_150;
  v18[3] = &__block_literal_global_156;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__EDInteractionLogger_applicationLaunched__block_invoke_5;
  v13[3] = &unk_1E6C016D0;
  id v9 = v7;
  id v14 = v9;
  id v10 = v4;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];
  uint64_t v12 = [(EDInteractionLogger *)self _eventLog];
  [v12 persistEvent:@"app_launch" date:v3 message:0 data:v10];
}

id __42__EDInteractionLogger_applicationLaunched__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v5 = @"LinesOfPreview";
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __42__EDInteractionLogger_applicationLaunched__block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v5 = @"ConversationViewShowsNewestAtTop";
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __42__EDInteractionLogger_applicationLaunched__block_invoke_3(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v6 = @"ConversationViewExcludesRelatedMessages";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "BOOLValue") ^ 1);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

id __42__EDInteractionLogger_applicationLaunched__block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v6 = @"NumberOfActiveAccounts";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count") - 1);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

void __42__EDInteractionLogger_applicationLaunched__block_invoke_5(id *a1, void *a2, void *a3)
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

- (void)applicationWillSuspend
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(EDInteractionLogger *)self messageListDisplayEndedForAllMessages];
  [(EDInteractionLogger *)self _viewingEndedForAllMessages];
  uint64_t v3 = [(EDInteractionLogger *)self _eventLog];
  [v3 persistEvent:@"app_background" date:v4 message:0 data:MEMORY[0x1E4F1CC08]];
}

- (void)applicationWillResume
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [(EDInteractionLogger *)self _eventLog];
  [v3 persistEvent:@"app_resume" date:v4 message:0 data:MEMORY[0x1E4F1CC08]];
}

- (void)_viewingEndedForAllMessages
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(EDInteractionLogger *)self _stateTrackingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke;
  v6[3] = &unk_1E6BFFAF0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewedMessages];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke_2;
  id v9 = &unk_1E6C01648;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:&v6];

  id v5 = objc_msgSend(*(id *)(a1 + 32), "_viewedMessages", v6, v7, v8, v9);
  [v5 removeAllObjects];
}

void __50__EDInteractionLogger__viewingEndedForAllMessages__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 viewingStarted];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v4 viewingStarted];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "scrolledToEnd"));
    uint64_t v11 = [*(id *)(a1 + 40) _eventLog];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [v4 message];
    v16[0] = @"duration";
    id v14 = [NSNumber numberWithDouble:v9];
    v16[1] = @"scrolled_to_end";
    v17[0] = v14;
    v17[1] = v10;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v11 persistEvent:@"message_view_end" date:v12 message:v13 data:v15];
  }
}

- (void)_conversationFlagsChanged:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"EDConversationFlagsChangedConversationIDKey"];
  uint64_t v8 = [v7 longLongValue];

  double v9 = [v6 objectForKeyedSubscript:@"EDConversationFlagsReason"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"EDConversationFlagsKey"];
  uint64_t v12 = [v11 unsignedLongLongValue];

  uint64_t v13 = [v6 objectForKeyedSubscript:@"EDConversationFlagsOldFlags"];
  uint64_t v14 = [v13 unsignedLongLongValue];

  if (v10 == 4 && v14 != v12)
  {
    if ((v14 & 4) == 0 && (v12 & 4) != 0)
    {
      id v15 = [(EDInteractionLogger *)self _eventLog];
      uint64_t v19 = @"value";
      v20[0] = MEMORY[0x1E4F1CC38];
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v15 persistEvent:@"marked_mute_thread" date:v5 conversationID:v8 data:v16];
LABEL_9:

      goto LABEL_10;
    }
    if ((v14 & 4) != 0 && (v12 & 4) == 0)
    {
      id v15 = [(EDInteractionLogger *)self _eventLog];
      long long v17 = @"value";
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v15 persistEvent:@"marked_mute_thread" date:v5 conversationID:v8 data:v16];
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(EDInteractionLogger *)self processingQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__EDInteractionLogger_persistenceDidAddMessages_generationWindow___block_invoke;
  v8[3] = &unk_1E6BFFAF0;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __66__EDInteractionLogger_persistenceDidAddMessages_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v6 = [v5 account];
        if (v6)
        {
          id v7 = [v5 account];
          uint64_t v8 = [v7 identifier];
          if (!v8)
          {

            goto LABEL_11;
          }
          id v9 = [v5 account];
          uint64_t v10 = [v9 emailAddressStrings];
          BOOL v11 = v10 == 0;

          if (v11) {
            continue;
          }
        }
        uint64_t v6 = [*(id *)(a1 + 40) _eventLog];
        [v6 persistEvent:@"message_fetched" dataFromMessage:v5];
LABEL_11:
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v2);
  }
}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(EDInteractionLogger *)self processingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__EDInteractionLogger_persistenceWillChangeFlags_messages___block_invoke;
  v13[3] = &unk_1E6BFFA78;
  id v14 = v7;
  id v15 = v6;
  long long v16 = self;
  id v17 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __59__EDInteractionLogger_persistenceWillChangeFlags_messages___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v18;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v18 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v17 + 1) + 8 * v4);
        if ([*(id *)(a1 + 40) reason] >= 4)
        {
          if ([*(id *)(a1 + 40) readChanged])
          {
            id v6 = [*(id *)(a1 + 48) _eventLog];
            uint64_t v7 = *(void *)(a1 + 56);
            id v23 = @"value";
            uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "read"));
            int64_t v24 = v8;
            id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
            [v6 persistEvent:@"read_changed" date:v7 message:v5 data:v9];
          }
          if ([*(id *)(a1 + 40) flaggedChanged])
          {
            id v10 = [*(id *)(a1 + 48) _eventLog];
            uint64_t v11 = *(void *)(a1 + 56);
            id v21 = @"value";
            id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "flagged"));
            id v22 = v12;
            long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
            [v10 persistEvent:@"flag_changed" date:v11 message:v5 data:v13];
          }
          if ([*(id *)(a1 + 40) repliedChanged]
            && [*(id *)(a1 + 40) replied])
          {
            id v14 = [*(id *)(a1 + 48) _eventLog];
            [v14 persistEvent:@"reply_sent" date:*(void *)(a1 + 56) message:v5 data:MEMORY[0x1E4F1CC08]];
          }
          if ((([*(id *)(a1 + 40) forwardedChanged] & 1) != 0
             || [*(id *)(a1 + 40) redirectedChanged])
            && (([*(id *)(a1 + 40) forwarded] & 1) != 0
             || [*(id *)(a1 + 40) redirected]))
          {
            id v15 = [*(id *)(a1 + 48) _eventLog];
            [v15 persistEvent:@"forward_sent" date:*(void *)(a1 + 56) message:v5 data:MEMORY[0x1E4F1CC08]];
          }
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v2);
  }
}

- (void)persistenceWillTransferMessages:(id)a3 transferType:(int64_t)a4 destinationMailboxURL:(id)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (v6)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    long long v13 = [(EDInteractionLogger *)self processingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__EDInteractionLogger_persistenceWillTransferMessages_transferType_destinationMailboxURL_userInitiated___block_invoke;
    block[3] = &unk_1E6C00A90;
    block[4] = self;
    id v16 = v11;
    id v18 = v12;
    int64_t v19 = a4;
    id v17 = v10;
    id v14 = v12;
    dispatch_async(v13, block);
  }
}

void __104__EDInteractionLogger_persistenceWillTransferMessages_transferType_destinationMailboxURL_userInitiated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) mailboxPersistence];
  uint64_t v3 = [v2 legacyMailboxForMailboxURL:*(void *)(a1 + 40)];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(a1 + 64);
        if (v9)
        {
          if (v9 == 1)
          {
            id v10 = [*(id *)(a1 + 32) _eventLog];
            [v10 persistEvent:@"message_moved" date:*(void *)(a1 + 56) message:v8 mailbox:v3];
          }
          else
          {
            if (v9 != 3) {
              goto LABEL_13;
            }
            id v10 = [*(id *)(a1 + 32) _eventLog];
            [v10 persistEvent:@"message_moved" date:*(void *)(a1 + 56) message:v8 mailboxType:3];
          }
        }
        else
        {
          id v10 = objc_msgSend(*(id *)(a1 + 32), "_eventLog", (void)v11);
          [v10 persistEvent:@"message_copied" date:*(void *)(a1 + 56) message:v8 mailbox:v3];
        }

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)deliveredMessage:(id)a3 account:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(EDInteractionLogger *)self _eventLog];
  [v7 persistEvent:@"message_sent" dataFromMessage:v8 account:v6];
}

- (void)waitForPendingStateChanges
{
  uint64_t v2 = [(EDInteractionLogger *)self _stateTrackingQueue];
  dispatch_sync(v2, &__block_literal_global_189);
}

- (NSMutableDictionary)_viewedMessages
{
  return self->_viewedMessages;
}

- (void)set_viewedMessages:(id)a3
{
}

- (NSMutableDictionary)_messageListMessages
{
  return self->_messageListMessages;
}

- (void)set_messageListMessages:(id)a3
{
}

- (_NSRange)_messageListVisibleRows
{
  NSUInteger length = self->_messageListVisibleRows.length;
  NSUInteger location = self->_messageListVisibleRows.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)set_messageListVisibleRows:(_NSRange)a3
{
  self->_messageListVisibleRows = a3;
}

- (OS_dispatch_queue)_stateTrackingQueue
{
  return self->_stateTrackingQueue;
}

- (void)set_stateTrackingQueue:(id)a3
{
}

- (EDInteractionEventLog)_eventLog
{
  return self->_eventLog;
}

- (void)set_eventLog:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_eventLog, 0);
  objc_storeStrong((id *)&self->_stateTrackingQueue, 0);
  objc_storeStrong((id *)&self->_messageListMessages, 0);

  objc_storeStrong((id *)&self->_viewedMessages, 0);
}

@end