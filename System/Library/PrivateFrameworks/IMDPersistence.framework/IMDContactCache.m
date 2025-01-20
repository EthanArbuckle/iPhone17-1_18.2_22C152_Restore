@interface IMDContactCache
+ (BOOL)vCardCoordinateForMapURL:(id)a3 outLatitude:(float *)a4 outLongitude:(float *)a5;
+ (id)contactsForVCardAtPath:(id)a3;
+ (id)sharedInstance;
+ (id)vCardMapURLForContact:(id)a3;
+ (id)vCardNameForContact:(id)a3;
+ (void)updateAttributes:(id)a3 withAddressFromContact:(id)a4;
- (IMDContactCache)init;
- (NSCache)cache;
- (NSData)currentHistoryToken;
- (id)_handlesMatchingContactIdentifier:(id)a3;
- (id)cachedContactForKey:(id)a3;
- (void)cacheContact:(id)a3 forKey:(id)a4;
- (void)cacheContactsFromFetchResults:(id)a3 forAliases:(id)a4;
- (void)contactStoreDidChange:(id)a3;
- (void)removeCachedContactForKey:(id)a3;
- (void)resetCache;
- (void)setCache:(id)a3;
- (void)setCurrentHistoryToken:(id)a3;
- (void)updateCacheForAliases:(id)a3;
@end

@implementation IMDContactCache

+ (id)sharedInstance
{
  if (qword_1EB5ABBF0 != -1) {
    dispatch_once(&qword_1EB5ABBF0, &unk_1F084CB80);
  }
  v2 = (void *)qword_1EB5ABCD0;
  return v2;
}

- (IMDContactCache)init
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v12.receiver = self;
    v12.super_class = (Class)IMDContactCache;
    v3 = [(IMDContactCache *)&v12 init];
    if (v3)
    {
      v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      cache = v3->_cache;
      v3->_cache = v4;

      uint64_t v6 = [MEMORY[0x1E4F1C9B8] data];
      currentHistoryToken = v3->_currentHistoryToken;
      v3->_currentHistoryToken = (NSData *)v6;

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:v3 selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];
    }
    self = v3;
    v9 = self;
  }
  else
  {
    v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1AFC61E70(v10);
    }

    v9 = 0;
  }

  return v9;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)resetCache
{
  id v2 = [(IMDContactCache *)self cache];
  [v2 removeAllObjects];
}

- (void)removeCachedContactForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Removing cached contact for key %@", (uint8_t *)&v9, 0xCu);
      }
    }
    v7 = [(IMDContactCache *)self cache];
    [v7 removeObjectForKey:v4];
  }
  else if (v5)
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = 0;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "IMDContactCache - asked to remove cached contact for nil key %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)cacheContactsFromFetchResults:(id)a3 forAliases:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  if ((!v6 || !v8) && IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "IMDContactCache - not caching fetchResults as aliases: %@, fetchResults: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Caching contacts for Spotlight Contacts cache", buf, 2u);
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v6 objectForKey:v16];
        if ([v17 count])
        {
          v18 = [v17 firstObject];
          [v11 setObject:v18 forKey:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(IMDContactCache *)self updateCacheForAliases:v11];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1AFB61E00;
    v20[3] = &unk_1E5F8D508;
    v20[4] = self;
    id v21 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "DONE Caching contacts for Spotlight", buf, 2u);
    }
  }
}

- (void)updateCacheForAliases:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "IMDContactCache - asked to udpate cache with %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Udpating cache with %lu aliases", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFB61FC4;
  v8[3] = &unk_1E5F8D530;
  v8[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)cacheContact:(id)a3 forKey:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_12;
    }
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "IMDContactCache - asked to cache contact for nil key %@", (uint8_t *)&v10, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!v6)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_12;
    }
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = 0;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Not caching nil contact:%@ for key:%@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v8 = [(IMDContactCache *)self cache];
  [v8 setObject:v6 forKey:v7];

LABEL_12:
}

- (id)cachedContactForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(IMDContactCache *)self cache];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDContactCache - Cannot get cached contact for nil key", v9, 2u);
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_handlesMatchingContactIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(IMDContactCache *)self cache];
  id v7 = [v6 mapTableRepresentation];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(v7, "keyEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v7 objectForKey:v13];
        v15 = [v14 identifier];
        if ([v4 isEqualToString:v15]) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = (void *)[v5 copy];
  return v16;
}

- (void)contactStoreDidChange:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Contacts store reported a change, updating our contacts cache", buf, 2u);
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B8E0]);
  [v6 setStartingToken:self->_currentHistoryToken];
  uint64_t v7 = *MEMORY[0x1E4F1AEE0];
  v28[0] = *MEMORY[0x1E4F1ADC8];
  v28[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v6 setAdditionalContactKeyDescriptors:v8];

  uint64_t v9 = _IMDContactStore();
  id v24 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v6 error:&v24];
  id v11 = v24;

  if (!v10 && IMOSLoggingEnabled())
  {
    __int16 v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v11 description];
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Could not fetch Change History from CNContactStore error:%@", buf, 0xCu);
    }
  }
  uint64_t v14 = objc_alloc_init(IMDContactChangeHandler);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = objc_msgSend(v10, "value", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v18++) acceptEventVisitor:v14];
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v16);
  }

  long long v19 = [v10 currentHistoryToken];
  [(IMDContactCache *)self setCurrentHistoryToken:v19];
}

