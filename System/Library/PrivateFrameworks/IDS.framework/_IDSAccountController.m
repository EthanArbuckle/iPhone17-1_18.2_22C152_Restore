@interface _IDSAccountController
- (NSSet)accounts;
- (NSSet)enabledAccounts;
- (NSSet)internalAccounts;
- (NSString)serviceName;
- (_IDSAccountController)initWithService:(id)a3 delegateContext:(id)a4;
- (id)accountWithLoginID:(id)a3 service:(id)a4;
- (id)accountWithUniqueID:(id)a3;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4;
- (void)_connect;
- (void)_loadCachedAccounts;
- (void)_loadCachedAccountsWithDictionaries:(id)a3;
- (void)_removeAccount:(id)a3;
- (void)_removeAndDeregisterAccount:(id)a3;
- (void)_setupAccountWithLoginID:(id)a3 accountConfig:(id)a4 authToken:(id)a5 password:(id)a6 completionHandler:(id)a7;
- (void)_updateDelegatesWithOldAccounts:(id)a3 newAccounts:(id)a4;
- (void)_updateLocalAccountVisibility;
- (void)accountAdded:(id)a3;
- (void)accountDisabled:(id)a3 onService:(id)a4;
- (void)accountEnabled:(id)a3 onService:(id)a4;
- (void)accountRemoved:(id)a3;
- (void)accountUpdated:(id)a3;
- (void)accountsChanged:(id)a3 forTopic:(id)a4;
- (void)addAccount:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)daemonDisconnected;
- (void)dealloc;
- (void)disableAccount:(id)a3;
- (void)enableAccount:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6;
- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5;
- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5;
- (void)setupCompleteForAccount:(id)a3 transactionID:(id)a4 setupError:(id)a5;
@end

@implementation _IDSAccountController

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A346CC();
    }
  }
  if (v6)
  {
    if (v7)
    {
      v11 = [(NSMapTable *)self->_delegateToInfo objectForKey:v6];

      if (!v11)
      {
        if (!self->_delegateToInfo)
        {
          v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v12;
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F6B420]);
        [v14 setQueue:v7];
        [(NSMapTable *)self->_delegateToInfo setObject:v14 forKey:v6];
      }
    }
  }
}

- (void)_loadCachedAccountsWithDictionaries:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A34BA8();
    }
  }
  self->_accountsLoaded = 1;
  v8 = +[IDSLogging Accounts];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412546;
    v39 = service;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_INFO, "Re-loading cached accounts for service: %@ with dictionaries %@", buf, 0x16u);
  }

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)[v4 _copyForEnumerating];
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v30 = v4;
    v12 = 0;
    uint64_t v13 = *(void *)v34;
    uint64_t v14 = *MEMORY[0x1E4F6B7F0];
    uint64_t v15 = *MEMORY[0x1E4F6B700];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v17 = v12;
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = [v18 objectForKey:v14];

        v19 = [v18 objectForKey:v15];
        int v20 = [v19 intValue];

        if (IDSIsValidAccountType())
        {
          v21 = [(_IDSAccountController *)self accountWithUniqueID:v12];
          if (v21)
          {
            v22 = v21;
            v23 = [v21 _internal];
            [v23 setAccountInfo:v18];
          }
          else
          {
            v22 = [[IDSAccount alloc] _initWithDictionary:v18 uniqueID:v12 serviceName:self->_service];
          }
          [v22 _setIsEnabled:[(NSMutableSet *)self->_enabledAccounts containsObject:v12]];
          [v31 addObject:v22];
        }
        else
        {
          v22 = +[IDSLogging IDSAccountController];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v39) = v20;
            _os_log_error_impl(&dword_19190B000, v22, OS_LOG_TYPE_ERROR, "Account loaded was of unknown account type %d, ignoring...", buf, 8u);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);

    id v4 = v30;
  }

  cachedAccounts = self->_cachedAccounts;
  p_cachedAccounts = &self->_cachedAccounts;
  if (([(NSMutableSet *)cachedAccounts isEqualToSet:v31] & 1) == 0)
  {
    if ([(NSMutableSet *)*p_cachedAccounts count])
    {
      v26 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_191A34B18((id *)p_cachedAccounts);
      }
    }
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v31];
    v28 = *p_cachedAccounts;
    *p_cachedAccounts = (NSMutableSet *)v27;

    v29 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_191A34A8C(v31);
    }
  }
}

- (void)_updateDelegatesWithOldAccounts:(id)a3 newAccounts:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSLogging IDSAccountController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Updating delegates of account changes", buf, 2u);
  }

  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v6];
  [v9 minusSet:v7];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
  [v10 minusSet:v6];
  id v30 = v7;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v7];
  id v31 = v6;
  [v11 intersectSet:v6];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * v16);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = sub_19198B9E4;
        v42[3] = &unk_1E572B7C8;
        v42[4] = self;
        v42[5] = v17;
        [(_IDSAccountController *)self _callDelegatesWithBlock:v42];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v14);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * v22);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = sub_19198BA60;
        v37[3] = &unk_1E572B7C8;
        v37[4] = self;
        v37[5] = v23;
        [(_IDSAccountController *)self _callDelegatesWithBlock:v37];
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v20);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v11;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * v28);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = sub_19198BADC;
        v32[3] = &unk_1E572B7C8;
        v32[4] = self;
        v32[5] = v29;
        [(_IDSAccountController *)self _callDelegatesWithBlock:v32];
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v48 count:16];
    }
    while (v26);
  }
}

