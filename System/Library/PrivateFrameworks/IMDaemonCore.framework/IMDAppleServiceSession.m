@interface IMDAppleServiceSession
+ (id)idsAccounts;
- (BOOL)_isDeviceRegistered;
- (BOOL)_isDeviceRegisteredForAccount:(id)a3;
- (BOOL)isiMessageServiceIDSAccount:(id)a3;
- (IDSAccount)idsAccount;
- (IMDAppleServiceSession)initWithAccount:(id)a3 service:(id)a4;
- (NSArray)aliases;
- (NSArray)registeredURIs;
- (NSArray)vettedAliases;
- (NSString)GUID;
- (NSString)callerURI;
- (id)_aliasStringsForIDSAccount:(id)a3;
- (id)_aliases;
- (id)_aliasesForIDSAccount:(id)a3;
- (id)callerURIForIDSAccount:(id)a3;
- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4;
- (id)idsAccountForURI:(id)a3 IDSServiceName:(id)a4;
- (id)imdAccountForIDSAccount:(id)a3;
- (int64_t)_validationStatusForAlias:(id)a3 onAccount:(id)a4;
- (int64_t)validationStatusForAlias:(id)a3;
- (int64_t)validationStatusForAlias:(id)a3 onAccount:(id)a4;
- (void)_updateAccountStatusToUnregistered:(BOOL)a3 withAccount:(id)a4;
- (void)addAliases:(id)a3 account:(id)a4;
- (void)authenticateAccount:(id)a3;
- (void)dealloc;
- (void)loginServiceSessionWithAccount:(id)a3;
- (void)logoutServiceSessionWithAccount:(id)a3;
- (void)passwordUpdatedWithAccount:(id)a3;
- (void)reIdentify;
- (void)refreshRegistration;
- (void)registerAccount:(id)a3;
- (void)removeAliases:(id)a3 account:(id)a4;
- (void)reregister;
- (void)resetCallerIDForIDSAccount:(id)a3;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)tryToRepairCallerID:(id)a3 forIDSAccount:(id)a4;
- (void)unregisterAccount:(id)a3;
- (void)unvalidateAliases:(id)a3 account:(id)a4;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5;
- (void)validateAliases:(id)a3 account:(id)a4;
- (void)validateProfileWithAccount:(id)a3;
@end

@implementation IMDAppleServiceSession

- (IMDAppleServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)IMDAppleServiceSession;
  v5 = -[IMDServiceSession initWithAccount:service:](&v11, sel_initWithAccount_service_, a3);
  if (v5)
  {
    v6 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "%@: Initialized!  (Environment: %@)", buf, 0x16u);
    }
    v5->_GUID = (NSString *)(id)[NSString stringGUID];
    v5->_serviceName = (NSString *)(id)[a4 internalName];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    GUID = self->_GUID;
    *(_DWORD *)buf = 138412290;
    v7 = GUID;
    _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc service session: %@", buf, 0xCu);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)IMDAppleServiceSession;
  [(IMDServiceSession *)&v5 dealloc];
}

- (IDSAccount)idsAccount
{
  v3 = [(IMDServiceSession *)self account];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    IMDInconsistencyResolved((uint64_t)self);
    return (IDSAccount *)[(IMDAccount *)v3 idsAccount];
  }
  else
  {
    if ([(IMDServiceSession *)self isActive])
    {
      [(IMDServiceSession *)self accounts];
      IMDNoticedInconsistency((uint64_t)self, @"********** We don't have an IDSAccount, please file a radar ********** State: service session = %@, accounts = %@", v5, v6, v7, v8, v9, v10, (uint64_t)self);
    }
    return 0;
  }
}

- (id)imdAccountForIDSAccount:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(IMDServiceSession *)self isReplicating])
  {
    return [(IMDServiceSession *)self account];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [(IMDServiceSession *)self accounts];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (id)[v11 idsAccount] == a3)
          {
            IMDInconsistencyResolved((uint64_t)self);
            return v11;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    if ([(IMDServiceSession *)self isActive])
    {
      [(IMDServiceSession *)self accounts];
      IMDNoticedInconsistency((uint64_t)self, @"********** We couldn't find an IMDAccount for the IDSAccount, please file a radar ********** State: service session = %@, IDSAccount = %@, accounts = %@", v12, v13, v14, v15, v16, v17, (uint64_t)self);
    }
    return 0;
  }
}