+ (id)contactsForVCardAtPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  id v13 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:8 error:&v13];
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "+[IMDContactCache contactsForVCardAtPath:]";
        __int16 v16 = 2112;
        id v17 = v3;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "%s Couldn't read data from file %@ ; error %@",
          buf,
          0x20u);
      }
    }
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  id v12 = 0;
  uint64_t v9 = [MEMORY[0x1E4F1B998] contactsWithData:v5 error:&v12];
  id v7 = v12;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "+[IMDContactCache contactsForVCardAtPath:]";
        __int16 v16 = 2112;
        id v17 = v3;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "%s Failed to generate vcard summary from file %@ ; error %@",
          buf,
          0x20u);
      }
    }
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  return v9;
}

+ (id)vCardNameForContact:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  if (!v4)
  {
    id v4 = [v3 organizationName];
  }

  return v4;
}

+ (void)updateAttributes:(id)a3 withAddressFromContact:(id)a4
{
  id v5 = a3;
  id v6 = [a4 postalAddresses];
  id v13 = [v6 firstObject];

  id v7 = [v13 value];
  uint64_t v8 = [v7 street];
  [v5 setThoroughfare:v8];

  uint64_t v9 = [v7 city];
  [v5 setCity:v9];

  uint64_t v10 = [v7 postalCode];
  [v5 setPostalCode:v10];

  id v11 = [v7 state];
  [v5 setStateOrProvince:v11];

  id v12 = [v7 country];
  [v5 setCountry:v12];
}

+ (id)vCardMapURLForContact:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v3 = [v18 urlAddresses];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      long long v25 = "+[IMDContactCache vCardMapURLForContact:]";
      __int16 v26 = 2117;
      id v27 = v3;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "%s urls %{sensitive}@", buf, 0x16u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 value];
        uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
        id v11 = [v10 host];
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            long long v25 = "+[IMDContactCache vCardMapURLForContact:]";
            __int16 v26 = 2112;
            id v27 = v11;
            _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "%s url host %@", buf, 0x16u);
          }
        }
        if (([v11 isEqualToString:@"maps.apple.com"] & 1) != 0
          || [v11 isEqualToString:@"maps.google.com"])
        {
          id v13 = v8;

          goto LABEL_21;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
      id v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_21:

  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v13 value];
      *(_DWORD *)buf = 136315651;
      long long v25 = "+[IMDContactCache vCardMapURLForContact:]";
      __int16 v26 = 2117;
      id v27 = v13;
      __int16 v28 = 2117;
      __int16 v29 = v15;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "%s got mapURL %{sensitive}@ value %{sensitive}@", buf, 0x20u);
    }
  }
  __int16 v16 = [v13 value];

  return v16;
}

+ (BOOL)vCardCoordinateForMapURL:(id)a3 outLatitude:(float *)a4 outLongitude:(float *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 length])
  {
    BOOL v23 = 0;
    goto LABEL_43;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  uint64_t v9 = [v8 host];
  uint64_t v10 = [MEMORY[0x1E4F29088] componentsWithURL:v8 resolvingAgainstBaseURL:0];
  id v11 = [v10 queryItems];
  v50 = v11;
  if ([v9 isEqualToString:@"maps.apple.com"])
  {
    v42 = a4;
    v44 = v10;
    v46 = v9;
    v48 = a5;
    id v41 = v7;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v19 = [v18 name];
          int v20 = [v19 isEqualToString:@"ll"];

          if (v20)
          {
            id v30 = v18;

            id v15 = v30;
            goto LABEL_30;
          }
          if (!v15)
          {
            long long v21 = [v18 name];
            int v22 = [v21 isEqualToString:@"sll"];

            if (v22) {
              id v15 = v18;
            }
            else {
              id v15 = 0;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v15 = 0;
    }
LABEL_30:

    v32 = [v15 value];
    uint64_t v31 = [v32 componentsSeparatedByString:@","];
    id v7 = v41;
    uint64_t v9 = v46;
    a5 = v48;
    a4 = v42;
    uint64_t v10 = v44;
LABEL_36:

    goto LABEL_37;
  }
  if ([v9 isEqualToString:@"maps.google.com"])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v24 = v11;
    id v15 = (id)[v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v15)
    {
      v43 = a4;
      v45 = v10;
      v47 = v9;
      v49 = a5;
      uint64_t v25 = *(void *)v52;
      while (2)
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v24);
          }
          id v27 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
          __int16 v28 = [v27 name];
          int v29 = [v28 isEqualToString:@"q"];

          if (v29)
          {
            id v15 = v27;
            goto LABEL_32;
          }
        }
        id v15 = (id)[v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_32:
      uint64_t v9 = v47;
      a5 = v49;
      a4 = v43;
      uint64_t v10 = v45;
    }

    v33 = [v15 value];
    v32 = [v33 componentsSeparatedByString:@" "];

    if ([v32 count])
    {
      v34 = [v32 objectAtIndex:0];
      uint64_t v31 = [v34 componentsSeparatedByString:@","];
    }
    else
    {
      uint64_t v31 = 0;
    }
    goto LABEL_36;
  }
  id v15 = 0;
  uint64_t v31 = 0;
LABEL_37:
  uint64_t v35 = [v31 count];
  BOOL v23 = v35 == 2;
  if (v35 == 2)
  {
    if (a4)
    {
      v36 = [v31 objectAtIndex:0];
      [v36 doubleValue];
      *(float *)&double v37 = v37;
      *a4 = *(float *)&v37;
    }
    if (a5)
    {
      v38 = [v31 objectAtIndex:1];
      [v38 doubleValue];
      *(float *)&double v39 = v39;
      *a5 = *(float *)&v39;
    }
  }

LABEL_43:
  return v23;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (void)setCurrentHistoryToken:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

@end