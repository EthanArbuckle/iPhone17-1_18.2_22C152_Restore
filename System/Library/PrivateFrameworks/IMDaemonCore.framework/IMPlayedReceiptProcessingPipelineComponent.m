@interface IMPlayedReceiptProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMPlayedReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (id)_account;
- (id)_idsAccount;
- (id)_messageStore;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_markMessageAsPlayedAndNotify:(id)a3 session:(id)a4 chat:(id)a5 date:(id)a6;
@end

@implementation IMPlayedReceiptProcessingPipelineComponent

- (IMPlayedReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPlayedReceiptProcessingPipelineComponent;
  v6 = [(IMPlayedReceiptProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)_idsAccount
{
  v2 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
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
  v2 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  return v3;
}

- (id)_messageStore
{
  v2 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 messageStore];

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v53 GUID];
      *(_DWORD *)buf = 138412290;
      v60 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMPlayedReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [v53 GUID];
        *(_DWORD *)buf = 138412290;
        v60 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "    Ignoring played receipt for message: %@", buf, 0xCu);
      }
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v53];
  }
  else
  {
    objc_super v9 = [v53 GUID];

    if (v9)
    {
      v51 = [v53 GUID];
      id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
      v11 = [v10 messageStore];
      v12 = [v11 chatsForMessageGUID:v51];

      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v60 = v51;
          __int16 v61 = 2112;
          v62 = v12;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = v12;
      uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v14)
      {
        uint64_t v50 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v55 != v50) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            v17 = (void *)MEMORY[0x1E4F1C9C8];
            v18 = [v53 timestamp];
            v19 = objc_msgSend(v17, "__im_iMessageDateFromTimeStamp:", v18);

            v20 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
            v21 = [v20 messageStore];
            v22 = [v21 messageWithGUID:v51];

            if (v22)
            {
              [v49 addObject:v22];
              uint64_t v23 = [(IMPlayedReceiptProcessingPipelineComponent *)self _account];
              v24 = [(id)v23 session];
              [(IMPlayedReceiptProcessingPipelineComponent *)self _markMessageAsPlayedAndNotify:v22 session:v24 chat:v16 date:v19];

              v25 = [v53 idsTrustedData];
              LOBYTE(v23) = [v25 isFromMe];

              if ((v23 & 1) == 0)
              {
                v26 = [v53 idsTrustedData];
                v27 = [v26 fromPushID];

                v28 = [v53 idsTrustedData];
                v29 = [v28 fromIdentifier];

                if (v27 && v29)
                {
                  v30 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
                  v31 = [v30 recentsController];
                  v32 = [v29 _stripFZIDPrefix];
                  [v31 updateLatestActiveDestination:v27 ForHandle:v32 incomingType:1];

                  v33 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
                  v34 = [v33 recentsController];
                  v35 = IMSingleObjectArray();
                  [v34 noteRecentMessageForPeople:v35];
                }
              }
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v14);
      }

      BOOL v36 = [v49 count] == 0;
      int v37 = IMOSLoggingEnabled();
      if (v36)
      {
        if (v37)
        {
          v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = [v53 GUID];
            *(_DWORD *)buf = 138412290;
            v60 = v44;
            _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Unable to mark message with GUID=%@: message not found", buf, 0xCu);
          }
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        v46 = (void *)[v45 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v46];
      }
      else
      {
        if (v37)
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = [v53 GUID];
            *(_DWORD *)buf = 138412290;
            v60 = v39;
            _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as played", buf, 0xCu);
          }
        }
        v40 = [obj firstObject];
        [v53 setChat:v40];

        v41 = (void *)[v49 copy];
        [v53 setMessageItems:v41];

        v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v53];
      }
    }
    else
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      v52 = (void *)[v42 initWithDomain:*MEMORY[0x1E4F6BE88] code:3 userInfo:0];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v52];
    }
  }

  return v8;
}

- (void)_markMessageAsPlayedAndNotify:(id)a3 session:(id)a4 chat:(id)a5 date:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v47 = a4;
  id v49 = a5;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v10;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Mark message as played: %@", buf, 0xCu);
    }
  }
  objc_msgSend(v10, "setFlags:", objc_msgSend(v10, "flags", v47) | 0x400000);
  id v13 = v11;
  if (v13)
  {
    uint64_t v14 = [v10 time];
    v15 = [v14 laterDate:v13];
  }
  else
  {
    v15 = 0;
  }
  uint64_t v16 = [v10 timeDelivered];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    if (v15)
    {
      [v10 setTimeDelivered:v15];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1C9C8] date];
      [v10 setTimeDelivered:v18];
    }
  }
  v19 = [v10 timeRead];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    if (v15)
    {
      [v10 setTimeRead:v15];
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
      [v10 setTimeRead:v21];
    }
  }
  v22 = [v10 timePlayed];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    if (v15)
    {
      [v10 setTimePlayed:v15];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1C9C8] date];
      [v10 setTimePlayed:v24];
    }
  }
  if ([v10 errorCode]) {
    [v10 setErrorCode:0];
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = [v10 guid];
      if ([v10 isExpirable]) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      int v28 = [v10 isFromMe];
      uint64_t v29 = [v10 expireState];
      if (v28) {
        v30 = @"YES";
      }
      else {
        v30 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      id v51 = v26;
      __int16 v52 = 2112;
      id v53 = v27;
      __int16 v54 = 2112;
      long long v55 = v30;
      __int16 v56 = 2048;
      uint64_t v57 = v29;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "message.GUID = %@; isExpirable = %@; isFromMe = %@; expireState = %lld",
        buf,
        0x2Au);
    }
  }
  if ([v10 isExpirable]
    && ([v10 isFromMe] & 1) == 0
    && [v10 expireState] <= 0)
  {
    int ShouldAutomaticallySave = IMMessageItemShouldAutomaticallySave();
    int v41 = IMOSLoggingEnabled();
    if (ShouldAutomaticallySave)
    {
      if (v41)
      {
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = [v10 guid];
          *(_DWORD *)buf = 138412290;
          id v51 = v43;
          _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Automatically saving received message played on linked device: %@", buf, 0xCu);
        }
      }
      uint64_t v44 = 3;
    }
    else
    {
      if (v41)
      {
        id v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = [v10 guid];
          *(_DWORD *)buf = 138412290;
          id v51 = v46;
          _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "Expire received message played on linked device: %@", buf, 0xCu);
        }
      }
      uint64_t v44 = 1;
    }
    [v10 setExpireState:v44];
    int v32 = ShouldAutomaticallySave ^ 1;
  }
  else
  {
    int ShouldAutomaticallySave = 0;
    int v32 = 0;
  }
  v33 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
  v34 = [v33 messageStore];
  id v35 = (id)[v34 storeMessage:v10 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x400000];

  BOOL v36 = [(IMPlayedReceiptProcessingPipelineComponent *)self pipelineResources];
  int v37 = [v36 chatRegistry];
  [v37 updateStateForChat:v49 hintMessage:0 shouldRebuildFailedMessageDate:0];

  if (v32)
  {
    v38 = [v10 guid];
    [v48 _updateExpireStateForMessageGUID:v38];
  }
  if (ShouldAutomaticallySave)
  {
    v39 = [v49 roomName];
    if ([v49 style] == 45) {
      uint64_t v40 = 45;
    }
    else {
      uint64_t v40 = 43;
    }
    [v48 sendSavedReceiptForMessage:v10 toChatID:0 identifier:v39 style:v40];
  }
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end