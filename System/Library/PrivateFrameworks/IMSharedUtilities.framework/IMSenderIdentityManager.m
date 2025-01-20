@interface IMSenderIdentityManager
+ (BOOL)isTUSenderIdentity:(id)a3 equalToSubscriptionContext:(id)a4;
+ (id)sharedInstance;
- (CNGeminiManager)geminiManager;
- (IMSenderIdentityManager)init;
- (id)bestSenderIdentityForGeminiHandle:(id)a3 contact:(id)a4;
- (id)bestSenderIdentityForHandleID:(id)a3 contact:(id)a4;
- (id)bestSenderIdentityForHandleIDs:(id)a3;
- (id)contactPreferredSenderIdentityForHandleID:(id)a3 contact:(id)a4;
- (void)setGeminiManager:(id)a3;
@end

@implementation IMSenderIdentityManager

+ (id)sharedInstance
{
  if (qword_1EB4A6738 != -1) {
    dispatch_once(&qword_1EB4A6738, &unk_1EF2BF9E0);
  }
  v2 = (void *)qword_1EB4A66A0;

  return v2;
}

- (IMSenderIdentityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMSenderIdentityManager;
  v2 = [(IMSenderIdentityManager *)&v6 init];
  if (v2)
  {
    if (qword_1E94FE770 != -1) {
      dispatch_once(&qword_1E94FE770, &unk_1EF2C05A0);
    }
    v3 = (CNGeminiManager *)objc_alloc_init((Class)MEMORY[0x1A6227910](@"CNGeminiManager", @"Contacts"));
    geminiManager = v2->_geminiManager;
    v2->_geminiManager = v3;
  }
  return v2;
}

- (id)bestSenderIdentityForHandleIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      uint64_t v8 = 0;
      id v9 = v5;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = -[IMSenderIdentityManager bestSenderIdentityForHandleID:contact:](self, "bestSenderIdentityForHandleID:contact:", *(void *)(*((void *)&v18 + 1) + 8 * v8), 0, (void)v18);
        v5 = v10;
        if (v9)
        {
          if (v10)
          {
            v11 = [v10 accountUUID];
            v12 = [v9 accountUUID];
            char v13 = [v11 isEqual:v12];

            if ((v13 & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v23 = v9;
                  __int16 v24 = 2112;
                  id v25 = v5;
                  _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Chat had recipients with different contact preferred subscriptions (%@ / %@). Returning nil.", buf, 0x16u);
                }
              }
              v15 = 0;
              goto LABEL_21;
            }
          }
        }

        ++v8;
        id v9 = v5;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Best sender identity :%@ for handleIDs :%@", buf, 0x16u);
    }
  }
  id v9 = v5;
  v15 = v9;
LABEL_21:

  return v15;
}

- (id)bestSenderIdentityForHandleID:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v7 || v8)
  {
    v11 = (void *)[objc_alloc((Class)qword_1E94FE798) initWithString:v6 type:-1];
    v10 = [(IMSenderIdentityManager *)self bestSenderIdentityForGeminiHandle:v11 contact:v7];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v13 = 0;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "bestSenderIdentityForHandleID: called with empty handle and no contact", v13, 2u);
      }
    }
    v10 = 0;
  }

  return v10;
}

- (id)contactPreferredSenderIdentityForHandleID:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v7 || v8)
  {
    v11 = [(IMSenderIdentityManager *)self geminiManager];
    id v18 = 0;
    v12 = [v11 geminiResultForContact:v7 error:&v18];
    id v13 = v18;

    if ([v12 usage] == 1)
    {
      v14 = [(IMSenderIdentityManager *)self geminiManager];
      id v17 = v13;
      v10 = [v14 bestSenderIdentityForContact:v7 error:&v17];
      id v15 = v17;

      id v13 = v15;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "contactPreferredSenderIdentityForHandleID: called with empty handle and no contact", buf, 2u);
      }
    }
    v10 = 0;
  }

  return v10;
}

- (id)bestSenderIdentityForGeminiHandle:(id)a3 contact:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[IMContactStore isCNContactAKnownContact:v7])
  {
    uint64_t v8 = [(IMSenderIdentityManager *)self geminiManager];
    id v32 = 0;
    id v9 = [v8 bestSenderIdentityForContact:v7 error:&v32];
    id v10 = v32;

    goto LABEL_12;
  }
  v11 = [v6 stringValue];
  uint64_t v12 = [v11 length];

  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v6;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: called with handle that has nil contact: %@. Attempting to find with TU handle %@.", buf, 0x16u);
      }
    }
    id v15 = [(IMSenderIdentityManager *)self geminiManager];
    id v16 = objc_alloc_init((Class)qword_1EB4A65A8);
    id v31 = 0;
    id v9 = [v15 bestSenderIdentityForHandle:v6 contactStore:v16 error:&v31];
    id v10 = v31;

    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v9 handle];
        long long v19 = [v18 value];
        *(_DWORD *)buf = 138412290;
        id v34 = v19;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: returned handle %@.", buf, 0xCu);
      }
    }
LABEL_12:
    if (v10 && IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "IMSenderIdentityManager: Error fetching sender identity: %@", buf, 0xCu);
      }
    }
    if (v9) {
      goto LABEL_40;
    }
    goto LABEL_24;
  }
  if (v13)
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: called with empty handle and no contact", buf, 2u);
    }
  }
  id v10 = 0;
LABEL_24:
  v22 = (void *)MEMORY[0x1A6227910](@"TUCallCenter", @"TelephonyUtilities");
  if (!v22)
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Failed to weak link TUCallCenter", buf, 2u);
      }
    }
    goto LABEL_35;
  }
  id v23 = [v22 sharedInstance];
  __int16 v24 = [v23 providerManager];
  id v25 = [v24 telephonyProvider];

  v26 = [v25 prioritizedSenderIdentities];
  id v9 = [v26 firstObject];

  if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v9;
      _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "TUCallProvider provided prioritized sender identity: %@", buf, 0xCu);
    }
  }
  if (!v9)
  {
LABEL_35:
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "IMSenderIdentityManager: bestSenderIdentityForGeminiHandle:contact: returning nil sender identity", buf, 2u);
      }
    }
    id v9 = 0;
  }
LABEL_40:

  return v9;
}

+ (BOOL)isTUSenderIdentity:(id)a3 equalToSubscriptionContext:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  id v5 = a4;
  id v6 = [a3 accountUUID];
  id v7 = [v6 UUIDString];
  uint64_t v8 = [v5 labelID];

  LOBYTE(v5) = [v7 isEqualToString:v8];
  return (char)v5;
}

- (CNGeminiManager)geminiManager
{
  return self->_geminiManager;
}

- (void)setGeminiManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end