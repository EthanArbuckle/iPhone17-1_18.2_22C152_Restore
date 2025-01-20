@interface IMJunkMessageProcessingPipelineComponent
- (IMDiMessageIDSTrustedData)idsTrustedData;
- (IMJunkMessageProcessingPipelineComponent)initWithIDSTrustedData:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_trackSendEventForSender:(id)a3 andReceiver:(id)a4;
@end

@implementation IMJunkMessageProcessingPipelineComponent

- (IMJunkMessageProcessingPipelineComponent)initWithIDSTrustedData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMJunkMessageProcessingPipelineComponent;
  v6 = [(IMJunkMessageProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idsTrustedData, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMJunkMessageProcessingPipelineComponent> Started processing", (uint8_t *)&v47, 2u);
    }
  }
  if (([MEMORY[0x1E4F6EA38] isiMessageJunkFilterEnabled] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Oscar is disabled", (uint8_t *)&v47, 2u);
      }
    }
    goto LABEL_46;
  }
  v6 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v7 = [v6 isInternalInstall];

  if (v7 && IMGetDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Default value set: oscar enabled.", (uint8_t *)&v47, 2u);
      }
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  v11 = [v4 messageItems];
  if ([v11 count] == 1)
  {
    v12 = [v4 messageItems];
    v13 = [v12 firstObject];
    int v14 = [v13 isTypingMessage];

    if (v14)
    {
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Message is a typing indicator, not processing for junk", (uint8_t *)&v47, 2u);
        }
      }
LABEL_46:
      id v26 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
      goto LABEL_47;
    }
  }
  else
  {
  }
  if ([v4 isFromMe])
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = [v4 fromIdentifier];
        int v47 = 138412290;
        uint64_t v48 = (uint64_t)v17;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Message is a message from me, not processing for junk: %@", (uint8_t *)&v47, 0xCu);
      }
    }
    goto LABEL_46;
  }
  v18 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v18 trackiMessageJunkEvent:2];

  LODWORD(v18) = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData isFromTrustedSender];
  int v19 = IMOSLoggingEnabled();
  if (((v9 | v18 ^ 1) & 1) == 0)
  {
    if (v19)
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Message is from trusted sender", (uint8_t *)&v47, 2u);
      }
    }
    goto LABEL_46;
  }
  if (v19)
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [v4 fromIdentifier];
      int v47 = 138412290;
      uint64_t v48 = (uint64_t)v21;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Message is not from a trusted sender, received from: %@", (uint8_t *)&v47, 0xCu);
    }
  }
  v22 = [v4 chat];
  if (!v22)
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Could not find chat, bailing", (uint8_t *)&v47, 2u);
      }
    }
    goto LABEL_64;
  }
  if (![v4 hadChat])
  {
    v29 = [v4 fromIdentifier];
    char IsKnownContact = _IMDCoreSpotlightIsKnownContact();

    if (IsKnownContact)
    {
      v31 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v31 trackiMessageJunkEvent:12];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Message is not from known sender", (uint8_t *)&v47, 2u);
        }
      }
      v36 = +[IMDAccountController sharedInstance];
      v37 = [v4 toIdentifier];
      v38 = [v4 account];
      char v39 = [v36 receiverIsCandidateForJunk:v37 forAccount:v38];

      if ((v39 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v45 = [v4 toIdentifier];
            int v47 = 138412290;
            uint64_t v48 = (uint64_t)v45;
            _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Receiver: %@ is not candidate for Oscar", (uint8_t *)&v47, 0xCu);
          }
        }
        v46 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v46 trackiMessageJunkEvent:13];

        uint64_t v34 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
        goto LABEL_65;
      }
      v40 = [MEMORY[0x1E4F6EA88] sharedInstance];
      [v40 sendReceivedJunkEventIfNeeded];

      [v22 updateIsFiltered:2];
      if (IMOSLoggingEnabled())
      {
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Chat set as junk", (uint8_t *)&v47, 2u);
        }
      }
      v42 = +[IMDChatRegistry sharedInstance];
      [v42 updateStateForChat:v22 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];

      v31 = [v4 fromIdentifier];
      v43 = [v4 toIdentifier];
      [(IMJunkMessageProcessingPipelineComponent *)self _trackSendEventForSender:v31 andReceiver:v43];
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
    [v26 fullfillWithValue:v4];
    goto LABEL_77;
  }
  if ([v22 isFiltered] == 2)
  {
    v23 = [v4 fromIdentifier];
    v24 = [v4 toIdentifier];
    [(IMJunkMessageProcessingPipelineComponent *)self _trackSendEventForSender:v23 andReceiver:v24];
  }
  else
  {
    if ([v22 isFiltered]) {
      goto LABEL_60;
    }
    v23 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v23 trackiMessageJunkEvent:12];
  }

LABEL_60:
  if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = [v22 isFiltered];
      int v47 = 134217984;
      uint64_t v48 = v33;
      _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Chat already exists, filtered as: %lld", (uint8_t *)&v47, 0xCu);
    }
  }
LABEL_64:
  uint64_t v34 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
LABEL_65:
  id v26 = (id)v34;
LABEL_77:

LABEL_47:

  return v26;
}

- (void)_trackSendEventForSender:(id)a3 andReceiver:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  uint64_t v8 = MEMORY[0x1E0169B60](v5);
  if (v8 && MEMORY[0x1E0169B60](v6))
  {
    int v9 = NSNumber;
    v10 = IMCountryCodeForNumber();
    v11 = IMCountryCodeForNumber();
    uint64_t v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isEqualToString:", v11));

    int v7 = (void *)v12;
  }
  v13 = [MEMORY[0x1E4F6E890] sharedInstance];
  v16[0] = &unk_1F33C5CA0;
  int v14 = [NSNumber numberWithBool:v8];
  v16[1] = &unk_1F33C5CB8;
  v17[0] = v14;
  v17[1] = v7;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v13 trackiMessageJunkEvent:1 withDictionary:v15];
}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
}

- (void).cxx_destruct
{
}

@end