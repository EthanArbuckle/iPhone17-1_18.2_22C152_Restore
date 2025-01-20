@interface IMRecoverJunkCommandProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMRecoverJunkCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMRecoverJunkCommandProcessingPipelineComponent

- (IMRecoverJunkCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRecoverJunkCommandProcessingPipelineComponent;
  v6 = [(IMRecoverJunkCommandProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v23 = [v22 GUID];
  int v4 = IMOSLoggingEnabled();
  if (!v23)
  {
    if (v4)
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Ignoring recover junk chat command, no message guid received", buf, 2u);
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v23;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMRecoverJunkCommandProcessingPipelineComponent> Started processing recover junk command for message GUID: %@", buf, 0xCu);
    }
  }
  if (([v22 isFromMe] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v23;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Ignoring recover junk command not from me for message: %@", buf, 0xCu);
      }
    }
LABEL_38:
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v22];
    goto LABEL_39;
  }
  v6 = [(IMRecoverJunkCommandProcessingPipelineComponent *)self pipelineResources];
  v7 = [v6 messageStore];
  v8 = [v7 chatsForMessageGUID:v23];

  if (IMOSLoggingEnabled())
  {
    objc_super v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v23;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Found chats for message guid: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found chats: %@", buf, 0xCu);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v15 isFiltered] == 2)
        {
          [v15 updateIsRecovered:1];
          [v15 updateIsFiltered:1];
        }
        else if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = [v15 isFiltered];
            *(_DWORD *)buf = 134218242;
            uint64_t v29 = v17;
            __int16 v30 = 2112;
            v31 = v15;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Chat is already out of Junk: %lld, not recovering: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v22];
LABEL_39:

  return v18;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end