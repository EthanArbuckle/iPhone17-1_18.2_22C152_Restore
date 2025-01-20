@interface IMDContactStoreChangeHistoryEventsHandler
- (BOOL)receivedDropEverythingEvent;
- (IMDContactStoreChangeHistoryEventsHandler)initWithAliasToCNIDMap:(id)a3;
- (NSMutableDictionary)CNIDToAliasesMap;
- (NSMutableDictionary)aliasToCNIDMap;
- (id)generateCNIDToAliasesMapFrom:(id)a3;
- (id)getAliasToCNIDMap;
- (id)getCNIDToAliasesMap;
- (id)matchAliasesFromCacheForCNContact:(id)a3;
- (void)addAliasToCNIDToAliasMap:(id)a3 withCNID:(id)a4;
- (void)handleAddOrUpdateEventForCNContact:(id)a3;
- (void)removeAliasFromCNIDToAliasesMap:(id)a3 withCNID:(id)a4;
- (void)setAliasToCNIDMap:(id)a3;
- (void)setCNIDToAliasesMap:(id)a3;
- (void)setReceivedDropEverythingEvent:(BOOL)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation IMDContactStoreChangeHistoryEventsHandler

- (IMDContactStoreChangeHistoryEventsHandler)initWithAliasToCNIDMap:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDContactStoreChangeHistoryEventsHandler;
  v6 = [(IMDContactStoreChangeHistoryEventsHandler *)&v12 init];
  if (v6)
  {
    if (IMAdditionalContactsLoggingEnabled())
    {
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, " Initializing with alisToCNIDMap", v11, 2u);
        }
      }
      +[IMContactStore logDictionary:v5];
    }
    objc_storeStrong((id *)&v6->_aliasToCNIDMap, a3);
    uint64_t v8 = [(IMDContactStoreChangeHistoryEventsHandler *)v6 generateCNIDToAliasesMapFrom:v5];
    CNIDToAliasesMap = v6->_CNIDToAliasesMap;
    v6->_CNIDToAliasesMap = (NSMutableDictionary *)v8;
  }
  return v6;
}

- (id)getAliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (id)getCNIDToAliasesMap
{
  return self->_CNIDToAliasesMap;
}

- (id)generateCNIDToAliasesMapFrom:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A07BA584;
  v8[3] = &unk_1E5A10A30;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (void)removeAliasFromCNIDToAliasesMap:(id)a3 withCNID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 length] && objc_msgSend(v6, "length"))
  {
    v7 = [(NSMutableDictionary *)self->_CNIDToAliasesMap objectForKey:v6];
    if ([v7 containsObject:v10]) {
      [v7 removeObject:v10];
    }
    uint64_t v8 = [v7 count];
    CNIDToAliasesMap = self->_CNIDToAliasesMap;
    if (v8) {
      [(NSMutableDictionary *)CNIDToAliasesMap setObject:v7 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)CNIDToAliasesMap removeObjectForKey:v6];
    }
  }
}

- (void)addAliasToCNIDToAliasMap:(id)a3 withCNID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 length] && objc_msgSend(v6, "length"))
  {
    id v7 = [(NSMutableDictionary *)self->_CNIDToAliasesMap objectForKey:v6];
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v7 addObject:v8];
    [(NSMutableDictionary *)self->_CNIDToAliasesMap setObject:v7 forKey:v6];
  }
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Drop everything change history event", v7, 2u);
    }
  }
  aliasToCNIDMap = self->_aliasToCNIDMap;
  self->_aliasToCNIDMap = 0;

  [(IMDContactStoreChangeHistoryEventsHandler *)self setReceivedDropEverythingEvent:1];
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Add Contact change history event", v7, 2u);
    }
  }
  id v6 = [v4 contact];
  [(IMDContactStoreChangeHistoryEventsHandler *)self handleAddOrUpdateEventForCNContact:v6];
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Handling a Update Contact change history event", v7, 2u);
    }
  }
  id v6 = [v4 contact];
  [(IMDContactStoreChangeHistoryEventsHandler *)self handleAddOrUpdateEventForCNContact:v6];
}

- (void)visitDeleteContactEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Handling a Delete Contact change history event", buf, 2u);
    }
  }
  v14 = objc_msgSend(v12, "contactIdentifier", v12);
  [(NSMutableDictionary *)self->_CNIDToAliasesMap objectForKey:v14];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v9;
            _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Removing alias %@ from _aliasToCNIDMap ", buf, 0xCu);
          }
        }
        [(NSMutableDictionary *)self->_aliasToCNIDMap removeObjectForKey:v9];
        [(NSMutableDictionary *)self->_aliasToCNIDMap setObject:@"__kIMDCNPersonNotFound" forKey:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  if ([v5 count])
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Removing entry for contactIdentifier %@ from _CNIDToAliasesMap ", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_CNIDToAliasesMap removeObjectForKey:v14];
  }
}

