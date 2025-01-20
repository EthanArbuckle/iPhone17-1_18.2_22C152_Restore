@interface AMSMediaTokenService
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_overrideOrClientIdentifier:(id)a3;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSMediaToken)cachedMediaToken;
- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 bag:(id)a4;
- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 clientVersion:(id)a4 bag:(id)a5;
- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 bag:(id)a5;
- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 tokenStore:(id)a4 bag:(id)a5;
- (AMSMediaTokenServiceStore)tokenStore;
- (AMSMediaTokenServiceThrottler)throttler;
- (AMSProcessInfo)clientInfo;
- (AMSURLSession)session;
- (BOOL)URLKnownToBeTrusted;
- (BOOL)_shouldRefreshMediaToken:(id)a3;
- (BOOL)_shouldReturnMediaToken:(id)a3;
- (BOOL)isEnabled;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)keychainAccessGroup;
- (OS_dispatch_queue)tokenFetchQueue;
- (double)refreshPercentage;
- (double)refreshTime;
- (id)_fetchBagProperties;
- (id)_fetchToken;
- (id)_tokenRequestWithError:(id *)a3;
- (id)fetchMediaToken;
- (int64_t)clientType;
- (void)_refreshMediaTokenIfNeeded:(id)a3;
- (void)invalidateMediaToken;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setCachedMediaToken:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKeychainAccessGroup:(id)a3;
- (void)setRefreshPercentage:(double)a3;
- (void)setRefreshTime:(double)a3;
- (void)setSession:(id)a3;
- (void)setURLKnownToBeTrusted:(BOOL)a3;
@end

@implementation AMSMediaTokenService

- (id)_fetchBagProperties
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v22 = [(AMSMediaTokenService *)self bag];
  v21 = [v22 doubleForKey:@"token-service-backoff-interval"];
  v20 = [v21 valuePromise];
  v24[0] = v20;
  v19 = [(AMSMediaTokenService *)self bag];
  v18 = [v19 doubleForKey:@"token-service-backoff-max"];
  v17 = [v18 valuePromise];
  v24[1] = v17;
  v16 = [(AMSMediaTokenService *)self bag];
  v15 = [v16 BOOLForKey:@"token-service-enabled"];
  v3 = [v15 valuePromise];
  v24[2] = v3;
  v4 = [(AMSMediaTokenService *)self bag];
  v5 = [v4 doubleForKey:@"token-service-refresh-percentage"];
  v6 = [v5 valuePromise];
  v24[3] = v6;
  v7 = [(AMSMediaTokenService *)self bag];
  v8 = [v7 doubleForKey:@"token-service-refresh-time"];
  v9 = [v8 valuePromise];
  v24[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  v11 = +[AMSPromise promiseWithAll:v10];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__AMSMediaTokenService__fetchBagProperties__block_invoke;
  v23[3] = &unk_1E559E528;
  v23[4] = self;
  v12 = [v11 thenWithBlock:v23];
  v13 = [v12 binaryPromiseAdapter];

  return v13;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

AMSPromise *__43__AMSMediaTokenService__fetchBagProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  double v6 = v5;
  v7 = [*(id *)(a1 + 32) throttler];
  [v7 setBaseSleepInterval:v6];

  v8 = [v3 objectAtIndexedSubscript:1];
  [v8 doubleValue];
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) throttler];
  [v11 setMaxSleepInterval:v10];

  v12 = [v3 objectAtIndexedSubscript:2];
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(v12, "BOOLValue"));

  v13 = [v3 objectAtIndexedSubscript:3];
  [v13 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setRefreshPercentage:");

  v14 = [v3 objectAtIndexedSubscript:4];

  [v14 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setRefreshTime:");

  uint64_t v15 = MEMORY[0x1E4F1CC38];
  return +[AMSPromise promiseWithResult:v15];
}

- (AMSMediaTokenServiceThrottler)throttler
{
  return self->_throttler;
}

- (void)setRefreshTime:(double)a3
{
  self->_refreshTime = a3;
}

- (void)setRefreshPercentage:(double)a3
{
  self->_refreshPercentage = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenStore, 0);
  objc_storeStrong((id *)&self->_tokenFetchQueue, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[AMSMediaTokenServiceStore alloc] initWithClientIdentifier:v10 keychainAccessGroup:v9];

  v12 = [(AMSMediaTokenService *)self initWithClientIdentifier:v10 tokenStore:v11 bag:v8];
  return v12;
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 tokenStore:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AMSMediaTokenService;
  v11 = [(AMSMediaTokenService *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bag, a5);
    if (os_variant_has_internal_content())
    {
      v13 = [(id)objc_opt_class() _overrideOrClientIdentifier:v8];
    }
    else
    {
      v13 = (NSString *)v8;
    }
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = v13;

    uint64_t v15 = [[AMSMediaTokenServiceThrottler alloc] initWithBaseSleepInterval:0.5 maxSleepInterval:30.0];
    throttler = v12->_throttler;
    v12->_throttler = v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.AppleMediaServices.AMSMediaTokenService", v17);
    tokenFetchQueue = v12->_tokenFetchQueue;
    v12->_tokenFetchQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v12->_tokenStore, a4);
  }

  return v12;
}