- (NSArray)registeredURIs
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v23 = self;
  v4 = (void *)[(id)objc_opt_class() idsAccounts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v10 = objc_msgSend(v9, "im_registeredURIs");
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "_URIFromFZIDType:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "_FZBestGuessFZIDType"));
              if ([v15 length]) {
                [v3 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  if ([v3 count])
  {
    IMDInconsistencyResolved((uint64_t)v23);
    return (NSArray *)[v3 allObjects];
  }
  else
  {
    if ([(IMDServiceSession *)v23 isActive])
    {
      [(id)objc_opt_class() idsAccounts];
      IMDNoticedInconsistency((uint64_t)v23, @"********** Requesting registered URIs but we don't have an IDSAccount, please file a radar ********** State: service session = %@, accounts = %@", v17, v18, v19, v20, v21, v22, (uint64_t)v23);
    }
    return 0;
  }
}

- (BOOL)_isDeviceRegistered
{
  return [(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] registrationStatus] == 5;
}

- (BOOL)_isDeviceRegisteredForAccount:(id)a3
{
  return [a3 canSend];
}

- (void)_updateAccountStatusToUnregistered:(BOOL)a3 withAccount:(id)a4
{
  BOOL v5 = a3;
  if (a3 || [a4 registrationStatus] >= 2)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    [v6 setObject:v7 forKey:*MEMORY[0x1E4F6C798]];
    uint64_t v8 = [NSNumber numberWithInt:1];
    [v6 setObject:v8 forKey:*MEMORY[0x1E4F6C7A8]];
    objc_msgSend(a4, "writeAccountDefaults:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E4F6C7A0]));

    if (v5)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      objc_msgSend(a4, "writeAccountDefaults:", objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E4F6C6B8]));
    }
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v13 = [v11 dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F6C708]];

  [a4 writeAccountDefaults:v13];
}

- (void)sessionDidBecomeActive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[IMDAppleServiceSession sessionDidBecomeActive]";
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v4 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(IMDServiceSession *)self accountID];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = (const char *)v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEFAULT, "Session activating: %@ on Environment: %@", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)IMDAppleServiceSession;
  [(IMDServiceSession *)&v7 sessionDidBecomeActive];
  [(IMDAppleServiceSession *)self refreshRegistration];
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[IMDAppleServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [(IMDServiceSession *)self accountID];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = (const char *)v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Session deactivating: %@ on Environment: %@", buf, 0x16u);
  }
  IMDInconsistencyResolved((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)IMDAppleServiceSession;
  [(IMDServiceSession *)&v9 sessionWillBecomeInactiveWithAccount:a3];
  [(IMDAppleServiceSession *)self _updateAccountStatusToUnregistered:0 withAccount:a3];
  [(IMDAppleServiceSession *)self refreshRegistration];
}

- (void)loginServiceSessionWithAccount:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      objc_super v7 = self;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "AppleServiceSession: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMDServiceSession *)self refreshServiceCapabilities];
  [(IMDServiceSession *)self serviceSessionDidLoginWithAccount:a3];
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      objc_super v7 = self;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "AppleServiceSession: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if ([a3 loginStatus] != 2)
  {
    [a3 setLoginStatus:0 message:0];
    [(IMDServiceSession *)self serviceSessionDidLogoutWithAccount:a3];
  }
}

