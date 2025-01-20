@interface IMChatSessionCloseProcessingPipelineComponent
- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3;
- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 idsTrustedData:(id)a5;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMChatSessionCloseProcessingPipelineComponent

- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMChatSessionCloseProcessingPipelineComponent;
  v6 = [(IMChatSessionCloseProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageStore, a3);
  }

  return v7;
}

- (IMChatSessionCloseProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 idsTrustedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMChatSessionCloseProcessingPipelineComponent;
  v12 = [(IMChatSessionCloseProcessingPipelineComponent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageStore, a3);
    objc_storeStrong((id *)&v13->_chatRegistry, a4);
    objc_storeStrong((id *)&v13->_idsTrustedData, a5);
  }

  return v13;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 GUID];
      *(_DWORD *)buf = 138412290;
      *(void *)v61 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMChatSessionCloseProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v4 GUID];
        *(_DWORD *)buf = 138412290;
        *(void *)v61 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "    Ignoring chat session close for message: %@", buf, 0xCu);
      }
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }
  else
  {
    uint64_t v57 = [v4 GUID];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v61 = v57;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "    Received Fresh ChatSessionClose For Message GUID: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData fromIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)v61 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "idsTrustedData: fromIdentifier: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v4 version];
        int v15 = [v14 intValue];
        id v16 = [v4 senderHandle];
        id v17 = [v4 senderName];
        v18 = [v4 conversationID];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v61 = v15;
        *(_WORD *)&v61[4] = 2112;
        *(void *)&v61[6] = v16;
        __int16 v62 = 2112;
        id v63 = v17;
        __int16 v64 = 2112;
        v65 = v18;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Eufo -> version: %d, senderHandle: %@, senderName: %@, conversationID: %@", buf, 0x26u);
      }
    }
    int v19 = objc_msgSend(v4, "isEmergencySOS", v57);
    v20 = [v4 conversationID];
    if (v19)
    {
      uint64_t v21 = [@"tsharing:" stringByAppendingString:v20];

      v20 = (void *)v21;
    }
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v61 = v20;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "chatIdentifier: %@", buf, 0xCu);
      }
    }
    chatRegistry = self->_chatRegistry;
    v24 = [v4 account];
    v25 = [(IMDChatRegistry *)chatRegistry existingChatWithIdentifier:v20 account:v24];

    int v26 = IMOSLoggingEnabled();
    if (v25)
    {
      if (v26)
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Chat FOUND, acting on the ChatSessionClose command!", buf, 2u);
        }
      }
      if ([v4 isEmergencySOS])
      {
        id v28 = objc_alloc(MEMORY[0x1E4F6EAA0]);
        v29 = [v25 emergencyUserInfo];
        v30 = [v29 emergencyUserPersona];
        v31 = [v30 senderID];
        v32 = (void *)MEMORY[0x1E4F1C9C8];
        v33 = [v4 timestamp];
        v34 = objc_msgSend(v32, "__im_iMessageDateFromTimeStamp:", v33);
        v35 = (void *)[v28 initWithSender:v31 time:v34 guid:v58 type:7];

        v36 = [v25 service];
        v37 = [v36 internalName];
        [v35 setService:v37];

        v38 = [v25 account];
        v39 = [v38 accountID];
        [v35 setAccountID:v39];

        v40 = [v25 account];
        v41 = [v40 loginID];
        [v35 setAccount:v41];
      }
      else
      {
        if ([v4 deleteConversation])
        {
          v35 = 0;
        }
        else
        {
          id v43 = objc_alloc(MEMORY[0x1E4F6E798]);
          v44 = [MEMORY[0x1E4F1C9C8] date];
          v45 = [NSString stringGUID];
          v35 = (void *)[v43 initWithSender:v20 time:v44 guid:v45 type:3];

          [v35 setActionType:0];
          v46 = [v25 service];
          v47 = [v46 internalName];
          [v35 setService:v47];

          v48 = [v25 account];
          v49 = [v48 accountID];
          [v35 setAccountID:v49];

          v50 = [v25 account];
          v51 = [v50 loginID];
          [v35 setAccount:v51];
        }
        [v25 deleteBIAContext];
      }
      if (v35)
      {
        v52 = [(IMDMessageStore *)self->_messageStore storeItem:v35 forceReplace:0];
        v53 = +[IMDChatStore sharedInstance];
        v54 = [v52 guid];
        [v53 addMessageWithGUID:v54 toChat:v25];

        v59 = v52;
        v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        [v4 setMessageItems:v55];
        [v4 setChat:v25];
      }
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    }
    else
    {
      if (v26)
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Chat not found, dropping ChatSessionClose command!", buf, 2u);
        }
      }
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end