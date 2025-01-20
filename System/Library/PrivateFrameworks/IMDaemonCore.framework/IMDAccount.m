@interface IMDAccount
- (BOOL)_isUsableForSending;
- (BOOL)canMakeDowngradeRoutingChecks;
- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser;
- (BOOL)isActive;
- (BOOL)isDisabled;
- (BOOL)isLoading;
- (BOOL)isManaged;
- (BOOL)isRegistered;
- (BOOL)isSMSRelayCapable;
- (BOOL)shouldPublishNowPlaying;
- (BOOL)wasDisabledAutomatically;
- (IMDAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5;
- (IMDService)service;
- (IMDServiceSession)session;
- (NSArray)aliases;
- (NSArray)replicationSessions;
- (NSDictionary)accountDefaults;
- (NSDictionary)registrationAlertInfo;
- (NSString)accountID;
- (NSString)loginID;
- (NSString)serviceLoginStatusMessage;
- (id)_registrationInfo;
- (id)accountInfoToPost;
- (id)description;
- (id)profileInfo;
- (int)registrationError;
- (int)serviceDisconnectReason;
- (int64_t)accountType;
- (int64_t)profileValidationStatus;
- (int64_t)registrationStatus;
- (unint64_t)loginStatus;
- (void)_createReplicationSessionsIfNecessary;
- (void)_forceSetLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6;
- (void)createSessionIfNecessary;
- (void)dealloc;
- (void)postAccountCapabilities;
- (void)releaseSession;
- (void)resetReplicationSessions;
- (void)setAccountID:(id)a3;
- (void)setIsManaged:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLoginID:(id)a3;
- (void)setLoginStatus:(unint64_t)a3;
- (void)setLoginStatus:(unint64_t)a3 message:(id)a4;
- (void)setLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6;
- (void)setManaged:(BOOL)a3;
- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5;
- (void)setService:(id)a3;
- (void)setServiceDisconnectReason:(int)a3;
- (void)setServiceLoginStatusMessage:(id)a3;
- (void)setSession:(id)a3;
- (void)setWasDisabledAutomatically:(BOOL)a3;
- (void)writeAccountDefaults:(id)a3;
@end

@implementation IMDAccount

- (id)accountInfoToPost
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(IMDAccount *)self accountID];
  if (v4) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6CA30], v4);
  }

  v5 = [(IMDAccount *)self accountDefaults];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = (const void *)*MEMORY[0x1E4F6CA20];
    v8 = [(IMDAccount *)self accountDefaults];
    CFDictionarySetValue(v3, v7, v8);
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IMDServiceSession capabilities](self->_session, "capabilities"));
  if (v9) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6CA18], v9);
  }

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMDAccount loginStatus](self, "loginStatus"));
  if (v10) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6CA38], v10);
  }

  v11 = [(IMDAccount *)self serviceLoginStatusMessage];
  if (v11) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6CA40], v11);
  }

  v12 = [(IMDServiceSession *)self->_session buddyProperties];
  v13 = (void *)[v12 copy];

  if ([v13 count]) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6CA10], v13);
  }
  v14 = [(IMDServiceSession *)self->_session groups];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = (const void *)*MEMORY[0x1E4F6CA28];
    v17 = [(IMDServiceSession *)self->_session groups];
    CFDictionarySetValue(v3, v16, v17);
  }

  return v3;
}

- (BOOL)isActive
{
  v3 = +[IMDAccountController sharedAccountController];
  v4 = [(IMDAccount *)self accountID];
  char v5 = [v3 isAccountActive:v4];

  return v5;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSDictionary)accountDefaults
{
  return &self->_accountDefaults->super;
}

- (NSString)serviceLoginStatusMessage
{
  return self->_serviceLoginStatusMessage;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (IMDService)service
{
  return self->_service;
}

- (IMDServiceSession)session
{
  return self->_session;
}

- (IMDAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IMDAccount;
  v12 = [(IMDAccount *)&v23 init];
  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Creating account id: %@    defaults: %@    on service: %@", buf, 0x20u);
      }
    }
    objc_storeStrong((id *)&v12->_accountID, a3);
    objc_storeStrong((id *)&v12->_service, a5);
    v14 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v14 addListener:v12];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v15 = [v10 mutableCopy];
      accountDefaults = v12->_accountDefaults;
      v12->_accountDefaults = (NSMutableDictionary *)v15;
    }
    else
    {
      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v19 = v12->_accountDefaults;
      v12->_accountDefaults = v18;

      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v25 = v10;
          __int16 v26 = 2112;
          id v27 = v21;
          id v22 = v21;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "IMDAccount: incoming 'defaults' is not a dictionary, %@, %@", buf, 0x16u);
        }
      }
    }
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IMDAccount;
  [(IMDAccount *)&v4 dealloc];
}

