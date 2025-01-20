@interface FAFetchFamilyCircleOperation
- (BOOL)_isCacheValid:(id)a3;
- (BOOL)_shouldFetchFromServer:(id)a3;
- (BOOL)_signedInAccountMatchesApproverRequirementsFromCache:(id)a3;
- (BOOL)promptUserToResolveAuthenticatonFailure;
- (BOOL)signedInAccountShouldBeApprover;
- (FAFamilyCircleCacheProtocol)cache;
- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7;
- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7 rateLimiter:(id)a8;
- (FARateLimiting)rateLimiter;
- (NSString)clientProcess;
- (NSString)context;
- (id)_accountStore;
- (id)_familyCircleWithResponse:(id)a3;
- (id)_fetchCircleRequestWithCacheResponse:(id)a3;
- (id)_renewCredentials;
- (id)cachePolicyString;
- (id)fetchCircleFromServer;
- (id)fetchCircleFromServerWithCacheResponse:(id)a3;
- (id)fetchFamilyCircle;
- (id)username;
- (unint64_t)cachePolicy;
- (void)familyCircleWithServerResponse:(id)a3 responseHeaders:(id)a4 completion:(id)a5;
- (void)setCache:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setClientProcess:(id)a3;
- (void)setContext:(id)a3;
- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3;
- (void)setRateLimiter:(id)a3;
- (void)setSignedInAccountShouldBeApprover:(BOOL)a3;
- (void)updateUserDefaultsWithFamilyCircle:(id)a3;
@end

@implementation FAFetchFamilyCircleOperation

- (BOOL)_signedInAccountMatchesApproverRequirementsFromCache:(id)a3
{
  id v4 = a3;
  if ([(FAFetchFamilyCircleOperation *)self signedInAccountShouldBeApprover])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = objc_msgSend(v4, "members", 0);
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v9 isMe])
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    unsigned int v10 = [v6 isParent];
    v11 = _FALogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        v13 = "The is-me member %@ is a parent/approver as expected in the cached family circle";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      v13 = "Forcing a server fetch of the family circle because the is-me member %@ is not a parent/approver";
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  LOBYTE(v10) = 1;
LABEL_20:

  return v10;
}

- (BOOL)_shouldFetchFromServer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(FAFetchFamilyCircleOperation *)self cachePolicy];
  if (v6 > 1)
  {
    if (v6 == 1000)
    {
      BOOL v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        v13 = "Attempting to fetch the family circle from the server because cachePolicy=FACachePolicyInternalReloadIgnoringCache";
        v14 = (uint8_t *)&v18;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      }
LABEL_19:

      unsigned __int8 v3 = 1;
      goto LABEL_20;
    }
    if (v6 == 2)
    {
      v8 = _FALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to fetch the family circle from the server because cachePolicy=FACachePolicyReloadIgnoringCache", buf, 2u);
      }

      v9 = [(FAFetchFamilyCircleOperation *)self rateLimiter];
      unsigned int v10 = [(FAFetchFamilyCircleOperation *)self clientProcess];
      unsigned __int8 v3 = [v9 isAllowedWithClientName:v10];
    }
  }
  else if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v7 = [v5 familyCircle];

      if (v7)
      {
        unsigned __int8 v3 = ![(FAFetchFamilyCircleOperation *)self _isCacheValid:v5];
        goto LABEL_20;
      }
      BOOL v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        v13 = "Attempting to fetch the family circle from the server because there is no cache";
        v14 = (uint8_t *)&v16;
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping fetching the family circle from the server because cachePolicy=FACachePolicyReturnCacheDontLoad", v17, 2u);
    }

    unsigned __int8 v3 = 0;
  }
LABEL_20:

  return v3 & 1;
}

