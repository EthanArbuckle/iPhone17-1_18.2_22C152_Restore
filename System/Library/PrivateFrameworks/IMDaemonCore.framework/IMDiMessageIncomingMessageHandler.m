@interface IMDiMessageIncomingMessageHandler
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5;
- (void)handleChatSessionCloseWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleCrossServiceAssociationCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleEditMessageCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessageDeliveredQuietlyReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessageDeliveryReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessageMarkUnreadRequestWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessagePlayedReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessageReadReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleMessageWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleNotifyRecipientCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleRecoverJunkCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleRepositionStickerCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleScheduledMessageUpdateCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
- (void)handleSyndicatedActionWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5;
@end

@implementation IMDiMessageIncomingMessageHandler

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5
{
}

- (void)handleMessageDeliveryReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing delivery receipt processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D2794;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"delivery receipt" description:45.0];
}

- (void)handleChatSessionCloseWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing chat session close processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D2BB0;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"chat session close" description:45.0];
}

- (void)handleMessageReadReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing read receipt processing", buf, 2u);
    }
  }
  if (([v9 isFromStorage] & 1) != 0 || objc_msgSend(v9, "isLastFromStorage"))
  {
    id v12 = +[IMDMessageFromStorageController iMessageStorageController];
    [v12 incrementPendingReadReceiptFromStorageCount];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D97D3000;
  v16[3] = &unk_1E6B76A90;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v16 withTimeout:@"read receipt" description:45.0];
}

- (void)handleMessageMarkUnreadRequestWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing mark unread request processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D344C;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"mark unread request" description:45.0];
}

- (void)handleMessagePlayedReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing played receipt processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D3868;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"played receipt" description:45.0];
}

- (void)handleMessageDeliveredQuietlyReceiptWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing delivered quietly receipt processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D3C84;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"delivered quietly receipt" description:45.0];
}

- (void)handleNotifyRecipientCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing notify recipient command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D40A0;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"notify recipient command" description:45.0];
}

- (void)handleEditMessageCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing edit message command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D44BC;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"edit message command" description:45.0];
}

- (void)handleRecoverJunkCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing edit message command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D48D8;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"recover junk command" description:45.0];
}

- (void)handleRepositionStickerCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing reposition sticker command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D4CF4;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"reposition sticker command" description:45.0];
}

- (void)handleScheduledMessageUpdateCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enqueuing scheduled message update command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D5110;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"Scheduled Message update command" description:45.0];
}

- (void)handleCrossServiceAssociationCommandWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enqueuing iml to im association command processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D552C;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"IML to IM association command" description:45.0];
}

- (void)handleMessageWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v9 GUID];
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing message processing (%@)", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      qos_class_t v14 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v14;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Enqueue message qos is (%u)", buf, 8u);
    }
  }
  id v15 = IMLogHandleForCategory();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D97D5A5C;
  v21[3] = &unk_1E6B76AE0;
  id v22 = v9;
  v23 = v15;
  id v25 = v10;
  os_signpost_id_t v26 = v16;
  id v24 = v8;
  id v17 = v10;
  id v18 = v8;
  id v19 = v15;
  id v20 = v9;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v21 withTimeout:@"message" description:45.0];
}

- (void)handleSyndicatedActionWithPipeline:(id)a3 input:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Enquing SyndicationAction processing", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D97D61B0;
  v15[3] = &unk_1E6B76A90;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(IMDiMessageIncomingMessageHandler *)self _enqueueBlock:v15 withTimeout:@"syndication action" description:45.0];
}

@end