+ (id)_overrideOrClientIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[AMSDefaults mediaClientIdOverrides];
  double v5 = [v4 valueForKey:v3];
  double v6 = v3;
  if (v5)
  {
    v7 = +[AMSLogConfig sharedMediaConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v13 = 138544130;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Client identifier was manually overridden in defaults. %@ is overridden with: %@. Use amstool to clear any overrides if you did not expect this.", (uint8_t *)&v13, 0x2Au);
    }
    double v6 = v5;
  }
  id v11 = v6;

  return v11;
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 bag:(id)a4
{
  return [(AMSMediaTokenService *)self initWithClientIdentifier:a3 keychainAccessGroup:0 bag:a4];
}

- (void)setSession:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  self->_URLKnownToBeTrusted = a3;
}

- (void)setClientInfo:(id)a3
{
}

void __39__AMSMediaTokenService_fetchMediaToken__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else if ([*(id *)(a1 + 40) isEnabled])
  {
    double v5 = [*(id *)(a1 + 40) cachedMediaToken];
    int v6 = [*(id *)(a1 + 40) _shouldReturnMediaToken:v5];
    v7 = *(void **)(a1 + 40);
    if (v6)
    {
      [v7 _refreshMediaTokenIfNeeded:v5];
      [*(id *)(a1 + 32) finishWithResult:v5];
    }
    else
    {
      uint64_t v9 = [v7 _fetchToken];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __39__AMSMediaTokenService_fetchMediaToken__block_invoke_2;
      v11[3] = &unk_1E55A3D00;
      id v12 = *(id *)(a1 + 32);
      [v9 addFinishBlock:v11];
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    AMSError(400, @"Token Service Disabled", @"Bag value of token-service-enabled is false.", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v8 finishWithError:v10];
  }
}

- (void)_refreshMediaTokenIfNeeded:(id)a3
{
  if ([(AMSMediaTokenService *)self _shouldRefreshMediaToken:a3]) {
    id v4 = [(AMSMediaTokenService *)self _fetchToken];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (AMSMediaToken)cachedMediaToken
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && (+[AMSDefaults mediaTokenOverride],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = +[AMSLogConfig sharedMediaConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    double v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = objc_opt_class();
      id v7 = v6;
      id v8 = [(AMSMediaTokenService *)self clientIdentifier];
      uint64_t v9 = +[AMSDefaults mediaTokenOverride];
      int v17 = 138543874;
      id v18 = v6;
      __int16 v19 = 2114;
      v20 = v8;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding media token. Identifier: %{public}@", (uint8_t *)&v17, 0x20u);
    }
    id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v10 timeIntervalSinceNow];
    double v12 = v11;
    int v13 = [AMSMediaToken alloc];
    uint64_t v14 = +[AMSDefaults mediaTokenOverride];
    __int16 v15 = [(AMSMediaToken *)v13 initWithString:v14 expirationDate:v10 lifetime:v12];
  }
  else
  {
    id v10 = [(AMSMediaTokenService *)self tokenStore];
    __int16 v15 = [v10 retrieveToken];
  }

  return v15;
}

