@interface IMDAccountController
+ (IMDAccountController)sharedInstance;
- (BOOL)_isAccountActive:(id)a3 forService:(id)a4;
- (BOOL)_isOperationalForAccount:(id)a3;
- (BOOL)accountAssociatedWithHandle:(id)a3;
- (BOOL)activeAccountsAreEligibleForHawking;
- (BOOL)hasActivePhoneAccount;
- (BOOL)isAccountActive:(id)a3;
- (BOOL)isLoading;
- (BOOL)networkDataAvailable;
- (BOOL)receiverIsCandidateForHawking:(id)a3;
- (BOOL)receiverIsCandidateForJunk:(id)a3 forAccount:(id)a4;
- (IMDAccountController)init;
- (NSArray)accounts;
- (NSArray)activeAccounts;
- (NSArray)activeSessions;
- (NSArray)connectedAccounts;
- (NSArray)connectingAccounts;
- (id)_nicknameController;
- (id)_operationalAccounts;
- (id)accountForAccountID:(id)a3;
- (id)accountForHandle:(id)a3;
- (id)accountForIDSAccountUniqueID:(id)a3;
- (id)accountsForLoginID:(id)a3 onService:(id)a4;
- (id)accountsForService:(id)a3;
- (id)activeAccountsForService:(id)a3;
- (id)activeAccountsWithServiceCapability:(id)a3;
- (id)activeAliases;
- (id)anySessionForServiceName:(id)a3;
- (id)connectedAccountsForService:(id)a3;
- (id)connectingAccountsForService:(id)a3;
- (id)sessionForAccount:(id)a3;
- (id)sessionForReplicationSourceServiceName:(id)a3 replicatingAccount:(id)a4;
- (void)_rebuildOperationalAccountsCache;
- (void)_resetAccountReplicationSessions;
- (void)account:(id)a3 isActiveChanged:(BOOL)a4;
- (void)activateAccount:(id)a3;
- (void)activateAccounts:(id)a3;
- (void)addAccount:(id)a3;
- (void)deactivateAccount:(id)a3;
- (void)deactivateAccount:(id)a3 force:(BOOL)a4;
- (void)deactivateAccounts:(id)a3;
- (void)deactivateAccounts:(id)a3 force:(BOOL)a4;
- (void)dealloc;
- (void)deferredSave;
- (void)load;
- (void)removeAccount:(id)a3;
- (void)save;
- (void)setNetworkDataAvailable:(BOOL)a3;
@end

@implementation IMDAccountController

- (id)accountsForService:(id)a3
{
  id v4 = a3;
  v5 = [(IMDAccountController *)self accounts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D9684BD4;
  v9[3] = &unk_1E6B72B30;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);

  return v7;
}

- (NSArray)activeAccounts
{
  v2 = [(IMDAccountController *)self accounts];
  v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1F33903A0);

  return (NSArray *)v3;
}

- (NSArray)accounts
{
  return (NSArray *)[(NSMutableDictionary *)self->_accounts allValues];
}

- (id)activeAccountsForService:(id)a3
{
  id v4 = a3;
  v5 = [(IMDAccountController *)self activeAccounts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D9684528;
  v9[3] = &unk_1E6B72B30;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);

  return v7;
}

- (BOOL)isAccountActive:(id)a3
{
  id v4 = a3;
  v5 = [(IMDAccountController *)self accountForAccountID:v4];
  id v6 = [v5 service];
  LOBYTE(self) = [(IMDAccountController *)self _isAccountActive:v4 forService:v6];

  return (char)self;
}

- (BOOL)_isAccountActive:(id)a3 forService:(id)a4
{
  activeAccounts = self->_activeAccounts;
  id v6 = a3;
  v7 = [a4 internalName];
  v8 = [(NSMutableDictionary *)activeAccounts objectForKey:v7];
  char v9 = [v8 containsObject:v6];

  return v9;
}

+ (IMDAccountController)sharedInstance
{
  if (qword_1EBE2B800 != -1) {
    dispatch_once(&qword_1EBE2B800, &unk_1F3390380);
  }
  v2 = (void *)qword_1EBE2B920;

  return (IMDAccountController *)v2;
}

- (id)accountForAccountID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_accounts objectForKey:a3];
}

- (BOOL)networkDataAvailable
{
  return self->_networkDataAvailable;
}

