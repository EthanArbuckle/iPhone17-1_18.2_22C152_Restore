@interface IMMessageMomentShareProcessingPipelineComponent
- (IMDiMessageIDSTrustedData)trustedData;
- (IMMessageMomentShareProcessingPipelineComponent)initWithTrustedData:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setTrustedData:(id)a3;
@end

@implementation IMMessageMomentShareProcessingPipelineComponent

- (IMMessageMomentShareProcessingPipelineComponent)initWithTrustedData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMMessageMomentShareProcessingPipelineComponent;
  v5 = [(IMMessageMomentShareProcessingPipelineComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IMMessageMomentShareProcessingPipelineComponent *)v5 setTrustedData:v4];
  }

  return v6;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [v33 messageItems];
      *(_DWORD *)buf = 138412290;
      v44 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "<IMMessageMomentShareProcessingPipelineComponent> Started processing for Messages: %@", buf, 0xCu);
    }
  }
  v5 = [v33 messageItems];
  BOOL v6 = [v5 count] == 0;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "<IMMessageMomentShareProcessingPipelineComponent> Failed to find any message items", buf, 2u);
      }
    }
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    v29 = (void *)[v28 initWithDomain:*MEMORY[0x1E4F6BE88] code:10 userInfo:0];
    id v32 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v29];
  }
  else
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
    v35 = [v33 chat];
    if (v35)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v7 = [v33 messageItems];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v8)
      {
        char v9 = 0;
        char v37 = 0;
        uint64_t v10 = *(void *)v40;
        id obj = v7;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v40 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (([v12 isTypingMessage] & 1) == 0)
            {
              char v38 = 0;
              v13 = (void *)MEMORY[0x1E4F6E898];
              v14 = [v12 balloonBundleID];
              v15 = [v12 body];
              v16 = [v12 payloadData];
              v17 = [v13 photoShareURLFromPluginBundleID:v14 contentString:v15 payload:v16 shouldAccept:&v38];

              if (v17)
              {
                if ((v9 & 1) == 0)
                {
                  v18 = [(IMMessageMomentShareProcessingPipelineComponent *)self trustedData];
                  v19 = [v18 fromIdentifier];
                  v20 = [v19 _stripFZIDPrefix];
                  v47 = v20;
                  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
                  char v22 = IMDAreAllAliasesUnknown();

                  char v37 = v22 ^ 1;
                }
                if ((v37 & 1) != 0 && v38)
                {
                  v23 = +[IMDMomentShareManager sharedInstance];
                  [v23 registerAndAcceptMomentShareForMessage:v12 inChat:v35 resetAssetTransfers:1];

                  char v9 = 1;
                  char v37 = 1;
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    v24 = OSLogHandleForIMEventCategory();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      if (v37) {
                        v25 = @"YES";
                      }
                      else {
                        v25 = @"NO";
                      }
                      *(_DWORD *)buf = 138412546;
                      if (v38) {
                        v26 = @"YES";
                      }
                      else {
                        v26 = @"NO";
                      }
                      v44 = v25;
                      __int16 v45 = 2112;
                      v46 = v26;
                      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Not accepting moment share, both isFromKnownSender (%@) and shouldAccept (%@) must be true", buf, 0x16u);
                    }
                  }
                  char v9 = 1;
                }
              }
            }
          }
          v7 = obj;
          uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v8);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = @"NO";
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Not accepting moment share hasChat: %@", buf, 0xCu);
      }
    }
    [v32 fullfillWithValue:v33];
  }

  return v32;
}

- (IMDiMessageIDSTrustedData)trustedData
{
  return self->_trustedData;
}

- (void)setTrustedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end