- (AMSMediaTokenServiceStore)tokenStore
{
  return self->_tokenStore;
}

- (BOOL)_shouldRefreshMediaToken:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4
    && [v4 isValid]
    && ([v5 percentageOfLifetimeRemaining],
        double v7 = v6,
        [(AMSMediaTokenService *)self refreshPercentage],
        v7 >= v8))
  {
    [(AMSMediaTokenService *)self refreshTime];
    char v9 = objc_msgSend(v5, "willExpireWithin:");
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (double)refreshTime
{
  return self->_refreshTime;
}

- (double)refreshPercentage
{
  return self->_refreshPercentage;
}

- (BOOL)_shouldReturnMediaToken:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 isValid]) {
    int v5 = [v4 isExpired] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)fetchMediaToken
{
  id v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = [(AMSMediaTokenService *)self _fetchBagProperties];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSMediaTokenService_fetchMediaToken__block_invoke;
  v8[3] = &unk_1E55A0778;
  int v5 = v3;
  char v9 = v5;
  id v10 = self;
  [v4 addFinishBlock:v8];

  double v6 = v5;
  return v6;
}

- (NSString)keychainAccessGroup
{
  v2 = [(AMSMediaTokenService *)self tokenStore];
  id v3 = [v2 keychainAccessGroup];

  return (NSString *)v3;
}

- (AMSURLSession)session
{
  p_session = &self->_session;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_session);
  }
  else
  {
    id v4 = +[AMSURLSession defaultSession];
  }
  return (AMSURLSession *)v4;
}

- (void)setCachedMediaToken:(id)a3
{
  id v6 = a3;
  id v4 = [(AMSMediaTokenService *)self tokenStore];
  int v5 = v4;
  if (v6) {
    [v4 storeToken:v6];
  }
  else {
    [v4 deleteToken];
  }
}

- (void)setKeychainAccessGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMediaTokenService *)self tokenStore];
  [v5 setKeychainAccessGroup:v4];
}

uint64_t __39__AMSMediaTokenService_fetchMediaToken__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (void)invalidateMediaToken
{
  id v3 = [(AMSMediaTokenService *)self cachedMediaToken];
  id v4 = [v3 invalidCopy];

  [(AMSMediaTokenService *)self setCachedMediaToken:v4];
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_122 != -1) {
    dispatch_once(&_MergedGlobals_122, &__block_literal_global_79);
  }
  v2 = (void *)qword_1EB38DCC8;
  return (NSString *)v2;
}

void __37__AMSMediaTokenService_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38DCC8;
  qword_1EB38DCC8 = @"AMSMediaTokenService";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DCD0 != -1) {
    dispatch_once(&qword_1EB38DCD0, &__block_literal_global_67_0);
  }
  v2 = (void *)qword_1EB38DCD8;
  return (NSString *)v2;
}

