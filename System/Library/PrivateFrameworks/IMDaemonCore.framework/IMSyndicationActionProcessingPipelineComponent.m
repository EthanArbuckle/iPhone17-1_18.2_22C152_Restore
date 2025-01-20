@interface IMSyndicationActionProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMSyndicationActionProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (id)_account;
- (id)_broadcaster;
- (id)_chatRegistry;
- (id)_messageStore;
- (id)findSMSChatForInput:(id)a3;
- (id)handleChatSyndicationAction:(id)a3 chat:(id)a4;
- (id)handleMessageSyndicationAction:(id)a3 chat:(id)a4;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMSyndicationActionProcessingPipelineComponent

- (IMSyndicationActionProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSyndicationActionProcessingPipelineComponent;
  v6 = [(IMSyndicationActionProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)_account
{
  v2 = [(IMSyndicationActionProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  return v3;
}

- (id)_messageStore
{
  v2 = [(IMSyndicationActionProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 messageStore];

  return v3;
}

- (id)_chatRegistry
{
  v2 = [(IMSyndicationActionProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 chatRegistry];

  return v3;
}

- (id)_broadcaster
{
  v2 = [(IMSyndicationActionProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 broadcaster];

  return v3;
}

- (id)handleMessageSyndicationAction:(id)a3 chat:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMSyndicationActionProcessingPipelineComponent *)self _messageStore];
  objc_super v9 = [v8 updateSyndicatedMessageWithSyndicationMessageAction:v6];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v9 guid];
        int v21 = 138412546;
        v22 = v11;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updated message: %@ with SyndicationAction: %@", (uint8_t *)&v21, 0x16u);
      }
    }
    v12 = [(IMSyndicationActionProcessingPipelineComponent *)self _broadcaster];
    v13 = [v7 accountID];
    v14 = [v7 chatIdentifier];
    uint64_t v15 = [v7 style];
    v16 = [v7 properties];
    [v12 account:v13 chat:v14 style:v15 chatProperties:v16 messageUpdated:v9];

    v17 = 0;
  }
  else
  {
    v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFD90((uint64_t)v6, v18);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    v17 = (void *)[v19 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
  }

  return v17;
}

- (id)handleChatSyndicationAction:(id)a3 chat:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 updateDonationStateWithSyndicationAction:v5];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = @"NO";
      if (v7) {
        objc_super v9 = @"YES";
      }
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Did update chat: %@. with SyndicationAction: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  return 0;
}

- (id)findSMSChatForInput:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "SyndicationAction: trying to find chat using SMS chat fallback search.", buf, 2u);
    }
  }
  id v6 = +[IMDServiceController sharedController];
  id v24 = [v6 serviceWithName:*MEMORY[0x1E4F6E1A0]];

  int v7 = +[IMDAccountController sharedInstance];
  v8 = [v7 activeAccountsForService:v24];

  objc_super v9 = [v4 participantIdentifiers];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1D9710118;
  v30[3] = &unk_1E6B73DC0;
  id v25 = v4;
  id v31 = v25;
  v10 = objc_msgSend(v9, "__imArrayByFilteringWithBlock:", v30);
  int v11 = [v10 _IDsFromURIs];

  unint64_t v12 = [v11 count];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v18 = [(IMSyndicationActionProcessingPipelineComponent *)self _chatRegistry];
        id v19 = v18;
        if (v12 <= 1)
        {
          int v21 = [v25 fromDisplayID];
          v20 = [v19 existingChatForID:v21 account:v17];
        }
        else
        {
          v20 = [v18 existingChatForIDs:v11 account:v17 style:43];
        }

        if (v20)
        {

          goto LABEL_22;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "SyndicationAction: SMS chat fallback search did not find a chat.", buf, 2u);
    }
  }
  v20 = 0;
LABEL_22:

  return v20;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 chat];
  if (!v5)
  {
    id v5 = [(IMSyndicationActionProcessingPipelineComponent *)self findSMSChatForInput:v4];
    if (!v5)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      unint64_t v12 = (void *)[v18 initWithDomain:*MEMORY[0x1E4F6BE88] code:8 userInfo:0];
      int v7 = 0;
      if (v12) {
        goto LABEL_12;
      }
    }
  }
  id v6 = [v4 createSyndicationActionWithChat:v5];
  int v7 = v6;
  if (!v6)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = [v10 initWithDomain:*MEMORY[0x1E4F6BE88] code:11 userInfo:0];
    if (!v11) {
      goto LABEL_16;
    }
    unint64_t v12 = (void *)v11;
    int v7 = 0;
LABEL_12:
    uint64_t v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFE08((uint64_t)v12, v14);
    }

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v12];
    goto LABEL_21;
  }
  int v8 = [v6 syndicatedItemType];
  if (v8 == 2)
  {
    uint64_t v9 = [(IMSyndicationActionProcessingPipelineComponent *)self handleChatSyndicationAction:v7 chat:v5];
  }
  else if (v8 == 1)
  {
    uint64_t v9 = [(IMSyndicationActionProcessingPipelineComponent *)self handleMessageSyndicationAction:v7 chat:v5];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [v13 initWithDomain:*MEMORY[0x1E4F6BE88] code:11 userInfo:0];
  }
  unint64_t v12 = (void *)v9;
  if (v9) {
    goto LABEL_12;
  }
  [v4 setSyndicationAction:v7];
LABEL_16:
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Processed SyndicationAction ok: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
LABEL_21:

  return v15;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end