- (IMDAccountController)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMDAccountController;
  v2 = [(IMDAccountController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__daemonWillShutdown_ name:@"__kIMDaemonWillShutdownNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_accounts;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v9 = [v8 idsAccount];
          [v9 removeDelegate:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)IMDAccountController;
  [(IMDAccountController *)&v10 dealloc];
}

- (void)load
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  self->_isLoading = 1;
  activeAccounts = self->_activeAccounts;
  self->_isFirstLoad = activeAccounts == 0;
  if (!activeAccounts)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v5 = self->_activeAccounts;
    self->_activeAccounts = Mutable;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = +[IMDServiceController sharedController];
      v8 = [v7 allServices];
      char v9 = [v8 arrayByApplyingSelector:sel_internalName];
      objc_super v10 = v9;
      long long v11 = @"YES";
      if (!self->_isFirstLoad) {
        long long v11 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v107 = v9;
      __int16 v108 = 2112;
      v109 = v11;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Loading services: %@ (First load: %@)", buf, 0x16u);
    }
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v12 = +[IMDServiceController sharedController];
  obuint64_t j = [v12 allServices];

  uint64_t v80 = [obj countByEnumeratingWithState:&v98 objects:v105 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v99;
    uint64_t v75 = *MEMORY[0x1E4F6C680];
    uint64_t v74 = *MEMORY[0x1E4F6BFD8];
    uint64_t v76 = *MEMORY[0x1E4F6C730];
    uint64_t v77 = *MEMORY[0x1E4F6C690];
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v99 != v79) {
          objc_enumerationMutation(obj);
        }
        v85 = *(IMDAccountController **)(*((void *)&v98 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          long long v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v85;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Loading service: %@", buf, 0xCu);
          }
        }
        if ([(IMDAccountController *)v85 isDiscontinued])
        {
          if (IMOSLoggingEnabled())
          {
            long long v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = self;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "service: %@ has been discontinued. Loading default disabled account", buf, 0xCu);
            }
          }
          v83 = [(IMDAccountController *)v85 createDiscontinuedAccount];
          [(IMDAccountController *)self addAccount:v83];
          goto LABEL_126;
        }
        char v15 = [(IMDAccountController *)v85 isIDSBased];
        v83 = [(IMDAccountController *)v85 serviceDefaults];
        if (v15)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v85;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, " Not loading accounts from defaults, appears to be IDS Based: %@", buf, 0xCu);
            }
          }
          v17 = [(IMDAccountController *)v85 accountsLoadedFromIdentityServices];
          if (IMOSLoggingEnabled())
          {
            v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v17;
              _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, " Found accounts: %@", buf, 0xCu);
            }
          }
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          v19 = v17;
          uint64_t v20 = [(IMDAccountController *)v19 countByEnumeratingWithState:&v90 objects:v103 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v91;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v91 != v21) {
                  objc_enumerationMutation(v19);
                }
                v23 = *(IMDAccountController **)(*((void *)&v90 + 1) + 8 * j);
                if (IMOSLoggingEnabled())
                {
                  v24 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v107 = v23;
                    _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, " Loading: %@", buf, 0xCu);
                  }
                }
                [(IMDAccountController *)v23 setLoading:1];
                [(IMDAccountController *)self addAccount:v23];
                [(IMDAccountController *)v23 setLoading:0];
                if (IMOSLoggingEnabled())
                {
                  v25 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, " Done", buf, 2u);
                  }
                }
              }
              uint64_t v20 = [(IMDAccountController *)v19 countByEnumeratingWithState:&v90 objects:v103 count:16];
            }
            while (v20);
          }

          v26 = [(IMDAccountController *)v85 activeAccountsFromIdentityServices];
          if ([v26 count]) {
            [(IMDAccountController *)self activateAccounts:v26];
          }
          id v84 = 0;
        }
        else
        {
          id v84 = [v83 objectForKey:v75];

          v27 = [(IMDAccountController *)self accountsForService:v85];
          int v28 = [v27 count];

          int v29 = [(IMDAccountController *)v85 requiresSingleAccount];
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v30 = [v84 allKeys];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v94 objects:v104 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v95;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v95 != v32) {
                  objc_enumerationMutation(v30);
                }
                v34 = *(IMDAccountController **)(*((void *)&v94 + 1) + 8 * k);
                v35 = [(IMDAccountController *)self accountForAccountID:v34];
                BOOL v36 = v35 != 0;

                if (v28 > 0) {
                  int v37 = v29;
                }
                else {
                  int v37 = 0;
                }
                if (((v36 | v37) & 1) == 0)
                {
                  if (IMOSLoggingEnabled())
                  {
                    v38 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v107 = v34;
                      _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "   Creating account with ID: %@", buf, 0xCu);
                    }
                  }
                  v39 = [v84 objectForKey:v34];
                  if (![v39 count])
                  {
                    uint64_t v40 = [(IMDAccountController *)v85 defaultAccountSettings];

                    v39 = (void *)v40;
                  }
                  v41 = [[IMDAccount alloc] initWithAccountID:v34 defaults:v39 service:v85];
                  [(IMDAccount *)v41 setLoading:1];
                  [(IMDAccountController *)self addAccount:v41];
                  [(IMDAccount *)v41 setLoading:0];

                  ++v28;
                }
              }
              uint64_t v31 = [v30 countByEnumeratingWithState:&v94 objects:v104 count:16];
            }
            while (v31);
          }

          if ([v84 count]) {
            goto LABEL_84;
          }
          if (v28 > 0) {
            goto LABEL_84;
          }
          v42 = [(IMDAccountController *)v85 serviceProperties];
          v43 = [v42 objectForKey:v74];
          BOOL v44 = [v43 intValue] == 0;

          if (v44) {
            goto LABEL_84;
          }
          v19 = [NSString stringGUID];
          if (IMOSLoggingEnabled())
          {
            v45 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v19;
              _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "   Creating persistent session with ID: %@", buf, 0xCu);
            }
          }
          v26 = [(IMDAccountController *)v85 defaultAccountSettings];
          v46 = [[IMDAccount alloc] initWithAccountID:v19 defaults:v26 service:v85];
          [(IMDAccountController *)self addAccount:v46];
          if ([(IMDAccountController *)v85 shouldCreateActiveAccounts])
          {
            if (IMOSLoggingEnabled())
            {
              v47 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v107 = v19;
                _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "  Service wants new accounts active, setting active: %@", buf, 0xCu);
              }
            }
            [(IMDAccountController *)self activateAccount:v19];
          }
        }
