@interface IMNotifyRecipientCommandProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMNotifyRecipientCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (id)_account;
- (id)_idsAccount;
- (id)_messageStore;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_markMessageAsNotifiedRecipientAndNotify:(id)a3 session:(id)a4 chat:(id)a5;
@end

@implementation IMNotifyRecipientCommandProcessingPipelineComponent

- (IMNotifyRecipientCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNotifyRecipientCommandProcessingPipelineComponent;
  v6 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)_idsAccount
{
  v2 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 idsAccount];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_account
{
  v2 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  return v3;
}

- (id)_messageStore
{
  v2 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 messageStore];

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v39 GUID];
      *(_DWORD *)buf = 138412290;
      v48 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMNotifyRecipientCommandProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [v39 GUID];
        *(_DWORD *)buf = 138412290;
        v48 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "    Ignoring notify recipient command for message: %@", buf, 0xCu);
      }
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v39];
  }
  else
  {
    objc_super v9 = [v39 GUID];

    if (v9)
    {
      v10 = [v39 GUID];
      id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
      v12 = [v11 messageStore];
      v13 = [v12 chatsForMessageGUID:v10];

      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v10;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v20 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
            v21 = [v20 messageStore];
            v22 = [v21 messageWithGUID:v10];

            if (v22)
            {
              [v40 addObject:v22];
              v23 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self _account];
              v24 = [v23 session];
              [(IMNotifyRecipientCommandProcessingPipelineComponent *)self _markMessageAsNotifiedRecipientAndNotify:v22 session:v24 chat:v19];

              if (([v22 isFromMe] & 1) == 0)
              {
                v25 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self _messageStore];
                v45 = v10;
                v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
                [v25 postUrgentNotificationsForMessageGUIDs:v26];
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v16);
      }

      BOOL v27 = [v40 count] == 0;
      int v28 = IMOSLoggingEnabled();
      if (v27)
      {
        if (v28)
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = [v39 GUID];
            *(_DWORD *)buf = 138412290;
            v48 = v35;
            _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Unable to mark message notified recipient with GUID=%@: message not found", buf, 0xCu);
          }
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        v37 = (void *)[v36 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v37];
      }
      else
      {
        if (v28)
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = [v39 GUID];
            *(_DWORD *)buf = 138412290;
            v48 = v30;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as notified recipient", buf, 0xCu);
          }
        }
        v31 = objc_msgSend(v15, "firstObject", v39);
        [v39 setChat:v31];

        v32 = (void *)[v40 copy];
        [v39 setMessageItems:v32];

        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v39];
      }
    }
    else
    {
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      v10 = (void *)[v33 initWithDomain:*MEMORY[0x1E4F6BE88] code:3 userInfo:0];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v10];
    }
  }

  return v8;
}

- (void)_markMessageAsNotifiedRecipientAndNotify:(id)a3 session:(id)a4 chat:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Mark message as notified recipient: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x800000000);
  if ([v8 errorCode]) {
    [v8 setErrorCode:0];
  }
  v12 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
  v13 = [v12 messageStore];
  id v14 = (id)[v13 storeMessage:v8 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x800000000];

  id v15 = [(IMNotifyRecipientCommandProcessingPipelineComponent *)self pipelineResources];
  uint64_t v16 = [v15 chatRegistry];
  [v16 updateStateForChat:v10 hintMessage:0 shouldRebuildFailedMessageDate:0];
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end