- (_IDSAccountController)initWithService:(id)a3 delegateContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A343D4();
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)_IDSAccountController;
  uint64_t v11 = [(_IDSAccountController *)&v28 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F59E30] weakRefWithObject:v7];
    id delegateContext = v11->_delegateContext;
    v11->_id delegateContext = (id)v12;

    uint64_t v14 = [v6 copy];
    service = v11->_service;
    v11->_service = (NSString *)v14;

    uint64_t v16 = [NSString copyStringGUIDForObject:v11];
    serviceToken = v11->_serviceToken;
    v11->_serviceToken = (NSString *)v16;

    id v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cachedAccounts = v11->_cachedAccounts;
    v11->_cachedAccounts = v18;

    uint64_t v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    enabledAccounts = v11->_enabledAccounts;
    v11->_enabledAccounts = v20;

    uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingAccountsToRemove = v11->_pendingAccountsToRemove;
    v11->_pendingAccountsToRemove = v22;

    v11->_isLocalAccountVisible = 1;
    id v24 = +[IDSDaemonController sharedInstance];
    uint64_t v25 = [v24 listener];
    [v25 addHandler:v11];

    [(_IDSAccountController *)v11 _connect];
    uint64_t v26 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_191A34368();
    }
  }
  return v11;
}

- (NSSet)accounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3446C();
    }
  }
  [(_IDSAccountController *)self _loadCachedAccounts];
  [(_IDSAccountController *)self _updateLocalAccountVisibility];
  id v6 = (void *)[(NSMutableSet *)self->_cachedAccounts mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_cachedAccounts;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "_internal", (void)v16);
        if ([v13 accountType] == 2)
        {
          BOOL isLocalAccountVisible = self->_isLocalAccountVisible;

          if (!isLocalAccountVisible) {
            [v6 removeObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return (NSSet *)v6;
}

- (void)_updateLocalAccountVisibility
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A35168();
    }
  }
  id v6 = (void *)[(NSMutableSet *)self->_cachedAccounts copy];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v31 = self;
    int v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v41;
    do
    {
      uint64_t v13 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v14, "_internal", v31);
        int v16 = [v15 accountType];

        if (v16 == 2)
        {
          id v17 = v14;

          id v11 = v17;
        }
        else
        {
          long long v18 = [v14 _internal];
          if ([v18 _isEnabled])
          {
            long long v19 = [v14 _internal];
            if ([v19 registrationStatus] == 5)
            {
              uint64_t v20 = [v14 _internal];
              [v20 aliases];
              uint64_t v21 = v12;
              int v22 = v10;
              id v23 = v11;
              v25 = id v24 = v7;
              BOOL v26 = [v25 count] != 0;

              id v7 = v24;
              id v11 = v23;
              int v10 = v22;
              uint64_t v12 = v21;
              uint64_t v9 = v32;
            }
            else
            {
              BOOL v26 = 0;
            }
          }
          else
          {
            BOOL v26 = 0;
          }

          v10 |= v26;
        }
        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v9);

    if (v11)
    {
      if (v10)
      {
        if (v31->_isLocalAccountVisible)
        {
          v31->_BOOL isLocalAccountVisible = 0;
          uint64_t v27 = [MEMORY[0x1E4F6C3B8] registration];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "We have a real account registered, hiding local account", buf, 2u);
          }

          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = sub_19198CBD4;
          v37[3] = &unk_1E572B7C8;
          v37[4] = v31;
          id v11 = v11;
          id v38 = v11;
          [(_IDSAccountController *)v31 _callDelegatesWithBlock:v37];
          objc_super v28 = v38;
LABEL_32:
        }
      }
      else if (!v31->_isLocalAccountVisible)
      {
        v31->_BOOL isLocalAccountVisible = 1;
        uint64_t v29 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "We don't have a real account registered, adding and enabling local account", buf, 2u);
        }

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = sub_19198CC50;
        v35[3] = &unk_1E572B7C8;
        v35[4] = v31;
        id v30 = v11;
        id v36 = v30;
        [(_IDSAccountController *)v31 _callDelegatesWithBlock:v35];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = sub_19198CCCC;
        v33[3] = &unk_1E572B7C8;
        v33[4] = v31;
        id v11 = v30;
        id v34 = v11;
        [(_IDSAccountController *)v31 _callDelegatesWithBlock:v33];

        objc_super v28 = v36;
        goto LABEL_32;
      }
    }
  }
  else
  {

    id v11 = 0;
  }
}