LABEL_84:
        v48 = [v83 objectForKey:v77];
        v81 = [v83 objectForKey:v76];
        if (IMOSLoggingEnabled())
        {
          v49 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v48;
            _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "  Setting active accounts: %@", buf, 0xCu);
          }
        }
        if (v48) {
          [(IMDAccountController *)self activateAccounts:v48];
        }
        if ((([(IMDAccountController *)v85 disallowDeactivation] & 1) != 0
           || [(IMDAccountController *)v85 shouldForceAccountsActive])
          && [v84 count])
        {
          if (IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v51 = [v84 allKeys];
              *(_DWORD *)buf = 138412290;
              v107 = v51;
              _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "  Service wants accounts always active, setting active: %@", buf, 0xCu);
            }
          }
          v52 = [v84 allKeys];
          [(IMDAccountController *)self activateAccounts:v52];
        }
        if (v81)
        {
          if (IMOSLoggingEnabled())
          {
            v53 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v81;
              _os_log_impl(&dword_1D967A000, v53, OS_LOG_TYPE_INFO, "Logging in previously logged in accounts: %@", buf, 0xCu);
            }
          }
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          v54 = v81;
          uint64_t v55 = [(IMDAccountController *)v54 countByEnumeratingWithState:&v86 objects:v102 count:16];
          if (v55)
          {
            uint64_t v56 = *(void *)v87;
            do
            {
              for (uint64_t m = 0; m != v55; ++m)
              {
                if (*(void *)v87 != v56) {
                  objc_enumerationMutation(v54);
                }
                v58 = *(IMDAccountController **)(*((void *)&v86 + 1) + 8 * m);
                v59 = [(IMDAccountController *)self accountForAccountID:v58];
                int v60 = IMOSLoggingEnabled();
                if (v59)
                {
                  if (v60)
                  {
                    v61 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v107 = v59;
                      _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, "  * Logging in previously logged in account: %@", buf, 0xCu);
                    }
                  }
                  [(IMDAccountController *)v59 createSessionIfNecessary];
                  v62 = [(IMDAccountController *)v59 session];
                  [v62 login];
                }
                else if (v60)
                {
                  v63 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v107 = v58;
                    _os_log_impl(&dword_1D967A000, v63, OS_LOG_TYPE_INFO, "  * No account found for account ID: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v55 = [(IMDAccountController *)v54 countByEnumeratingWithState:&v86 objects:v102 count:16];
            }
            while (v55);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v64 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v85;
            _os_log_impl(&dword_1D967A000, v64, OS_LOG_TYPE_INFO, "Done loading service: %@", buf, 0xCu);
          }
        }
LABEL_126:
      }
      uint64_t v80 = [obj countByEnumeratingWithState:&v98 objects:v105 count:16];
    }
    while (v80);
  }

  v65 = +[IMDServiceController sharedController];
  v66 = [v65 serviceWithName:*MEMORY[0x1E4F6E1B0]];

  if (v66)
  {
    v67 = [(IMDAccountController *)self accountsForService:v66];
    v68 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v107 = v66;
      __int16 v108 = 2112;
      v109 = v67;
      _os_log_impl(&dword_1D967A000, v68, OS_LOG_TYPE_DEFAULT, "iMessage service found: %@    accounts: %@", buf, 0x16u);
    }

    if ([v67 count])
    {
      v69 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, &v69->super, OS_LOG_TYPE_DEFAULT, "   We have iMessage acounts, good to go", buf, 2u);
      }
      goto LABEL_145;
    }
    v69 = [[IMDAccount alloc] initWithAccountID:@"PlaceholderAccount" defaults:0 service:v66];
    v70 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v107 = (IMDAccountController *)v69;
      _os_log_impl(&dword_1D967A000, v70, OS_LOG_TYPE_DEFAULT, "   Empty iMessage accounts, created one: %@", buf, 0xCu);
    }

    if (v69)
    {
      [(IMDAccountController *)self addAccount:v69];
      v71 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v72 = "   Added, and moving along";
LABEL_143:
        _os_log_impl(&dword_1D967A000, v71, OS_LOG_TYPE_DEFAULT, v72, buf, 2u);
      }
    }
    else
    {
      v71 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v72 = "   No account created";
        goto LABEL_143;
      }
    }

LABEL_145:
    goto LABEL_146;
  }
  v67 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D967A000, v67, OS_LOG_TYPE_DEFAULT, "No iMessage service found", buf, 2u);
  }
LABEL_146:

  if (IMOSLoggingEnabled())
  {
    v73 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v73, OS_LOG_TYPE_INFO, "Done loading all services", buf, 2u);
    }
  }
  *(_WORD *)&self->_isLoading = 0;
  [(IMDAccountController *)self _checkPowerAssertion];
}

- (void)deferredSave
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];

  [(IMDAccountController *)self performSelector:sel_save withObject:0 afterDelay:10.0];
}

- (void)save
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];
  if (!self->_isLoading)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = +[IMDServiceController sharedController];
    uint64_t v4 = [v3 allServices];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) saveSettings];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)activateAccount:(id)a3
{
  if (a3)
  {
    IMSingleObjectArray();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(IMDAccountController *)self activateAccounts:v4];
  }
}

