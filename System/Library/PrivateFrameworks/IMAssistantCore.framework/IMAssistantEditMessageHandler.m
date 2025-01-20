@interface IMAssistantEditMessageHandler
- (void)chatsForMessageIdentifiers:(id)a3 completion:(id)a4;
- (void)confirmEditMessage:(id)a3 completion:(id)a4;
- (void)handleEditMessage:(id)a3 completion:(id)a4;
- (void)resolveEditedContentForEditMessage:(id)a3 withCompletion:(id)a4;
- (void)sendEditedMessageItem:(id)a3 originalMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6;
@end

@implementation IMAssistantEditMessageHandler

- (void)resolveEditedContentForEditMessage:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = [v5 editedContent];
  v8 = [v7 trimmedString];

  uint64_t v9 = [v8 length];
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Trimmed message content length is nonzero, returning success", v15, 2u);
      }
    }
    uint64_t v12 = [MEMORY[0x263F10020] successWithResolvedString:v8];
  }
  else
  {
    if (v10)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Trimmed message content length is zero, returning needsValue", buf, 2u);
      }
    }
    uint64_t v12 = [MEMORY[0x263F10020] needsValue];
  }
  v14 = (void *)v12;
  v6[2](v6, v12);
}

- (void)confirmEditMessage:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Confirming INEditMessageIntent: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v9 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  int v10 = [v9 accountDataSource];
  char v11 = [v10 hasMessagingAccount];

  if (v11)
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
          (uint8_t *)&v15,
          2u);
      }
    }
    uint64_t v12 = 10;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:v12 userActivity:0];
  v7[2](v7, v14);
}

- (void)handleEditMessage:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Handling INEditMessageIntent: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = [v5 messageIdentifier];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v16 = v8;
    int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    char v11 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
    id v14 = v5;
    id v15 = v6;
    IMSPIQueryIMMessageItemsWithGUIDsAndQOS();

    uint64_t v12 = v14;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Intent message identifier is nil", buf, 2u);
      }
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F0FAC0]) initWithCode:4 userActivity:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }
}

- (void)sendEditedMessageItem:(id)a3 originalMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6
{
  uint64_t v9 = (void *)MEMORY[0x263F4A568];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v21 = [v9 sharedInstance];
  id v14 = [v12 body];
  id v15 = objc_msgSend(v14, "__im_messagePartIndexes");
  uint64_t v16 = [v15 firstIndex];
  uint64_t v17 = [v11 chatIdentifier];
  uint64_t v18 = [v11 chatStyle];
  uint64_t v19 = [v11 account];

  v20 = [v19 uniqueID];
  [v21 sendEditedMessage:v13 previousMessage:v12 partIndex:v16 editType:1 toChatIdentifier:v17 style:v18 account:v20 backwardCompatabilityText:v10];
}

- (void)chatsForMessageIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  id v10 = v6;
  id v8 = v6;
  id v9 = v5;
  IMSPIQueryMessagesWithGUIDsAndQOS();
}

@end