- (void)_loadCachedAccounts
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A34CA8();
    }
  }
  if (!self->_accountsLoaded)
  {
    id v6 = +[IDSDaemonController sharedInstance];
    [v6 blockUntilConnected];

    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_cachedAccounts];
    id v7 = +[IDSDaemonController sharedInstance];
    uint64_t v8 = [v7 listener];
    uint64_t v9 = [v8 accountDictionariesForService:self->_service];

    objc_super v28 = (void *)v9;
    [(_IDSAccountController *)self _loadCachedAccountsWithDictionaries:v9];
    p_enabledAccounts = &self->_enabledAccounts;
    id v11 = (void *)[(NSMutableSet *)self->_enabledAccounts copy];
    [(NSMutableSet *)self->_enabledAccounts removeAllObjects];
    uint64_t v12 = +[IDSDaemonController sharedInstance];
    uint64_t v13 = [v12 listener];
    uint64_t v14 = [v13 enabledAccountsForService:self->_service];

    if ([v14 count]) {
      [(NSMutableSet *)*p_enabledAccounts addObjectsFromArray:v14];
    }
    if (([v11 isEqualToSet:*p_enabledAccounts] & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_191A34C40();
      }
    }
    BOOL v26 = v14;
    uint64_t v27 = v11;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    int v16 = self->_cachedAccounts;
    uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int v22 = *p_enabledAccounts;
          id v23 = objc_msgSend(v21, "_internal", v26, v27);
          id v24 = [v23 uniqueID];
          objc_msgSend(v21, "_setIsEnabled:", -[NSMutableSet containsObject:](v22, "containsObject:", v24));
        }
        uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }

    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_cachedAccounts];
    [(_IDSAccountController *)self _updateDelegatesWithOldAccounts:v29 newAccounts:v25];
  }
}

- (void)_connect
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A348F0();
    }
  }
  id v6 = +[IDSDaemonController sharedInstance];
  char v7 = [v6 hasListenerForID:self->_serviceToken];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_191A34884();
    }

    uint64_t v9 = +[IDSDaemonController sharedInstance];
    serviceToken = self->_serviceToken;
    id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_service];
    LOBYTE(serviceToken) = [v9 addListenerID:serviceToken services:v11];

    if ((serviceToken & 1) == 0)
    {
      uint64_t v12 = +[IDSLogging IDSAccountController];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_191A347FC();
      }
    }
  }
}

- (void)dealloc
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 removeListenerID:self->_serviceToken];

  v4.receiver = self;
  v4.super_class = (Class)_IDSAccountController;
  [(_IDSAccountController *)&v4 dealloc];
}

- (NSSet)internalAccounts
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A34504();
    }
  }
  [(_IDSAccountController *)self _loadCachedAccounts];
  [(_IDSAccountController *)self _updateLocalAccountVisibility];
  id v6 = (void *)[(NSMutableSet *)self->_cachedAccounts copy];

  return (NSSet *)v6;
}

- (NSSet)enabledAccounts
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3459C();
    }
  }
  [(_IDSAccountController *)self _loadCachedAccounts];
  [(_IDSAccountController *)self _updateLocalAccountVisibility];
  id v6 = (void *)[(NSMutableSet *)self->_enabledAccounts mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = self->_enabledAccounts;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v12, (void)v17);
        uint64_t v14 = [v13 _internal];
        if ([v14 accountType] == 2)
        {
          BOOL isLocalAccountVisible = self->_isLocalAccountVisible;

          if (!isLocalAccountVisible) {
            [v6 removeObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return (NSSet *)v6;
}

- (NSString)serviceName
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A34634();
    }
  }
  id v6 = (void *)[(NSString *)self->_service copy];

  return (NSString *)v6;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMapTable *)self->_delegateToInfo removeObjectForKey:v4];
    if (![(NSMapTable *)self->_delegateToInfo count])
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_callDelegatesWithBlock:(id)a3
{
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v49 = (void (**)(id, uint64_t))a4;
  id v12 = a5;
  v48 = (void (**)(id, uint64_t))a6;
  uint64_t v13 = a7;
  uint64_t v14 = v13;
  v50 = (void (**)(void, void))v12;
  if (v12)
  {
    group = v13;
    uint64_t v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      long long v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A34764();
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x192FE0160]();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v20 = self->_delegateToInfo;
    uint64_t v21 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v26 = [(NSMapTable *)self->_delegateToInfo objectForKey:v25];
          uint64_t v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            [v18 addObject:v25];
            [v19 addObject:v27];
          }
        }
        uint64_t v22 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v22);
    }

    uint64_t v14 = group;
    if ([v18 count])
    {
      char v29 = 1;
      do
      {
        long long v30 = (void *)MEMORY[0x192FE0160]();
        long long v31 = [v18 objectAtIndex:0];
        long long v32 = [v19 objectAtIndex:0];
        [v18 removeObjectAtIndex:0];
        [v19 removeObjectAtIndex:0];
        uint64_t v33 = [v18 count];
        id v34 = [v32 queue];
        if (v14) {
          dispatch_group_enter(v14);
        }
        uint64_t v35 = +[IDSInternalQueueController sharedInstance];
        id v36 = [v35 queue];

        if (v34 == v36)
        {
          if (a3)
          {
            uint64_t v14 = group;
            if (v49 != 0 && (v29 & 1) != 0) {
              v49[2](v49, 1);
            }
            ((void (**)(void, void *))v50)[2](v50, v31);
            if (v48 && !v33) {
              v48[2](v48, 1);
            }
          }
          else
          {
            ((void (**)(void, void *))v50)[2](v50, v31);
            uint64_t v14 = group;
          }
          id v43 = self;
          id v44 = self;
          if (!v14) {
            goto LABEL_42;
          }
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = sub_19198B878;
          v52[3] = &unk_1E572B330;
          SEL v58 = a3;
          char v59 = v29 & 1;
          v55 = v49;
          v56 = v50;
          id v53 = v31;
          BOOL v60 = v33 == 0;
          v57 = v48;
          id v54 = v32;
          v37 = (void *)MEMORY[0x192FE03B0](v52);
          id v38 = v37;
          if (v34 == MEMORY[0x1E4F14428]) {
            dispatch_block_t v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          }
          else {
            dispatch_block_t v39 = (dispatch_block_t)[v37 copy];
          }
          long long v42 = v39;

          uint64_t v14 = group;
          if (group) {
            dispatch_group_async(group, v34, v42);
          }
          else {
            dispatch_async(v34, v42);
          }

          if (!group) {
            goto LABEL_42;
          }
        }
        else
        {
          id v40 = self;
          id v41 = self;
          uint64_t v14 = group;
          if (!group) {
            goto LABEL_42;
          }
        }
        dispatch_group_leave(v14);
LABEL_42:

        char v29 = 0;
      }
      while ([v18 count]);
    }
    id v45 = self;
    id v46 = self;
  }
}

