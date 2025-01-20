@interface IMDeferReplicatedMessagePipelineComponent
- (BOOL)_shouldDeferDeliveryWithInput:(id)a3;
- (BOOL)skipDeferral;
- (NSString)replicationSourceServiceNameOverride;
- (id)_runIndividuallyWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setReplicationSourceServiceNameOverride:(id)a3;
- (void)setSkipDeferral:(BOOL)a3;
@end

@implementation IMDeferReplicatedMessagePipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  if (![(IMDeferReplicatedMessagePipelineComponent *)self skipDeferral])
  {
    v5 = [MEMORY[0x1E4F6C360] sharedInstance];
    if ([v5 isInternalInstall])
    {
      int v6 = IMGetCachedDomainBoolForKey();

      if (v6)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
        dispatch_time_t v8 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D971919C;
        block[3] = &unk_1E6B73BC8;
        block[4] = self;
        id v14 = v4;
        id v9 = v7;
        id v15 = v9;
        dispatch_after(v8, MEMORY[0x1E4F14428], block);
        v10 = v15;
        id v11 = v9;

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v11 = [(IMDeferReplicatedMessagePipelineComponent *)self _runIndividuallyWithInput:v4];
LABEL_7:

  return v11;
}

- (id)_runIndividuallyWithInput:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Started processing", (uint8_t *)&v14, 2u);
    }
  }
  if ([(IMDeferReplicatedMessagePipelineComponent *)self _shouldDeferDeliveryWithInput:v4])
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [v4 GUID];
        int v14 = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Deferring message %@", (uint8_t *)&v14, 0xCu);
      }
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (void *)[v8 initWithDomain:*MEMORY[0x1E4F6BE88] code:18 userInfo:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v9];
  }
  else
  {
    id v11 = [(IMDeferReplicatedMessagePipelineComponent *)self replicationSourceServiceNameOverride];

    if (v11)
    {
      v12 = [(IMDeferReplicatedMessagePipelineComponent *)self replicationSourceServiceNameOverride];
      [v4 setReplicationSourceServiceName:v12];
    }
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }

  return v10;
}

- (BOOL)_shouldDeferDeliveryWithInput:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 replicationSourceServiceName];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v11 = [v4 GUID];
        int v24 = 138412290;
        v25 = v11;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, message is not replicated.", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v7 isInternalInstall])
  {
    int v8 = IMGetCachedDomainBoolForKey();

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = [v4 GUID];
          int v24 = 138412290;
          v25 = v10;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, default set", (uint8_t *)&v24, 0xCu);
        }
LABEL_22:

        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (![v4 isSOS])
  {
    if ([(IMDeferReplicatedMessagePipelineComponent *)self skipDeferral])
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v13 = [v4 GUID];
          int v24 = 138412290;
          v25 = v13;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, skipDeferral is set", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    uint64_t v16 = +[IMDMessageStore sharedInstance];
    v17 = [v4 GUID];
    v18 = [v16 messageWithGUID:v17];

    BOOL v14 = v18 == 0;
    if (!v18)
    {
LABEL_34:

      goto LABEL_24;
    }
    v19 = [v4 replicationSourceServiceName];
    if ([v19 isEqualToString:*MEMORY[0x1E4F6E1A0]])
    {
      v20 = [v18 service];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F6E198]];

      if (!v21) {
        goto LABEL_30;
      }
      v19 = [v18 service];
      [v4 setReplicationSourceServiceName:v19];
    }

LABEL_30:
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [v4 GUID];
        int v24 = 138412546;
        v25 = v23;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, found existing item %@", (uint8_t *)&v24, 0x16u);
      }
    }
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = [v4 GUID];
      int v24 = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, message is SOS", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_23:
  BOOL v14 = 0;
LABEL_24:

  return v14;
}

- (BOOL)skipDeferral
{
  return self->_skipDeferral;
}

- (void)setSkipDeferral:(BOOL)a3
{
  self->_skipDeferral = a3;
}

- (NSString)replicationSourceServiceNameOverride
{
  return self->_replicationSourceServiceNameOverride;
}

- (void)setReplicationSourceServiceNameOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end