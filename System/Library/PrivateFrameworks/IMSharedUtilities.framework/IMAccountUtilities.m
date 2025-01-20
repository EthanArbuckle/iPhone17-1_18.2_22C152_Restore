@interface IMAccountUtilities
+ (BOOL)_hasMadridIDSAccountForSending;
+ (BOOL)_isApprovedForRelayWithAllAccounts:(id)a3 account:(id)a4;
+ (BOOL)isAccountOperationalWithAllAccounts:(id)a3 account:(id)a4;
+ (BOOL)isAccountRegistered:(id)a3;
+ (BOOL)isAccountUsableForSendingWithAllAccounts:(id)a3 account:(id)a4;
@end

@implementation IMAccountUtilities

+ (BOOL)isAccountOperationalWithAllAccounts:(id)a3 account:(id)a4
{
  id v5 = a4;
  if ([a3 containsObjectIdenticalTo:v5] && objc_msgSend(v5, "isActive"))
  {
    v6 = [v5 service];
    int v7 = [v6 supportsRegistration];

    if (v7)
    {
      uint64_t v8 = [v5 accountType];
      uint64_t v9 = [v5 registrationStatus];
      BOOL v10 = v9 == 5 && v8 == 2;
      if (v8 != 2 && v9 == 5) {
        BOOL v10 = [v5 profileValidationStatus] == 3;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)isAccountUsableForSendingWithAllAccounts:(id)a3 account:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 service];
  uint64_t v9 = [v8 internalName];
  if ([v9 isEqualToString:IMServiceNameiMessage[0]])
  {
    int v10 = IMIsRunningInIDSAccountCapableClient();

    if (!v10)
    {
LABEL_12:
      if ([v7 isActive])
      {
        if ([v7 loginStatus] == 4
          || ([v7 service],
              v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v16 ignoresNetworkConnectivity],
              v16,
              (v17 & 1) != 0))
        {
          if (![v7 accountType]) {
            goto LABEL_41;
          }
          v18 = [v7 service];
          int v19 = [v18 supportsRegistration];

          if (!v19) {
            goto LABEL_41;
          }
          if ([v7 accountType] == 2)
          {
            int v20 = [a1 _isApprovedForRelayWithAllAccounts:v6 account:v7];
            int v15 = [v7 isRegistered] | v20;
            if (IMOSLoggingEnabled())
            {
              v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                int v28 = 136447234;
                v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                __int16 v30 = 2112;
                id v31 = a1;
                __int16 v32 = 1024;
                int v33 = v15;
                __int16 v34 = 1024;
                int v35 = [v7 isRegistered];
                __int16 v36 = 1024;
                int v37 = v20;
                _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "%{public}s %@ %{BOOL}d is registered %{BOOL}d is approved for relay %{BOOL}d", (uint8_t *)&v28, 0x28u);
              }
            }
            goto LABEL_42;
          }
          if ([v7 accountType] != 1)
          {
LABEL_41:
            LOBYTE(v15) = 1;
            goto LABEL_42;
          }
          if (([v7 isRegistered] & 1) != 0
            || ([a1 _isApprovedForRelayWithAllAccounts:v6 account:v7] & 1) != 0)
          {
            v23 = [v7 aliases];
            if ([v23 count])
            {
              if ([v23 count] != 1
                || ([v23 lastObject],
                    v24 = objc_claimAutoreleasedReturnValue(),
                    int v25 = [v24 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]],
                    v24,
                    !v25))
              {
                LOBYTE(v15) = 1;
LABEL_49:

                goto LABEL_42;
              }
              if (IMOSLoggingEnabled())
              {
                v26 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  int v28 = 136446466;
                  v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                  __int16 v30 = 2112;
                  id v31 = v7;
                  _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "%{public}s NO %@ has sentinel alias", (uint8_t *)&v28, 0x16u);
                }
LABEL_47:
              }
            }
            else if (IMOSLoggingEnabled())
            {
              v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                int v28 = 136446466;
                v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                __int16 v30 = 2112;
                id v31 = v7;
                _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "%{public}s NO %@ has no aliases", (uint8_t *)&v28, 0x16u);
              }
              goto LABEL_47;
            }
            LOBYTE(v15) = 0;
            goto LABEL_49;
          }
          if (IMOSLoggingEnabled())
          {
            v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              int v28 = 136446466;
              v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
              __int16 v30 = 2112;
              id v31 = v7;
              _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not registered nor approved for relay", (uint8_t *)&v28, 0x16u);
            }
LABEL_29:
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            int v28 = 136446466;
            v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
            __int16 v30 = 2112;
            id v31 = v7;
            _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not logged in and service does not ignore network connectivity", (uint8_t *)&v28, 0x16u);
          }
          goto LABEL_29;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v28 = 136446466;
          v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
          __int16 v30 = 2112;
          id v31 = v7;
          _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not active", (uint8_t *)&v28, 0x16u);
        }
        goto LABEL_29;
      }
      LOBYTE(v15) = 0;
      goto LABEL_42;
    }
  }
  else
  {
    v11 = [v7 service];
    v12 = [v11 internalName];
    if (![v12 isEqualToString:IMServiceNameiMessageLite[0]])
    {

      goto LABEL_12;
    }
    char v13 = IMIsRunningInIDSAccountCapableClient();

    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Early returning based on the value of IMServiceImpl because this is iMessage or iMessage Lite", (uint8_t *)&v28, 2u);
    }
  }
  LOBYTE(v15) = [a1 _hasMadridIDSAccountForSending];
LABEL_42:

  return v15;
}

+ (BOOL)_hasMadridIDSAccountForSending
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMIsRunningInIDSAccountCapableClient())
  {
    if (qword_1E94FF108 != -1) {
      dispatch_once(&qword_1E94FF108, &unk_1EF2BF0C0);
    }
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v2 = objc_msgSend((id)qword_1E94FF100, "accounts", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v2);
          }
          if ([*(id *)(*((void *)&v7 + 1) + 8 * i) canSend])
          {
            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)_isApprovedForRelayWithAllAccounts:(id)a3 account:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F61740] sharedInstance];
  uint64_t v6 = [v5 deviceType];

  if (v6 == 2)
  {
    char v7 = 0;
  }
  else
  {
    long long v8 = [v4 service];
    char v7 = [v8 supportsRelay];
  }
  return v7;
}

+ (BOOL)isAccountRegistered:(id)a3
{
  id v3 = a3;
  if ([v3 isActive]) {
    BOOL v4 = [v3 registrationStatus] == 5;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end