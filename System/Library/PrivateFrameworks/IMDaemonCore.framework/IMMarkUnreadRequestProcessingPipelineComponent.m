@interface IMMarkUnreadRequestProcessingPipelineComponent
- (IMMarkUnreadRequestProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMMarkUnreadRequestProcessingPipelineComponent

- (IMMarkUnreadRequestProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMMarkUnreadRequestProcessingPipelineComponent;
  v15 = [(IMMarkUnreadRequestProcessingPipelineComponent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageStore, a3);
    objc_storeStrong((id *)&v16->_chatRegistry, a4);
    objc_storeStrong((id *)&v16->_recents, a5);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 GUID];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "<IMMarkUnreadRequestProcessingPipelineComponent> Started processing mark unread request for message GUID: %@", buf, 0xCu);
    }
  }
  if ([v4 isFromMe])
  {
    v7 = [(IMDMessageStore *)self->_messageStore messageWithGUID:v5];
    if ([v5 length] && v7)
    {
      if ([(IMDMessageStore *)self->_messageStore markMessageGUIDUnread:v5])
      {
        if (IMOSLoggingEnabled())
        {
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v5;
            _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Successfully marked message (%@) as unread", buf, 0xCu);
          }
        }
        v9 = [(IMDMessageStore *)self->_messageStore chatsForMessageGUID:v5];
        v10 = [v9 firstObject];
        [v4 setChat:v10];

        v17 = v7;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        [v4 setMessageItems:v11];
      }
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      v15 = (void *)[v14 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v15];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Ignoring mark unread request not from me for message: %@", buf, 0xCu);
      }
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);

  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end