void __44__AMSMediaTokenService_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38DCD8;
  qword_1EB38DCD8 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (id)_fetchToken
{
  id v3 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak(&location, self);
  id v4 = [(AMSMediaTokenService *)self tokenFetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AMSMediaTokenService__fetchToken__block_invoke;
  block[3] = &unk_1E559F7A0;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  double v8 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __35__AMSMediaTokenService__fetchToken__block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained cachedMediaToken];
  if ([WeakRetained _shouldReturnMediaToken:v3])
  {
    [*(id *)(a1 + 32) finishWithResult:v3];
  }
  else
  {
    id v4 = [WeakRetained throttler];
    int v5 = [v4 shouldThrottle];

    if (v5)
    {
      id v6 = +[AMSLogConfig sharedMediaConfig];
      if (!v6)
      {
        id v6 = +[AMSLogConfig sharedConfig];
      }
      double v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        double v8 = objc_opt_class();
        id v9 = v8;
        id v10 = [WeakRetained clientIdentifier];
        *(_DWORD *)buf = 138543618;
        v49 = v8;
        __int16 v50 = 2114;
        uint64_t v51 = (uint64_t)v10;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token request throttled. Returning cached media token if available.", buf, 0x16u);
      }
      double v11 = AMSError(402, @"Token request throttled", @"Throttling to reduce server load.", 0);
      if (v3) {
        double v12 = 0;
      }
      else {
        double v12 = v11;
      }
      [*(id *)(a1 + 32) finishWithResult:v3 error:v12];
    }
    else
    {
      id v47 = 0;
      int v13 = [WeakRetained _tokenRequestWithError:&v47];
      id v14 = v47;
      if (v14 || !v13)
      {
        v22 = +[AMSLogConfig sharedMediaConfig];
        if (!v22)
        {
          v22 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v23 = [v22 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = objc_opt_class();
          id v25 = v24;
          v26 = [WeakRetained clientIdentifier];
          *(_DWORD *)buf = 138543874;
          v49 = v24;
          __int16 v50 = 2114;
          uint64_t v51 = (uint64_t)v26;
          __int16 v52 = 2114;
          id v53 = v14;
          _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token request encoding failed. Returning cached media token if available. Error: %{public}@", buf, 0x20u);
        }
        int v17 = AMSError(300, @"Token request encoding failed", @"The token request encoder finished with an error.", v14);
        if (v3) {
          v27 = 0;
        }
        else {
          v27 = v17;
        }
        [*(id *)(a1 + 32) finishWithResult:v3 error:v27];
      }
      else
      {
        __int16 v15 = [WeakRetained throttler];
        [v15 throttle];

        v16 = [WeakRetained session];
        int v17 = [v16 dataTaskPromiseWithRequest:v13];

        id v46 = 0;
        id v18 = [v17 resultWithTimeout:&v46 error:60.0];
        id v14 = v46;
        if (v14 || !v18)
        {
          v28 = +[AMSLogConfig sharedMediaConfig];
          if (!v28)
          {
            v28 = +[AMSLogConfig sharedConfig];
          }
          v29 = [v28 OSLogObject];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v43 = v13;
            v30 = v18;
            v31 = objc_opt_class();
            id v41 = v31;
            v32 = [WeakRetained clientIdentifier];
            *(_DWORD *)buf = 138543874;
            v49 = v31;
            id v18 = v30;
            int v13 = v43;
            __int16 v50 = 2114;
            uint64_t v51 = (uint64_t)v32;
            __int16 v52 = 2114;
            id v53 = v14;
            _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token result error. Returning cached media token if available. Error: %{public}@", buf, 0x20u);
          }
          v20 = AMSError(301, @"Token result error", @"The token result promise finished with an error.", v14);
          if (v3) {
            v33 = 0;
          }
          else {
            v33 = v20;
          }
          [*(id *)(a1 + 32) finishWithResult:v3 error:v33];
        }
        else
        {
          __int16 v19 = [v18 object];
          id v45 = 0;
          v20 = +[AMSMediaTokenServiceDeserializer mediaTokenFromDictionary:v19 error:&v45];
          id v14 = v45;

          if (v14 || !v20)
          {
            v44 = v18;
            v34 = +[AMSLogConfig sharedMediaConfig];
            if (!v34)
            {
              v34 = +[AMSLogConfig sharedConfig];
            }
            v35 = [v34 OSLogObject];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v36 = objc_opt_class();
              id v42 = v36;
              uint64_t v37 = [WeakRetained clientIdentifier];
              *(_DWORD *)buf = 138543874;
              v49 = v36;
              __int16 v50 = 2114;
              uint64_t v51 = v37;
              v38 = (void *)v37;
              __int16 v52 = 2114;
              id v53 = v14;
              _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token result could not be deserialized. Returning cached media token if available. Error: %{public}@", buf, 0x20u);
            }
            v39 = AMSError(301, @"Token result error", @"Token result could not be deserialized.", v14);
            if (v3) {
              v40 = 0;
            }
            else {
              v40 = v39;
            }
            [*(id *)(a1 + 32) finishWithResult:v3 error:v40];

            id v18 = v44;
          }
          else
          {
            __int16 v21 = [WeakRetained throttler];
            [v21 reset];

            [WeakRetained setCachedMediaToken:v20];
            [*(id *)(a1 + 32) finishWithResult:v20];
            id v14 = 0;
          }
        }
      }
    }
  }
}

