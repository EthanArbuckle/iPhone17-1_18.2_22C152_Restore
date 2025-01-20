@interface IMAssistantIntentHandler
- (IMAssistantIntentHandler)init;
- (id)existingHandlerForIntentIdentifier:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)updateRecentlyUsedHandlersWithHandler:(id)a3;
@end

@implementation IMAssistantIntentHandler

- (IMAssistantIntentHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMAssistantIntentHandler;
  v2 = [(IMAssistantIntentHandler *)&v9 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22C1AD000, v3, OS_LOG_TYPE_INFO, "Intent Extension initialized", v8, 2u);
      }
    }
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recentIntentHandlers = v2->_recentIntentHandlers;
    v2->_recentIntentHandlers = v4;

    IMSetEmbeddedTempDirectory();
    id v6 = +[IMAssistantMessageHandler connectToIMDaemonController];
  }
  return v2;
}

- (id)handlerForIntent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [(IMAssistantIntentHandler *)self existingHandlerForIntentIdentifier:v5];
  if (v6)
  {
LABEL_17:
    [(IMAssistantIntentHandler *)self updateRecentlyUsedHandlersWithHandler:v6];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_super v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        int v13 = 138412802;
        id v14 = v10;
        __int16 v15 = 2048;
        v16 = v6;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Using %@ %p for intent %@", (uint8_t *)&v13, 0x20u);
      }
    }
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = off_264912028;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = off_264912030;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = off_264912038;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = off_264912008;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v7 = off_264912010;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v7 = &off_264912048;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_21;
              }
              v7 = off_264911FE0;
            }
          }
        }
      }
    }
  }
  id v6 = (void *)[objc_alloc(*v7) initWithIntentIdentifier:v5];
  if (v6) {
    goto LABEL_17;
  }
LABEL_21:
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Received an unknown intent: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v6 = 0;
LABEL_26:

  return v6;
}

- (id)existingHandlerForIntentIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = self->_recentIntentHandlers;
    objc_sync_enter(v5);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_recentIntentHandlers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "intentIdentifier", (void)v18);
          int v12 = [v4 isEqualToString:v11];

          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              id v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v23 = v4;
                _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Found existing handler for intent identifier: %@.", buf, 0xCu);
              }
            }
            id v13 = v10;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_16:

    objc_sync_exit(v5);
    if (!v13 && IMOSLoggingEnabled())
    {
      __int16 v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Existing handler not found for intent identifier: %@. Creating new handler.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Intent does not have an intentIdentifier set. Creating new handler.", buf, 2u);
      }
    }
    id v13 = 0;
  }

  return v13;
}

- (void)updateRecentlyUsedHandlersWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 intentIdentifier];
  uint64_t v6 = [v5 length];

  if (!v6 && IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Updating recently used intent handler cache for an intent with no intentIdentifier.", v10, 2u);
    }
  }
  uint64_t v8 = self->_recentIntentHandlers;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMutableArray *)self->_recentIntentHandlers indexOfObjectIdenticalTo:v4];
  if (v9)
  {
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_recentIntentHandlers removeObjectAtIndex:v9];
    }
    [(NSMutableArray *)self->_recentIntentHandlers insertObject:v4 atIndex:0];
    if ((unint64_t)[(NSMutableArray *)self->_recentIntentHandlers count] >= 6) {
      [(NSMutableArray *)self->_recentIntentHandlers removeLastObject];
    }
  }
  objc_sync_exit(v8);
}

- (void).cxx_destruct
{
}

@end