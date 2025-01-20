@interface IMSeenAsOffGridProcessingPipelineComponent
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMSeenAsOffGridProcessingPipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Started processing", v24, 2u);
    }
  }
  if (([v3 seenAsOffGrid] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Not seen as off grid", v24, 2u);
      }
    }
    goto LABEL_29;
  }
  v5 = [v3 lastPublisherOfOffGridStatus];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Missing identifier of last published status, not attempting to recover", v24, 2u);
      }
    }
LABEL_29:
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
    goto LABEL_41;
  }
  v7 = [MEMORY[0x1E4F6B548] sharedInstance];
  v8 = [v7 pushToken];

  v9 = objc_msgSend(v8, "__imHexString");
  v10 = [v3 lastPublisherOfOffGridStatus];
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = [v9 isEqualToString:v10];
      v13 = @"NO";
      *(_DWORD *)v24 = 138412802;
      *(void *)&v24[4] = v8;
      *(_WORD *)&v24[12] = 2112;
      if (v12) {
        v13 = @"YES";
      }
      *(void *)&v24[14] = v10;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Our token %@, token of last publisher %@, same? %@", v24, 0x20u);
    }
  }
  if (objc_msgSend(v9, "isEqualToString:", v10, *(_OWORD *)v24))
  {
    v14 = +[IMDAccountController sharedInstance];
    v15 = [v14 anySessionForServiceName:*MEMORY[0x1E4F6E1B8]];

    LODWORD(v14) = [v3 seenAsOffGrid];
    int v16 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v16)
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Sender sees us as off grid", v24, 2u);
        }
      }
      [v15 republishOffGridStatusIfNecessary];
    }
    else if (v16)
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Not seen as off grid", v24, 2u);
      }
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "<IMSeenAsOffGridProcessingPipelineComponent> Last published off grid status was not from our device, not attempting to recover", v24, 2u);
      }
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
  }

LABEL_41:

  return v20;
}

@end