- (int64_t)accountType
{
  v3 = [(IMDAccount *)self loginID];
  uint64_t v4 = [v3 rangeOfString:@"P:"];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return 2;
  }
  char v5 = [(IMDAccount *)self service];
  unsigned int v6 = [v5 supportsAuthorization];

  return v6;
}

- (void)setIsManaged:(BOOL)a3
{
  char v5 = (void *)MEMORY[0x1E4F1C9E8];
  unsigned int v6 = objc_msgSend(NSNumber, "numberWithBool:");
  v7 = [v5 dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F6C740]];
  [(IMDAccount *)self writeAccountDefaults:v7];

  self->_managed = a3;
}

- (BOOL)canMakeDowngradeRoutingChecks
{
  if ([(IMDAccount *)self accountType] != 2) {
    return 0;
  }
  v3 = [(IMDAccount *)self service];
  char v4 = [v3 supportsCapability:*MEMORY[0x1E4F6E0F0]];

  return v4;
}

- (BOOL)wasDisabledAutomatically
{
  v2 = [(IMDAccount *)self accountDefaults];
  v3 = [v2 objectForKey:@"AccountManaged"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setWasDisabledAutomatically:(BOOL)a3
{
  char v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = [NSNumber numberWithBool:a3];
  char v5 = [v4 dictionaryWithObject:v6 forKey:@"AccountManaged"];
  [(IMDAccount *)self writeAccountDefaults:v5];
}

- (BOOL)isDisabled
{
  v3 = +[IMDLocalDaemon sharedDaemon];
  char v4 = [v3 parentalControls];
  LOBYTE(self) = [v4 disableAccount:self];

  return (char)self;
}

- (void)writeAccountDefaults:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%@ - write account defaults: %@", buf, 0x16u);
    }
  }
  if ([v4 count])
  {
    id v6 = (void *)[v4 mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v12 = [v4 objectForKey:v11];
          if (([v12 isNull] & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v12 length])
          {
            [v6 removeObjectForKey:v11];
            [(NSMutableDictionary *)self->_accountDefaults removeObjectForKey:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    [(NSMutableDictionary *)self->_accountDefaults addEntriesFromDictionary:v6];
  }
  v13 = +[IMDBroadcastController sharedProvider];
  v14 = [(IMDAccount *)self service];
  uint64_t v15 = [v13 broadcasterForListenersSupportingService:v14];
  v16 = [(IMDAccount *)self accountID];
  v17 = [(IMDAccount *)self accountDefaults];
  v18 = (void *)[v17 copy];
  [v15 account:v16 defaultsChanged:v18];

  v19 = [(IMDAccount *)self session];
  [v19 accountDefaultsChanged:v4];

  if ([v4 count]
    && ![(IMDAccount *)self isLoading]
    && ![(IMDAccount *)self isManaged])
  {
    v20 = [(IMDAccount *)self service];
    [v20 delayedSaveSettings];
  }
}

- (void)postAccountCapabilities
{
  context = (void *)MEMORY[0x1E016A370](self, a2);
  v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDAccount *)self service];
  uint64_t v15 = [v3 broadcasterForListenersSupportingService:v4];

  char v5 = [(IMDAccount *)self session];
  id v6 = [(IMDAccount *)self accountID];
  v7 = [(IMDAccount *)self accountDefaults];
  uint64_t v8 = [v5 blockList];
  uint64_t v9 = [v5 allowList];
  uint64_t v10 = [v5 blockingMode];
  uint64_t v11 = [v5 blockIdleStatus];
  uint64_t v12 = [v5 capabilities];
  unint64_t v13 = [(IMDAccount *)self loginStatus];
  v14 = [(IMDAccount *)self serviceLoginStatusMessage];
  [v15 account:v6 defaults:v7 blockList:v8 allowList:v9 blockingMode:v10 blockIdleStatus:v11 status:0 capabilities:v12 serviceLoginStatus:v13 loginStatusMessage:v14];
}

- (void)createSessionIfNecessary
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(IMDAccount *)self isDisabled])
  {
    v3 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      long long v23 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEFAULT, "%@: Account is restricted, not creating session", (uint8_t *)&v22, 0xCu);
    }
