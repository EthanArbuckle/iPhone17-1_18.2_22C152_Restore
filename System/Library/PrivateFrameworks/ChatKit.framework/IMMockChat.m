@interface IMMockChat
- (BOOL)deleteAllHistory;
- (IMHandle)incomingHandle;
- (IMHandle)outgoingHandle;
- (IMMessage)lastMockIMMessage;
- (IMMockChat)init;
- (NSArray)extraParticipants;
- (NSArray)mockChatItems;
- (id)_chatItemFromMockItemInfo:(id)a3 atIndex:(unint64_t)a4;
- (id)_messageFromMockItemInfo:(id)a3;
- (id)displayName;
- (id)lastFinishedMessage;
- (id)lastFinishedMessageDate;
- (id)lastMessage;
- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5;
- (id)participants;
- (unint64_t)messageCount;
- (unint64_t)mockUnreadMessageCount;
- (void)appendMockItemWithInfo:(id)a3;
- (void)deleteChatItems:(id)a3;
- (void)setExtraParticipants:(id)a3;
- (void)setIncomingHandle:(id)a3;
- (void)setLastMockIMMessage:(id)a3;
- (void)setMockChatItems:(id)a3;
- (void)setMockUnreadMessageCount:(unint64_t)a3;
- (void)setOutgoingHandle:(id)a3;
- (void)setupWithMockItemInfoArray:(id)a3;
@end

@implementation IMMockChat

- (IMMockChat)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMMockChat;
  v2 = [(IMItemsController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F6BBD0]);
    v4 = [MEMORY[0x1E4F6BDC0] iMessageService];
    v5 = (void *)[v3 initWithService:v4];

    v6 = [v5 imHandleWithID:@"5034222074" alreadyCanonical:0];
    [(IMMockChat *)v2 setIncomingHandle:v6];

    v7 = [v5 imHandleWithID:@"8082698799" alreadyCanonical:0];
    [(IMMockChat *)v2 setOutgoingHandle:v7];
  }
  return v2;
}

- (NSArray)mockChatItems
{
  p_mockChatItems = &self->_mockChatItems;
  mockChatItems = self->_mockChatItems;
  if (!mockChatItems)
  {
    v5 = [MEMORY[0x1E4F28F80] processInfo];
    v6 = [v5 environment];
    v7 = [v6 valueForKey:@"CHAT_ITEM_INFO"];

    v8 = +[IMMockItemInfo decodedMockItemInfoArray:v7];
    if (!v8)
    {
      v8 = +[IMMockItemInfo defaultMockInfoArray];
    }
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    id v16 = 0;
    id v16 = [MEMORY[0x1E4F1CA48] array];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__IMMockChat_mockChatItems__block_invoke;
    v10[3] = &unk_1E5624B98;
    v10[4] = self;
    v10[5] = &v11;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v10];
    objc_storeStrong((id *)p_mockChatItems, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

    mockChatItems = *p_mockChatItems;
  }

  return mockChatItems;
}

void __27__IMMockChat_mockChatItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) _chatItemFromMockItemInfo:v5 atIndex:a3];
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 680);
    if (v8)
    {
      id v9 = v8;
      v10 = *(void **)(v7 + 680);
      *(void *)(v7 + 680) = v9;
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) _messageFromMockItemInfo:v5];
      uint64_t v12 = *(void *)(a1 + 32);
      v10 = *(void **)(v12 + 680);
      *(void *)(v12 + 680) = v11;
    }

    if (!*(void *)(*(void *)(a1 + 32) + 680))
    {
      uint64_t v13 = NSString;
      uint64_t v14 = IMFileLocationTrimFileName();
      v15 = [NSString stringWithFormat:&stru_1EDE4CA38];
      id v16 = [v13 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"_lastMockIMMessage", "-[IMMockChat mockChatItems]_block_invoke", v14, 145, v15];

      v17 = (void (*)(void *))IMGetAssertionFailureHandler();
      if (v17) {
        v17(v16);
      }
      else {
        _IMWarn();
      }
    }
  }
}

