@interface CKIMSimulatedChat
+ (id)prepopulatedChat;
- (BOOL)_handleIncomingItem:(id)a3;
- (BOOL)allowedByScreenTime;
- (BOOL)allowedToShowConversation;
- (BOOL)allowedToShowConversationSync;
- (CKIMSimulatedAccount)simulatedAccount;
- (CKIMSimulatedChat)initWithIncomingIDs:(id)a3 outgoingID:(id)a4 messageIDOffset:(unint64_t)a5 service:(id)a6;
- (CKIMSimulatedChatDelegate)delegate;
- (IMHandle)outgoingHandle;
- (NSArray)incomingHandles;
- (NSString)simulatedChatIdentifier;
- (NSString)simulatedGUID;
- (id)_messageWithGUID:(id)a3;
- (id)account;
- (id)chatIdentifier;
- (id)guid;
- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5;
- (id)recipient;
- (unint64_t)currentMessageID;
- (unsigned)chatStyle;
- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5;
- (void)chat:(id)a3 didSendMessage:(id)a4 finished:(BOOL)a5;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSimulatedChatIdentifier:(id)a3;
- (void)simulatedDaemon:(id)a3 willSendBalloonPayload:(id)a4 attachments:(id)a5 messageGUID:(id)a6 bundleID:(id)a7;
@end

@implementation CKIMSimulatedChat

- (CKIMSimulatedChat)initWithIncomingIDs:(id)a3 outgoingID:(id)a4 messageIDOffset:(unint64_t)a5 service:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CKIMSimulatedChat;
  v13 = [(IMItemsController *)&v39 init];
  v14 = v13;
  if (initWithIncomingIDs_outgoingID_messageIDOffset_service__onceToken == -1)
  {
    if (!v13) {
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&initWithIncomingIDs_outgoingID_messageIDOffset_service__onceToken, &__block_literal_global_172);
    if (!v14) {
      goto LABEL_11;
    }
  }
  uint64_t v15 = [NSString stringGUID];
  simulatedGUID = v14->_simulatedGUID;
  v14->_simulatedGUID = (NSString *)v15;

  id v33 = v12;
  v17 = [[CKIMSimulatedAccount alloc] initWithService:v12];
  simulatedAccount = v14->_simulatedAccount;
  v14->_simulatedAccount = v17;

  uint64_t v19 = [(CKIMSimulatedAccount *)v14->_simulatedAccount imHandleWithID:v11 alreadyCanonical:0];
  outgoingHandle = v14->_outgoingHandle;
  v14->_outgoingHandle = (IMHandle *)v19;

  uint64_t v21 = [MEMORY[0x1E4F1C978] array];
  incomingHandles = v14->_incomingHandles;
  v14->_incomingHandles = (NSArray *)v21;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v34 = v10;
  id v23 = v10;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = v14->_incomingHandles;
        v29 = [(CKIMSimulatedAccount *)v14->_simulatedAccount imHandleWithID:*(void *)(*((void *)&v35 + 1) + 8 * i) alreadyCanonical:0];
        uint64_t v30 = [(NSArray *)v28 arrayByAddingObject:v29];
        v31 = v14->_incomingHandles;
        v14->_incomingHandles = (NSArray *)v30;
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v25);
  }

  [(CKIMSimulatedAccount *)v14->_simulatedAccount setLoginHandle:v14->_outgoingHandle];
  id v10 = v34;
  v14->_currentMessageID = a5;
  id v12 = v33;
LABEL_11:

  return v14;
}

void __76__CKIMSimulatedChat_initWithIncomingIDs_outgoingID_messageIDOffset_service___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F6BDC0] serviceWithInternalName:*MEMORY[0x1E4F6E1B0]];
  uint64_t v2 = *MEMORY[0x1E4F6C030];
  v3[0] = &unk_1EDF15710;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 setServiceProperties:v1];
}

- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKIMSimulatedChat;
  id v8 = a3;
  [(CKIMSimulatedChat *)&v12 _sendMessage:v8 adjustingSender:v6 shouldQueue:v5];
  v9 = [v8 _imMessageItem];

  if ([v9 isTypingMessage])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__CKIMSimulatedChat__sendMessage_adjustingSender_shouldQueue___block_invoke;
    v10[3] = &unk_1E5620AF8;
    v10[4] = self;
    id v11 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __62__CKIMSimulatedChat__sendMessage_adjustingSender_shouldQueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 chat:*(void *)(a1 + 32) didSendMessage:*(void *)(a1 + 40) finished:0];
}

- (void)sendMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKIMSimulatedChat;
  [(CKIMSimulatedChat *)&v34 sendMessage:v4];
  if ([v4 hasDataDetectorResults])
  {
    objc_msgSend(v4, "messagesBySeparatingRichLinks", v4);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v11 = [(CKIMSimulatedChat *)self outgoingHandle];
          [v10 _updateSender:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v36 = v4;
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v36, 1, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v5;
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    uint64_t v15 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = [*(id *)(*((void *)&v26 + 1) + 8 * j) _imMessageItem];
        v18 = [(CKIMSimulatedChat *)self delegate];
        objc_msgSend(v18, "chat:didSendMessage:finished:", self, v17, objc_msgSend(v17, "isTypingMessage") ^ 1);

        ++self->_currentMessageID;
        dispatch_time_t v19 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__CKIMSimulatedChat_sendMessage___block_invoke;
        block[3] = &unk_1E5620AF8;
        id v24 = v17;
        uint64_t v25 = self;
        id v20 = v17;
        dispatch_after(v19, v15, block);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }
}

void __33__CKIMSimulatedChat_sendMessage___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) currentMessageID];
  id v4 = [*(id *)(a1 + 40) outgoingHandle];
  id v5 = [*(id *)(a1 + 40) incomingHandles];
  uint64_t v6 = [v5 firstObject];
  messageItemCopyForMessageItem(v2, 36869, v3, v4, v6, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) _handleIncomingItem:v7];
}

- (BOOL)_handleIncomingItem:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 associatedMessageType] != 2) {
    goto LABEL_42;
  }
  long long v35 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  v37 = id v36 = self;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = [(IMItemsController *)self _items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v6) {
    goto LABEL_32;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v46;
  uint64_t v38 = v5;
  uint64_t v39 = *(void *)v46;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v46 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v4;
        id v12 = v10;
        if ([v12 messageID])
        {
          uint64_t v13 = [v12 pluginSessionGUID];
          uint64_t v14 = [v11 associatedMessageGUID];
          if (([v13 isEqualToString:v14] & 1) == 0)
          {

            goto LABEL_14;
          }
          id v15 = v4;
          v16 = [v12 balloonBundleID];
          v17 = [v11 balloonBundleID];
          int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            if ([v12 associatedMessageType] == 3)
            {
              uint64_t v13 = [v12 payloadData];
              [v37 addObject:v13];
              id v4 = v15;
              id v5 = v38;
              uint64_t v8 = v39;
              goto LABEL_14;
            }
            objc_opt_class();
            id v4 = v15;
            uint64_t v8 = v39;
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 associatedMessageType] != 2)
            {
              id v5 = v38;
            }
            else
            {
              uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E5E0]) initWithMessageItem:v12];
              int v19 = [v12 isFromMe];
              char v20 = v19;
              id v5 = v38;
              if (v19)
              {
                uint64_t outgoingHandle = (uint64_t)v36->_outgoingHandle;
              }
              else
              {
                uint64_t outgoingHandle = [(NSArray *)v36->_incomingHandles firstObject];
                objc_super v34 = (void *)outgoingHandle;
              }
              if (objc_msgSend(v12, "isFromMe", v34))
              {
                v22 = [(NSArray *)v36->_incomingHandles firstObject];
                [v13 _updateContextWithSenderHandle:outgoingHandle otherHandle:v22];
              }
              else
              {
                [v13 _updateContextWithSenderHandle:outgoingHandle otherHandle:v36->_outgoingHandle];
              }
              if ((v20 & 1) == 0) {

              }
              id v23 = [v11 associatedMessageGUID];
              [v13 setAssociatedMessageGUID:v23];

              [v13 setAssociatedMessageType:3];
              id v24 = [v11 breadcrumbText];
              [v13 setBody:v24];

              [v35 addObject:v13];
              uint64_t v25 = [v12 payloadData];
              [v37 addObject:v25];

              uint64_t v8 = v39;