- (void)daemonDisconnected
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A349F4();
    }
  }
  id v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_191A34988();
  }

  *(_WORD *)&self->_accountsLoaded = 256;
}

- (id)accountWithUniqueID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A34D40();
    }
  }
  uint64_t v8 = [(_IDSAccountController *)self internalAccounts];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = objc_msgSend(v8, "allObjects", 0);
  id v10 = (id)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 _internal];
        uint64_t v15 = [v14 uniqueID];
        char v16 = [v15 isEqualToIgnoringCase:v4];

        if (v16)
        {
          id v10 = v13;
          goto LABEL_15;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v10;
}

- (id)accountWithLoginID:(id)a3 service:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  char v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A34DD8();
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(_IDSAccountController *)self internalAccounts];
  id v10 = (id)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 _internal];
        uint64_t v15 = [v14 loginID];
        if (IMAreEmailsLogicallyTheSame())
        {
          char v16 = [v13 _internal];
          long long v17 = [v16 serviceName];
          char v18 = [v17 isEqualToIgnoringCase:v20];

          if (v18)
          {
            id v10 = v13;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v10 = (id)[obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
LABEL_16:

  return v10;
}

- (void)_setupAccountWithLoginID:(id)a3 accountConfig:(id)a4 authToken:(id)a5 password:(id)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  long long v17 = +[IDSInternalQueueController sharedInstance];
  int v18 = [v17 assertQueueIsCurrent];

  if (v18)
  {
    long long v19 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_191A34E70();
    }
  }
  id v20 = [NSString stringGUID];
  if (!self->_transactionIDToHandlersMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    transactionIDToHandlersMap = self->_transactionIDToHandlersMap;
    self->_transactionIDToHandlersMap = Mutable;
  }
  long long v23 = (void *)[v14 copy];
  long long v24 = (void *)MEMORY[0x192FE03B0]();
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_transactionIDToHandlersMap, v20, v24);
  }

  long long v25 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138413058;
    id v29 = v12;
    __int16 v30 = 2112;
    long long v31 = service;
    __int16 v32 = 2112;
    uint64_t v33 = v20;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Requesting setup of account: %@   service: %@  transaction: %@  accountConfig: %@", buf, 0x2Au);
  }

  uint64_t v27 = +[IDSDaemonController sharedInstance];
  [v27 setupAccountWithLoginID:v12 serviceName:self->_service accountType:1 accountConfig:v13 authToken:v16 password:v15 transactionID:v20];
}

- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
}

- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  id v29 = a5;
  id v27 = a6;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A34F08();
    }
  }
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    uint64_t v17 = *MEMORY[0x1E4F6B710];
    uint64_t v18 = *MEMORY[0x1E4F6B718];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v21 = (void *)MEMORY[0x1E4F1C9E8];
        long long v22 = [NSNumber numberWithInt:3];
        long long v23 = objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v20, v17, v22, v18, 0);
        [v13 addObject:v23];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  if ([v13 count] && v13) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B720], v13);
  }
  if ([v13 count])
  {
    long long v24 = [obj allObjects];
    long long v25 = [v24 arrayByApplyingSelector:sel_lowercaseString];

    if (v25) {
      CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B808], v25);
    }
  }
  [(_IDSAccountController *)self _setupAccountWithLoginID:v30 accountConfig:theDict authToken:0 password:v29 completionHandler:v27];
}

- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  BOOL v28 = [v7 objectForKey:*MEMORY[0x1E4F6AC48]];
  value = [v7 objectForKey:*MEMORY[0x1E4F6AC70]];
  long long v25 = [v7 objectForKey:*MEMORY[0x1E4F6AC50]];
  id v30 = v7;
  id v9 = [v7 objectForKey:*MEMORY[0x1E4F6AC78]];
  long long v24 = [v9 objectForKey:@"uri"];

  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    uint64_t v14 = *MEMORY[0x1E4F6B710];
    uint64_t v15 = *MEMORY[0x1E4F6B718];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) lowercaseString];
        long long v19 = [NSNumber numberWithInt:3];
        uint64_t v20 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, v14, v19, v15, 0);
        [v10 addObject:v20];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  long long v21 = [v30 objectForKey:*MEMORY[0x1E4F6AC60]];
  long long v22 = objc_msgSend(v21, "__imArrayByApplyingBlock:", &unk_1EE246C48);

  if (value) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B730], value);
  }
  if (v28) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B728], v28);
  }
  if ([v24 length] && v24) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B7C8], v24);
  }
  if ([v22 count] && v22) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B808], v22);
  }
  if ([v10 count] && v10) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B720], v10);
  }
  [(_IDSAccountController *)self _setupAccountWithLoginID:v28 accountConfig:theDict authToken:v25 password:0 completionHandler:v29];
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A34FA0();
    }
  }
  if (v4)
  {
    id v8 = +[IDSDaemonController sharedInstance];
    uint64_t v18 = [v4 _internal];
    id v9 = [v18 loginID];
    service = self->_service;
    id v10 = [v4 _internal];
    uint64_t v11 = [v10 uniqueID];
    uint64_t v12 = [v4 _internal];
    uint64_t v13 = [v12 accountType];
    [v4 _internal];
    v15 = uint64_t v14 = self;
    uint64_t v16 = [v15 accountInfo];
    [v8 addAccountWithLoginID:v9 serviceName:service uniqueID:v11 accountType:v13 accountInfo:v16];

    [(_IDSAccountController *)v14 _loadCachedAccounts];
    [(NSMutableSet *)v14->_cachedAccounts addObject:v4];
  }
}

- (void)_removeAndDeregisterAccount:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A35038();
    }
  }
  if (v4)
  {
    id v8 = [v4 _internal];
    id v9 = [v8 uniqueID];

    id v10 = +[IDSDaemonController sharedInstance];
    [v10 _removeAndDeregisterAccount:v9];

    [(NSMutableDictionary *)self->_pendingAccountsToRemove setObject:v4 forKey:v9];
    [(_IDSAccountController *)self _loadCachedAccounts];
    [(NSMutableSet *)self->_cachedAccounts removeObject:v4];
  }
}

- (void)_removeAccount:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A350D0();
    }
  }
  if (v4)
  {
    id v8 = [(_IDSAccountController *)self accountWithUniqueID:v4];
    if (v8)
    {
      id v9 = +[IDSDaemonController sharedInstance];
      [v9 _removeAccount:v4];

      [(_IDSAccountController *)self _loadCachedAccounts];
      [(NSMutableSet *)self->_cachedAccounts removeObject:v8];
    }
  }
}

- (void)enableAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A35200();
    }
  }
  id v8 = [v4 _internal];
  id v9 = [v8 uniqueID];

  if (v4 && v9 && ([(NSMutableSet *)self->_enabledAccounts containsObject:v9] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v4 _internal];
      uint64_t v12 = [v11 uniqueID];
      int v18 = 138412290;
      long long v19 = v12;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Client request to enable account ID: %@", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v13 = +[IDSDaemonController sharedInstance];
    [v13 enableAccount:v9];

    [(_IDSAccountController *)self _loadCachedAccounts];
    enabledAccounts = self->_enabledAccounts;
    uint64_t v15 = [v4 _internal];
    uint64_t v16 = [v15 uniqueID];
    [(NSMutableSet *)enabledAccounts addObject:v16];

    [v4 _setIsEnabled:1];
    uint64_t v17 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_191A34C40();
    }
  }
}

- (void)disableAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A35298();
    }
  }
  id v8 = [v4 _internal];
  id v9 = [v8 uniqueID];

  int v10 = [v4 registrationError];
  if (v4 && v9 && ([(NSMutableSet *)self->_enabledAccounts containsObject:v9] & 1) != 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v4 _internal];
      uint64_t v13 = [v12 uniqueID];
      int v28 = 138412290;
      id v29 = v13;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Client request to disable account ID: %@", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v14 = +[IDSDaemonController sharedInstance];
    uint64_t v15 = [v4 _internal];
    uint64_t v16 = [v15 uniqueID];
    [v14 disableAccount:v16];

    [(_IDSAccountController *)self _loadCachedAccounts];
    enabledAccounts = self->_enabledAccounts;
    int v18 = [v4 _internal];
    long long v19 = [v18 uniqueID];
    [(NSMutableSet *)enabledAccounts removeObject:v19];

    [v4 _setIsEnabled:0];
    uint64_t v20 = [MEMORY[0x1E4F6C3B8] registration];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((v10 - 27) <= 2)
  {
    long long v21 = [MEMORY[0x1E4F6B460] KeyTransparency];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "Account has KT error, we're going to force disable it. { accountID: %@ }", (uint8_t *)&v28, 0xCu);
    }

    long long v22 = +[IDSDaemonController sharedInstance];
    long long v23 = [v4 _internal];
    long long v24 = [v23 uniqueID];
    [v22 forceDisableAccount:v24];

    [(_IDSAccountController *)self _loadCachedAccounts];
    long long v25 = self->_enabledAccounts;
    uint64_t v26 = [v4 _internal];
    id v27 = [v26 uniqueID];
    [(NSMutableSet *)v25 removeObject:v27];

    [v4 _setIsEnabled:0];
    uint64_t v20 = [MEMORY[0x1E4F6C3B8] registration];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
