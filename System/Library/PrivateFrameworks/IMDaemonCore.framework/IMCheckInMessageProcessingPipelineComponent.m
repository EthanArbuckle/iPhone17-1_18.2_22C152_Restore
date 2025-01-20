@interface IMCheckInMessageProcessingPipelineComponent
- (IMCheckInMessageProcessingPipelineComponent)initWithAccount:(id)a3;
- (IMDAccount)account;
- (id)_getURL:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMCheckInMessageProcessingPipelineComponent

- (IMCheckInMessageProcessingPipelineComponent)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCheckInMessageProcessingPipelineComponent;
  v6 = [(IMCheckInMessageProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Started processing", buf, 2u);
    }
  }
  if ([v4 conformsToProtocol:&unk_1F33EF158])
  {
    id v6 = v4;
    v7 = [v6 balloonPluginBundleID];
    v8 = IMBalloonExtensionIDWithSuffix();
    char v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      v10 = [(IMCheckInMessageProcessingPipelineComponent *)self _getURL:v6];
      if (v10)
      {
        v11 = [v6 fromIdentifier];
        v12 = [v11 _stripFZIDPrefix];

        v13 = [MEMORY[0x1E4F6E940] sharedCoordinator];
        int v14 = objc_msgSend(v13, "shouldDropIncomingCheckInMessageWithURL:senderHandle:isFromMe:", v10, v12, objc_msgSend(v6, "isFromMe"));

        if (v14)
        {
          if (IMOSLoggingEnabled())
          {
            v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message should be dropped", v23, 2u);
            }
          }
          id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
          v17 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F6BE88] code:20 userInfo:0];
          id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v17];
        }
        else
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
          [v18 fullfillWithValue:v6];
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Unable to extract payload URL", v24, 2u);
          }
        }
        id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v6];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message is not a Check In message", v25, 2u);
        }
      }
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v6];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message is not a balloon plugin", v26, 2u);
      }
    }
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }

  return v18;
}

- (id)_getURL:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = IMExtensionPayloadUnarchivingClasses();
  id v6 = [v4 balloonPluginPayload];

  uint64_t v11 = 0;
  v7 = [v3 unarchivedObjectOfClasses:v5 fromData:v6 error:&v11];
  uint64_t v8 = v11;

  char v9 = 0;
  if (!v8 && v7)
  {
    char v9 = [v7 objectForKey:*MEMORY[0x1E4F6D330]];
  }

  return v9;
}

- (IMDAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end