LABEL_27:

    return;
  }
  if ([(IMDAccount *)self wasDisabledAutomatically]) {
    [(IMDAccount *)self setWasDisabledAutomatically:0];
  }
  id v4 = [(IMDAccount *)self session];

  if (!v4)
  {
    char v5 = [(IMDAccount *)self service];
    v3 = [v5 mainService];

    if ([v3 supportsOneSessionForAllAccounts])
    {
      id v6 = +[IMDServiceSession existingServiceSessionForService:v3];
      [(IMDAccount *)self setSession:v6];
    }
    if (self->_session)
    {
      v7 = [(IMDAccount *)self session];
      [v7 addAccount:self];

      uint64_t v8 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        int v22 = 138412546;
        long long v23 = self;
        __int16 v24 = 2112;
        id v25 = session;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEFAULT, "%@: Reused existing session: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc((Class)-[NSObject sessionClass](v3, "sessionClass")), "initWithAccount:service:", self, v3);
      [(IMDAccount *)self setSession:v10];

      uint64_t v8 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = self->_session;
        uint64_t v12 = [v3 internalName];
        unint64_t v13 = NSStringFromClass((Class)[v3 sessionClass]);
        int v22 = 138413058;
        long long v23 = self;
        __int16 v24 = 2112;
        id v25 = v11;
        __int16 v26 = 2112;
        id v27 = v12;
        __int16 v28 = 2112;
        id v29 = v13;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEFAULT, "%@: Created active session: %@ of service type: %@   (Session class: %@)", (uint8_t *)&v22, 0x2Au);
      }
    }

    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        long long v23 = self;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "%@: Telling session it became active", (uint8_t *)&v22, 0xCu);
      }
    }
    uint64_t v15 = [(IMDAccount *)self session];
    [v15 sessionDidBecomeActive];

    v16 = [(IMDAccount *)self service];
    int v17 = [v16 shouldForceAccountsConnected];

    if (v17)
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          long long v23 = self;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "%@: Forcing login", (uint8_t *)&v22, 0xCu);
        }
      }
      v19 = [(IMDAccount *)self session];
      [v19 login];
    }
    v20 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = [(IMDAccount *)self session];
      int v22 = 138412546;
      long long v23 = self;
      __int16 v24 = 2112;
      id v25 = v21;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEFAULT, "%@: Done setting up session: %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_27;
  }
}

- (void)_createReplicationSessionsIfNecessary
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!self->_replicationSessions)
  {
    v3 = [(IMDAccount *)self session];
    if (v3)
    {
      id v4 = [(IMDAccount *)self service];
      char v5 = [v4 mainService];
      id v6 = [v5 replicationServices];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v8 = [(IMDAccount *)self service];
        uint64_t v9 = [v8 mainService];
        uint64_t v10 = [v9 replicationServices];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = v10;
        uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11)
        {
          uint64_t v13 = *(void *)v31;
          *(void *)&long long v12 = 138412802;
          long long v27 = v12;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
              v16 = +[IMDAccountController sharedAccountController];
              int v17 = [v16 activeAccountsForService:v15];

              v18 = [(IMDAccount *)self session];
              v19 = [v18 preferredAccountForReplicationOnService:v15 eligibleAccounts:v17];

              if (v19)
              {
                id v20 = objc_alloc((Class)[v15 sessionClass]);
                long long v21 = [(IMDAccount *)self session];
                int v22 = (void *)[v20 initWithAccount:v19 service:v15 replicatingForSession:v21];

                [v22 sessionDidBecomeActive];
                [v29 addObject:v22];
              }
              else if (IMOSLoggingEnabled())
              {
                long long v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  __int16 v24 = [(IMDAccount *)self loginID];
                  *(_DWORD *)buf = v27;
                  v35 = self;
                  __int16 v36 = 2112;
                  v37 = v15;
                  __int16 v38 = 2112;
                  v39 = v24;
                  _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Cannot create replication session for %@, no account found for %@ (loginID: %@)", buf, 0x20u);
                }
              }

              ++v14;
            }
            while (v11 != v14);
            uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
          }
          while (v11);
        }

        id v25 = (NSArray *)[v29 copy];
        replicationSessions = self->_replicationSessions;
        self->_replicationSessions = v25;
      }
    }
  }
}

- (void)releaseSession
{
  v3 = [(IMDAccount *)self session];
  [v3 sessionWillBecomeInactiveWithAccount:self];

  [(IMDAccount *)self setSession:0];
}

- (NSArray)replicationSessions
{
  [(IMDAccount *)self createSessionIfNecessary];
  [(IMDAccount *)self _createReplicationSessionsIfNecessary];
  replicationSessions = self->_replicationSessions;

  return replicationSessions;
}

- (void)resetReplicationSessions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting replication session for %@", (uint8_t *)&v6, 0xCu);
    }
  }
  replicationSessions = self->_replicationSessions;
  self->_replicationSessions = 0;

  char v5 = [(IMDAccount *)self session];
  [v5 _replicationSessionsChanged];
}

- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id value = a5;
  uint64_t v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  if (v9) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C7A8], v9);
  }

  uint64_t v10 = [NSNumber numberWithInt:v5];
  if (v10) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C798], v10);
  }

  if (value) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C790], value);
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F6C7A0]];
  [(IMDAccount *)self writeAccountDefaults:v11];
}