- (id)_tokenRequestWithError:(id *)a3
{
  int v5 = [(AMSMediaTokenService *)self tokenFetchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(AMSMediaTokenService *)self bag];
  double v7 = [v6 URLForKey:@"sf-api-token-service-url"];
  id v33 = 0;
  double v8 = [v7 valueWithError:&v33];
  id v9 = v33;

  if (v9)
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v12 = [(AMSMediaTokenService *)self clientInfo];
  int v13 = +[AMSMappedBundleInfo accountMediaTypeInfoForProcessInfo:v12];

  if (!v13)
  {
    id v14 = [(AMSMediaTokenService *)self clientInfo];
    int v13 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v14];
  }
  v31 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(AMSMediaTokenService *)self clientType] == 1) {
    v16 = @"other";
  }
  else {
    v16 = @"apple";
  }
  [v15 setObject:v16 forKeyedSubscript:@"clientClass"];
  int v17 = [(AMSMediaTokenService *)self clientIdentifier];
  [v15 setObject:v17 forKeyedSubscript:@"clientId"];

  id v18 = +[AMSDevice productVersion];
  [v15 setObject:v18 forKeyedSubscript:@"osVersion"];

  __int16 v19 = +[AMSDevice operatingSystem];
  [v15 setObject:v19 forKeyedSubscript:@"os"];

  v20 = [v13 clientVersion];
  [v15 setObject:v20 forKeyedSubscript:@"productVersion"];

  [v15 setObject:@"2" forKeyedSubscript:@"version"];
  if (os_variant_has_internal_content()) {
    [v15 setObject:@"internal" forKeyedSubscript:@"buildVariant"];
  }
  __int16 v21 = [MEMORY[0x1E4F18D50] requestWithURL:v8];
  [v21 setHTTPMethod:@"GET"];
  id v22 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
  v24 = [v22 stringFromDate:v23];

  [v21 addValue:v24 forHTTPHeaderField:@"x-request-timestamp"];
  id v25 = [AMSURLRequestEncoder alloc];
  v26 = [(AMSMediaTokenService *)self bag];
  v27 = [(AMSURLRequestEncoder *)v25 initWithBag:v26];

  v28 = [(AMSMediaTokenService *)self account];
  [(AMSURLRequestEncoder *)v27 setAccount:v28];

  v29 = [(AMSMediaTokenService *)self clientInfo];
  [(AMSURLRequestEncoder *)v27 setClientInfo:v29];

  [(AMSURLRequestEncoder *)v27 setMescalType:1];
  [(AMSURLRequestEncoder *)v27 setUrlKnownToBeTrusted:[(AMSMediaTokenService *)self URLKnownToBeTrusted]];
  v30 = [(AMSURLRequestEncoder *)v27 requestByEncodingRequest:v21 parameters:v15];
  id v32 = 0;
  id v10 = [v30 resultWithTimeout:&v32 error:60.0];
  id v9 = v32;

  if (a3) {
LABEL_3:
  }
    *a3 = v9;
LABEL_4:

  return v10;
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 clientVersion:(id)a4 bag:(id)a5
{
  return [(AMSMediaTokenService *)self initWithClientIdentifier:a3 bag:a5];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setBag:(id)a3
{
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (OS_dispatch_queue)tokenFetchQueue
{
  return self->_tokenFetchQueue;
}

- (BOOL)URLKnownToBeTrusted
{
  return self->_URLKnownToBeTrusted;
}

@end