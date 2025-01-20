@interface IMDMessageSortOrderAssigner
- (id)copyOfMessagesWithReplyToGUID:(id)a3;
- (id)messageWithGUID:(id)a3;
- (void)assignAndPersistSortIDForIncomingMessage:(id)a3 onChat:(id)a4;
- (void)assignSortIDToIncomingMessage:(id)a3 onChat:(id)a4;
- (void)assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:(id)a3 onChat:(id)a4;
- (void)compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:(id)a3 existingMessagesWithSameReplyToGUID:(id)a4;
- (void)persistMessage:(id)a3;
@end

@implementation IMDMessageSortOrderAssigner

- (id)messageWithGUID:(id)a3
{
  v4 = +[IMDMessageStore sharedInstance];

  return [(IMDMessageStore *)v4 itemWithGUID:a3];
}

- (id)copyOfMessagesWithReplyToGUID:(id)a3
{
  v3 = +[IMDMessageStore sharedInstance];

  return (id)MEMORY[0x1F4181798](v3, sel_messagesWithReplyToGUID_);
}

- (void)compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:(id)a3 existingMessagesWithSameReplyToGUID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = 0;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (!v7) {
    goto LABEL_23;
  }
  v8 = 0;
  uint64_t v9 = *(void *)v22;
  do
  {
    uint64_t v10 = 0;
    v11 = v8;
    do
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(a4);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
      if ([v12 isOlderThanItem:a3])
      {
        v8 = v12;
        if (v11)
        {
          if ([v11 isOlderThanItem:v12]) {
            v8 = v12;
          }
          else {
            v8 = v11;
          }
        }
      }
      else if (objc_msgSend((id)objc_msgSend(v12, "time"), "compare:", objc_msgSend(a3, "time")))
      {
        v8 = v11;
      }
      else if (![a3 messageID] {
             || (uint64_t v13 = [v12 messageID], v8 = v11, v13 < objc_msgSend(a3, "messageID")))
      }
      {
        v8 = v12;
      }
      if (!v6 || [v12 isOlderThanItem:v6]) {
        v6 = v12;
      }
      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    uint64_t v7 = [a4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  }
  while (v7);
  if (v8)
  {
    uint64_t v14 = [v8 sortID];
  }
  else
  {
LABEL_23:
    id v15 = -[IMDMessageSortOrderAssigner messageWithGUID:](self, "messageWithGUID:", [a3 replyToGUID]);
    if (!v15)
    {
      uint64_t v16 = [v6 sortID] - 50;
      goto LABEL_27;
    }
    uint64_t v14 = [v15 sortID];
  }
  uint64_t v16 = v14 + 50;
LABEL_27:
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [a3 guid];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:v16];
      *(_DWORD *)buf = 136315650;
      v26 = "-[IMDMessageSortOrderAssigner compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:existingMessag"
            "esWithSameReplyToGUID:]";
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "%s assigning %@ sortID %@", buf, 0x20u);
    }
  }
  [a3 setSortID:v16];
}

- (void)assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:(id)a3 onChat:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = -[IMDMessageSortOrderAssigner messageWithGUID:](self, "messageWithGUID:", [a3 replyToGUID]);
  id v8 = -[IMDMessageSortOrderAssigner copyOfMessagesWithReplyToGUID:](self, "copyOfMessagesWithReplyToGUID:", [a3 guid]);
  if (![v8 count]
    || (long long v22 = 0u,
        long long v23 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        (uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16]) == 0))
  {
    if (!v7)
    {
LABEL_22:
      uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "lastMessage"), "sortID");
      goto LABEL_23;
    }
LABEL_21:
    uint64_t v15 = [v7 sortID];
LABEL_23:
    uint64_t v16 = v15 + 100;
    goto LABEL_24;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (!v10 || [*(id *)(*((void *)&v20 + 1) + 8 * i) isOlderThanItem:v10]) {
        uint64_t v10 = v13;
      }
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
  }
  while (v9);
  if (v10) {
    BOOL v14 = v7 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (!v7)
    {
      if (v10)
      {
        uint64_t v16 = [v10 sortID] - 50;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v16 = [v7 sortID] + 50;
LABEL_24:
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [a3 guid];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:v16];
      *(_DWORD *)buf = 136315650;
      v25 = "-[IMDMessageSortOrderAssigner assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:onChat:]";
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "%s assigning %@ sortID %@", buf, 0x20u);
    }
  }
  [a3 setSortID:v16];
  if (v8) {
}
  }

- (void)persistMessage:(id)a3
{
  v4 = +[IMDMessageStore sharedInstance];

  [(IMDMessageStore *)v4 storeItem:a3 forceReplace:0];
}

- (void)assignSortIDToIncomingMessage:(id)a3 onChat:(id)a4
{
  id v7 = -[IMDMessageSortOrderAssigner copyOfMessagesWithReplyToGUID:](self, "copyOfMessagesWithReplyToGUID:", [a3 replyToGUID]);
  if ([v7 count]) {
    [(IMDMessageSortOrderAssigner *)self compareMessageToOtherMessagesWithSameReplyToGUIDAndAssignSortID:a3 existingMessagesWithSameReplyToGUID:v7];
  }
  else {
    [(IMDMessageSortOrderAssigner *)self assignSortIDToIncomingMessageWithNoExistingMessagesWithSameReplyToGUID:a3 onChat:a4];
  }
  if (v7)
  {
  }
}

- (void)assignAndPersistSortIDForIncomingMessage:(id)a3 onChat:(id)a4
{
  [(IMDMessageSortOrderAssigner *)self assignSortIDToIncomingMessage:a3 onChat:a4];

  MEMORY[0x1F4181798](self, sel_persistMessage_);
}

@end