- (void)authenticateAccount:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
    __int16 v22 = 2112;
    id v23 = a3;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Client requested re-authenticate (Environment: %@) account: %@", buf, 0x16u);
  }
  if ([a3 length])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v6 = [(IMDServiceSession *)self accounts];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v16;
      *(void *)&long long v8 = 138412290;
      long long v14 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v14;
                uint64_t v21 = (uint64_t)v12;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Found account to re-authenticate account: %@", buf, 0xCu);
              }
              objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "authenticateAccount");
            }
          }
        }
        uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)registerAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Client requested re-register (Environment: %@)", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v6 = [(IMDServiceSession *)self accounts];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138412290;
    long long v14 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              uint64_t v21 = (uint64_t)v12;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Found account to re-register account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "registerAccount");
          }
        }
      }
      uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)unregisterAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceInformationString");
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Client requested de-register (Environment: %@)", buf, 0xCu);
  }
  int v6 = [(IMDServiceSession *)self account];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v14 = self;
  uint64_t v7 = [(IMDServiceSession *)self accounts];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(IMDAccount **)(*((void *)&v15 + 1) + 8 * i);
        if ([(NSString *)[(IMDAccount *)v12 accountID] isEqualToString:a3])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = (uint64_t)v12;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Found account to de-register account: %@", buf, 0xCu);
            }
            objc_msgSend((id)-[IMDAccount idsAccount](v12, "idsAccount"), "unregisterAccount");
            int v6 = v12;
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  [(IMDAppleServiceSession *)v14 _updateAccountStatusToUnregistered:1 withAccount:v6];
}

- (void)passwordUpdatedWithAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = a3;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Client requested password updated (account: %@)", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v6 = [(IMDServiceSession *)self accounts];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138412290;
    long long v14 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              id v21 = v12;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Found account to update password account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "passwordUpdated");
          }
        }
      }
      uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = a5;
    _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEFAULT, "Client updateAuthorizationCredentials (account: %@)", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [(IMDServiceSession *)self accounts];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v20;
    *(void *)&long long v12 = 138412290;
    long long v18 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v16, "accountID", v18), "isEqualToString:", a5))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v17 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              id v25 = v16;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_DEFAULT, "Found account to updateAuthorizationCredentials: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v16, "idsAccount"), "updateAuthorizationCredentials:token:", a3, a4);
          }
        }
      }
      uint64_t v13 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

- (int64_t)_validationStatusForAlias:(id)a3 onAccount:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t result = [a3 length];
  if (result)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = -[IMDAppleServiceSession _aliasesForIDSAccount:](self, "_aliasesForIDSAccount:", a4, 0);
    int64_t result = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (result)
    {
      int64_t v9 = result;
      uint64_t v10 = *(void *)v15;
      uint64_t v11 = *MEMORY[0x1E4F6B710];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", v11), "isEqualToString:", a3)) {
            return (int)objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E4F6B718]), "intValue");
          }
        }
        int64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        int64_t result = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)_aliasStringsForIDSAccount:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = -[IMDAppleServiceSession _aliasesForIDSAccount:](self, "_aliasesForIDSAccount:", a3, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x1E4F6B710];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) objectForKey:v10];
        if ([v12 length])
        {
          if (MEMORY[0x1E0169B60](v12)) {
            long long v12 = (void *)IMCanonicalizeFormattedString();
          }
          [v5 addObject:v12];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)_aliases
{
  v3 = [(IMDAppleServiceSession *)self idsAccount];

  return [(IMDAppleServiceSession *)self _aliasesForIDSAccount:v3];
}

- (id)_aliasesForIDSAccount:(id)a3
{
  v3 = (void *)[a3 aliases];

  return (id)objc_msgSend(v3, "__imArrayByApplyingBlock:", &unk_1F3392500);
}

- (void)removeAliases:(id)a3 account:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = a3;
    __int16 v32 = 2112;
    id v33 = a4;
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Client request to remove aliases: %@ account: %@", buf, 0x16u);
  }
  uint64_t v7 = [(IMDAppleServiceSession *)self idsAccount];
  uint64_t v8 = [(IMDServiceSession *)self account];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = self;
  uint64_t v9 = [(IMDServiceSession *)self accounts];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(IMDAccount **)(*((void *)&v25 + 1) + 8 * i);
        if ([(NSString *)[(IMDAccount *)v14 accountID] isEqualToString:a4])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v7 = (IDSAccount *)[(IMDAccount *)v14 idsAccount];
            long long v15 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v31 = a3;
              __int16 v32 = 2112;
              id v33 = v14;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "Found account to remove aliases: %@  account: %@", buf, 0x16u);
            }
            uint64_t v8 = v14;
          }
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
  long long v16 = objc_msgSend(a3, "__imArrayByApplyingBlock:", &unk_1F3392520);
  if ([v16 count])
  {
    uint64_t v17 = objc_msgSend(-[IMDAppleServiceSession _aliasesForIDSAccount:](v23, "_aliasesForIDSAccount:", v7), "count");
    if (v17 - 1 >= 0)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *MEMORY[0x1E4F6B710];
      uint64_t v20 = *MEMORY[0x1E4F6C708];
      while (1)
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(-[IMDAppleServiceSession _aliasesForIDSAccount:](v23, "_aliasesForIDSAccount:", v7), "objectAtIndex:", --v18), "objectForKey:", v19);
        if ([v16 containsObject:v21])
        {
          id v22 = [(NSDictionary *)[(IMDAccount *)v8 accountDefaults] objectForKey:v20];
          if ([v22 length])
          {
            if ([v22 isEqualToString:v21]) {
              break;
            }
          }
        }
        if (v18 <= 0) {
          goto LABEL_24;
        }
      }
      -[IMDAccount writeAccountDefaults:](v8, "writeAccountDefaults:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), v20));
    }