- (void)activateAccounts:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = (IMDAccountController *)a3;
  if (self->_isFirstLoad) {
    id v47 = 0;
  }
  else {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Activating accounts: %@", buf, 0xCu);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [(IMDAccountController *)obj countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v6)
  {
    id v49 = *(id *)v57;
    *(void *)&long long v7 = 138412546;
    long long v46 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(id *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(IMDAccountController **)(*((void *)&v56 + 1) + 8 * i);
        -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v9, v46);
        long long v10 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          long long v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v10;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "   Found account: %@", buf, 0xCu);
          }
        }
        if (v10)
        {
          if ([(IMDAccountController *)v10 isDisabled])
          {
            if (IMOSLoggingEnabled())
            {
              long long v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "      => Disabled, continuing", buf, 2u);
              }
            }
          }
          else
          {
            long long v13 = [(IMDAccountController *)v10 service];
            if (IMOSLoggingEnabled())
            {
              uint64_t v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v13;
                _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "      Found service: %@", buf, 0xCu);
              }
            }
            if ([(IMDAccountController *)v13 isDiscontinued])
            {
              if (IMOSLoggingEnabled())
              {
                char v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "      => Service discontinued, skipping.", buf, 2u);
                }
              }
            }
            else
            {
              activeAccounts = self->_activeAccounts;
              v17 = [(IMDAccountController *)v13 internalName];
              v18 = [(NSMutableDictionary *)activeAccounts objectForKey:v17];
              v19 = (IMDAccountController *)[v18 mutableCopy];

              if (!v19) {
                v19 = (IMDAccountController *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              if (([(IMDAccountController *)v19 containsObject:v9] & 1) == 0)
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v20 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v46;
                    v62 = v9;
                    __int16 v63 = 2112;
                    v64 = v19;
                    _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "      Adding account: %@ to active set: %@", buf, 0x16u);
                  }
                }
                if ([(IMDAccountController *)v13 supportsOneSessionForAllAccounts]&& [(IMDAccountController *)v19 count])
                {
                  uint64_t v21 = [(IMDAccountController *)v19 lastObject];
                  v22 = [(IMDAccountController *)self accountForAccountID:v21];

                  v23 = [v22 session];
                  if (v23)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v24 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v62 = v23;
                        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Reusing session: %@", buf, 0xCu);
                      }
                    }
                    [(IMDAccountController *)v10 setSession:v23];
                    [(IMDAccountController *)v23 addAccount:v10];
                    [(IMDAccountController *)v23 sessionDidBecomeActive];
                    v25 = [(IMDAccountController *)v10 service];
                    int v26 = [v25 shouldForceAccountsConnected];

                    if (v26)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        v27 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          v62 = self;
                          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "%@: Forcing login", buf, 0xCu);
                        }
                      }
                      int v28 = [(IMDAccountController *)v10 session];
                      [v28 loginWithAccount:v10];
                    }
                  }
                }
                [(IMDAccountController *)v19 addObject:v9];
                [v47 addObject:v13];
                if (IMOSLoggingEnabled())
                {
                  int v29 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v62 = v19;
                    _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "      Active account set is: %@", buf, 0xCu);
                  }
                }
                v30 = self->_activeAccounts;
                if (!v30)
                {
                  Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                  uint64_t v32 = self->_activeAccounts;
                  self->_activeAccounts = Mutable;

                  v30 = self->_activeAccounts;
                }
                v33 = [(IMDAccountController *)v13 internalName];
                [(NSMutableDictionary *)v30 setObject:v19 forKey:v33];

                if (IMOSLoggingEnabled())
                {
                  v34 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "      Building sesssion", buf, 2u);
                  }
                }
                [(IMDAccountController *)v10 createSessionIfNecessary];
                if (IMOSLoggingEnabled())
                {
                  v35 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "      Enable the associated account", buf, 2u);
                  }
                }
                [(IMDAccountController *)v13 enableAccount:v10];
              }
            }
          }
        }
      }
      uint64_t v6 = [(IMDAccountController *)obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v6);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v50 = v47;
  uint64_t v36 = [v50 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(v50);
        }
        v39 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        uint64_t v40 = +[IMDBroadcastController sharedProvider];
        v41 = [v40 broadcasterForListenersSupportingService:v39];
        v42 = [(IMDAccountController *)self activeAccountsForService:v39];
        v43 = [v42 arrayByApplyingSelector:sel_accountID];
        BOOL v44 = [v39 internalName];
        [v41 activeAccountsChanged:v43 forService:v44];
      }
      uint64_t v36 = [v50 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v36);
  }

  if ([v50 count]) {
    [(IMDAccountController *)self _rebuildOperationalAccountsCache];
  }
  v45 = self;
  if (!self->_isLoading)
  {
    [(IMDAccountController *)self save];
    v45 = self;
  }
  [(IMDAccountController *)v45 _checkPowerAssertion];
}

- (void)deactivateAccounts:(id)a3 force:(BOOL)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v5;
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating accounts: %@", buf, 0xCu);
  }

  if (self->_isFirstLoad) {
    id v36 = 0;
  }
  else {
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v45;
    *(void *)&long long v8 = 138412290;
    long long v35 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v12 = -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v11, v35);
        long long v13 = [v12 service];
        uint64_t v14 = v13;
        if (!v12)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_34;
          }
          v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            id v51 = v11;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Tried to deactivate an account, but found no account: %@", buf, 0xCu);
          }
LABEL_33:

          goto LABEL_34;
        }
        if (!v13)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_34;
          }
          v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            id v51 = v11;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Tried to deactivate an account, but found no service; %@",
              buf,
              0xCu);
          }
          goto LABEL_33;
        }
        if (a4 || ([v13 shouldForceAccountsActive] & 1) == 0)
        {
          activeAccounts = self->_activeAccounts;
          uint64_t v16 = [v14 internalName];
          v17 = [(NSMutableDictionary *)activeAccounts objectForKey:v16];
          id v18 = (id)[v17 mutableCopy];

          if (!v18) {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          if (([v18 containsObject:v11] & 1) != 0
            || [v12 isAccountKeyCDPSyncingOrWaitingForUser])
          {
            [v18 removeObject:v11];
            [v36 addObject:v14];
            v19 = self->_activeAccounts;
            if (!v19)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              uint64_t v21 = self->_activeAccounts;
              self->_activeAccounts = Mutable;

              v19 = self->_activeAccounts;
            }
            v22 = [v14 internalName];
            [(NSMutableDictionary *)v19 setObject:v18 forKey:v22];

            v23 = [v12 session];
            if (v23 && (unint64_t)[v12 loginStatus] >= 3)
            {
              v24 = [v12 session];
              [v24 logout];
            }
            [v14 disableAccount:v12];
            [v23 removeAccount:v12];
            [v12 releaseSession];
          }
        }
