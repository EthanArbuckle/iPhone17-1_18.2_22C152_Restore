@interface IMContactStoreChangeHistoryEventsHandler
- (BOOL)receivedDropEverythingEvent;
- (void)postNotificationForCNContact:(id)a3 eventType:(unint64_t)a4 handleIDsToProcess:(id)a5;
- (void)processChangeEventForContact:(id)a3 contactFromCache:(id)a4 eventType:(unint64_t)a5 handleID:(id)a6;
- (void)processContactChangeEventForContact:(id)a3 ofEventType:(unint64_t)a4;
- (void)setReceivedDropEverythingEvent:(BOOL)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation IMContactStoreChangeHistoryEventsHandler

- (void)visitDropEverythingEvent:(id)a3
{
  id v4 = a3;
  [(IMContactStoreChangeHistoryEventsHandler *)self setReceivedDropEverythingEvent:1];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Drop everything change history event", v8, 2u);
    }
  }
  v6 = +[IMContactStore sharedInstance];
  [v6 handleDropEverythingEvent];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v7, "__mainThreadPostNotificationName:object:", IMCSChangeHistoryDropEverythingEventNotification, self);
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Add Contact change history event", v7, 2u);
    }
  }
  v6 = [v4 contact];
  [(IMContactStoreChangeHistoryEventsHandler *)self processContactChangeEventForContact:v6 ofEventType:1];
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Delete Contact change history event", buf, 2u);
    }
  }
  v6 = [v4 contactIdentifier];
  if ([v6 length])
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v6, @"__kIMCSChangeHistoryContactIdentifierKey", 0);
  }
  else
  {
    v7 = 0;
  }
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v8, "__mainThreadPostNotificationName:object:userInfo:", IMCSChangeHistoryDeleteContactEventNotification, self, v7);
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Update Contact change history event", v7, 2u);
    }
  }
  v6 = [v4 contact];
  [(IMContactStoreChangeHistoryEventsHandler *)self processContactChangeEventForContact:v6 ofEventType:2];
}

- (void)processContactChangeEventForContact:(id)a3 ofEventType:(unint64_t)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v50 = v4;
    +[IMContactStore IDsFromCNContact:v4];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (!v48)
    {
      v49 = 0;
      goto LABEL_61;
    }
    v49 = 0;
    uint64_t v45 = *(void *)v61;
    *(void *)&long long v5 = 138412290;
    long long v43 = v5;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v61 != v45)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v51 = v6;
        v8 = *(void **)(*((void *)&v60 + 1) + 8 * v6);
        v9 = +[IMContactStore sharedInstance];
        v10 = [v9 getContactForID:v8];

        id v11 = v8;
        int v12 = MEMORY[0x1A62278C0]();
        if (v10) {
          int v13 = 0;
        }
        else {
          int v13 = v12;
        }
        if (v13 != 1)
        {
          v20 = v11;
          goto LABEL_49;
        }
        v14 = +[IMContactStore sharedInstance];
        v15 = [v50 identifier];
        v16 = [v14 handleIDsForCNID:v15];

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v69 count:16];
        if (!v18)
        {

          v20 = v11;
LABEL_28:
          if ([v20 hasPrefix:@"+"])
          {
            v10 = 0;
          }
          else
          {
            v27 = +[IMContactStore IDWithCurrentLocaleITUCode:v20];
            if (IMOSLoggingEnabled())
            {
              v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v43;
                v66 = v27;
                _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
              }
            }
            v29 = +[IMContactStore sharedInstance];
            v30 = [v29 getAllKeysFromIDToCNContactMap];

            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v31 = v30;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v53;
LABEL_36:
              uint64_t v34 = 0;
              while (1)
              {
                if (*(void *)v53 != v33) {
                  objc_enumerationMutation(v31);
                }
                v35 = *(void **)(*((void *)&v52 + 1) + 8 * v34);
                if ([v35 isEqualToString:v27]) {
                  break;
                }
                v36 = [@"+" stringByAppendingString:v20];
                int v37 = [v35 isEqualToString:v36];

                if (v37)
                {
                  id v39 = [@"+" stringByAppendingString:v20];
                  goto LABEL_46;
                }
                if (v32 == ++v34)
                {
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v64 count:16];
                  if (v32) {
                    goto LABEL_36;
                  }
                  goto LABEL_43;
                }
              }
              id v39 = v35;
LABEL_46:
              id v38 = v39;

              goto LABEL_47;
            }
