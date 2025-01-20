@interface IMFindAccountProcessingPipelineComponent
- (BOOL)_isSOSWithInput:(id)a3;
- (IMDAccount)receivingAccount;
- (IMFindAccountProcessingPipelineComponent)initWithReceivingAccount:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMFindAccountProcessingPipelineComponent

- (IMFindAccountProcessingPipelineComponent)initWithReceivingAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMFindAccountProcessingPipelineComponent;
  v6 = [(IMFindAccountProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_receivingAccount, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Started processing", buf, 2u);
    }
  }
  v6 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
  v7 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
  v8 = [v7 session];

  if (!v8)
  {
    char v24 = [v6 isActive];
    int v25 = IMOSLoggingEnabled();
    if ((v24 & 1) == 0)
    {
      if (v25)
      {
        v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v53, OS_LOG_TYPE_INFO, "No service session, and the account is not active - ignoring message", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v54, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find service session", buf, 2u);
        }
      }
      id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = (void *)[v55 initWithDomain:*MEMORY[0x1E4F6BE88] code:22 userInfo:0];
      uint64_t v52 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v16];
      goto LABEL_75;
    }
    if (v25)
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No service session, and the account is active - try to create one", buf, 2u);
      }
    }
    [v6 createSessionIfNecessary];
    v27 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
    v8 = [v27 session];

    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v8;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "ServiceSession created: %@", buf, 0xCu);
      }
    }
  }
  objc_super v9 = [v4 replicationSourceServiceName];
  BOOL v10 = [v9 length] == 0;

  if (v10)
  {
    v16 = v8;
LABEL_37:
    [v4 setAccount:v6];
    [v4 setServiceSession:v16];
    if (IMOSLoggingEnabled())
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = [v4 replicationSourceServiceName];
        *(_DWORD *)buf = 138412802;
        v75 = v6;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v16;
        __int16 v78 = 2112;
        v79 = v41;
        _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Assigning account %@ service session %@ (replication source: %@)", buf, 0x20u);
      }
    }
    uint64_t v42 = IMGetCachedDomainIntForKey();
    v43 = [MEMORY[0x1E4F6C360] sharedInstance];
    char v44 = [v43 isInternalInstall];
    if (v42 > 0) {
      char v45 = v44;
    }
    else {
      char v45 = 0;
    }
    if (v45)
    {
      v46 = [v4 replicationSourceServiceName];
      BOOL v47 = [v46 length] == 0;

      if (!v47)
      {
        id v48 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
        dispatch_time_t v49 = dispatch_time(0, 1000000000 * v42);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = sub_1D9860B60;
        v71[3] = &unk_1E6B73218;
        id v50 = v48;
        id v72 = v50;
        id v73 = v4;
        dispatch_after(v49, MEMORY[0x1E4F14428], v71);
        v51 = v73;
        id v33 = v50;

        goto LABEL_76;
      }
    }
    else
    {
    }
    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    goto LABEL_75;
  }
  v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isReplicationEnabled];

  if (v12)
  {
    v13 = +[IMDAccountController sharedAccountController];
    v14 = [v4 replicationSourceServiceName];
    v15 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
    v16 = [v13 sessionForReplicationSourceServiceName:v14 replicatingAccount:v15];

    v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v13) = [v17 isSOSAlertingEnabled];

    if (v13)
    {
      BOOL v18 = [(IMFindAccountProcessingPipelineComponent *)self _isSOSWithInput:v4];
      if (!v16 && v18)
      {
        if (IMOSLoggingEnabled())
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = [v4 replicationSourceServiceName];
            v22 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
            *(_DWORD *)buf = 138412546;
            v75 = v21;
            __int16 v76 = 2112;
            uint64_t v77 = (uint64_t)v22;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Failed to find service session for replicated message with source service %@ replicating account %@, but is SOS, permitting on received iMessage account session instead", buf, 0x16u);
          }
        }
        v23 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
        v16 = [v23 session];

        if (!v16) {
          goto LABEL_58;
        }
LABEL_36:
        uint64_t v39 = [v16 account];

        v6 = (void *)v39;
        goto LABEL_37;
      }
    }
    if (!v16)
    {
LABEL_58:
      v56 = [v4 toIdentifier];
      if ([v56 length])
      {
        v57 = [v4 toIdentifier];
        int IsEmail = IMStringIsEmail();

        if (IsEmail) {
          uint64_t v59 = 17;
        }
        else {
          uint64_t v59 = 16;
        }
      }
      else
      {

        int IsEmail = 0;
        uint64_t v59 = 16;
      }
      if (IMOSLoggingEnabled())
      {
        v64 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = [v4 replicationSourceServiceName];
          uint64_t v66 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
          v67 = (void *)v66;
          v68 = @"NO";
          *(_DWORD *)buf = 138412802;
          v75 = v65;
          __int16 v76 = 2112;
          if (IsEmail) {
            v68 = @"YES";
          }
          uint64_t v77 = v66;
          __int16 v78 = 2112;
          v79 = v68;
          _os_log_impl(&dword_1D967A000, v64, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Failed to find service session for replicated message with source service %@ replicating account %@ (email alias: %@)", buf, 0x20u);
        }
      }
      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = (void *)[v69 initWithDomain:*MEMORY[0x1E4F6BE88] code:v59 userInfo:0];
      uint64_t v52 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v16];
LABEL_75:
      id v33 = (id)v52;
      goto LABEL_76;
    }
    v34 = [v16 mainSession];
    v35 = [(IMFindAccountProcessingPipelineComponent *)self receivingAccount];
    v36 = [v4 toIdentifier];
    v37 = [v36 _stripFZIDPrefix];
    char v38 = objc_msgSend(v34, "acceptsIncomingReplicatedMessagesFromAccount:toIdentifier:isSOS:", v35, v37, -[IMFindAccountProcessingPipelineComponent _isSOSWithInput:](self, "_isSOSWithInput:", v4));

    if (v38) {
      goto LABEL_36;
    }
    if (IMOSLoggingEnabled())
    {
      v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = [v4 replicationSourceServiceName];
        *(_DWORD *)buf = 138412290;
        v75 = v61;
        _os_log_impl(&dword_1D967A000, v60, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Has replication source %@ but service session rejected message, dropping", buf, 0xCu);
      }
    }
    id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
    v63 = (void *)[v62 initWithDomain:*MEMORY[0x1E4F6BE88] code:17 userInfo:0];
    id v33 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v63];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v4 replicationSourceServiceName];
        *(_DWORD *)buf = 138412290;
        v75 = v30;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Has replication source %@ but feature flag disabled, dropping message", buf, 0xCu);
      }
    }
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    v32 = (void *)[v31 initWithDomain:*MEMORY[0x1E4F6BE88] code:17 userInfo:0];
    id v33 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v32];

    v16 = v8;
  }
LABEL_76:

  return v33;
}

- (BOOL)_isSOSWithInput:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isSOS];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (IMDAccount)receivingAccount
{
  return self->_receivingAccount;
}

- (void).cxx_destruct
{
}

@end