- (id)participants
{
  id v3 = [(IMMockChat *)self incomingHandle];

  if (v3)
  {
    v4 = [(IMMockChat *)self incomingHandle];
    id v5 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = [(IMMockChat *)self extraParticipants];

  if (v6)
  {
    uint64_t v7 = [(IMMockChat *)self extraParticipants];
    uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v7];

    id v5 = (void *)v8;
  }

  return v5;
}

- (id)displayName
{
  return @"MockChat";
}

- (id)lastFinishedMessageDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)lastFinishedMessage
{
  return self->_lastMockIMMessage;
}

- (id)lastMessage
{
  return self->_lastMockIMMessage;
}

- (unint64_t)messageCount
{
  v2 = [(IMMockChat *)self chatItems];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend(NSString, "stringGUID", a3, a4, a5);
}

- (BOOL)deleteAllHistory
{
  return 1;
}

- (void)deleteChatItems:(id)a3
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mockChatItems = self->_mockChatItems;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __30__IMMockChat_deleteChatItems___block_invoke;
  v20[3] = &unk_1E5624BC0;
  id v21 = v4;
  id v19 = v4;
  v6 = [(NSArray *)mockChatItems indexesOfObjectsPassingTest:v20];
  uint64_t v7 = self->_mockChatItems;
  uint64_t v8 = (NSArray *)[(NSArray *)v7 mutableCopy];
  [(NSArray *)v8 removeObjectsAtIndexes:v6];
  id v9 = self->_mockChatItems;
  self->_mockChatItems = v8;
  v10 = v8;

  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v12 = *MEMORY[0x1E4F6B8D8];
  v22[0] = *MEMORY[0x1E4F6B8E0];
  uint64_t v13 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v14 = *MEMORY[0x1E4F6B908];
  v23[0] = v13;
  v23[1] = v6;
  uint64_t v15 = *MEMORY[0x1E4F6B900];
  v22[1] = v14;
  v22[2] = v15;
  id v16 = [MEMORY[0x1E4F28D60] indexSet];
  v23[2] = v16;
  v22[3] = *MEMORY[0x1E4F6B8F8];
  v17 = [MEMORY[0x1E4F28D60] indexSet];
  v22[4] = *MEMORY[0x1E4F6B8F0];
  v23[3] = v17;
  v23[4] = v7;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

  [v11 postNotificationName:v12 object:self userInfo:v18];
}

uint64_t __30__IMMockChat_deleteChatItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)setupWithMockItemInfoArray:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 count];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [v12 objectAtIndexedSubscript:i];
      uint64_t v8 = [(IMMockChat *)self _chatItemFromMockItemInfo:v7 atIndex:i];
      [v5 addObject:v8];
    }
  }
  id v9 = [v12 lastObject];
  v10 = [(IMMockChat *)self _messageFromMockItemInfo:v9];
  lastMockIMMessage = self->_lastMockIMMessage;
  self->_lastMockIMMessage = v10;

  [(IMMockChat *)self setMockChatItems:v5];
}

- (void)appendMockItemWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMockChat *)self mockChatItems];
  -[IMMockChat _chatItemFromMockItemInfo:atIndex:](self, "_chatItemFromMockItemInfo:atIndex:", v4, [v5 count]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [(IMMockChat *)self _messageFromMockItemInfo:v4];

  lastMockIMMessage = self->_lastMockIMMessage;
  self->_lastMockIMMessage = v6;

  uint64_t v8 = [(NSArray *)self->_mockChatItems arrayByAddingObject:v10];
  mockChatItems = self->_mockChatItems;
  self->_mockChatItems = v8;
}