LABEL_43:
            id v38 = v20;
LABEL_47:

            v40 = +[IMContactStore sharedInstance];
            v10 = [v40 getContactForID:v38];

            v20 = v38;
          }
          goto LABEL_48;
        }
        v10 = 0;
        uint64_t v19 = *(void *)v57;
        v20 = v11;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if ([v22 containsString:v20])
            {
              if (IMOSLoggingEnabled())
              {
                v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v66 = v22;
                  __int16 v67 = 2112;
                  id v68 = v11;
                  _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID: %@. Previous ID was %@", buf, 0x16u);
                }
              }
              id v24 = v22;

              v25 = +[IMContactStore sharedInstance];
              uint64_t v26 = [v25 getContactForID:v24];

              v10 = (void *)v26;
              v20 = v24;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v69 count:16];
        }
        while (v18);

        if (!v10) {
          goto LABEL_28;
        }
LABEL_48:

LABEL_49:
        [(IMContactStoreChangeHistoryEventsHandler *)self processChangeEventForContact:v50 contactFromCache:v10 eventType:a4 handleID:v20];
        if ([v20 length])
        {
          v41 = v49;
          if (!v49) {
            v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          v49 = v41;
          [v41 addObject:v20];
        }

        uint64_t v6 = v51 + 1;
      }
      while (v51 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
      if (!v48)
      {
LABEL_61:

        [(IMContactStoreChangeHistoryEventsHandler *)self postNotificationForCNContact:v50 eventType:a4 handleIDsToProcess:v49];
        id v4 = v50;
        goto LABEL_62;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "Invalid Contact, not handling contact change event.", buf, 2u);
    }
  }
LABEL_62:
}

- (void)processChangeEventForContact:(id)a3 contactFromCache:(id)a4 eventType:(unint64_t)a5 handleID:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v33 = a4;
  id v10 = a6;
  id v11 = v10;
  if (a5 == 2)
  {
    id v31 = v10;
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v31;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Removing contact for ID %@ from Contact Store cache and adding the new one.", buf, 0xCu);
      }
    }
    uint64_t v18 = +[IMContactStore sharedInstance];
    [v18 replaceContact:v9 withID:v32];

    uint64_t v19 = +[IMContactStore IDsFromCNContact:v9];
    v20 = +[IMContactStore IDsFromCNContact:v33];
    v21 = (void *)[v20 mutableCopy];

    unint64_t v22 = [v21 count];
    if (v22 > [v19 count])
    {
      [v21 removeObjectsInArray:v19];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v28 = +[IMContactStore sharedInstance];
            [v28 replaceWithMutableContactForID:v27];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v24);
      }
    }
    id v11 = v32;
  }
  else if (a5 == 1)
  {
    BOOL v12 = +[IMContactStore isCNContactAKnownContact:v33];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          BOOL v15 = +[IMContactStore isCNContactAKnownContact:v33];
          v16 = @"NO";
          if (v15) {
            v16 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          v40 = v11;
          __int16 v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Not prcoessing add event for ID already known to us %@. isAKnownContact:%@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v13)
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v11;
          _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Removing contact for ID %@ from Contact Store cache and adding the new one.", buf, 0xCu);
        }
      }
      v30 = +[IMContactStore sharedInstance];
      [v30 replaceContact:v9 withID:v11];
    }
  }
}

- (void)postNotificationForCNContact:(id)a3 eventType:(unint64_t)a4 handleIDsToProcess:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 count];
  if (v8 && v10)
  {
    if (a4 == 1)
    {
      id v11 = &IMCSChangeHistoryAddContactEventNotification;
    }
    else
    {
      if (a4 != 2)
      {
        int v13 = 0;
        v14 = 0;
        goto LABEL_13;
      }
      id v11 = &IMCSChangeHistoryUpdateContactEventNotification;
    }
    int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, @"__kIMCSChangeHistoryHandleIDsKey", v8, @"__kIMCSChangeHistoryContactKey", 0);
    v14 = *v11;
LABEL_13:
    BOOL v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v15, "__mainThreadPostNotificationName:object:userInfo:", v14, self, v13);

    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "No handleIDs to process or invalid CNContact.", buf, 2u);
    }
  }
LABEL_14:
}

- (BOOL)receivedDropEverythingEvent
{
  return self->_receivedDropEverythingEvent;
}

- (void)setReceivedDropEverythingEvent:(BOOL)a3
{
  self->_receivedDropEverythingEvent = a3;
}

@end