LABEL_24:
    [(IDSAccount *)v7 removeAliases:v16];
  }
}

- (void)addAliases:(id)a3 account:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = a3;
    __int16 v24 = 2112;
    id v25 = a4;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Client request to add aliases: %@  account: %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(IMDServiceSession *)self accounts];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    *(void *)&long long v10 = 138412546;
    long long v16 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v15 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              id v23 = a3;
              __int16 v24 = 2112;
              id v25 = v14;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "Found account to add aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "addAliases:", a3);
          }
        }
      }
      uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)validateAliases:(id)a3 account:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = a3;
    __int16 v24 = 2112;
    id v25 = a4;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Client request to validate: %@  account: %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(IMDServiceSession *)self accounts];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    *(void *)&long long v10 = 138412546;
    long long v16 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v15 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              id v23 = a3;
              __int16 v24 = 2112;
              id v25 = v14;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "Found account to validate aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "validateAliases:", a3);
          }
        }
      }
      uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)unvalidateAliases:(id)a3 account:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = a3;
    __int16 v24 = 2112;
    id v25 = a4;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Client request to unvalidate: %@  account: %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(IMDServiceSession *)self accounts];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    *(void *)&long long v10 = 138412546;
    long long v16 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v15 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              id v23 = a3;
              __int16 v24 = 2112;
              id v25 = v14;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "Found account to unvalidate aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "unvalidateAliases:", a3);
          }
        }
      }
      uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)validateProfileWithAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = a3;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Client request to validate profile info: %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(IMDServiceSession *)self accounts];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138412290;
    long long v14 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              id v21 = v12;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "Found account to validate profile info account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "validateProfile");
          }
        }
      }
      uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)resetCallerIDForIDSAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (-[IMDAppleServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:")
    && objc_msgSend((id)objc_msgSend(a3, "vettedAliases"), "count"))
  {
    id v5 = (void *)[a3 accountInfo];
    id v6 = (void *)[v5 objectForKey:*MEMORY[0x1E4F6B738]];
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      long long v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = [a3 uniqueID];
      __int16 v18 = 2112;
      long long v19 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEFAULT, "Checking specified caller ID: %@ on account: %@, accountDefaults: %@", (uint8_t *)&v14, 0x20u);
    }
    if (![v6 length])
    {
      uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v14) = 0;
      uint64_t v11 = "No caller ID specified, moving along";
      uint64_t v12 = v13;
      goto LABEL_11;
    }
    int64_t v8 = [(IMDAppleServiceSession *)self validationStatusForAlias:v6 onAccount:a3];
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == 3)
    {
      if (!v10) {
        return;
      }
      LOWORD(v14) = 0;
      uint64_t v11 = " Caller ID is valid, registered and in good shape, moving along";
      uint64_t v12 = v9;
LABEL_11:
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 2u);
      return;
    }
    if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEFAULT, "Caller ID isn't validated, try repair if we find another account with the same caller id. clearing caller ID settings for current account", (uint8_t *)&v14, 2u);
    }
    [(IMDAppleServiceSession *)self tryToRepairCallerID:v6 forIDSAccount:a3];
    [a3 setDisplayName:0];
  }
}