LABEL_34:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v7);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v38 = v36;
  uint64_t v26 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v38);
        }
        int v29 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        v30 = +[IMDBroadcastController sharedProvider];
        uint64_t v31 = [v30 broadcasterForListenersSupportingService:v29];
        uint64_t v32 = [(IMDAccountController *)self activeAccountsForService:v29];
        v33 = [v32 arrayByApplyingSelector:sel_accountID];
        v34 = [v29 internalName];
        [v31 activeAccountsChanged:v33 forService:v34];
      }
      uint64_t v26 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v26);
  }

  if ([v38 count]) {
    [(IMDAccountController *)self _rebuildOperationalAccountsCache];
  }
  if (!self->_isLoading) {
    [(IMDAccountController *)self save];
  }
  [(IMDAccountController *)self _checkPowerAssertion];
}

- (void)deactivateAccount:(id)a3
{
  if (a3)
  {
    IMSingleObjectArray();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(IMDAccountController *)self deactivateAccounts:v4];
  }
}

- (void)deactivateAccounts:(id)a3
{
}

- (void)deactivateAccount:(id)a3 force:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    IMSingleObjectArray();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(IMDAccountController *)self deactivateAccounts:v6 force:v4];
  }
}

- (void)addAccount:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Add account: %@", buf, 0xCu);
      }
    }
    id v6 = [v4 accountID];
    long long v43 = [(IMDAccountController *)self accountForAccountID:v6];

    if (v43)
    {
      id v44 = v43;
      uint64_t v7 = [v4 accountDefaults];
      [v44 writeAccountDefaults:v7];
    }
    else
    {
      accounts = self->_accounts;
      if (!accounts)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        long long v10 = self->_accounts;
        self->_accounts = Mutable;

        accounts = self->_accounts;
      }
      long long v11 = [v4 accountID];
      [(NSMutableDictionary *)accounts setObject:v4 forKey:v11];

      id v44 = v4;
    }
    if (!self->_isFirstLoad)
    {
      long long v12 = +[IMDBroadcastController sharedProvider];
      long long v13 = [v4 service];
      uint64_t v14 = [v12 broadcasterForListenersSupportingService:v13];
      char v15 = [v44 accountID];
      uint64_t v16 = [v44 accountDefaults];
      v17 = [v4 service];
      id v18 = [v17 internalName];
      [v14 accountAdded:v15 defaults:v16 service:v18];

      [(IMDAccountController *)self _rebuildOperationalAccountsCache];
      [v44 writeAccountDefaults:0];
      [v44 postAccountCapabilities];
      if (!self->_isFirstLoad && !self->_isLoading)
      {
        v19 = [v4 service];
        [v19 accountAdded:v4];

        uint64_t v20 = +[IMDServiceController sharedController];
        long long v42 = [v20 serviceWithName:*MEMORY[0x1E4F6E1B0]];

        uint64_t v21 = [v4 service];
        LODWORD(v20) = v21 == v42;

        if (v20)
        {
          [(IMDAccountController *)self accountsForService:v42];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v50;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v50 != v24) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v26 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                uint64_t v27 = [v26 loginID];
                if (![v27 length])
                {

LABEL_26:
                  id v30 = v26;

                  if (v30) {
                    BOOL v31 = v30 == v4;
                  }
                  else {
                    BOOL v31 = 1;
                  }
                  if (!v31)
                  {
                    uint64_t v32 = [MEMORY[0x1E4F6C3B8] registration];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v56 = v30;
                      _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_DEFAULT, "*** Removing placeholder account: %@", buf, 0xCu);
                    }

                    [(IMDAccountController *)self removeAccount:v30];
                  }
                  goto LABEL_33;
                }
                int v28 = [v26 accountID];
                char v29 = [v28 isEqualToIgnoringCase:@"PlaceholderAccount"];

                if (v29) {
                  goto LABEL_26;
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v54 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          id v30 = 0;
LABEL_33:
        }
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v33 = [(IMDAccountController *)self accounts];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v46;
          uint64_t v36 = MEMORY[0x1E4F14428];
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v46 != v35) {
                objc_enumerationMutation(v33);
              }
              id v38 = *(void **)(*((void *)&v45 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v39 = [v38 idsAccount];
                [v39 addDelegate:self queue:v36];
              }
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v34);
        }
      }
    }
    long long v40 = [v4 service];
    if ([v40 shouldForceAccountsActive])
    {
      long long v41 = [v4 accountID];
      [(IMDAccountController *)self activateAccount:v41];
    }
  }
}

- (void)removeAccount:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Remove account: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)self->_accounts allKeysForObject:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
            long long v12 = [v4 service];
            BOOL v13 = [(IMDAccountController *)self _isAccountActive:v11 forService:v12];

            if (v13) {
              [(IMDAccountController *)self deactivateAccount:v11 force:1];
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v8);
      }
      [(NSMutableDictionary *)self->_accounts removeObjectsForKeys:v7];
      if (![(NSMutableDictionary *)self->_accounts count])
      {
        accounts = self->_accounts;
        self->_accounts = 0;
      }
      if (!self->_isLoading)
      {
        [v4 writeAccountDefaults:0];
        char v15 = +[IMDBroadcastController sharedProvider];
        uint64_t v16 = [v4 service];
        v17 = [v15 broadcasterForListenersSupportingService:v16];
        id v18 = [v4 accountID];
        [v17 accountRemoved:v18];

        [(IMDAccountController *)self _rebuildOperationalAccountsCache];
        v19 = [v4 service];
        [v19 accountRemoved:v4];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v4 idsAccount];
        [v20 removeDelegate:self];
      }
    }
    [(IMDAccountController *)self save];
  }
  [(IMDAccountController *)self _checkPowerAssertion];
}

