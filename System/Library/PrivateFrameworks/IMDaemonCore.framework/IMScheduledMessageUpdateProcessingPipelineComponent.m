@interface IMScheduledMessageUpdateProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMScheduledMessageUpdateProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMScheduledMessageUpdateProcessingPipelineComponent

- (IMScheduledMessageUpdateProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMScheduledMessageUpdateProcessingPipelineComponent;
  v6 = [(IMScheduledMessageUpdateProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMScheduledMessageUpdateProcessingPipelineParameter> Started processing", (uint8_t *)&v25, 2u);
    }
  }
  if ([v4 isFromMe])
  {
    v6 = [v4 GUID];
    v7 = [(IMScheduledMessageUpdateProcessingPipelineComponent *)self pipelineResources];
    v8 = [v7 messageStore];
    objc_super v9 = [v8 messageWithGUID:v6];

    if ([v6 length] && v9)
    {
      v10 = [v4 scheduleState];
      BOOL v11 = v10 == 0;

      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Not Processing. Did not find update for any property on scheduled message", (uint8_t *)&v25, 2u);
          }
        }
        id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
      }
      else
      {
        v12 = [v4 scheduleState];
        objc_msgSend(v9, "setScheduleState:", (int)objc_msgSend(v12, "intValue"));

        v13 = [(IMScheduledMessageUpdateProcessingPipelineComponent *)self pipelineResources];
        v14 = [v13 messageStore];
        id v15 = (id)[v14 storeMessage:v9 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0];

        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [v4 scheduleState];
            int v25 = 138412546;
            v26 = v6;
            __int16 v27 = 2112;
            v28 = v17;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Stored scheduled message %@ with scheduleState %@", (uint8_t *)&v25, 0x16u);
          }
        }
        id v18 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
        [v18 fullfillWithValue:v4];
      }
    }
    else
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      v22 = (void *)[v21 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v22];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [v4 fromIdentifier];
        int v25 = 138412290;
        v26 = v20;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Scheduled Message update is not from me, not processing: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }

  return v18;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end