- (void)tryToRepairCallerID:(id)a3 forIDSAccount:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(IMDAppleServiceSession *)self isiMessageServiceIDSAccount:a4])
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)IMPreferredAccountMap(), "objectForKey:", *MEMORY[0x1E4F6E1B0]), "objectForKey:", @"guid");
    int64_t v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = (uint64_t)v7;
      __int16 v29 = 2112;
      uint64_t v30 = [a4 uniqueID];
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Current preferred account: [%@], account to repair: [%@]", buf, 0x16u);
    }
    if (objc_msgSend(v7, "isEqualToString:", objc_msgSend(a4, "uniqueID")))
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v9 = (void *)[(id)objc_opt_class() idsAccounts];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v12 = v10;
        uint64_t v13 = *(void *)v23;
        *(void *)&long long v11 = 138412546;
        long long v21 = v11;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v9);
            }
            long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isEqual:", a4, v21, (void)v22) & 1) == 0
              && [(IMDAppleServiceSession *)self isiMessageServiceIDSAccount:v15])
            {
              __int16 v16 = [MEMORY[0x1E4F6C3B8] registration];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = [v15 uniqueID];
                uint64_t v18 = [v15 displayName];
                *(_DWORD *)buf = v21;
                uint64_t v28 = v17;
                __int16 v29 = 2112;
                uint64_t v30 = v18;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Found another iMessage account: [%@], displayName: [%@]", buf, 0x16u);
              }
              if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v15, "displayName")))
              {
                IMRegisterForPreferredAccountChangeNotificationsInternal();
                long long v19 = [MEMORY[0x1E4F6C3B8] registration];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v20 = [v15 uniqueID];
                  *(_DWORD *)buf = v21;
                  uint64_t v28 = (uint64_t)a3;
                  __int16 v29 = 2112;
                  uint64_t v30 = v20;
                  _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Found a match for callerID: [%@], update preferred account to: [%@] for iMessage", buf, 0x16u);
                }
                [v15 uniqueID];
                IMUpdatePreferredAccountForService();
              }
            }
          }
          uint64_t v12 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);
      }
    }
  }
}

- (BOOL)isiMessageServiceIDSAccount:(id)a3
{
  v3 = (void *)[a3 serviceName];

  return [v3 isEqualToString:@"com.apple.madrid"];
}

- (void)refreshRegistration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(), "idsAccounts", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(IMDAppleServiceSession *)self resetCallerIDForIDSAccount:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)reregister
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];

  MEMORY[0x1F4181798](v2, sel__reregisterAndReidentify_);
}

- (void)reIdentify
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];

  MEMORY[0x1F4181798](v2, sel__reregisterAndReidentify_);
}

- (NSArray)vettedAliases
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];

  return (NSArray *)[(IDSAccount *)v2 vettedAliases];
}

- (NSArray)aliases
{
  v3 = [(IMDAppleServiceSession *)self idsAccount];

  return (NSArray *)[(IMDAppleServiceSession *)self _aliasStringsForIDSAccount:v3];
}

- (int64_t)validationStatusForAlias:(id)a3
{
  [(IMDAppleServiceSession *)self idsAccount];

  return MEMORY[0x1F4181798](self, sel__validationStatusForAlias_onAccount_);
}

- (int64_t)validationStatusForAlias:(id)a3 onAccount:(id)a4
{
  return MEMORY[0x1F4181798](self, sel__validationStatusForAlias_onAccount_);
}

- (NSString)callerURI
{
  [(IMDAppleServiceSession *)self idsAccount];

  return (NSString *)MEMORY[0x1F4181798](self, sel_callerURIForIDSAccount_);
}

