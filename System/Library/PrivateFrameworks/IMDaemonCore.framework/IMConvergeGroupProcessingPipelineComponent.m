@interface IMConvergeGroupProcessingPipelineComponent
- (IMConvergeGroupProcessingPipelineComponent)initWithIDSTrustedData:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMConvergeGroupProcessingPipelineComponent

- (IMConvergeGroupProcessingPipelineComponent)initWithIDSTrustedData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMConvergeGroupProcessingPipelineComponent;
  v6 = [(IMConvergeGroupProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idsTrustedData, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 chat];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> Started processing for chat: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    if ([v4 style] != 43) {
      goto LABEL_24;
    }
    v6 = [v3 GUID];
    if (v6)
    {
      v7 = +[IMDMessageStore sharedInstance];
      v8 = [v7 messageWithGUID:v6];

      objc_super v9 = +[IMDServiceController sharedController];
      v10 = [v3 replicationSourceServiceName];
      v25 = [v9 serviceWithName:v10];

      if (v8)
      {
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> already have message - nothing to converge", buf, 2u);
          }
        }
      }
      else
      {
        v24 = [v3 serviceSession];
        v23 = [v3 account];
        v22 = [v3 groupID];
        v21 = [v3 participantIdentifiers];
        v13 = [v3 fromIdentifier];
        v14 = [v3 toIdentifier];
        v15 = [v3 groupParticipantVersion];
        v16 = [v3 groupProtocolVersion];
        v17 = [v3 timestamp];
        v18 = [v3 groupPhotoCreationTime];
        [v4 _convergeGroupChatIfNeededWithServiceSession:v24 account:v23 replicationService:v25 groupID:v22 incomingParticipants:v21 fromIdentifier:v13 toIdentifier:v14 receivedGroupParticipantVersion:v15 receivedGroupProtocolVersion:v16 messageTimeStamp:v17 groupPhotoCreationTime:v18];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> missing message guid", buf, 2u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_24;
    }
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> No chat found, nothing to converge", buf, 2u);
    }
  }

LABEL_24:
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];

  return v19;
}

- (void).cxx_destruct
{
}

@end