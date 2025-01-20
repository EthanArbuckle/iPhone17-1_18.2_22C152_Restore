@interface IMFindChatProcessingPipelineComponent
+ (id)findGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 groupName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8 chatRegistry:(id)a9;
- (BOOL)_participantsContainBizID:(id)a3;
- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6;
- (BOOL)shouldDropDueToGroupSize:(id)a3;
- (IMFindChatProcessingPipelineComponent)initWithChatRegistry:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMFindChatProcessingPipelineComponent

- (IMFindChatProcessingPipelineComponent)initWithChatRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMFindChatProcessingPipelineComponent;
  v6 = [(IMFindChatProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_chatRegistry, a3);
  }

  return v7;
}

+ (id)findGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 groupName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8 chatRegistry:(id)a9
{
  return (id)[a9 bestCandidateGroupChatWithFromIdentifier:a3 toIdentifier:a4 displayName:a5 participants:a6 groupID:a7 serviceName:a8];
}

- (BOOL)shouldDropDueToGroupSize:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v5 = [v4 objectForKey:@"md-max-chat-participants-incoming"];

  if (v5)
  {
    uint64_t v6 = [v5 unsignedIntegerValue];
    if (!v6)
    {
LABEL_11:
      BOOL v11 = 0;
      goto LABEL_12;
    }
    unint64_t v7 = v6 + 1;
  }
  else
  {
    unint64_t v7 = 51;
  }
  unint64_t v8 = [v3 count];
  if (v8 <= v7) {
    goto LABEL_11;
  }
  unint64_t v9 = v8;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 134218240;
      unint64_t v14 = v9;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Incoming Group message has too many participants (%lu, max = %lu), should drop message", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)_participantsContainBizID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (MEMORY[0x1E0169B30](v7))
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMSharedHelperAreObjectsLogicallySame()) {
    goto LABEL_2;
  }
  if ([v10 length])
  {
    __int16 v15 = [MEMORY[0x1E4F6E7A0] sharedInstance];
    int v16 = [v15 isGroupInBlocklist:v10];

    if (v16)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_10:
        BOOL v14 = 1;
        goto LABEL_11;
      }
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "GroupID %@ was found in blocklist, dropping message", (uint8_t *)&v19, 0xCu);
      }
LABEL_8:

      goto LABEL_10;
    }
  }
  if ([(IMFindChatProcessingPipelineComponent *)self shouldDropDueToGroupSize:v11]) {
    goto LABEL_10;
  }
  if ([(IMFindChatProcessingPipelineComponent *)self _participantsContainBizID:v11])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_10;
    }
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v11;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Dropping message because participant list contains biz id. participants: %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_2:
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Started processing", buf, 2u);
    }
  }
  uint64_t v6 = [v4 chat];

  if (!v6)
  {
    id v10 = [v4 participantIdentifiers];
    BOOL v11 = (unint64_t)[v10 count] > 2;

    if (v11)
    {
      id v12 = [v4 groupID];
      id v13 = [v4 participantIdentifiers];
      BOOL v14 = [v4 fromIdentifier];
      __int16 v15 = [v4 toIdentifier];
      BOOL v16 = [(IMFindChatProcessingPipelineComponent *)self _shouldDropMessageGroupID:v12 participants:v13 fromIdentifier:v14 toIdentifier:v15];

      if (v16)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v4 groupID];
            int v19 = [v4 participantIdentifiers];
            *(_DWORD *)buf = 138412546;
            id v38 = v18;
            __int16 v39 = 2112;
            v40 = v19;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Dropping message from MessageGroupController. groupID: %@ participants: %@", buf, 0x16u);
          }
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = (void *)[v20 initWithDomain:*MEMORY[0x1E4F6BE88] code:6 userInfo:0];
        uint64_t v22 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v21];
        goto LABEL_30;
      }
      v26 = [v4 account];
      v27 = [v26 service];
      v24 = [v27 internalName];

      v28 = objc_opt_class();
      v25 = [v4 fromIdentifier];
      v29 = [v4 toIdentifier];
      v30 = [v4 currentGroupName];
      v31 = [v4 participantIdentifiers];
      v32 = [v31 _IDsFromURIs];
      v33 = [v4 groupID];
      uint64_t v21 = [v28 findGroupChatWithFromIdentifier:v25 toIdentifier:v29 groupName:v30 participants:v32 groupID:v33 serviceName:v24 chatRegistry:self->_chatRegistry];
    }
    else
    {
      chatRegistry = self->_chatRegistry;
      v24 = [v4 fromDisplayID];
      v25 = [v4 account];
      uint64_t v21 = [(IMDChatRegistry *)chatRegistry existingChatForID:v24 account:v25];
    }

    int v34 = IMOSLoggingEnabled();
    if (v21)
    {
      if (v34)
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v21;
          _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Found chat: %@", buf, 0xCu);
        }
LABEL_28:
      }
    }
    else if (v34)
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Chat not found. IMMessageLegacyProcessingPipelineComponent will create it.", buf, 2u);
      }
      goto LABEL_28;
    }
    [v4 setChat:v21];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
LABEL_30:
    long long v9 = (void *)v22;

    goto LABEL_31;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = [v4 chat];
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Found pre-supplied chat: %@", buf, 0xCu);
    }
  }
  long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
LABEL_31:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_chatRegistry, 0);
}

@end