- (id)callerURIForIDSAccount:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([a3 accountType]
    || (long long v21 = objc_msgSend((id)objc_msgSend(a3, "loginID"), "_URIFromCanonicalizedPhoneNumber"),
        ![v21 length]))
  {
    uint64_t v5 = objc_msgSend(a3, "im_registeredURIs");
    if ([v5 count])
    {
      uint64_t v6 = (void *)[a3 accountInfo];
      [v6 objectForKey:*MEMORY[0x1E4F6B738]];
      uint64_t v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_1F3392540);
      id v8 = (id)_IDSCopyCallerID();
      if (IMOSLoggingEnabled())
      {
        long long v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v30 = self;
          __int16 v31 = 2112;
          uint64_t v32 = (uint64_t)v8;
          __int16 v33 = 2112;
          uint64_t v34 = v7;
          __int16 v35 = 2112;
          id v36 = a3;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "%@ callerID - choosing %@ from %@, idsAccount %@", buf, 0x2Au);
        }
      }
      long long v10 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = self;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v8;
        __int16 v33 = 2112;
        uint64_t v34 = v7;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEFAULT, "%@ callerID - choosing %@ from %@", buf, 0x20u);
      }
      long long v11 = (void *)[v8 lowercaseString];
      id v12 = [(IMDAppleServiceSession *)self _aliasStringsForIDSAccount:a3];
      uint64_t v13 = [v11 length];
      int v14 = (uint64_t *)MEMORY[0x1E4F6B7D0];
      if (v13
        && [v12 containsObject:v11]
        && ![v11 _appearsToBeDSID]
        || (long long v26 = 0u,
            long long v27 = 0u,
            long long v24 = 0u,
            long long v25 = 0u,
            (uint64_t v15 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16]) == 0))
      {
LABEL_20:
        long long v19 = v11;
      }
      else
      {
        uint64_t v16 = *(void *)v25;
        uint64_t v17 = *v14;
LABEL_13:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
          if (([v19 isEqualToIgnoringCase:v17] & 1) == 0
            && ![v19 _appearsToBeDSID])
          {
            break;
          }
          if (v15 == ++v18)
          {
            uint64_t v15 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v15) {
              goto LABEL_13;
            }
            goto LABEL_20;
          }
        }
      }
      if (([v5 containsObject:v19] & 1) == 0)
      {
        if ([0 isEqualToIgnoringCase:*v14])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = 0;
              __int16 v31 = 2112;
              uint64_t v32 = (uint64_t)v5;
              _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, " ** Selected display ID: %@  was not in URIs set: %@", buf, 0x16u);
            }
          }
        }
        long long v19 = objc_msgSend(v5, "__imFirstObject");
      }
      return (id)objc_msgSend(v19, "_URIFromFZIDType:", objc_msgSend(v19, "_FZBestGuessFZIDType"));
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v30 = a3;
          __int16 v31 = 2112;
          uint64_t v32 = [a3 registeredURIs];
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "callerURI - No bindings !!, idsAccount %@ registeredURIs %@", buf, 0x16u);
        }
      }
      return 0;
    }
  }
  return v21;
}

+ (id)idsAccounts
{
  if (qword_1EBE2BC88 != -1) {
    dispatch_once(&qword_1EBE2BC88, &unk_1F3392560);
  }
  v2 = (void *)[(id)qword_1EBE2BC78 accounts];
  if (!objc_msgSend((id)objc_msgSend((id)qword_1EBE2BC80, "accounts"), "count")) {
    return v2;
  }

  return (id)MEMORY[0x1F4181798](v2, sel_setByAddingObjectsFromSet_);
}

- (id)idsAccountForURI:(id)a3 IDSServiceName:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = (void *)[(id)objc_opt_class() idsAccounts];
  uint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v9 = 138412546;
    long long v17 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "serviceName", v17), "isEqualToString:", a4)
          && (uint64_t v13 = objc_msgSend(v12, "im_registeredURIs"),
              [a3 _stripFZIDPrefix],
              [v13 containsObject:IMCanonicalizeFormattedString()]))
        {
          if ([v12 canSend]) {
            return v12;
          }
          if (IMOSLoggingEnabled())
          {
            int v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v17;
              long long v23 = v12;
              __int16 v24 = 2112;
              id v25 = a3;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "IDS Account (%@) registered for: %@ but registration status was wrong. Saving for later", buf, 0x16u);
            }
          }
          uint64_t v7 = v12;
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            long long v23 = v7;
            __int16 v24 = 2112;
            id v25 = a3;
            __int16 v26 = 2112;
            id v27 = a4;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "IDS Account (%@) not registered for: %@, serviceName: %@, moving on", buf, 0x20u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_idsAccountForURI_IDSServiceName_);
}

- (NSString)GUID
{
  return self->_GUID;
}

@end