@interface CKContactKeyVerificationRecipientsHelper
+ (BOOL)shouldShowVerifiedIconForRecipient:(id)a3 inChat:(id)a4;
+ (id)recipientsToUpdateForUpdatedCKVHandles:(id)a3 recipients:(id)a4 inConversation:(id)a5;
@end

@implementation CKContactKeyVerificationRecipientsHelper

+ (id)recipientsToUpdateForUpdatedCKVHandles:(id)a3 recipients:(id)a4 inConversation:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  v8 = [v29 lastAddressedHandle];
  v31 = [v8 _stripFZIDPrefix];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) _stripFZIDPrefix];
        int v13 = [v12 isEqualToString:v31];

        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Updating atom state for all recipients because self status changed.", buf, 2u);
            }
          }
          id v34 = v30;

          goto LABEL_40;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v34 = (id)objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v30;
  uint64_t v36 = [v32 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v44;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v35)
        {
          uint64_t v15 = v14;
          objc_enumerationMutation(v32);
          uint64_t v14 = v15;
        }
        uint64_t v37 = v14;
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
        if ([v16 isGroup])
        {
          [v34 addObject:v16];
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v38 = obj;
          uint64_t v17 = [v38 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v40;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v38);
                }
                v20 = [*(id *)(*((void *)&v39 + 1) + 8 * j) _stripFZIDPrefix];
                v21 = [v16 normalizedAddress];
                v22 = [v21 _stripFZIDPrefix];
                if ([v22 isEqualToString:v20])
                {

LABEL_27:
                  [v34 addObject:v16];

                  goto LABEL_28;
                }
                v23 = [v16 address];
                v24 = [v23 _stripFZIDPrefix];
                int v25 = [v24 isEqualToString:v20];

                if (v25) {
                  goto LABEL_27;
                }
              }
              uint64_t v17 = [v38 countByEnumeratingWithState:&v39 objects:v53 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_28:
        }
        uint64_t v14 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [v32 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v36);
  }

  if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v34;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Recipients to update: %@", buf, 0xCu);
    }
  }
LABEL_40:

  return v34;
}

+ (BOOL)shouldShowVerifiedIconForRecipient:(id)a3 inChat:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6BCF0] sharedController];
  int v8 = [v7 selfOptedIn];

  if (!v8) {
    goto LABEL_5;
  }
  if (![v5 isGroup])
  {
    uint64_t v10 = [v5 address];

    if (!v10) {
      goto LABEL_15;
    }
    v11 = [v5 normalizedAddress];
    v12 = IMStripFormattingFromAddress();

    int v13 = [MEMORY[0x1E4F6BCF0] sharedController];
    unint64_t v9 = [v13 contactKeyVerificationStatusForHandleID:v12 inChat:v6];

    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 134218498;
        unint64_t v17 = v9;
        __int16 v18 = 2112;
        v19 = v12;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Setting kt status %lu to set atom state for address: %@ in chat: %@", (uint8_t *)&v16, 0x20u);
      }
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  unint64_t v9 = [v6 keyTransparencyStatusForAffectedHandles:0];
LABEL_12:
  if (v9 <= 0xE) {
    LODWORD(v10) = (0x110u >> v9) & 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
LABEL_15:

  return (char)v10;
}

@end