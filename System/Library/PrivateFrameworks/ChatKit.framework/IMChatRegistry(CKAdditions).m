@interface IMChatRegistry(CKAdditions)
- (id)_ck_chatForHandles:()CKAdditions displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:;
- (uint64_t)_ck_chatForHandles:()CKAdditions createIfNecessary:;
@end

@implementation IMChatRegistry(CKAdditions)

- (id)_ck_chatForHandles:()CKAdditions displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v44 = a4;
  id v42 = a5;
  id v43 = a6;
  v45 = v15;
  if (CKIsRunningUITests())
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v58 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = [*(id *)(*((void *)&v57 + 1) + 8 * i) ID];
          if ([v21 _appearsToBePhoneNumber])
          {
            uint64_t v22 = IMInternationalForPhoneNumberWithOptions();

            v21 = (void *)v22;
          }
          v23 = IMStripFormattingFromAddress();
          [v16 addObject:v23];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v18);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v24 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    obuint64_t j = [v24 simulatedChats];

    uint64_t v48 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v54;
      while (2)
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          v27 = [MEMORY[0x1E4F1CA80] set];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v28 = [v26 participants];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v65 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v50;
            do
            {
              for (uint64_t k = 0; k != v29; ++k)
              {
                if (*(void *)v50 != v30) {
                  objc_enumerationMutation(v28);
                }
                v32 = [*(id *)(*((void *)&v49 + 1) + 8 * k) ID];
                v33 = IMStripFormattingFromAddress();
                [v27 addObject:v33];
              }
              uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v65 count:16];
            }
            while (v29);
          }

          v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
          int v35 = [v27 isEqualToSet:v34];

          if (v35)
          {
            id v36 = v26;

            goto LABEL_32;
          }
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }
    id v36 = 0;
LABEL_32:
  }
  else if ((unint64_t)[v15 count] < 2)
  {
    if ([v15 count] == 1)
    {
      v38 = [v15 objectAtIndex:0];
      id v36 = [a1 existingChatWithHandle:v38 allowAlternativeService:0];
      if (!v36 && a9)
      {
        if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v62 = v42;
            __int16 v63 = 2112;
            id v64 = v43;
            _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Creating chat with last addressed handle %@ last addressed sim ID %@", buf, 0x16u);
          }
        }
        id v36 = [a1 chatWithHandle:v38 lastAddressedHandle:v42 lastAddressedSIMID:v43];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v15;
          _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_DEBUG, "Bad recipients for conversation request. %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      id v36 = 0;
    }
  }
  else
  {
    if (a8)
    {
      id v36 = [a1 existingChatWithHandles:v15 allowAlternativeService:0 groupID:0 displayName:v44 joinedChatsOnly:a7];
      if (v36) {
        goto LABEL_33;
      }
    }
    else
    {
      id v36 = 0;
    }
    if (a9)
    {
      if (IMOSLoggingEnabled())
      {
        v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v62 = v42;
          __int16 v63 = 2112;
          id v64 = v43;
          _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "Creating group chat with last addressed handle %@ last addressed sim ID %@", buf, 0x16u);
        }
      }
      id v36 = [a1 chatWithHandles:v45 displayName:v44 joinedChatsOnly:a7 findMatchingNamedGroups:a8 lastAddressedHandle:v42 lastAddressedSIMID:v43];
    }
  }
LABEL_33:

  return v36;
}

- (uint64_t)_ck_chatForHandles:()CKAdditions createIfNecessary:
{
  LOBYTE(v5) = a4;
  return objc_msgSend(a1, "_ck_chatForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:", a3, 0, 0, 0, 1, 1, v5);
}

@end