- (BOOL)_isCacheValid:(id)a3
{
  id v4 = a3;
  if (CFPreferencesGetAppBooleanValue(@"AlwaysUseCache", @"com.apple.familycircle", 0))
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Skipping cache validation for family circle due to preferences override", v9, 2u);
    }

    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v4 familyCircleIfFresh];
    BOOL v6 = [(FAFetchFamilyCircleOperation *)self _signedInAccountMatchesApproverRequirementsFromCache:v7];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_storeStrong((id *)&self->_marqueeCacheHandler, 0);
  objc_storeStrong((id *)&self->_familyRefreshActivityScheduler, 0);
  objc_storeStrong((id *)&self->_requestCoalescer, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)updateUserDefaultsWithFamilyCircle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 members];
  id v6 = [v5 count];

  uint64_t v7 = _FALogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v21 = 136315138;
      v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: cache family count more than 0", (uint8_t *)&v21, 0xCu);
    }

    v9 = [v3 members];
    id v10 = [v9 count];
    [v4 setInteger:v10 forKey:FAFamilySettingRowFamilyCountKey];
  }
  else
  {
    if (v8)
    {
      int v21 = 136315138;
      v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: delete cached family count", (uint8_t *)&v21, 0xCu);
    }

    [v4 removeObjectForKey:FAFamilySettingRowFamilyCountKey];
  }
  if (_os_feature_enabled_impl())
  {
    v11 = [v3 pendingMembers];
    uint64_t v12 = (uint64_t)[v11 count];

    v13 = [v3 pendingInvitesOnly];
    uint64_t v14 = (uint64_t)[v13 count];

    long long v15 = _FALogSystem();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12 < 1)
    {
      if (v16)
      {
        int v21 = 136315138;
        v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: delete cached invitation count count", (uint8_t *)&v21, 0xCu);
      }

      long long v17 = +[NSUserDefaults standardUserDefaults];
      [v17 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];
    }
    else
    {
      if (v16)
      {
        int v21 = 136315138;
        v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: cache pending invites count more than 1", (uint8_t *)&v21, 0xCu);
      }

      long long v17 = +[NSUserDefaults standardUserDefaults];
      [v17 setInteger:v12 forKey:FAFamilySettingRowPendingInvitesKey];
    }

    __int16 v18 = _FALogSystem();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v14 < 1)
    {
      if (v19)
      {
        int v21 = 136315138;
        v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: delete cached  count count", (uint8_t *)&v21, 0xCu);
      }

      id v20 = +[NSUserDefaults standardUserDefaults];
      [v20 removeObjectForKey:FAFamilyInvitationsReceivedKey];
    }
    else
    {
      if (v19)
      {
        int v21 = 136315138;
        v22 = "-[FAFetchFamilyCircleOperation updateUserDefaultsWithFamilyCircle:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: cache inviters count more than 1", (uint8_t *)&v21, 0xCu);
      }

      id v20 = +[NSUserDefaults standardUserDefaults];
      [v20 setInteger:v14 forKey:FAFamilyInvitationsReceivedKey];
    }
  }
}

- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  long long v17 = [[FARateLimiter alloc] initWithIdentifier:@"FAFetchFamilyCircleOperation"];
  __int16 v18 = [(FAFetchFamilyCircleOperation *)self initWithNetworkService:v16 cache:v15 marqueeCacheHanlder:v14 requestCoalescer:v13 familyRefreshActivityScheduler:v12 rateLimiter:v17];

  return v18;
}

- (id)fetchFamilyCircle
{
  id v3 = [(FANetworkClient *)self networkService];
  id v4 = [v3 ensureDeviceUnlockedSinceBoot];
  id v5 = [v4 then];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004DF8;
  v14[3] = &unk_10004D0F8;
  v14[4] = self;
  id v6 = ((void (**)(void, void *))v5)[2](v5, v14);
  uint64_t v7 = [v6 then];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004908;
  v13[3] = &unk_10004D160;
  v13[4] = self;
  BOOL v8 = ((void (**)(void, void *))v7)[2](v7, v13);
  v9 = [v8 then];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000045DC;
  v12[3] = &unk_10004D1B0;
  v12[4] = self;
  id v10 = ((void (**)(void, void *))v9)[2](v9, v12);

  return v10;
}

- (FAFetchFamilyCircleOperation)initWithNetworkService:(id)a3 cache:(id)a4 marqueeCacheHanlder:(id)a5 requestCoalescer:(id)a6 familyRefreshActivityScheduler:(id)a7 rateLimiter:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)FAFetchFamilyCircleOperation;
  __int16 v18 = [(FANetworkClient *)&v23 initWithNetworkService:a3];
  BOOL v19 = v18;
  if (v18)
  {
    v18->_cachePolicy = 1;
    objc_storeStrong((id *)&v18->_cache, a4);
    objc_storeStrong((id *)&v19->_requestCoalescer, a6);
    objc_storeStrong((id *)&v19->_marqueeCacheHandler, a5);
    objc_storeStrong((id *)&v19->_familyRefreshActivityScheduler, a7);
    objc_storeStrong((id *)&v19->_rateLimiter, a8);
  }

  return v19;
}