- (id)_messageFromMockItemInfo:(id)a3
{
  id v4 = a3;
  int v5 = [v4 outgoing];
  if ([v4 type])
  {
    if ([v4 type] != 1)
    {
      uint64_t v13 = 0;
      goto LABEL_19;
    }
    if (v5) {
      uint64_t v6 = 1048581;
    }
    else {
      uint64_t v6 = 1048577;
    }
    if (v5) {
      [(IMMockChat *)self outgoingHandle];
    }
    else {
    id v12 = [(IMMockChat *)self incomingHandle];
    }
    uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:&unk_1EDF17AC8];
    id v20 = objc_alloc(MEMORY[0x1E4F6BD18]);
    v17 = [MEMORY[0x1E4F1C9C8] date];
    v18 = [NSString stringGUID];
    uint64_t v19 = [v20 initWithSender:v12 time:v17 text:0 messageSubject:0 fileTransferGUIDs:0 flags:v6 error:0 guid:v18 subject:0 balloonBundleID:@"com.apple.messages.CKTicTacToeBalloonProvider" payloadData:v15 expressiveSendStyleID:0 threadIdentifier:0];
  }
  else
  {
    if (v5) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = 1;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
    id v10 = v9;
    if (v5)
    {
      uint64_t v11 = [v9 localizedStringForKey:@"Outgoing" value:&stru_1EDE4CA38 table:0];
      id v12 = (void *)[v8 initWithString:v11];

      [(IMMockChat *)self outgoingHandle];
    }
    else
    {
      uint64_t v14 = [v9 localizedStringForKey:@"Incoming" value:&stru_1EDE4CA38 table:0];
      id v12 = (void *)[v8 initWithString:v14];

      [(IMMockChat *)self incomingHandle];
    uint64_t v15 = };
    id v16 = objc_alloc(MEMORY[0x1E4F6BD18]);
    v17 = [MEMORY[0x1E4F1C9C8] date];
    v18 = [NSString stringGUID];
    uint64_t v19 = [v16 initWithSender:v15 time:v17 text:v12 fileTransferGUIDs:0 flags:v7 error:0 guid:v18 subject:0 threadIdentifier:0];
  }
  uint64_t v13 = (void *)v19;

LABEL_19:

  return v13;
}

- (id)_chatItemFromMockItemInfo:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(IMMockChat *)self _messageFromMockItemInfo:v6];
  id v8 = [v7 _imMessageItem];
  if (!v8) {
    goto LABEL_5;
  }
  if (![v6 type])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F6BDF8]);
    id v9 = [v8 body];
    uint64_t v12 = objc_msgSend(v14, "_initWithItem:text:index:messagePartRange:subject:", v8, v9, a4, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    goto LABEL_7;
  }
  if ([v6 type] != 1)
  {
LABEL_5:
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F6BD80]);
  id v10 = [v8 guid];
  [v9 setMessageGUID:v10];

  uint64_t v11 = [v8 payloadData];
  [v9 setData:v11];

  [v9 setPluginBundleID:@"com.apple.messages.CKTicTacToeBalloonProvider"];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6BE18]), "_initWithItem:initialPayload:messagePartRange:", v8, v9, 0, 0x7FFFFFFFFFFFFFFFLL);
LABEL_7:
  uint64_t v13 = (void *)v12;

LABEL_8:

  return v13;
}

- (void)setMockChatItems:(id)a3
{
}

- (IMHandle)incomingHandle
{
  return self->_incomingHandle;
}

- (void)setIncomingHandle:(id)a3
{
}

- (IMHandle)outgoingHandle
{
  return self->_outgoingHandle;
}

- (void)setOutgoingHandle:(id)a3
{
}

- (IMMessage)lastMockIMMessage
{
  return self->_lastMockIMMessage;
}

- (void)setLastMockIMMessage:(id)a3
{
}

- (NSArray)extraParticipants
{
  return self->_extraParticipants;
}

- (void)setExtraParticipants:(id)a3
{
}

- (unint64_t)mockUnreadMessageCount
{
  return self->_mockUnreadMessageCount;
}

- (void)setMockUnreadMessageCount:(unint64_t)a3
{
  self->_mockUnreadMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraParticipants, 0);
  objc_storeStrong((id *)&self->_lastMockIMMessage, 0);
  objc_storeStrong((id *)&self->_outgoingHandle, 0);
  objc_storeStrong((id *)&self->_incomingHandle, 0);

  objc_storeStrong((id *)&self->_mockChatItems, 0);
}

@end