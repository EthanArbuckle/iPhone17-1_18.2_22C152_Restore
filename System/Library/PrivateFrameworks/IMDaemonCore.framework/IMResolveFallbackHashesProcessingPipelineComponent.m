@interface IMResolveFallbackHashesProcessingPipelineComponent
- (id)_associatedMessageGUIDForInput:(id)a3 error:(id *)a4;
- (id)_messageGUIDForInput:(id)a3 providedGUID:(id)a4 fallbackHash:(id)a5;
- (id)_messageGUIDForMessageWithFallbackHash:(id)a3 chat:(id)a4;
- (id)_threadIdentifierForInput:(id)a3 error:(id *)a4;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMResolveFallbackHashesProcessingPipelineComponent

- (id)_associatedMessageGUIDForInput:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 associatedMessageGUID];
  v8 = [v6 associatedMessageFallbackHash];
  v9 = [v6 replicationSourceServiceName];
  if ([v9 length] && objc_msgSend(v7, "length"))
  {
    v10 = IMAssociatedMessageDecodeGUID();
    uint64_t v11 = [(IMResolveFallbackHashesProcessingPipelineComponent *)self _messageGUIDForInput:v6 providedGUID:v10 fallbackHash:v8];
    v12 = (void *)v11;
    if (v11)
    {
      if ((void *)v11 == v10)
      {
        id v16 = v7;
      }
      else
      {
        v13 = [v6 associatedMessageGUID];
        uint64_t v14 = IMAssociatedMessageDecodePartIndex();

        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v15 = 0;
        }
        else {
          uint64_t v15 = v14;
        }
        id v16 = (id)[[NSString alloc] initWithFormat:@"p:%ld/%@", v15, v12];
      }
      id v17 = v16;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = [v8 length];
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no source message GUID for fallback hash with length %llu, rejecting replicated message", buf, 0xCu);
        }
      }
      if (a4)
      {
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v17 = 0;
        *a4 = (id)[v19 initWithDomain:*MEMORY[0x1E4F6BE88] code:17 userInfo:0];
      }
      else
      {
        id v17 = 0;
      }
    }
  }
  else
  {
    id v17 = v7;
  }

  return v17;
}

- (id)_threadIdentifierForInput:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 threadIdentifierGUID];
  v8 = [v6 threadOriginatorFallbackHash];
  v9 = [v6 replicationSourceServiceName];
  if ([v9 length] && objc_msgSend(v7, "length"))
  {
    IMMessageThreadIdentifierGetComponents();
    id v10 = 0;
    id v11 = 0;
    v12 = v11;
    if (v10 && v11)
    {
      uint64_t v13 = [(IMResolveFallbackHashesProcessingPipelineComponent *)self _messageGUIDForInput:v6 providedGUID:v10 fallbackHash:v8];
      uint64_t v14 = (void *)v13;
      if (v13)
      {
        if ((id)v13 == v10) {
          id ThreadIdentifierWithComponents = v7;
        }
        else {
          id ThreadIdentifierWithComponents = (id)IMMessageCreateThreadIdentifierWithComponents();
        }
        id v16 = ThreadIdentifierWithComponents;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v21 = [v8 length];
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no source message GUID for fallback hash with length %llu, rejecting replicated message", buf, 0xCu);
          }
        }
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v16 = 0;
          *a4 = (id)[v18 initWithDomain:*MEMORY[0x1E4F6BE88] code:17 userInfo:0];
        }
        else
        {
          id v16 = 0;
        }
      }
    }
    else
    {
      id v16 = v7;
    }
  }
  else
  {
    id v16 = v7;
  }

  return v16;
}

- (id)_messageGUIDForInput:(id)a3 providedGUID:(id)a4 fallbackHash:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 replicationSourceServiceName];
  if (v11)
  {
    v12 = +[IMDMessageStore sharedInstance];
    uint64_t v13 = [v12 messageWithGUID:v9];

    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          id v23 = v9;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found existing message for GUID %@", (uint8_t *)&v22, 0xCu);
        }
      }
      id v15 = v9;
LABEL_8:

      goto LABEL_23;
    }
    if ([v10 length])
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          id v23 = v9;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no existing message for GUID %@, using fallback hash", (uint8_t *)&v22, 0xCu);
        }
      }
      id v17 = [v8 chat];
      id v15 = [(IMResolveFallbackHashesProcessingPipelineComponent *)self _messageGUIDForMessageWithFallbackHash:v10 chat:v17];

      if (v15) {
        goto LABEL_8;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v10 length];
      int v22 = 138412546;
      id v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> No existing message found with provided GUID %@ or fallbackHash (len: %llu)", (uint8_t *)&v22, 0x16u);
    }
  }
  if ([v8 isFromMe]) {
    v20 = v9;
  }
  else {
    v20 = 0;
  }
  id v15 = v20;
LABEL_23:

  return v15;
}

- (id)_messageGUIDForMessageWithFallbackHash:(id)a3 chat:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = +[IMDMessageStore sharedInstance];
    id v8 = [v7 sortedMessageItemsWithFallbackHash:v5 inChat:v6 limit:1];
    id v9 = [v8 firstObject];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v9 guid];
        int v14 = 138412546;
        id v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = [v5 length];
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found message %@ for fallback hash with length %llu", (uint8_t *)&v14, 0x16u);
      }
    }
    v12 = [v9 guid];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Started processing", buf, 2u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v13 = 0;
    id v6 = [(IMResolveFallbackHashesProcessingPipelineComponent *)self _associatedMessageGUIDForInput:v4 error:&v13];
    id v7 = v13;
    if (v7)
    {
      id v8 = v7;
LABEL_12:
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v8];
      goto LABEL_14;
    }
    [v4 setAssociatedMessageGUID:v6];
  }
  id v12 = 0;
  id v6 = [(IMResolveFallbackHashesProcessingPipelineComponent *)self _threadIdentifierForInput:v4 error:&v12];
  id v8 = v12;
  if (v8) {
    goto LABEL_12;
  }
  [v4 setThreadIdentifierGUID:v6];
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
LABEL_14:
  id v10 = (void *)v9;

  return v10;
}

@end