LABEL_16:
    sub_191A34C40();
LABEL_17:
  }
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A35410();
    }
  }
  uint64_t v8 = *MEMORY[0x1E4F6B7E0];
  id v9 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  int v10 = v9;
  if (v4
    && self->_service
    && ((objc_msgSend(v9, "isEqualToString:") & 1) != 0
     || [(NSString *)self->_service isEqualToString:*MEMORY[0x1E4F6B3C0]]))
  {
    uint64_t v11 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
    uint64_t v12 = [v4 objectForKey:v8];
    uint64_t v13 = [v4 objectForKey:*MEMORY[0x1E4F6B700]];
    int v14 = [v13 intValue];

    if (IDSIsValidAccountType())
    {
      if ([v11 length])
      {
        uint64_t v15 = [(_IDSAccountController *)self accountWithUniqueID:v11];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = [v15 _internal];
          [v17 setAccountInfo:v4];

          int v18 = v21;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = sub_19198D668;
          v21[3] = &unk_1E572B7C8;
          v21[4] = self;
          long long v19 = v16;
          v21[5] = v19;
        }
        else
        {
          id v20 = [[IDSAccount alloc] _initWithDictionary:v4 uniqueID:v11 serviceName:v12];
          objc_msgSend(v20, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v11));
          [(NSMutableSet *)self->_cachedAccounts addObject:v20];
          int v18 = v22;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = sub_19198D5EC;
          v22[3] = &unk_1E572B7C8;
          v22[4] = self;
          long long v19 = v20;
          v22[5] = v19;
        }
        [(_IDSAccountController *)self _callDelegatesWithBlock:v18];

        [(_IDSAccountController *)self _updateLocalAccountVisibility];
      }
      else
      {
        long long v19 = +[IDSLogging IDSAccountController];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_191A35330();
        }
      }
    }
    else
    {
      long long v19 = +[IDSLogging IDSAccountController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_191A35398(v14, v19);
      }
    }
  }
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A355E0();
    }
  }
  uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  id v9 = v8;
  if (v4
    && self->_service
    && ((objc_msgSend(v8, "isEqualToString:") & 1) != 0
     || [(NSString *)self->_service isEqualToString:*MEMORY[0x1E4F6B3C0]]))
  {
    int v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_191A35578();
    }

    uint64_t v11 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
    if ([v11 length])
    {
      uint64_t v12 = [(_IDSAccountController *)self accountWithUniqueID:v11];
      if (v12
        || ([(NSMutableDictionary *)self->_pendingAccountsToRemove objectForKeyedSubscript:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(NSMutableSet *)self->_cachedAccounts removeObject:v12];
        [(NSMutableDictionary *)self->_pendingAccountsToRemove removeObjectForKey:v11];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = sub_19198D944;
        uint64_t v17 = &unk_1E572B7C8;
        int v18 = self;
        id v19 = v12;
        uint64_t v13 = v12;
        [(_IDSAccountController *)self _callDelegatesWithBlock:&v14];
        [(_IDSAccountController *)self _updateLocalAccountVisibility];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_191A35510();
        }
      }
    }
    else
    {
      uint64_t v13 = +[IDSLogging IDSAccountController];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_191A354A8();
      }
    }
  }
}

- (void)accountUpdated:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A35828();
    }
  }
  uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  id v9 = v8;
  if (v4
    && self->_service
    && ((objc_msgSend(v8, "isEqualToString:") & 1) != 0
     || [(NSString *)self->_service isEqualToString:*MEMORY[0x1E4F6B3C0]]))
  {
    int v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v4;
      __int16 v34 = 2112;
      long long v35 = v9;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_INFO, "Received account updated %@ for topic %@", buf, 0x16u);
    }

    uint64_t v11 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
    if (![v11 length])
    {
      uint64_t v13 = [MEMORY[0x1E4F6C3B8] warning];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_191A35678();
      }
      goto LABEL_30;
    }
    uint64_t v12 = [(_IDSAccountController *)self accountWithUniqueID:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 _internal];
      uint64_t v15 = [v14 accountInfo];
      char v16 = IMAreObjectsLogicallySame();

      if (v16)
      {
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v17 = [v13 _internal];
      [v17 setAccountInfo:v4];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_19198DDF0;
      v30[3] = &unk_1E572B7C8;
      v30[4] = self;
      long long v31 = v13;
      [(_IDSAccountController *)self _callDelegatesWithBlock:v30];
    }
    else
    {
      int v18 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_191A357C0();
      }

      id v19 = [v4 objectForKey:*MEMORY[0x1E4F6B700]];
      int v20 = [v19 intValue];

      if ((IDSIsValidAccountType() & 1) == 0)
      {
        long long v22 = +[IDSLogging IDSAccountController];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_191A35748(v20, v22);
        }

        goto LABEL_30;
      }
      id v21 = [[IDSAccount alloc] _initWithDictionary:v4 uniqueID:v11 serviceName:v9];
      if (v21)
      {
        objc_msgSend(v21, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v11));
        [(NSMutableSet *)self->_cachedAccounts addObject:v21];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = sub_19198DE6C;
        id v27 = &unk_1E572B7C8;
        int v28 = self;
        id v29 = v21;
        [(_IDSAccountController *)self _callDelegatesWithBlock:&v24];
      }
      else
      {
        long long v23 = [MEMORY[0x1E4F6C3B8] warning];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_191A356E0();
        }
      }
    }
    [(_IDSAccountController *)self _updateLocalAccountVisibility];
    goto LABEL_30;
  }