LABEL_14:
            }
          }
          else
          {
            id v4 = v15;
            id v5 = v38;
            uint64_t v8 = v39;
          }
        }
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v26 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
    uint64_t v7 = v26;
  }
  while (v26);
LABEL_32:

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v27 = v35;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
  self = v36;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        [(CKIMSimulatedChat *)v36 _handleIncomingItem:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v29);
  }

  if ([v37 count]) {
    [v4 setConsumedSessionPayloads:v37];
  }

LABEL_42:
  v40.receiver = self;
  v40.super_class = (Class)CKIMSimulatedChat;
  BOOL v32 = [(CKIMSimulatedChat *)&v40 _handleIncomingItem:v4];

  return v32;
}

- (id)chatIdentifier
{
  uint64_t v3 = [(CKIMSimulatedChat *)self simulatedChatIdentifier];

  if (!v3)
  {
    id v4 = [(CKIMSimulatedChat *)self incomingHandles];
    if ([v4 count] == 1)
    {
      id v5 = [(CKIMSimulatedChat *)self incomingHandles];
      uint64_t v6 = [v5 firstObject];
      uint64_t v7 = [v6 ID];
      [(CKIMSimulatedChat *)self setSimulatedChatIdentifier:v7];
    }
    else
    {
      id v5 = [NSString stringGUID];
      [(CKIMSimulatedChat *)self setSimulatedChatIdentifier:v5];
    }
  }

  return [(CKIMSimulatedChat *)self simulatedChatIdentifier];
}

- (id)account
{
  return self->_simulatedAccount;
}

- (id)guid
{
  return self->_simulatedGUID;
}

- (id)recipient
{
  id v2 = [(CKIMSimulatedChat *)self incomingHandles];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (unsigned)chatStyle
{
  id v2 = [(CKIMSimulatedChat *)self incomingHandles];
  unint64_t v3 = [v2 count];

  if (v3 <= 1) {
    return 45;
  }
  else {
    return 43;
  }
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend(NSString, "stringGUID", a3, a4, a5);
}

- (BOOL)allowedByScreenTime
{
  return 1;
}

- (BOOL)allowedToShowConversationSync
{
  return 1;
}

- (BOOL)allowedToShowConversation
{
  return 1;
}

- (void)chat:(id)a3 didSendMessage:(id)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  ++self->_currentMessageID;
  id v7 = a4;
  if ([v7 isTypingMessage]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [(CKIMSimulatedChat *)self currentMessageID];
  }
  uint64_t v9 = [(CKIMSimulatedChat *)self incomingHandles];
  id v10 = [v9 firstObject];
  id v11 = [(CKIMSimulatedChat *)self outgoingHandle];
  messageItemCopyForMessageItem(v7, v5, v8, v10, v11, 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [(CKIMSimulatedChat *)self _handleIncomingItem:v12];
}

- (void)simulatedDaemon:(id)a3 willSendBalloonPayload:(id)a4 attachments:(id)a5 messageGUID:(id)a6 bundleID:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(CKIMSimulatedChat *)self _messageWithGUID:a6];
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    uint64_t v28 = (void *)v12;
    uint64_t v29 = self;
    id v31 = v10;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v30 = v11;
    obuint64_t j = v11;
    uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
          char v20 = NSString;
          uint64_t v21 = NSTemporaryDirectory();
          v22 = [NSString stringGUID];
          id v23 = [v20 stringWithFormat:@"%@/%@", v21, v22];

          [v19 writeToFile:v23 atomically:1];
          id v24 = [MEMORY[0x1E4F6BCC8] sharedInstance];
          uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23];
          uint64_t v26 = [v24 createNewOutgoingTransferWithLocalFileURL:v25];
          [v14 addObject:v26];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v16);
    }

    uint64_t v13 = v28;
    id v10 = v31;
    [v28 setPayloadData:v31];
    [v28 setFileTransferGUIDs:v14];
    [(CKIMSimulatedChat *)v29 _handleIncomingItem:v28];
    id v27 = [(CKIMSimulatedChat *)v29 delegate];
    [v27 chat:v29 didSendMessage:v28 finished:1];

    id v11 = v30;
  }
}