- (NSString)loginID
{
  v3 = [(IMDAccount *)self accountDefaults];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F6C738]];

  loginID = self->_loginID;
  p_loginID = &self->_loginID;
  if (![(NSString *)loginID isEqualToString:v4]) {
    objc_storeStrong((id *)p_loginID, v4);
  }
  uint64_t v7 = *p_loginID;

  return v7;
}

- (NSArray)aliases
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDAccount *)self accountDefaults];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6C6B8]];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4F6C698];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", v9, (void)v16);
        long long v12 = [v11 lowercaseString];
        uint64_t v13 = [v12 trimmedString];

        if (v13) {
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 allObjects];

  return (NSArray *)v14;
}

- (id)_registrationInfo
{
  v2 = [(IMDAccount *)self accountDefaults];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C7A0]];

  return v3;
}

- (int64_t)registrationStatus
{
  v2 = [(IMDAccount *)self _registrationInfo];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C7A8]];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (int)registrationError
{
  v2 = [(IMDAccount *)self _registrationInfo];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C798]];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  return ([(IMDAccount *)self registrationError] & 0xFFFFFFFE) == 28;
}

- (NSDictionary)registrationAlertInfo
{
  v2 = [(IMDAccount *)self _registrationInfo];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C790]];

  return (NSDictionary *)v3;
}

- (void)setLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v14 = a4;
  id v10 = a6;
  if ([(IMDAccount *)self loginStatus] != a3
    || [(IMDAccount *)self serviceDisconnectReason] != v7)
  {
LABEL_5:
    [(IMDAccount *)self _forceSetLoginStatus:a3 message:v14 reason:v7 properties:v10];
    goto LABEL_6;
  }
  id v11 = [(IMDAccount *)self serviceLoginStatusMessage];
  if (v11 != v14)
  {
    long long v12 = [(IMDAccount *)self serviceLoginStatusMessage];
    char v13 = [v14 isEqualToString:v12];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

LABEL_6:
}

- (void)setLoginStatus:(unint64_t)a3 message:(id)a4
{
}

- (void)_forceSetLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    long long v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = [(IMDAccount *)self session];
      int v19 = 138413570;
      id v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 1024;
      int v26 = v7;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      long long v30 = v13;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "-[%@ _forceSetLoginStatus:%lu message:%@ reason:%d properties:%@] session=%@", (uint8_t *)&v19, 0x3Au);
    }
  }
  unint64_t v14 = [(IMDAccount *)self loginStatus];
  [(IMDAccount *)self setLoginStatus:a3];
  [(IMDAccount *)self setServiceDisconnectReason:v7];
  id v15 = [(IMDAccount *)self serviceLoginStatusMessage];
  BOOL v16 = v15 == v10;

  if (!v16)
  {
    long long v17 = (void *)[v10 copy];
    [(IMDAccount *)self setServiceLoginStatusMessage:v17];
  }
  long long v18 = [(IMDAccount *)self session];
  objc_msgSend(v18, "__forceSetLoginStatus:oldStatus:message:reason:properties:account:", a3, v14, v10, v7, v11, self);
}

- (id)description
{
  v3 = NSString;
  int v4 = [(IMDAccount *)self accountID];
  id v5 = [(IMDAccount *)self service];
  uint64_t v6 = [v3 stringWithFormat:@"<IMDAccount:%p, ID:%@, Service:%@ >", self, v4, v5];

  return v6;
}

- (id)profileInfo
{
  v2 = [(IMDAccount *)self accountDefaults];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C758]];

  return v3;
}

- (int64_t)profileValidationStatus
{
  v2 = [(IMDAccount *)self profileInfo];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6C768]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isRegistered
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F6E560], sel_isAccountRegistered_);
}

- (BOOL)isSMSRelayCapable
{
  v2 = [(IMDAccount *)self accountDefaults];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F6BFB8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_isUsableForSending
{
  v3 = (void *)MEMORY[0x1E4F6E560];
  char v4 = +[IMDAccountController sharedInstance];
  id v5 = [v4 accounts];
  LOBYTE(self) = [v3 isAccountUsableForSendingWithAllAccounts:v5 account:self];

  return (char)self;
}

- (void)setAccountID:(id)a3
{
}

- (void)setLoginID:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_loginStatus = a3;
}

- (int)serviceDisconnectReason
{
  return self->_serviceDisconnectReason;
}

- (void)setServiceDisconnectReason:(int)a3
{
  self->_serviceDisconnectReason = a3;
}

- (void)setServiceLoginStatusMessage:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)shouldPublishNowPlaying
{
  return self->_shouldPublishNowPlaying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoginStatusMessage, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_replicationSessions, 0);

  objc_storeStrong((id *)&self->_accountDefaults, 0);
}

@end