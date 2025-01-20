@interface IMDeliveredQuietlyReceiptProcessingPipelineComponent
- (IMDeliveredQuietlyReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (IMDiMessagePipelineResources)pipelineResources;
- (id)_account;
- (id)_idsAccount;
- (id)_messageStore;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_markMessageAsDeliveredQuietlyAndNotify:(id)a3 session:(id)a4 chat:(id)a5;
@end

@implementation IMDeliveredQuietlyReceiptProcessingPipelineComponent

- (IMDeliveredQuietlyReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDeliveredQuietlyReceiptProcessingPipelineComponent;
  v6 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)_idsAccount
{
  v2 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
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
  v2 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  return v3;
}

- (id)_messageStore
{
  v2 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 messageStore];

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v38 GUID];
      *(_DWORD *)buf = 138412290;
      v46 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMDeliveredQuietlyReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [v38 GUID];
        *(_DWORD *)buf = 138412290;
        v46 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "    Ignoring delivered quietly receipt for message: %@", buf, 0xCu);
      }
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v38];
  }
  else
  {
    objc_super v9 = [v38 GUID];

    if (v9)
    {
      v10 = [v38 GUID];
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
      v12 = [v11 messageStore];
      v13 = [v12 chatsForMessageGUID:v10];

      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v10;
          __int16 v47 = 2112;
          v48 = v13;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            v20 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
            v21 = [v20 messageStore];
            v22 = [v21 messageWithGUID:v10];

            if (v22)
            {
              [v39 addObject:v22];
              v23 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self _account];
              v24 = [v23 session];
              [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self _markMessageAsDeliveredQuietlyAndNotify:v22 session:v24 chat:v19];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v16);
      }

      BOOL v25 = [v39 count] == 0;
      int v26 = IMOSLoggingEnabled();
      if (v25)
      {
        if (v26)
        {
          v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = [v38 GUID];
            *(_DWORD *)buf = 138412290;
            v46 = v34;
            _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly with GUID=%@: message not found", buf, 0xCu);
          }
        }
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        v36 = (void *)[v35 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v36];
      }
      else
      {
        if (v26)
        {
          v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = [v38 GUID];
            *(_DWORD *)buf = 138412290;
            v46 = v28;
            _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as delivered quietly", buf, 0xCu);
          }
        }
        v29 = objc_msgSend(v15, "firstObject", v38);
        [v38 setChat:v29];

        v30 = (void *)[v39 copy];
        [v38 setMessageItems:v30];

        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v38];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly with missing GUID", buf, 2u);
        }
      }
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      v10 = (void *)[v32 initWithDomain:*MEMORY[0x1E4F6BE88] code:3 userInfo:0];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v10];
    }
  }

  return v8;
}

- (void)_markMessageAsDeliveredQuietlyAndNotify:(id)a3 session:(id)a4 chat:(id)a5
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
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Mark message as delivered quietly: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x400000000);
  if ([v8 errorCode]) {
    [v8 setErrorCode:0];
  }
  v12 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
  v13 = [v12 messageStore];
  id v14 = (id)[v13 storeMessage:v8 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x400000000];

  id v15 = [(IMDeliveredQuietlyReceiptProcessingPipelineComponent *)self pipelineResources];
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