- (void)handleAddOrUpdateEventForCNContact:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(IMDContactStoreChangeHistoryEventsHandler *)self matchAliasesFromCacheForCNContact:v4];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v35 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v9 = [(NSMutableDictionary *)self->_aliasToCNIDMap objectForKey:v8];
          if ([v9 length])
          {
            if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
            {
              id v10 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v9;
                __int16 v41 = 2112;
                uint64_t v42 = v8;
                _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, " Removing CNID %@ from _aliasToCNIDMap for alias %@", buf, 0x16u);
              }
            }
            [(NSMutableDictionary *)self->_aliasToCNIDMap removeObjectForKey:v8];
            v11 = [v4 identifier];
            [(IMDContactStoreChangeHistoryEventsHandler *)self removeAliasFromCNIDToAliasesMap:v8 withCNID:v11];
          }
          aliasToCNIDMap = self->_aliasToCNIDMap;
          v13 = [v4 identifier];
          [(NSMutableDictionary *)aliasToCNIDMap setObject:v13 forKey:v8];

          v14 = [v4 identifier];
          [(IMDContactStoreChangeHistoryEventsHandler *)self addAliasToCNIDToAliasMap:v8 withCNID:v14];

          if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
          {
            long long v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              long long v16 = [v4 identifier];
              *(_DWORD *)buf = 138412546;
              v40 = v16;
              __int16 v41 = 2112;
              uint64_t v42 = v8;
              _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, " Adding CNID %@ to _aliasToCNIDMap for alias %@", buf, 0x16u);
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v5);
    }

    CNIDToAliasesMap = self->_CNIDToAliasesMap;
    long long v18 = [v4 identifier];
    v19 = [(NSMutableDictionary *)CNIDToAliasesMap objectForKey:v18];
    v28 = (void *)[v19 mutableCopy];

    unint64_t v20 = [v28 count];
    if (v20 > [obj count])
    {
      [v28 removeObjectsInArray:obj];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v28;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            [(NSMutableDictionary *)self->_aliasToCNIDMap removeObjectForKey:v25];
            [(NSMutableDictionary *)self->_aliasToCNIDMap setObject:@"__kIMDCNPersonNotFound" forKey:v25];
            if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
            {
              v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v40 = v25;
                _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, " Removing entry for alias %@ from _aliasToCNIDMap and replacing with __kIMDCNPersonNotFound", buf, 0xCu);
              }
            }
            v27 = [v4 identifier];
            [(IMDContactStoreChangeHistoryEventsHandler *)self removeAliasFromCNIDToAliasesMap:v25 withCNID:v27];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v22);
      }
    }
  }
}

- (id)matchAliasesFromCacheForCNContact:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = +[IMContactStore IDsFromCNContact:](IMContactStore, "IDsFromCNContact:");
  v19 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_aliasToCNIDMap allKeys];
        if (([v10 containsObject:v9] & 1) == 0
          && MEMORY[0x1A62278C0](v9)
          && ([v9 hasPrefix:@"+"] & 1) == 0)
        {
          v11 = +[IMContactStore IDWithCurrentLocaleITUCode:v9];
          if (IMOSLoggingEnabled())
          {
            id v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v11;
              _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
            }
          }
          if ([v10 containsObject:v11])
          {
            [v19 removeObject:v9];
            [v19 addObject:v11];
LABEL_21:

            goto LABEL_22;
          }
          v13 = [@"+" stringByAppendingString:v9];
          int v14 = [v10 containsObject:v13];

          if (v14)
          {
            [v19 removeObject:v9];
            long long v15 = [@"+" stringByAppendingString:v9];
            [v19 addObject:v15];

            goto LABEL_21;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  long long v16 = (void *)[v19 copy];

  return v16;
}

- (BOOL)receivedDropEverythingEvent
{
  return self->_receivedDropEverythingEvent;
}

- (void)setReceivedDropEverythingEvent:(BOOL)a3
{
  self->_receivedDropEverythingEvent = a3;
}

- (NSMutableDictionary)aliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (void)setAliasToCNIDMap:(id)a3
{
}

- (NSMutableDictionary)CNIDToAliasesMap
{
  return self->_CNIDToAliasesMap;
}

- (void)setCNIDToAliasesMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNIDToAliasesMap, 0);

  objc_storeStrong((id *)&self->_aliasToCNIDMap, 0);
}

@end