- (id)accountsForLoginID:(id)a3 onService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IMDAccountController *)self accounts];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D9696820;
  v13[3] = &unk_1E6B72B08;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v13);

  return v11;
}

- (id)accountForHandle:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IMDAccountController *)self activeAccounts];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    id v9 = (void *)MEMORY[0x1E4F6E1B0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v12 = [v11 service];
        BOOL v13 = [v12 internalName];
        int v14 = [v13 isEqualToString:*v9];

        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v11 idsAccount];
            uint64_t v16 = [v15 aliasStrings];

            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v25;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v25 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  if ([*(id *)(*((void *)&v24 + 1) + 8 * j) isEqualToString:v4])
                  {
                    id v22 = v11;

                    goto LABEL_22;
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            id v9 = (void *)MEMORY[0x1E4F6E1B0];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      id v22 = 0;
    }
    while (v7);
  }
  else
  {
    id v22 = 0;
  }
LABEL_22:

  return v22;
}

- (id)activeAccountsWithServiceCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDAccountController *)self activeAccounts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D9696BCC;
  v9[3] = &unk_1E6B72B78;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);

  return v7;
}

- (NSArray)connectedAccounts
{
  v2 = [(IMDAccountController *)self activeAccounts];
  v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1F33903C0);

  return (NSArray *)v3;
}

- (id)connectedAccountsForService:(id)a3
{
  v3 = [(IMDAccountController *)self activeAccountsForService:a3];
  id v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &unk_1F33903E0);

  return v4;
}

- (NSArray)connectingAccounts
{
  v2 = [(IMDAccountController *)self activeAccounts];
  v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1F3390400);

  return (NSArray *)v3;
}

- (id)connectingAccountsForService:(id)a3
{
  v3 = [(IMDAccountController *)self activeAccountsForService:a3];
  id v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &unk_1F3390420);

  return v4;
}

- (BOOL)accountAssociatedWithHandle:(id)a3
{
  v3 = [(IMDAccountController *)self accountForHandle:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)accountForIDSAccountUniqueID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(IMDAccountController *)self accounts];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 idsAccount];
          uint64_t v11 = [v10 uniqueID];
          uint64_t v12 = [v11 caseInsensitiveCompare:v4];

          if (!v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSArray)activeSessions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDAccountController *)self activeAccounts];
  v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:filter:", &unk_1F3390440, &unk_1F3390460);

  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "activeSessions = %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (id)sessionForAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDAccountController *)self accountForAccountID:v4];
  id v6 = [v5 session];
  if (!v6)
  {
    uint64_t v7 = [v5 service];
    int v8 = +[IMDServiceSession existingServiceSessionForService:v7];

    if (!v8
      || ([v5 createSessionIfNecessary],
          [v5 session],
          (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          accounts = self->_accounts;
          int v12 = 138412802;
          id v13 = v4;
          __int16 v14 = 2112;
          long long v15 = v5;
          __int16 v16 = 2112;
          long long v17 = accounts;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Could not find a service session for string: %@, account: %@, allAccounts: %@", (uint8_t *)&v12, 0x20u);
        }
      }
      id v6 = 0;
    }
  }

  return v6;
}

- (id)anySessionForServiceName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDServiceController sharedController];
  id v5 = [v4 serviceWithName:v3];

  if (v5)
  {
    id v6 = +[IMDAccountController sharedInstance];
    uint64_t v7 = [v6 activeAccountsForService:v5];
    int v8 = objc_msgSend(v7, "__imFirstObject");

    if (v8)
    {
      id v9 = [v8 session];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          id v21 = v8;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find a session for account: %@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          __int16 v14 = +[IMDAccountController sharedInstance];
          id v15 = [v14 accountsForService:v5];
          __int16 v16 = +[IMDAccountController sharedInstance];
          long long v17 = [v16 accounts];
          int v20 = 138412802;
          id v21 = v3;
          __int16 v22 = 2112;
          id v23 = v15;
          __int16 v24 = 2112;
          long long v25 = v17;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find an account for serviceString: %@, accountsForService: %@, accounts: %@", (uint8_t *)&v20, 0x20u);
        }
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v3;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find a service for string: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)sessionForReplicationSourceServiceName:(id)a3 replicatingAccount:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v31 = a4;
  id v6 = +[IMDServiceController sharedController];
  long long v30 = [v6 serviceWithName:v29];

  if (v30)
  {
    [(IMDAccountController *)self activeAccountsForService:v30];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v27)
    {
      uint64_t v7 = *(void *)v37;
      uint64_t v25 = *(void *)v37;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v37 != v7)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v26 = v8;
          uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v11 = [v10 replicationSessions];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v33;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(v11);
                }
                id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                __int16 v16 = [v15 replicationService];
                long long v17 = [v16 internalName];
                uint64_t v18 = [v31 service];
                uint64_t v19 = [v18 internalName];
                int v20 = [v17 isEqualToString:v19];

                if (v20)
                {
                  if (IMOSLoggingEnabled())
                  {
                    id v23 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v41 = v15;
                      __int16 v42 = 2112;
                      id v43 = v31;
                      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Found source session %@ for replicating account %@", buf, 0x16u);
                    }
                  }
                  id v22 = v15;

                  goto LABEL_28;
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v26 + 1;
          uint64_t v7 = v25;
        }
        while (v26 + 1 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
        uint64_t v7 = v25;
      }
      while (v27);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v29;
      __int16 v42 = 2112;
      id v43 = v31;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "IMDAccountController: No source session on service %@ for replicating account %@", buf, 0x16u);
    }
  }
  id v22 = 0;
