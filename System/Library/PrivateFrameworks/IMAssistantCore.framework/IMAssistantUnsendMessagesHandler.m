@interface IMAssistantUnsendMessagesHandler
+ (id)makeRetractedMessageItem:(id)a3;
- (void)chatsForMessageIdentifiers:(id)a3 completion:(id)a4;
- (void)handleUnsendMessages:(id)a3 completion:(id)a4;
- (void)retractPartIndex:(int64_t)a3 fromMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6;
@end

@implementation IMAssistantUnsendMessagesHandler

- (void)handleUnsendMessages:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Handling INUnsendMessagesIntent: %@", buf, 0xCu);
    }
  }
  v9 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  v10 = [v9 accountDataSource];
  char v11 = [v10 hasMessagingAccount];

  if (v11)
  {
    v12 = [v6 messageIdentifiers];
    v13 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
    id v16 = v6;
    id v17 = v7;
    IMSPIQueryIMMessageItemsWithGUIDsAndQOS();

    v14 = v16;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
          buf,
          2u);
      }
    }
    v14 = (void *)[objc_alloc(MEMORY[0x263F10088]) initWithCode:10 userActivity:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

- (void)chatsForMessageIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  v10 = v6;
  id v8 = v6;
  id v9 = v5;
  IMSPIQueryMessagesWithGUIDsAndQOS();
}

+ (id)makeRetractedMessageItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 body];
  if (!v4)
  {
    uint64_t v5 = [v3 plainBody];
    id v6 = (void *)v5;
    id v7 = &stru_26DF9B8B8;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    id v8 = v7;

    v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
  }
  id v9 = objc_msgSend(v4, "__im_messageTextByRemovingMessagePartIndex:", 0);
  v10 = (void *)MEMORY[0x263F4AFC0];
  char v11 = [v3 fileTransferGUIDs];
  v12 = (void *)[v10 newMessageItemFrom:v3 withText:v9 deleteSubject:1 withFileTransferGUIDs:v11];

  v13 = objc_msgSend(MEMORY[0x263EFF910], "__im_dateWithCurrentServerTime");
  [v12 setDateEdited:v13];

  [v12 addRetractedPartIndex:0];

  return v12;
}

- (void)retractPartIndex:(int64_t)a3 fromMessageItem:(id)a4 chat:(id)a5 backwardCompatabilityText:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [v10 account];
  v13 = IMCopyGUIDForChatOnAccount();

  IMComponentsFromChatGUID();
  id v14 = 0;
  v15 = +[IMAssistantUnsendMessagesHandler makeRetractedMessageItem:v11];
  id v16 = [MEMORY[0x263F4A568] sharedInstance];
  uint64_t v17 = [v10 chatStyle];
  v18 = [v10 account];

  id v19 = [v18 uniqueID];
  [v16 sendEditedMessage:v15 previousMessage:v11 partIndex:a3 editType:2 toChatIdentifier:v14 style:v17 account:v19 backwardCompatabilityText:v9];
}

@end