- (BOOL)signedInAccountShouldBeApprover
{
  return self->_signedInAccountShouldBeApprover;
}

- (void)setSignedInAccountShouldBeApprover:(BOOL)a3
{
  self->_signedInAccountShouldBeApprover = a3;
}

- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3
{
  self->_promptUserToResolveAuthenticatonFailure = a3;
}

- (void)setContext:(id)a3
{
}

- (void)setClientProcess:(id)a3
{
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (id)username
{
  v2 = [(FANetworkClient *)self networkService];
  id v3 = [v2 account];
  id v4 = objc_msgSend(v3, "aa_personID");

  return v4;
}

- (id)fetchCircleFromServer
{
  return [(FAFetchFamilyCircleOperation *)self fetchCircleFromServerWithCacheResponse:0];
}

- (id)fetchCircleFromServerWithCacheResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id)[(FAFetchFamilyCircleOperation *)self cachePolicy] == (id)1000
    || (id)[(FAFetchFamilyCircleOperation *)self cachePolicy] == (id)2;
  id v6 = [(FAFetchFamilyCircleOperation *)self rateLimiter];
  uint64_t v7 = [(FAFetchFamilyCircleOperation *)self clientProcess];
  [v6 recordCallWithClientName:v7];

  requestCoalescer = self->_requestCoalescer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007BDC;
  v12[3] = &unk_10004D250;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  id v10 = [(FARequestCoalescer *)requestCoalescer performBlockForKey:@"FAFetchFamilyCircleOperationKey" force:v5 block:v12];

  return v10;
}

- (id)_fetchCircleRequestWithCacheResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008010;
  v12[3] = &unk_10004D2A0;
  v12[4] = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v12];
  BOOL v8 = [v7 then];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008680;
  v11[3] = &unk_10004D2C8;
  v11[4] = self;
  id v9 = ((void (**)(void, void *))v8)[2](v8, v11);

  return v9;
}

- (id)_familyCircleWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008754;
  v9[3] = &unk_10004D2A0;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (id)_renewCredentials
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008940;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)cachePolicyString
{
  unint64_t v2 = [(FAFetchFamilyCircleOperation *)self cachePolicy];
  if (v2 > 2) {
    return @"Internal-Reload-Ignoring-Cache";
  }
  else {
    return *(&off_10004D360 + v2);
  }
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = +[ACAccountStore defaultStore];
    id v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)familyCircleWithServerResponse:(id)a3 responseHeaders:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 objectForKeyedSubscript:@"status"];
  if (v11
    && (id v12 = (void *)v11,
        [v8 objectForKeyedSubscript:@"status"],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 integerValue],
        v13,
        v12,
        !v14))
  {
    id v15 = [objc_alloc((Class)FAFamilyCircle) initWithServerResponse:v8];
    [(FAFetchFamilyCircleOperation *)self updateUserDefaultsWithFamilyCircle:v15];
    if (v15)
    {
      cache = self->_cache;
      objc_super v23 = [v9 objectForKeyedSubscript:@"X-Apple-Cache-ServerTag"];
      v24 = [(FAFamilyCircleCacheProtocol *)cache updateWithFamilyCircle:v15 serverTag:v23];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100009058;
      v25[3] = &unk_10004D340;
      v25[4] = self;
      id v27 = v10;
      id v15 = v15;
      id v26 = v15;
      [v24 onComplete:v25];
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    id v15 = +[NSMutableDictionary dictionary];
    id v16 = [v8 objectForKeyedSubscript:@"status-message"];

    if (v16)
    {
      id v17 = [v8 objectForKeyedSubscript:@"status-message"];
      [v15 setObject:v17 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    __int16 v18 = [v8 objectForKeyedSubscript:@"status"];
    BOOL v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"FAFetchFamilyCircleErrorDomain", [v18 integerValue], v15);

    id v20 = _FALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2112;
      id v31 = v8;
      id v21 = v29;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: Error in server response - %@", buf, 0x16u);
    }
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v19);
  }
}

- (NSString)clientProcess
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)promptUserToResolveAuthenticatonFailure
{
  return self->_promptUserToResolveAuthenticatonFailure;
}

- (FARateLimiting)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (FAFamilyCircleCacheProtocol)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

@end