- (id)_messageWithGUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(IMItemsController *)self _items];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 guid];
        if ([v10 isEqualToString:v4])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (CKIMSimulatedChatDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKIMSimulatedChatDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKIMSimulatedAccount)simulatedAccount
{
  return self->_simulatedAccount;
}

- (NSString)simulatedGUID
{
  return self->_simulatedGUID;
}

- (NSArray)incomingHandles
{
  return self->_incomingHandles;
}

- (IMHandle)outgoingHandle
{
  return self->_outgoingHandle;
}

- (unint64_t)currentMessageID
{
  return self->_currentMessageID;
}

- (NSString)simulatedChatIdentifier
{
  return self->_simulatedChatIdentifier;
}

- (void)setSimulatedChatIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedChatIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingHandle, 0);
  objc_storeStrong((id *)&self->_incomingHandles, 0);
  objc_storeStrong((id *)&self->_simulatedGUID, 0);
  objc_storeStrong((id *)&self->_simulatedAccount, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)prepopulatedChat
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6BDC0] serviceWithInternalName:*MEMORY[0x1E4F6E1B0]];
  unint64_t v3 = [CKIMSimulatedChat alloc];
  v23[0] = @"+15555228243";
  v23[1] = @"+1555648584";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  char v20 = (void *)v2;
  BOOL v5 = [(CKIMSimulatedChat *)v3 initWithIncomingIDs:v4 outgoingID:@"+15555648583" messageIDOffset:800000 service:v2];

  id v6 = objc_alloc_init(MEMORY[0x1E4F6E800]);
  [v6 setStatus:0];
  [v6 setDirection:0];
  [v6 setOtherHandle:@"+15555228243"];
  int v19 = v6;
  [(CKIMSimulatedChat *)v5 _handleIncomingItem:v6];
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Message %d", v7);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
    id v10 = objc_alloc(MEMORY[0x1E4F6BD18]);
    id v11 = [(CKIMSimulatedChat *)v5 outgoingHandle];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    long long v13 = [NSString stringGUID];
    long long v14 = (void *)[v10 initWithSender:v11 time:v12 text:v9 fileTransferGUIDs:0 flags:0 error:0 guid:v13 subject:0 threadIdentifier:0];

    [(CKIMSimulatedChat *)v5 sendMessage:v14];
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 30);
  long long v15 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_Photos2"];
  long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__CKIMSimulatedChat_Prepopulated__prepopulatedChat__block_invoke;
  v21[3] = &unk_1E5622818;
  uint64_t v17 = v5;
  v22 = v17;
  +[CKComposition requestCompositionFromItemProvider:v16 completion:v21];

  return v17;
}

void __51__CKIMSimulatedChat_Prepopulated__prepopulatedChat__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString stringGUID];
  BOOL v5 = [v3 messagesFromCompositionFirstGUIDForMessage:v4 sendingService:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

@end