LABEL_28:

  return v22;
}

- (void)_rebuildOperationalAccountsCache
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  self->_operationalAccountsCache = 0;

  id v5 = [(IMDAccountController *)self _operationalAccounts];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      uint64_t v12 = v3;
      __int16 v13 = 2112;
      __int16 v14 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Rebuilding operational accounts, old: (%@)  new: (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v7 = [v5 count];
  if (v7 != -[NSSet count](v3, "count") || ([v5 isEqualToSet:v3] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Removing replication sessions due to account rebuild", (uint8_t *)&v11, 2u);
      }
    }
    [(IMDAccountController *)self _resetAccountReplicationSessions];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Operational accounts changed", (uint8_t *)&v11, 2u);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMDBadgeUtilitiesOperationalAccountsChangedNotification", 0, 0, 1u);
  }
}

- (void)_resetAccountReplicationSessions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(IMDAccountController *)self activeAccounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetReplicationSessions];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_operationalAccounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  if (operationalAccountsCache)
  {
    uint64_t v4 = operationalAccountsCache;
  }
  else
  {
    uint64_t v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(IMDAccountController *)self activeAccounts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ([(IMDAccountController *)self _isOperationalForAccount:v11]) {
            [(NSSet *)v4 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_operationalAccountsCache, v4);
  }

  return v4;
}

- (BOOL)_isOperationalForAccount:(id)a3
{
  id v3 = a3;
  if ([v3 isActive])
  {
    uint64_t v4 = [v3 service];
    int v5 = [v4 supportsRegistration];

    BOOL v8 = !v5
      || [v3 accountType] != 2
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || ([v3 idsAccount],
           uint64_t v6 = objc_claimAutoreleasedReturnValue(),
           uint64_t v7 = [v6 profileValidationStatus],
           v6,
           v7 != 3))
      || [v3 registrationStatus] == 5;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_nicknameController
{
  return +[IMDNicknameController sharedInstance];
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 serviceName];
  int v8 = [v7 isEqualToString:@"com.apple.madrid"];

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [v6 canSend];
      uint64_t v11 = @"NO";
      if (v4) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      *(_DWORD *)long long v17 = 138413058;
      *(void *)&v17[4] = v6;
      if (v10) {
        long long v13 = @"YES";
      }
      else {
        long long v13 = @"NO";
      }
      *(void *)&v17[14] = v12;
      *(_WORD *)&v17[12] = 2112;
      *(_WORD *)&v17[22] = 2112;
      if (v8) {
        uint64_t v11 = @"YES";
      }
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      int v20 = v11;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "IDS account %@ is active %@ can send %@ is madrid account %@", v17, 0x2Au);
    }
  }
  if (v8)
  {
    long long v14 = [(IMDAccountController *)self _nicknameController];
    long long v15 = v14;
    if (v4) {
      [v14 newDeviceDidSignIntoiMessage];
    }
    else {
      [v14 deviceSignedOutOfiMessage];
    }
  }
  long long v16 = +[IMDBadgeUtilities sharedInstance];
  [v16 updateBadgeInCaseOfMistakenLoginInvalidation];

  [(IMDAccountController *)self _rebuildOperationalAccountsCache];
}

- (void)setNetworkDataAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "calling setNetwork %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (self->_networkDataAvailable != v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "  => broadcasting", (uint8_t *)&v10, 2u);
      }
    }
    self->_networkDataAvailable = v3;
    int v8 = +[IMDBroadcastController sharedProvider];
    uint64_t v9 = [v8 broadcasterForAllListeners];
    [v9 networkDataAvailabilityChanged:v3];
  }
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalAccountsCache, 0);
  objc_storeStrong((id *)&self->_activeAccounts, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

- (id)activeAliases
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  [(IMDAccountController *)self activeAccountsWithServiceCapability:*MEMORY[0x1E4F6E078]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 idsAccount];
          int v10 = [v9 aliasStrings];

          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                if ([v16 length]
                  && ((IMStringIsEmail() & 1) != 0 || MEMORY[0x1E0169B60](v16)))
                {
                  [v3 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  long long v17 = [v3 allObjects];

  return v17;
}

- (BOOL)activeAccountsAreEligibleForHawking
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(IMDAccountController *)self activeAccounts];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v8 = [v7 service];
          uint64_t v9 = [v8 internalName];
          char v10 = [v9 isEqualToString:*MEMORY[0x1E4F6E190]];

          if ((v10 & 1) == 0)
          {
            id v11 = [v7 idsAccount];
            uint64_t v12 = [v11 regionID];

            if ([MEMORY[0x1E4F6EA38] accountRegionIsCandidateForHawking:v12])
            {
LABEL_22:

              BOOL v20 = 1;
              goto LABEL_24;
            }
            uint64_t v13 = [v7 idsAccount];
            uint64_t v14 = [v13 aliasStrings];

            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v23;
              while (2)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v23 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  if ([MEMORY[0x1E4F6EA38] receiverIsCandidateForHawking:*(void *)(*((void *)&v22 + 1) + 8 * j)])
                  {

                    goto LABEL_22;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
      BOOL v20 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_24:

  return v20;
}

- (BOOL)receiverIsCandidateForHawking:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = IMChatCanonicalIDSIDsForAddress();
    uint64_t v6 = MEMORY[0x1E0169B80]();

    uint64_t v7 = [MEMORY[0x1E4F6EA38] mapID:v6 usingKey:*MEMORY[0x1E4F6EB30]];

    if (MEMORY[0x1E0169B60](v7))
    {
      int v8 = IMCountryCodeForNumber();
      int v9 = [v8 isEqualToString:@"cn"];
      int v10 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v10)
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v18 = 138412546;
            __int16 v19 = v7;
            __int16 v20 = 2112;
            id v21 = v8;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for spam filtering.", (uint8_t *)&v18, 0x16u);
          }
          goto LABEL_30;
        }
      }
      else if (v10)
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          __int16 v19 = v7;
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is not a candidate for spam filtering.", (uint8_t *)&v18, 0x16u);
        }
        goto LABEL_30;
      }