LABEL_31:
}

- (void)accountsChanged:(id)a3 forTopic:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    int v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A359F8();
    }
  }
  if ([v7 isEqualToIgnoringCase:self->_service])
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    id v48 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      service = self->_service;
      id v46 = [(NSMutableSet *)self->_cachedAccounts __imSetByApplyingBlock:&unk_1EE245EC8];
      *(_DWORD *)buf = 138413058;
      v75 = v48;
      __int16 v76 = 2112;
      id v77 = v7;
      __int16 v78 = 2112;
      v79 = service;
      id v6 = v48;
      __int16 v80 = 2112;
      v81 = v46;
      _os_log_debug_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEBUG, "Received accounts changed %@ for topic %@  service: %@  (Cached: %@)", buf, 0x2Au);
    }
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v13 = (void *)[v6 _copyForEnumerating];
    cachedAccounts = self->_cachedAccounts;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = sub_19198E790;
    v70[3] = &unk_1E572B810;
    id v47 = v12;
    id v71 = v47;
    [(NSMutableSet *)cachedAccounts enumerateObjectsUsingBlock:v70];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    id v50 = v7;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v67;
      uint64_t v18 = *MEMORY[0x1E4F6B3C0];
      uint64_t v55 = *MEMORY[0x1E4F6B7F0];
      uint64_t v49 = *MEMORY[0x1E4F6B700];
      uint64_t v51 = *MEMORY[0x1E4F6B3C0];
      do
      {
        uint64_t v19 = 0;
        uint64_t v53 = v16;
        do
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(obj);
          }
          int v20 = *(void **)(*((void *)&v66 + 1) + 8 * v19);
          id v21 = v7;
          if ([(NSString *)self->_service isEqualToString:v18]
            || [v21 isEqualToString:self->_service])
          {
            long long v22 = [v20 objectForKey:v55];
            if (v22)
            {
              [v52 addObject:v22];
              long long v23 = [(_IDSAccountController *)self accountWithUniqueID:v22];
              uint64_t v24 = v23;
              if (v23)
              {
                uint64_t v25 = [v23 _internal];
                uint64_t v26 = [v25 accountInfo];
                char v27 = IMAreObjectsLogicallySame();

                if ((v27 & 1) == 0)
                {
                  int v28 = [v24 _internal];
                  [v28 setAccountInfo:v20];

                  v64[0] = MEMORY[0x1E4F143A8];
                  v64[1] = 3221225472;
                  v64[2] = sub_19198E7F8;
                  v64[3] = &unk_1E572B7C8;
                  v64[4] = self;
                  uint64_t v24 = v24;
                  v65 = v24;
                  [(_IDSAccountController *)self _callDelegatesWithBlock:v64];
                }
                id v7 = v50;
              }
              else
              {
                id v29 = [MEMORY[0x1E4F6C3B8] registration];
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v75 = v22;
                  _os_log_debug_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEBUG, "Did not find an existing account to update with unique ID %@", buf, 0xCu);
                }

                uint64_t v30 = [v20 objectForKey:v49];
                int v31 = [v30 intValue];

                if (IDSIsValidAccountType())
                {
                  id v32 = [[IDSAccount alloc] _initWithDictionary:v20 uniqueID:v22 serviceName:v21];
                  if (v32)
                  {
                    objc_msgSend(v32, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v22));
                    [(NSMutableSet *)self->_cachedAccounts addObject:v32];
                    v62[0] = MEMORY[0x1E4F143A8];
                    v62[1] = 3221225472;
                    v62[2] = sub_19198E874;
                    v62[3] = &unk_1E572B7C8;
                    v62[4] = self;
                    id v63 = v32;
                    [(_IDSAccountController *)self _callDelegatesWithBlock:v62];
                  }
                  else
                  {
                    __int16 v34 = [MEMORY[0x1E4F6C3B8] warning];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v75 = v20;
                      _os_log_error_impl(&dword_19190B000, v34, OS_LOG_TYPE_ERROR, "Could not create IDSAccount with info %@", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  id v33 = +[IDSLogging IDSAccountController];
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v75) = v31;
                    _os_log_error_impl(&dword_19190B000, v33, OS_LOG_TYPE_ERROR, "Account changed was of unknown account type %d, ignoring...", buf, 8u);
                  }
                }
              }
              uint64_t v18 = v51;
              uint64_t v16 = v53;
            }
            else
            {
              uint64_t v24 = [MEMORY[0x1E4F6C3B8] registration];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v75 = v20;
                _os_log_debug_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEBUG, "No uniqueID for account %@, ignoring...", buf, 0xCu);
              }
            }
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
      }
      while (v16);
    }

    if ([v47 count])
    {
      long long v35 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_191A35990();
      }
    }
    if ([v52 count])
    {
      uint64_t v36 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        sub_191A35928();
      }
    }
    [v47 minusSet:v52];
    if ([v47 count])
    {
      uint64_t v37 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_191A358C0();
      }
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = v47;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      id v41 = 0;
      uint64_t v42 = *(void *)v59;
      do
      {
        uint64_t v43 = 0;
        id v44 = v41;
        do
        {
          if (*(void *)v59 != v42) {
            objc_enumerationMutation(v38);
          }
          id v41 = [(_IDSAccountController *)self accountWithUniqueID:*(void *)(*((void *)&v58 + 1) + 8 * v43)];

          if (v41)
          {
            [(NSMutableSet *)self->_cachedAccounts removeObject:v41];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = sub_19198E8F0;
            v56[3] = &unk_1E572B7C8;
            v56[4] = self;
            id v57 = v41;
            [(_IDSAccountController *)self _callDelegatesWithBlock:v56];
          }
          ++v43;
          id v44 = v41;
        }
        while (v40 != v43);
        uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v40);

      id v7 = v50;
    }

    [(_IDSAccountController *)self _updateLocalAccountVisibility];
    id v6 = v48;
  }
}

