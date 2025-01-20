@interface IMDContactChangeHandler
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation IMDContactChangeHandler

- (void)visitDropEverythingEvent:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Handling a Drop everything change history event", v6, 2u);
    }
  }
  v5 = +[IMDContactCache sharedInstance];
  [v5 resetCache];
}

- (void)visitAddContactEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Handling a Add Contact change history event", buf, 2u);
    }
  }
  v5 = [v3 contact];
  v6 = [MEMORY[0x1E4F6E6D8] IDsFromCNContact:v5];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Updating contact cache for handle IDs: %@", buf, 0xCu);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = +[IMDContactCache sharedInstance];
        [v13 cacheContact:v5 forKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (v8) {
    IMDCoreSpotlightReIndexForHandles(v8);
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Handling a Update Contact change history event", buf, 2u);
    }
  }
  v5 = [v3 contact];
  v6 = [MEMORY[0x1E4F6E6D8] IDsFromCNContact:v5];
  v7 = +[IMDContactCache sharedInstance];
  id v8 = [v5 identifier];
  uint64_t v9 = [v7 _handlesMatchingContactIdentifier:v8];

  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Removing entries from contact cache for handle IDs: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Updating contact cache with the new CNContact for handle IDs: %@", buf, 0xCu);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v15);
        long long v17 = +[IMDContactCache sharedInstance];
        [v17 removeCachedContactForKey:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * v21);
        v23 = +[IMDContactCache sharedInstance];
        [v23 cacheContact:v5 forKey:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  if (v18) {
    IMDCoreSpotlightReIndexForHandles(v18);
  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Handling a Delete Contact change history event", buf, 2u);
    }
  }
  v5 = [v3 contactIdentifier];
  v6 = +[IMDContactCache sharedInstance];
  v7 = [v6 _handlesMatchingContactIdentifier:v5];

  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "IMDContactChangeHandler: Removing entries from contact cache for handle IDs: %@", buf, 0xCu);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = +[IMDContactCache sharedInstance];
        [v14 removeCachedContactForKey:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (v9) {
    IMDCoreSpotlightReIndexForHandles(v9);
  }
}

@end