LABEL_31:

      goto LABEL_32;
    }
    if (!IMStringIsEmail())
    {
      LOBYTE(v9) = 0;
LABEL_32:

      goto LABEL_33;
    }
    int v8 = [(IMDAccountController *)self accountForHandle:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          __int16 v19 = v8;
          __int16 v20 = 2112;
          id v21 = (id)objc_opt_class();
          id v16 = v21;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Found an account (%@) that isn't IMDIDS (%@), can't determien region -- falling through.", (uint8_t *)&v18, 0x16u);
        }
      }
      LOBYTE(v9) = 0;
      goto LABEL_31;
    }
    uint64_t v12 = [v8 idsAccount];
    id v11 = [v12 regionID];

    int v9 = [MEMORY[0x1E4F6EA38] accountRegionIsCandidateForHawking:v11];
    int v13 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v13)
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          __int16 v19 = v7;
          __int16 v20 = 2112;
          id v21 = v11;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Receiving id (%@) with region (%@) is a candidate for spam filtering.", (uint8_t *)&v18, 0x16u);
        }
LABEL_29:
      }
    }
    else if (v13)
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412546;
        __int16 v19 = v7;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Receiving id (%@) with region (%@) is not a candidate for spam filtering.", (uint8_t *)&v18, 0x16u);
      }
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  LOBYTE(v9) = 0;
LABEL_33:

  return v9;
}

- (BOOL)hasActivePhoneAccount
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(IMDAccountController *)self activeAccounts];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    uint64_t v6 = (void *)MEMORY[0x1E4F6E190];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v9 = [v8 service];
        int v10 = [v9 internalName];
        char v11 = [v10 isEqualToString:*v6];

        if ((v11 & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [v8 idsAccount];
            int v13 = [v12 aliasStrings];

            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v14 = v13;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v22;
              while (2)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v22 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  if (MEMORY[0x1E0169B60](*(void *)(*((void *)&v21 + 1) + 8 * j)))
                  {

                    BOOL v19 = 1;
                    goto LABEL_22;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v19 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_22:

  return v19;
}

- (BOOL)receiverIsCandidateForJunk:(id)a3 forAccount:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = MEMORY[0x1E0169B80](v5);
    int v8 = [MEMORY[0x1E4F6EA38] mapID:v7 usingKey:*MEMORY[0x1E4F6E548]];
    if (MEMORY[0x1E0169B60]())
    {
      int v9 = IMCountryCodeForNumber();
      if (IMOSLoggingEnabled())
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v37 = v8;
          __int16 v38 = 2112;
          id v39 = v9;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Receiving ID: %@ has country code: %@", buf, 0x16u);
        }
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      char v11 = [MEMORY[0x1E4F6EA38] telephonyCountryCodesEligibleForJunkFiltering];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v30 + 1) + 8 * i) isEqualToString:v9])
            {
              if (IMOSLoggingEnabled())
              {
                long long v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v37 = v8;
                  __int16 v38 = 2112;
                  id v39 = v9;
                  _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for Oscar filtering.", buf, 0x16u);
                }
              }
              LOBYTE(v12) = 1;
              goto LABEL_39;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_39:
    }
    else
    {
      if (IMStringIsEmail())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v6 idsAccount];
          uint64_t v16 = [v15 regionID];

          if (IMOSLoggingEnabled())
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v8;
              __int16 v38 = 2112;
              id v39 = v16;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Receiving ID: %@ has region: %@", buf, 0x16u);
            }
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          int v18 = objc_msgSend(MEMORY[0x1E4F6EA38], "accountRegionsEligibleForJunkFiltering", 0);
          uint64_t v12 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v19 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v18);
                }
                if ([*(id *)(*((void *)&v26 + 1) + 8 * j) isEqualToString:v16])
                {
                  if (IMOSLoggingEnabled())
                  {
                    long long v24 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v37 = v16;
                      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for Oscar filtering.", buf, 0xCu);
                    }
                  }
                  LOBYTE(v12) = 1;
                  goto LABEL_50;
                }
              }
              uint64_t v12 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_50:

          goto LABEL_51;
        }
        if (IMOSLoggingEnabled())
        {
          long long v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v6;
            __int16 v38 = 2112;
            id v39 = (id)objc_opt_class();
            id v23 = v39;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Found an account (%@) that isn't IMDIDS (%@), can't determine region -- falling through.", buf, 0x16u);
          }
        }
      }
      LOBYTE(v12) = 0;
    }
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1D98FDB3C((uint64_t)v5, v7);
  }
  LOBYTE(v12) = 0;
LABEL_52:

  return v12;
}

@end