- (void)setupCompleteForAccount:(id)a3 transactionID:(id)a4 setupError:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A35A90();
    }
  }
  if ([v9 length])
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_transactionIDToHandlersMap objectForKey:v9];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "SetupCompleteForAccount %@ transactionID %@ setupError %@", buf, 0x20u);
      }

      uint64_t v16 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (void *)MEMORY[0x192FE03B0](v14);
        *(_DWORD *)buf = 134218242;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Setup handler block %p for transactionID %@", buf, 0x16u);
      }
      uint64_t v18 = [(_IDSAccountController *)self accountWithUniqueID:v8];
      if (v18)
      {
        uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        int v20 = dispatch_queue_create("IDSAccountController-setupCompleteQueue", v19);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19198ECC8;
        block[3] = &unk_1E5729140;
        id v22 = v18;
        id v23 = v10;
        uint64_t v24 = v14;
        dispatch_async(v20, block);
        [(NSMutableDictionary *)self->_transactionIDToHandlersMap removeObjectForKey:v9];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Account setup completed but we don't have an account, ignoring...", buf, 2u);
        }
      }
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Setup complete - no transaction ID, bailing...", buf, 2u);
    }
  }
}

- (void)accountEnabled:(id)a3 onService:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A35C60();
    }
  }
  if (![v6 length])
  {
    uint64_t v13 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A35B28();
    }
    goto LABEL_23;
  }
  if (![v7 length])
  {
    uint64_t v13 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A35B5C();
    }
    goto LABEL_23;
  }
  if (self->_service
    && ((objc_msgSend(v7, "isEqualToString:") & 1) != 0
     || [(NSString *)self->_service isEqualToString:*MEMORY[0x1E4F6B3C0]]))
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A35BF8();
    }

    int v12 = [(_IDSAccountController *)self accountWithUniqueID:v6];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 _setIsEnabled:1];
      [(NSMutableSet *)self->_enabledAccounts addObject:v6];
      uint64_t v14 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_191A35B90();
      }

      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_19198F0B8;
      uint64_t v19 = &unk_1E572B7C8;
      int v20 = self;
      uint64_t v13 = v13;
      id v21 = v13;
      [(_IDSAccountController *)self _callDelegatesWithBlock:&v16];
      [(_IDSAccountController *)self _updateLocalAccountVisibility];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Did not find an existing account to enable with unique ID %@", buf, 0xCu);
      }
    }
LABEL_23:
  }
}

- (void)accountDisabled:(id)a3 onService:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A35E30();
    }
  }
  if (![v6 length])
  {
    int v12 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A35CF8();
    }
    goto LABEL_23;
  }
  if (![v7 length])
  {
    int v12 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A35D2C();
    }
    goto LABEL_23;
  }
  if (self->_service
    && ((objc_msgSend(v7, "isEqualToString:") & 1) != 0
     || [(NSString *)self->_service isEqualToString:*MEMORY[0x1E4F6B3C0]]))
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_191A35DC8();
    }

    int v12 = [(_IDSAccountController *)self accountWithUniqueID:v6];
    [(NSMutableSet *)self->_enabledAccounts removeObject:v6];
    [v12 _setIsEnabled:0];
    uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_191A35D60();
      }

      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_19198F3F8;
      uint64_t v18 = &unk_1E572B7C8;
      uint64_t v19 = self;
      int v12 = v12;
      int v20 = v12;
      [(_IDSAccountController *)self _callDelegatesWithBlock:&v15];
      [(_IDSAccountController *)self _updateLocalAccountVisibility];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Did not find an existing account to disable with unique ID %@", buf, 0xCu);
      }
    }
LABEL_23:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIDToHandlersMap, 0);
  objc_storeStrong((id *)&self->_pendingAccountsToRemove, 0);
  objc_storeStrong((id *)&self->_enabledAccounts, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);

  objc_storeStrong(&self->_delegateContext, 0);
}

@end