@interface CMSCloudExtensionSession
- (BOOL)_handleURLResponseCode:(int64_t)a3 error:(id)a4 before:(id)a5 request:(id)a6 networkActivity:(id)a7 retryHandler:(id)a8;
- (BOOL)_updateDynamicHeadersOnRequest:(id)a3 withDeadline:(id)a4;
- (BOOL)allowExplicitContent;
- (BOOL)shuffledPlayback;
- (BOOL)updateUserTasteProfile;
- (CMSCloudExtensionConfiguration)config;
- (CMSCloudExtensionSession)init;
- (CMSCloudExtensionSession)initWithConfiguration:(id)a3 authProviderDelegate:(id)a4;
- (CMSPlayerContext)intentPlayerContext;
- (NSMutableArray)requestQueue;
- (NSMutableDictionary)completions;
- (NSMutableDictionary)durations;
- (NSMutableDictionary)exceptions;
- (NSMutableDictionary)results;
- (NSString)authHeader;
- (NSString)description;
- (NSString)endpointIdentifier;
- (NSString)requesterHomeUserID;
- (NSString)sessionIdentifier;
- (NSURLSession)session;
- (double)durationForMethod:(id)a3;
- (double)timeoutInterval;
- (double)totalDuration;
- (id)_constraintsDefinition;
- (id)_parsedObjectFromData:(id)a3 inResponse:(id)a4 error:(id *)a5;
- (id)_queuePlayMediaForActivity:(id)a3;
- (id)_requestForMethods:(id)a3 before:(id)a4 error:(id *)a5;
- (id)_resultsFromData:(id)a3 inResponse:(id)a4 error:(id *)a5;
- (id)_sessionDescriptionWithDeadline:(id)a3;
- (id)peekResponseForMethod:(id)a3 exception:(id *)a4;
- (id)prepareRequestHook;
- (unsigned)qosClass;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)_connectSession;
- (void)_handleURLResponse:(id)a3 before:(id)a4 networkActivity:(id)a5 request:(id)a6 data:(id)a7 error:(id)a8;
- (void)_performActivityUpdate:(id)a3 completion:(id)a4;
- (void)_retryRequest:(id)a3 before:(id)a4 networkActivity:(id)a5 completionHandler:(id)a6;
- (void)_retryRequestAfterAuthTokenRenewal:(id)a3 parentNetworkActivity:(id)a4 before:(id)a5 completionHandler:(id)a6;
- (void)closeWithForce:(BOOL)a3;
- (void)getAlbumArtDataFromURL:(id)a3 networkActivity:(id)a4 completionHandler:(id)a5;
- (void)getContentProtectionKeyForAssetIdentifier:(id)a3 usingKeySystem:(id)a4 andKeyRequest:(id)a5 playerContext:(id)a6 userActivityDictionary:(id)a7 networkActivity:(id)a8 completionHandler:(id)a9;
- (void)getFairplayCertificateUsingNetworkActivity:(id)a3 completionHandler:(id)a4;
- (void)getQueueSegmentFromURL:(id)a3 referrer:(id)a4 networkActivity:(id)a5 completion:(id)a6;
- (void)performMethod:(id)a3 withParams:(id)a4 networkActivity:(id)a5 completion:(id)a6;
- (void)publishContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 previousContentURL:(id)a6 nextContentURL:(id)a7 networkActivity:(id)a8 completion:(id)a9;
- (void)report:(unint64_t)a3 forActivity:(id)a4 nowPlaying:(id)a5 previous:(id)a6 timestamp:(id)a7 completion:(id)a8;
- (void)reportContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 timestamp:(id)a6 completion:(id)a7;
- (void)requestQueueForActivity:(id)a3 networkActivity:(id)a4 completion:(id)a5;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setAuthHeader:(id)a3;
- (void)setCloseCompletion:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDurations:(id)a3;
- (void)setEndpointIdentifier:(id)a3;
- (void)setExceptions:(id)a3;
- (void)setIntentPlayerContext:(id)a3;
- (void)setPrepareRequestHook:(id)a3;
- (void)setQosClass:(unsigned int)a3;
- (void)setRequestQueue:(id)a3;
- (void)setRequesterHomeUserID:(id)a3;
- (void)setResults:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setShuffledPlayback:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setTotalDuration:(double)a3;
- (void)setUpdateUserTasteProfile:(BOOL)a3;
@end

@implementation CMSCloudExtensionSession

- (CMSCloudExtensionSession)init
{
  v3 = objc_alloc_init(CMSCloudExtensionConfiguration);
  v4 = [(CMSCloudExtensionSession *)self initWithConfiguration:v3 authProviderDelegate:0];

  return v4;
}

- (CMSCloudExtensionSession)initWithConfiguration:(id)a3 authProviderDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMSCloudExtensionSession;
  v9 = [(CMSCloudExtensionSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeWeak((id *)&v10->_authProvider, v8);
    v10->_requestQueueLock._os_unfair_lock_opaque = 0;
    v10->_timeoutInterval = 10.0;
  }

  return v10;
}

- (void)setQosClass:(unsigned int)a3
{
  if (self->_connected)
  {
    v4 = _CMSILogingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession setQosClass:](a2, v4);
    }
  }
  else
  {
    self->_qosClass = a3;
  }
}

- (void)setCloseCompletion:(id)a3
{
  self->_closeCompletion = (id)MEMORY[0x230F3FCD0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (BOOL)_updateDynamicHeadersOnRequest:(id)a3 withDeadline:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  prepareRequestHook = (void (**)(id, CMSCloudExtensionSession *, id))self->_prepareRequestHook;
  if (prepareRequestHook) {
    prepareRequestHook[2](prepareRequestHook, self, v6);
  }
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    double timeoutInterval = v9 + 2.0;
  }
  else
  {
    double timeoutInterval = self->_timeoutInterval;
  }
  double v11 = timeoutInterval;
  if (timeoutInterval < 1.0)
  {
    objc_super v12 = _CMSILogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:]";
      __int16 v18 = 2048;
      double v19 = timeoutInterval;
      _os_log_impl(&dword_22B0FF000, v12, OS_LOG_TYPE_DEFAULT, "%s already near or past deadline by %fs", buf, 0x16u);
    }

    double v11 = 1.0;
  }
  unint64_t v13 = 0x263F08000uLL;
  LODWORD(v13) = vcvtpd_s64_f64(v11);
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v13);
  [v6 setValue:v14 forHTTPHeaderField:@"Request-timeout"];

  [v6 setTimeoutInterval:v11 + 1.0];
  [v6 setValue:self->_sessionIdentifier forHTTPHeaderField:@"x-applecloudextension-session-id"];
  [v6 setValue:self->_authHeader forHTTPHeaderField:@"Authorization"];

  return timeoutInterval >= 1.0;
}

- (id)_requestForMethods:(id)a3 before:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v10 = CreateDataWithSerializedJSON(v8, 0);
    if (v10)
    {
      double v11 = [v8 firstObject];
      objc_super v12 = [v11 objectForKey:@"method"];

      unint64_t v13 = CMSExtensionEndpointForProtocolMethodName(v12);
      if (v13)
      {
        v14 = [(CMSCloudExtensionConfiguration *)self->_config configForEndpoint:v13];
        v15 = [v14 request];
        v16 = (void *)[v15 mutableCopy];

        [v16 setHTTPMethod:@"POST"];
        [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [v16 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [v16 setHTTPBody:v10];
        [(CMSCloudExtensionSession *)self _updateDynamicHeadersOnRequest:v16 withDeadline:v9];
      }
      else if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:11 userInfo:0];
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }
    else if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:12 userInfo:0];
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:6 userInfo:0];
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_parsedObjectFromData:(id)a3 inResponse:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      unint64_t v13 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:a5];
      goto LABEL_14;
    }
    v10 = [v9 valueForHTTPHeaderField:@"x-applecloudextension-session-id"];
    if (!v10
      || ([(CMSCloudExtensionSession *)self sessionIdentifier],
          double v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v10 isEqualToString:v11],
          v11,
          (v12 & 1) != 0))
    {

      goto LABEL_6;
    }
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:3 userInfo:0];
    }
  }
  else if (a5 && !*a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
    unint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  unint64_t v13 = 0;
LABEL_14:

  return v13;
}

- (id)_resultsFromData:(id)a3 inResponse:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = -[CMSCloudExtensionSession _parsedObjectFromData:inResponse:error:](self, "_parsedObjectFromData:inResponse:error:", a3, a4);
  id v7 = (void *)v6;
  if (a5 && !v6 && *a5)
  {
LABEL_16:
    id v13 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a5)
          {
            objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.cloudextension.errors.session", 4, 0, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v13 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v13 = v8;
LABEL_20:

LABEL_21:
  return v13;
}

- (void)_connectSession
{
  if (!self->_connected)
  {
    closeError = self->_closeError;
    self->_closeError = 0;

    if (!self->_sessionIdentifier)
    {
      v4 = [MEMORY[0x263F08C38] UUID];
      v5 = [v4 UUIDString];
      sessionIdentifier = self->_sessionIdentifier;
      self->_sessionIdentifier = v5;
    }
    id v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    requestQueue = self->_requestQueue;
    self->_requestQueue = v7;

    uint64_t v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:8];
    results = self->_results;
    self->_results = v9;

    uint64_t v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    exceptions = self->_exceptions;
    self->_exceptions = v11;

    id v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    completions = self->_completions;
    self->_completions = v13;

    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    durations = self->_durations;
    self->_durations = v15;

    self->_totalDuration = 0.0;
    attr = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)self->_qosClass, 0);
    id v17 = [NSString stringWithFormat:@"com.apple.cloudextension.session.%@", self->_sessionIdentifier];
    long long v18 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v17 UTF8String], attr);
    requestDispatch = self->_requestDispatch;
    self->_requestDispatch = v18;

    uint64_t v20 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    v21 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v20 delegate:self delegateQueue:0];
    session = self->_session;
    self->_session = v21;

    self->_connected = 1;
  }
}

- (id)_constraintsDefinition
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"shuffledPlayback";
  v3 = [NSNumber numberWithBool:self->_shuffledPlayback];
  v10[0] = v3;
  v9[1] = @"updateUserTasteProfile";
  v4 = [NSNumber numberWithBool:self->_updateUserTasteProfile];
  v10[1] = v4;
  v9[2] = @"allowExplicitContent";
  v5 = [NSNumber numberWithBool:self->_allowExplicitContent];
  v10[2] = v5;
  v9[3] = @"maximumQueueSegmentItemCount";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:1000];
  v10[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)_sessionDescriptionWithDeadline:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = self->_sessionIdentifier;
  v15[0] = @"identifier";
  v15[1] = @"version";
  v14 = CMSCloudExtensionSpecVersion();
  v16[1] = v14;
  v15[2] = @"constraints";
  v5 = [(CMSCloudExtensionSession *)self _constraintsDefinition];
  v16[2] = v5;
  v15[3] = @"playerContext";
  uint64_t v6 = [(CMSPlayerContext *)self->_intentPlayerContext cmsCoded];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v16[3] = v7;
  v15[4] = @"requested";
  id v8 = cmsDateFormatter();
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  uint64_t v10 = [v8 stringFromDate:v9];
  v16[4] = v10;
  v15[5] = @"deadline";
  if (v4)
  {
    cmsDateFormatter();
    self = (CMSCloudExtensionSession *)objc_claimAutoreleasedReturnValue();
    [(CMSCloudExtensionSession *)self stringFromDate:v4];
  }
  else
  {
    [MEMORY[0x263EFF9D0] null];
  uint64_t v11 = };
  v16[5] = v11;
  char v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
  if (v4)
  {

    uint64_t v11 = self;
  }

  if (!v6) {
  return v12;
  }
}

- (void)_retryRequest:(id)a3 before:(id)a4 networkActivity:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (!self->_connected || !self->_session)
  {
    if (!v14) {
      goto LABEL_12;
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 2;
LABEL_11:
    v31 = [v21 errorWithDomain:@"com.apple.cloudextension.errors.session" code:v22 userInfo:0];
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v31);

    goto LABEL_12;
  }
  if ([(CMSCloudExtensionSession *)self _updateDynamicHeadersOnRequest:v11 withDeadline:v12])
  {
    long long v16 = [v11 allHTTPHeaderFields];
    int v17 = [v16 cmsIntegerForKey:@"x-applecloudextension-retry-count" withDefault:0];

    long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v17 + 1));
    [v11 setValue:v18 forHTTPHeaderField:@"x-applecloudextension-retry-count"];

    objc_storeStrong((id *)&self->_lastRequest, a3);
    double v19 = [(NSURLSession *)self->_session dataTaskWithRequest:v11 completionHandler:v14];
    dataTask = self->_dataTask;
    self->_dataTask = v19;

    [v13 associateWithTask:self->_dataTask];
    [(NSURLSessionDataTask *)self->_dataTask resume];
    goto LABEL_12;
  }
  v23 = _CMSILogingFacility();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[CMSCloudExtensionSession _retryRequest:before:networkActivity:completionHandler:](v23, v24, v25, v26, v27, v28, v29, v30);
  }

  if (v14)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = 10;
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)_retryRequestAfterAuthTokenRenewal:(id)a3 parentNetworkActivity:(id)a4 before:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authProvider);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    id v15 = objc_loadWeakRetained((id *)&self->_authProvider);
    sessionIdentifier = self->_sessionIdentifier;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke;
    v25[3] = &unk_264888640;
    objc_copyWeak(&v30, &location);
    id v26 = v10;
    id v27 = v12;
    id v28 = v11;
    id v29 = v13;
    [v15 authRenewalForSessionIdentifier:sessionIdentifier parentNetworkActivity:v28 completion:v25];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    int v17 = _CMSILogingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession _retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:]((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:9 userInfo:0];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v24);
  }
}

void __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = WeakRetained;
  if (!WeakRetained
    || ([WeakRetained sessionIdentifier],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 compare:v7],
        v12,
        v13))
  {
    if (!v9)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:3 userInfo:0];
    }
LABEL_14:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_15;
  }
  if (!v8)
  {
    if (!v9)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:9 userInfo:0];
    }
    id v15 = _CMSILogingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke_cold_1();
    }

    goto LABEL_14;
  }
  id v14 = _CMSILogingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    int v17 = "-[CMSCloudExtensionSession _retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22B0FF000, v14, OS_LOG_TYPE_DEFAULT, "%s: session %@ retrieved new authorization", (uint8_t *)&v16, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)v11 + 4);
  objc_storeStrong((id *)v11 + 12, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)v11 + 4);
  [v11 _retryRequest:*(void *)(a1 + 32) before:*(void *)(a1 + 40) networkActivity:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
LABEL_15:
}

- (BOOL)_handleURLResponseCode:(int64_t)a3 error:(id)a4 before:(id)a5 request:(id)a6 networkActivity:(id)a7 retryHandler:(id)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v18)
  {
    uint64_t v21 = _CMSILogingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]();
    }
    goto LABEL_17;
  }
  id v19 = [v16 allHTTPHeaderFields];
  uint64_t v20 = [v19 cmsIntegerForKey:@"x-applecloudextension-retry-count" withDefault:0];

  if (v20 >= 4)
  {
    uint64_t v21 = _CMSILogingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:](v21);
    }
LABEL_17:

    BOOL v25 = 0;
    goto LABEL_18;
  }
  if (!v14) {
    goto LABEL_13;
  }
  uint64_t v22 = [v14 domain];
  int v23 = [v22 isEqualToString:*MEMORY[0x263F08570]];

  if (!v23) {
    goto LABEL_13;
  }
  uint64_t v24 = [v14 code];
  if (v24 != -1005)
  {
    if (v24 == -1013)
    {
LABEL_14:
      [(CMSCloudExtensionSession *)self _retryRequestAfterAuthTokenRenewal:v16 parentNetworkActivity:v17 before:v15 completionHandler:v18];
      BOOL v25 = 1;
      goto LABEL_18;
    }
LABEL_13:
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0x191)
    {
      uint64_t v21 = _CMSILogingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]();
      }
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_initWeak(&location, self);
  if (!v15
    || ([MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)v20 * 0.5],
        id v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v28 = [v27 compare:v15] == -1,
        v27,
        v28))
  {
    id v30 = _CMSILogingFacility();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
      __int16 v42 = 1024;
      int v43 = v20 + 1;
      __int16 v44 = 2048;
      double v45 = (double)v20 * 0.5;
      __int16 v46 = 2112;
      id v47 = v15;
      _os_log_impl(&dword_22B0FF000, v30, OS_LOG_TYPE_DEFAULT, "%s: NSURLErrorNetworkConnectionLost, will retry #%d after a delay of %f seconds, deadline %@", buf, 0x26u);
    }

    dispatch_time_t v31 = dispatch_time(0, (uint64_t)((double)v20 * 0.5 * 1000000000.0));
    requestDispatch = self->_requestDispatch;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __101__CMSCloudExtensionSession__handleURLResponseCode_error_before_request_networkActivity_retryHandler___block_invoke;
    v33[3] = &unk_264888668;
    objc_copyWeak(&v38, &location);
    id v34 = v16;
    id v35 = v15;
    id v36 = v17;
    id v37 = v18;
    dispatch_after(v31, requestDispatch, v33);

    objc_destroyWeak(&v38);
    BOOL v25 = 1;
  }
  else
  {
    id v29 = _CMSILogingFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
      __int16 v42 = 1024;
      int v43 = v20 + 1;
      __int16 v44 = 2112;
      double v45 = *(double *)&v15;
      _os_log_impl(&dword_22B0FF000, v29, OS_LOG_TYPE_DEFAULT, "%s: NSURLErrorNetworkConnectionLost, will not attempt retry after %d attempt(s): expecting to miss deadline %@", buf, 0x1Cu);
    }

    BOOL v25 = 0;
  }
  objc_destroyWeak(&location);
LABEL_18:

  return v25;
}

void __101__CMSCloudExtensionSession__handleURLResponseCode_error_before_request_networkActivity_retryHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _retryRequest:*(void *)(a1 + 32) before:*(void *)(a1 + 40) networkActivity:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_handleURLResponse:(id)a3 before:(id)a4 networkActivity:(id)a5 request:(id)a6 data:(id)a7 error:(id)a8
{
  v44[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v29 = a5;
  id v30 = a6;
  id v16 = a7;
  id v17 = a8;
  objc_initWeak(&location, self);
  id v18 = v14;
  uint64_t v19 = [v18 statusCode];
  uint64_t v20 = v19;
  if (v17 || v19 != 200)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke;
    v37[3] = &unk_264888690;
    objc_copyWeak(&v41, &location);
    id v38 = v15;
    id v39 = v29;
    id v40 = v30;
    BOOL v22 = [(CMSCloudExtensionSession *)self _handleURLResponseCode:v20 error:v17 before:v38 request:v40 networkActivity:v39 retryHandler:v37];

    objc_destroyWeak(&v41);
    if (v22)
    {
      uint64_t v21 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_16;
    }
    if (!v17)
    {
      int v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F08320];
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Service Error: HTTP statusCode %d", v20);
      v44[0] = v24;
      BOOL v25 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
      id v17 = [v23 errorWithDomain:@"com.apple.cloudextension.errors.session" code:14 userInfo:v25];
    }
    uint64_t v21 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v36 = 0;
    uint64_t v21 = [(CMSCloudExtensionSession *)self _resultsFromData:v16 inResponse:v18 error:&v36];
    id v17 = v36;
  }
  id v26 = _CMSILogingFacility();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[CMSCloudExtensionSession _handleURLResponse:before:networkActivity:request:data:error:]();
  }

  if (v17)
  {
    id v27 = _CMSILogingFacility();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession _handleURLResponse:before:networkActivity:request:data:error:]();
    }

    requestDispatch = self->_requestDispatch;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_108;
    block[3] = &unk_2648886E0;
    objc_copyWeak(&v35, &location);
    block[4] = self;
    id v17 = v17;
    id v34 = v17;
    dispatch_async(requestDispatch, block);

    objc_destroyWeak(&v35);
  }
  else
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3;
    v31[3] = &unk_264888730;
    v31[4] = self;
    objc_copyWeak(&v32, &location);
    [v21 enumerateObjectsUsingBlock:v31];
    objc_destroyWeak(&v32);
    id v17 = 0;
  }
LABEL_16:

  objc_destroyWeak(&location);
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 7);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleURLResponse:v9 before:a1[4] networkActivity:a1[5] request:a1[6] data:v10 error:v8];
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_108(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    id v4 = (void *)[*(id *)&v3[44]._os_unfair_lock_opaque copy];
    [*(id *)&v3[44]._os_unfair_lock_opaque removeAllObjects];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_2;
    v7[3] = &unk_2648886B8;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    v7[4] = v3;
    v7[5] = v5;
    id v8 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    os_unfair_lock_unlock(v3 + 4);
  }
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1[4] + 152);
  uint64_t v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKey:v7];
  uint64_t v9 = a1[4];
  id v11 = (id)v8;
  if (v8)
  {
    [*(id *)(v9 + 152) removeObjectForKey:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    uint64_t v10 = 0;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 16));
    uint64_t v10 = a1[6];
  }
  v6[2](v6, a1[5], v7, v11, v10);

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v66[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [v5 cmsOptionalDictionaryForKey:@"result"];
  uint64_t v7 = [v5 cmsOptionalStringForKey:@"method"];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"(Not Provided)";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  id v11 = [v5 cmsOptionalDictionaryForKey:@"exception"];
  uint64_t v45 = [v5 cmsOptionalStringForKey:@"debug"];
  if (v6)
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (!v11)
    {
      v66[0] = v10;
      v65[0] = @"methodName";
      v65[1] = @"methodIndex";
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
      v65[2] = @"reason";
      v66[1] = v13;
      v66[2] = @"invalid_result";
      id v11 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
    }
    uint64_t v12 = 5;
  }
  if (!_isValidMethod(v10))
  {
    if (!v11 || ([(__CFString *)v10 isEqualToString:@"ProtocolException"] & 1) == 0)
    {
      v64[0] = v10;
      v63[0] = @"methodName";
      v63[1] = @"methodIndex";
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, v45);
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v63[2] = @"reason";
      v64[1] = v18;
      v64[2] = @"invalid_method";
      id v14 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];
      uint64_t v12 = 6;
      goto LABEL_30;
    }
    id v14 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    objc_msgSend(v15, "cmsOptionalStringForKey:", @"reason", v45);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v17 = v16;
      if (([@"unsupported" isEqualToString:v16] & 1) != 0
        || ([@"unauthorized" isEqualToString:v17] & 1) != 0
        || ([@"unexpected" isEqualToString:v17] & 1) != 0
        || ([@"invalid" isEqualToString:v17] & 1) != 0
        || ([@"unparseable" isEqualToString:v17] & 1) != 0
        || ([@"deprecated" isEqualToString:v17] & 1) != 0
        || ([@"internal" isEqualToString:v17] & 1) != 0
        || ([@"complex" isEqualToString:v17] & 1) != 0
        || ([@"busy" isEqualToString:v17] & 1) != 0
        || ([@"invalid_result" isEqualToString:v17] & 1) != 0
        || [@"invalid_exception" isEqualToString:v17])
      {

LABEL_27:
        id v18 = [v14 cmsOptionalStringForKey:@"methodName"];
        if (!_isValidMethod(v18))
        {
          uint64_t v12 = 8;
          goto LABEL_31;
        }
        id v18 = v18;
        uint64_t v12 = 8;
        id v11 = v10;
        uint64_t v10 = v18;
LABEL_30:

LABEL_31:
        uint64_t v6 = 0;
        id v11 = v14;
        goto LABEL_32;
      }
      char v44 = [@"invalid_method" isEqualToString:v17];

      if (v44) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    v62[0] = v10;
    v61[0] = @"methodName";
    v61[1] = @"methodIndex";
    id v18 = [NSNumber numberWithUnsignedInteger:a3];
    v62[1] = v18;
    v62[2] = @"invalid_exception";
    v61[2] = @"reason";
    v61[3] = @"x-originalException";
    v62[3] = v14;
    [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
    id v11 = v14;
    uint64_t v12 = 7;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_32:
  uint64_t v19 = objc_msgSend(v5, "cmsOptionalDictionaryForKey:", @"metrics", v45);
  uint64_t v20 = v19;
  if (v19)
  {
    [v19 cmsDoubleForKey:@"duration" withDefault:NAN];
    double v22 = v21;
    int v23 = _CMSILogingFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_3((uint64_t)v10, v23, v24, v25, v26, v27, v28, v29);
    }

    id v30 = *(void **)(*(void *)(a1 + 32) + 184);
    dispatch_time_t v31 = [NSNumber numberWithDouble:v22];
    [v30 setObject:v31 forKey:v10];

    *(double *)(*(void *)(a1 + 32) + 192) = v22 + *(double *)(*(void *)(a1 + 32) + 192);
  }
  if (!v11)
  {
    id v35 = 0;
    v33 = v46;
    if (!v46) {
      goto LABEL_45;
    }
    goto LABEL_42;
  }
  id v32 = @"<No debug string>";
  v33 = v46;
  if (v46) {
    id v32 = v46;
  }
  v59[0] = @"com.apple.cloudextension.errors.session.debug";
  v59[1] = @"com.apple.cloudextension.errors.session.exception";
  v60[0] = v32;
  v60[1] = v11;
  id v34 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  id v35 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:v12 userInfo:v34];

  if (v46)
  {
LABEL_42:
    id v36 = _CMSILogingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138412802;
      uint64_t v54 = v43;
      __int16 v55 = 2112;
      v56 = v10;
      __int16 v57 = 2112;
      v58 = v33;
      _os_log_debug_impl(&dword_22B0FF000, v36, OS_LOG_TYPE_DEBUG, "Debug URL for %@:%@: %@", buf, 0x20u);
    }
  }
LABEL_45:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v37 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v10];
  if (v37)
  {
  }
  else
  {
    id v38 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:v10];

    if (!v38) {
      goto LABEL_51;
    }
  }
  id v39 = _CMSILogingFacility();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_2();
  }

LABEL_51:
  id v40 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:v10];
  if (v40)
  {
    id v41 = _CMSILogingFacility();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 176) removeObjectForKey:v10];
    __int16 v42 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_143;
    block[3] = &unk_264888708;
    objc_copyWeak(&v52, (id *)(a1 + 40));
    id v51 = v40;
    uint64_t v48 = v10;
    id v49 = v6;
    id v50 = v35;
    dispatch_async(v42, block);

    objc_destroyWeak(&v52);
    v33 = v46;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 152) setObject:v6 forKeyedSubscript:v10];
    [*(id *)(*(void *)(a1 + 32) + 160) setObject:v35 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

uint64_t __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_143(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 64))) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (id)peekResponseForMethod:(id)a3 exception:(id *)a4
{
  p_requestQueueLock = &self->_requestQueueLock;
  id v7 = a3;
  os_unfair_lock_lock(p_requestQueueLock);
  uint64_t v8 = [(NSMutableDictionary *)self->_results objectForKey:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_exceptions objectForKey:v7];

  os_unfair_lock_unlock(p_requestQueueLock);
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (void)performMethod:(id)a3 withParams:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  v43[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, CMSCloudExtensionSession *, id, void *, void *))a6;
  BOOL isValidMethod = _isValidMethod(v10);
  if (v11)
  {
    if (isValidMethod)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_unfair_lock_lock(&self->_requestQueueLock);
        id v15 = [(NSMutableDictionary *)self->_results objectForKey:v10];
        [(NSMutableDictionary *)self->_results removeObjectForKey:v10];
        id v16 = [(NSMutableDictionary *)self->_exceptions objectForKey:v10];
        [(NSMutableDictionary *)self->_exceptions removeObjectForKey:v10];
        if (v15)
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13) {
            v13[2](v13, self, v10, v15, v16);
          }
        }
        else if (v16)
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13) {
            v13[2](v13, self, v10, 0, v16);
          }
        }
        else if (self->_connected {
               || ([(CMSCloudExtensionSession *)self _connectSession], self->_connected))
        }
        {
          id v34 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:self->_timeoutInterval];
          id v17 = [(CMSCloudExtensionSession *)self requestQueue];
          uint64_t v32 = [v17 count];

          dispatch_time_t v31 = [(CMSCloudExtensionSession *)self requestQueue];
          if (v32)
          {
            v40[0] = @"method";
            v40[1] = @"params";
            v41[0] = v10;
            v41[1] = v11;
            id v18 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
            uint64_t v19 = v31;
            [v31 addObject:v18];
          }
          else
          {
            v42[0] = @"session";
            id v18 = [(CMSCloudExtensionSession *)self _sessionDescriptionWithDeadline:v34];
            v43[0] = v18;
            v43[1] = v10;
            v42[1] = @"method";
            v42[2] = @"params";
            v43[2] = v11;
            v33 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
            uint64_t v19 = v31;
            [v31 addObject:v33];
          }
          uint64_t v20 = _CMSILogingFacility();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[CMSCloudExtensionSession performMethod:withParams:networkActivity:completion:]((uint64_t)self, v20, v21, v22, v23, v24, v25, v26);
          }

          if (v13)
          {
            uint64_t v27 = [(CMSCloudExtensionSession *)self completions];
            uint64_t v28 = (void *)MEMORY[0x230F3FCD0](v13);
            [v27 setObject:v28 forKey:v10];
          }
          if (!self->_waiting)
          {
            self->_waiting = 1;
            requestDispatch = self->_requestDispatch;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke;
            block[3] = &unk_264888780;
            void block[4] = self;
            id v36 = v10;
            id v39 = v13;
            id v37 = v34;
            id v38 = v12;
            dispatch_async(requestDispatch, block);
          }
          os_unfair_lock_unlock(&self->_requestQueueLock);
        }
        else
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13)
          {
            id v30 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:2 userInfo:0];
            v13[2](v13, self, v10, 0, v30);
          }
        }

        goto LABEL_13;
      }
    }
  }
  if (v13)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:6 userInfo:0];
    v13[2](v13, self, v10, 0, v15);
LABEL_13:
  }
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = v3;

  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  uint64_t v6 = (void *)MEMORY[0x230F3FCD0](*(void *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 176) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  id v7 = _CMSILogingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_cold_1();
  }

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v30 = 0;
  id v10 = [v8 _requestForMethods:v2 before:v9 error:&v30];
  id v11 = v30;
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v10);
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v12 = *(void **)(*(void *)(a1 + 32) + 144);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_2;
    v20[3] = &unk_264888690;
    objc_copyWeak(&v24, &location);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v23 = v10;
    uint64_t v13 = [v12 dataTaskWithRequest:v23 completionHandler:v20];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = v13;

    [*(id *)(a1 + 56) associateWithTask:*(void *)(*(void *)(a1 + 32) + 48)];
    [*(id *)(*(void *)(a1 + 32) + 48) resume];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void, void, void, id))(v16 + 16))(v16, *(void *)(a1 + 32), *(void *)(a1 + 40), 0, v11);
    }
    id v17 = (void *)[*(id *)(*(void *)(a1 + 32) + 176) copy];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_153;
    v26[3] = &unk_264888758;
    uint64_t v18 = *(void *)(a1 + 32);
    id v27 = v17;
    uint64_t v28 = v18;
    id v29 = v11;
    id v19 = v17;
    [v2 enumerateObjectsUsingBlock:v26];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  }
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_153(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v3 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 40) + 176) removeObjectForKey:v4];
    ((void (**)(void, void, id, void, void))v3)[2](v3, *(void *)(a1 + 40), v4, 0, *(void *)(a1 + 48));
  }
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleURLResponse:v7 before:*(void *)(a1 + 32) networkActivity:*(void *)(a1 + 40) request:*(void *)(a1 + 48) data:v11 error:v8];
  }
}

- (id)_queuePlayMediaForActivity:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = self->_sessionIdentifier;
  v10[0] = @"identifier";
  v10[1] = @"version";
  id v5 = CMSCloudExtensionSpecVersion();
  v11[1] = v5;
  v10[2] = @"userActivity";
  uint64_t v6 = v4;
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  }
  v11[2] = v6;
  v10[3] = @"constraints";
  id v7 = [(CMSCloudExtensionSession *)self _constraintsDefinition];
  v11[3] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  if (!v4) {
  return v8;
  }
}

- (void)requestQueueForActivity:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CMSCloudExtensionConfiguration *)self->_config configForEndpoint:@"queues/playMedia"];
  if (v11)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected) {
      [(CMSCloudExtensionSession *)self _connectSession];
    }
    os_unfair_lock_unlock(&self->_requestQueueLock);
    id v12 = [(CMSCloudExtensionSession *)self _queuePlayMediaForActivity:v8];
    v31[0] = 0;
    uint64_t v13 = CreateDataWithSerializedJSON(v12, v31);
    id v14 = v31[0];

    if (v13)
    {
      id v15 = [v11 request];
      uint64_t v16 = (void *)[v15 mutableCopy];

      [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
      [v16 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
      [v16 setHTTPMethod:@"POST"];
      [v16 setHTTPBody:v13];
      [(CMSCloudExtensionSession *)self _updateDynamicHeadersOnRequest:v16 withDeadline:0];
      objc_initWeak(&location, self);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke;
      v27[3] = &unk_2648887A8;
      objc_copyWeak(&v29, &location);
      id v28 = v10;
      id v17 = (void *)MEMORY[0x230F3FCD0](v27);
      requestDispatch = self->_requestDispatch;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_158;
      block[3] = &unk_2648887F8;
      objc_copyWeak(&v26, &location);
      id v23 = v16;
      id v24 = v9;
      id v25 = v17;
      id v19 = v17;
      id v20 = v16;
      dispatch_async(requestDispatch, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, CMSCloudExtensionSession *, void, id))v10 + 2))(v10, self, 0, v14);
    }
  }
  else
  {
    id v21 = _CMSILogingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession requestQueueForActivity:networkActivity:completion:]();
    }

    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:1 userInfo:0];
    (*((void (**)(id, CMSCloudExtensionSession *, void, id))v10 + 2))(v10, self, 0, v14);
  }
}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 32))
    {
      id v12 = _CMSILogingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[CMSCloudExtensionSession requestQueueForActivity:networkActivity:completion:]_block_invoke";
        _os_log_impl(&dword_22B0FF000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding response", buf, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:2 userInfo:0];

      id v7 = 0;
      id v9 = (id)v13;
    }
    id v14 = v8;
    if ([v14 statusCode] == 204)
    {
      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:15 userInfo:0];

      id v9 = (id)v15;
    }
    if (!v7 || v9)
    {
      if (!v9)
      {
        id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v18 = 0;
      uint64_t v16 = [v11 _parsedObjectFromData:v7 inResponse:v14 error:&v18];
      id v9 = v18;
      id v17 = cmsSafeDictionary(v16);

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = (void *)WeakRetained[18];
  id v4 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_2;
  id v9 = &unk_2648887D0;
  id v10 = WeakRetained;
  id v11 = v4;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v5 = [v3 dataTaskWithRequest:v11 completionHandler:&v6];
  objc_msgSend(*(id *)(a1 + 40), "associateWithTask:", v5, v6, v7, v8, v9, v10);
  [v5 resume];
}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 statusCode];
  if (!v9 && (v11 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8)
  {
    uint64_t v12 = 0;
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v9 = (id)v12;
    goto LABEL_11;
  }
  if (([*(id *)(a1 + 32) _handleURLResponseCode:v11 error:v9 before:0 request:*(void *)(a1 + 40) networkActivity:*(void *)(a1 + 48) retryHandler:*(void *)(a1 + 56)] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    if (v9)
    {
      uint64_t v15 = *MEMORY[0x263F08608];
      v16[0] = v9;
      id v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v12 = [v13 errorWithDomain:@"com.apple.cloudextension.errors.session" code:14 userInfo:v14];

    if (v9) {
    goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)getQueueSegmentFromURL:(id)a3 referrer:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CMSCloudExtensionConfiguration *)self->_config configForEndpoint:@"queues/playMedia"];
  if (v14)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected) {
      [(CMSCloudExtensionSession *)self _connectSession];
    }
    os_unfair_lock_unlock(&self->_requestQueueLock);
    uint64_t v15 = [v14 request];
    uint64_t v16 = (void *)[v15 mutableCopy];

    [v16 setURL:v10];
    if (v11)
    {
      id v17 = [MEMORY[0x263F08BA0] componentsWithURL:v11 resolvingAgainstBaseURL:1];
      id v18 = v17;
      if (v17)
      {
        [v17 setPassword:0];
        [v18 setUser:0];
        [v18 setQuery:0];
        [v18 setFragment:0];
        id v19 = [v18 string];
        [v16 setValue:v19 forHTTPHeaderField:@"Referer"];
      }
    }
    [v16 setHTTPMethod:@"GET"];
    [v16 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [(CMSCloudExtensionSession *)self _updateDynamicHeadersOnRequest:v16 withDeadline:0];
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    id v31[2] = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke;
    v31[3] = &unk_2648887A8;
    objc_copyWeak(&v33, &location);
    id v32 = v13;
    id v20 = (void *)MEMORY[0x230F3FCD0](v31);
    requestDispatch = self->_requestDispatch;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_163;
    block[3] = &unk_2648887F8;
    objc_copyWeak(&v30, &location);
    id v27 = v16;
    id v28 = v12;
    id v29 = v20;
    id v22 = v20;
    id v23 = v16;
    dispatch_async(requestDispatch, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    id v24 = _CMSILogingFacility();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CMSCloudExtensionSession getQueueSegmentFromURL:referrer:networkActivity:completion:]();
    }

    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:1 userInfo:0];
    (*((void (**)(id, CMSCloudExtensionSession *, void, void *))v13 + 2))(v13, self, 0, v25);
  }
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 32))
    {
      id v12 = _CMSILogingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[CMSCloudExtensionSession getQueueSegmentFromURL:referrer:networkActivity:completion:]_block_invoke";
        _os_log_impl(&dword_22B0FF000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding response", buf, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:2 userInfo:0];

      id v7 = 0;
      id v9 = (id)v13;
    }
    id v14 = v8;
    if ([v14 statusCode] == 204)
    {
      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:15 userInfo:0];

      id v9 = (id)v15;
    }
    if (!v7 || v9)
    {
      if (!v9)
      {
        id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v18 = 0;
      uint64_t v16 = [v11 _parsedObjectFromData:v7 inResponse:v14 error:&v18];
      id v9 = v18;
      id v17 = cmsSafeDictionary(v16);

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_163(id *a1)
{
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = (void *)WeakRetained[18];
  id v5 = a1[4];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_2;
  id v10 = &unk_264888820;
  objc_copyWeak(&v14, v2);
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[6];
  uint64_t v6 = [v4 dataTaskWithRequest:v5 completionHandler:&v7];
  objc_msgSend(a1[5], "associateWithTask:", v6, v7, v8, v9, v10);
  [v6 resume];

  objc_destroyWeak(&v14);
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = [v9 statusCode];
  uint64_t v11 = v10;
  if (!v8 && (v10 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8
    || (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56)),
        char v13 = [WeakRetained _handleURLResponseCode:v11 error:v8 before:0 request:*(void *)(a1 + 32) networkActivity:*(void *)(a1 + 40) retryHandler:*(void *)(a1 + 48)], WeakRetained, (v13 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_performActivityUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CMSCloudExtensionConfiguration *)self->_config configForEndpoint:@"queues/updateActivity"];
  id v9 = _CMSILogingFacility();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[CMSCloudExtensionSession _performActivityUpdate:completion:]();
    }

    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected) {
      [(CMSCloudExtensionSession *)self _connectSession];
    }
    os_unfair_lock_unlock(&self->_requestQueueLock);
    uint64_t v11 = [(CMSCloudExtensionSession *)self _constraintsDefinition];
    [v6 setConstraints:v11];

    [v6 setSessionIdentifier:self->_sessionIdentifier];
    id v12 = [v6 cmsCoded];
    char v13 = v12;
    if (v12)
    {
      v43[0] = 0;
      id v14 = CreateDataWithSerializedJSON(v12, v43);
      id v15 = v43[0];
      if (v14)
      {
        double timeoutInterval = self->_timeoutInterval;
        if (timeoutInterval < 120.0) {
          double timeoutInterval = 120.0;
        }
        id v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:timeoutInterval];
        id v18 = [v8 request];
        id v19 = (void *)[v18 mutableCopy];

        [v19 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [v19 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [v19 setHTTPMethod:@"POST"];
        [v19 setHTTPBody:v14];
        [(CMSCloudExtensionSession *)self _updateDynamicHeadersOnRequest:v19 withDeadline:v17];
        objc_initWeak(&location, self);
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke;
        v39[3] = &unk_2648887A8;
        objc_copyWeak(&v41, &location);
        id v40 = v7;
        id v33 = v14;
        id v20 = (void *)MEMORY[0x230F3FCD0](v39);
        requestDispatch = self->_requestDispatch;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_167;
        block[3] = &unk_2648887F8;
        objc_copyWeak(&v38, &location);
        id v35 = v19;
        id v36 = v17;
        id v37 = v20;
        id v22 = v20;
        id v23 = v17;
        id v24 = v19;
        dispatch_async(requestDispatch, block);

        id v14 = v33;
        objc_destroyWeak(&v38);

        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);
      }
      else
      {
        (*((void (**)(id, CMSCloudExtensionSession *, void, void, id))v7 + 2))(v7, self, 0, 0, v15);
      }
    }
    else
    {
      id v25 = _CMSILogingFacility();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CMSCloudExtensionSession _performActivityUpdate:completion:](v25, v26, v27, v28, v29, v30, v31, v32);
      }

      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:12 userInfo:0];
      (*((void (**)(id, CMSCloudExtensionSession *, void, void, id))v7 + 2))(v7, self, 0, 0, v15);
    }
  }
  else
  {
    if (v10) {
      -[CMSCloudExtensionSession _performActivityUpdate:completion:]();
    }

    char v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:11 userInfo:0];
    (*((void (**)(id, CMSCloudExtensionSession *, void, void, void *))v7 + 2))(v7, self, 0, 0, v13);
  }
}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 32))
    {
      id v12 = _CMSILogingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[CMSCloudExtensionSession _performActivityUpdate:completion:]_block_invoke";
        _os_log_impl(&dword_22B0FF000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding queues/activityUpdate response", buf, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:2 userInfo:0];

      id v8 = 0;
      id v7 = 0;
      id v9 = (id)v13;
    }
    id v8 = v8;
    if ([v8 statusCode] != 204)
    {
      if (v7 && !v9)
      {
        id v18 = 0;
        id v14 = [v11 _parsedObjectFromData:v7 inResponse:v8 error:&v18];
        id v9 = v18;
        id v15 = cmsSafeDictionary(v14);

        uint64_t v16 = [v15 cmsOptionalDictionaryForKey:@"queue"];
        id v17 = [v15 cmsOptionalDictionaryForKey:@"userActivity"];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_13:
        goto LABEL_14;
      }
      if (!v9)
      {
        id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_13;
  }
LABEL_14:
}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_167(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v3 = (void *)WeakRetained[18];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_2;
  id v9 = &unk_2648887D0;
  BOOL v10 = WeakRetained;
  id v4 = a1[4];
  id v11 = a1[5];
  id v12 = a1[4];
  id v13 = a1[6];
  id v5 = [v3 dataTaskWithRequest:v4 completionHandler:&v6];
  objc_msgSend(v5, "resume", v6, v7, v8, v9, v10);
}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = [v9 statusCode];
  if (!v8 && (v10 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8
    || ([*(id *)(a1 + 32) _handleURLResponseCode:v10 error:v8 before:*(void *)(a1 + 40) request:*(void *)(a1 + 48) networkActivity:0 retryHandler:*(void *)(a1 + 56)] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)report:(unint64_t)a3 forActivity:(id)a4 nowPlaying:(id)a5 previous:(id)a6 timestamp:(id)a7 completion:(id)a8
{
  id v19 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [[CMSUpdateActivityRequest alloc] initForActivity:v17 report:a3 nowPlaying:v16 previouslyPlaying:v15];

  if (v19) {
    [v18 setTimestamp:v19];
  }
  [(CMSCloudExtensionSession *)self _performActivityUpdate:v18 completion:v14];
}

- (void)reportContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 timestamp:(id)a6 completion:(id)a7
{
  id v17 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[CMSUpdateActivityRequest alloc] initForActivity:v14 failure:v15 whilePlaying:v13];

  if (v17) {
    [v16 setTimestamp:v17];
  }
  [(CMSCloudExtensionSession *)self _performActivityUpdate:v16 completion:v12];
}

- (void)publishContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 previousContentURL:(id)a6 nextContentURL:(id)a7 networkActivity:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v42 = a8;
  id v20 = a9;
  uint64_t v21 = [(CMSCloudExtensionConfiguration *)self->_config configForEndpoint:@"queues/contentPlaybackFailure"];
  if (v21)
  {
    id v41 = v15;
    id v22 = [[CMSContentFailureRequest alloc] initWithContentFailure:v15 whilePlaying:v17 previousContentURL:v18 nextContentURL:v19 userActivityDictionary:v16];
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected) {
      [(CMSCloudExtensionSession *)self _connectSession];
    }
    os_unfair_lock_unlock(&self->_requestQueueLock);
    id v23 = [(CMSCloudExtensionSession *)self _constraintsDefinition];
    [(CMSContentFailureRequest *)v22 setConstraints:v23];

    [(CMSContentFailureRequest *)v22 setSessionIdentifier:self->_sessionIdentifier];
    id v24 = [(CMSContentFailureRequest *)v22 cmsCoded];
    id v25 = v24;
    if (v24)
    {
      id v40 = v19;
      id v51 = 0;
      uint64_t v26 = CreateDataWithSerializedJSON(v24, &v51);
      id v27 = v51;
      if (v26)
      {
        objc_initWeak(&location, self);
        id v39 = v16;
        requestDispatch = self->_requestDispatch;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke;
        block[3] = &unk_264888870;
        objc_copyWeak(&v49, &location);
        id v48 = v20;
        id v44 = v21;
        uint64_t v45 = self;
        id v46 = v26;
        id v47 = v42;
        uint64_t v29 = requestDispatch;
        id v16 = v39;
        dispatch_async(v29, block);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);
      }
      else if (v20)
      {
        (*((void (**)(id, CMSCloudExtensionSession *, void, id))v20 + 2))(v20, self, 0, v27);
      }

      id v19 = v40;
    }
    else
    {
      uint64_t v31 = _CMSILogingFacility();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CMSCloudExtensionSession publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:](v31, v32, v33, v34, v35, v36, v37, v38);
      }

      if (!v20) {
        goto LABEL_19;
      }
      id v27 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:13 userInfo:0];
      (*((void (**)(id, CMSCloudExtensionSession *, void, id))v20 + 2))(v20, self, 0, v27);
    }

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v30 = _CMSILogingFacility();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[CMSCloudExtensionSession publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:]();
  }

  if (v20)
  {
    id v41 = v15;
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:11 userInfo:0];
    (*((void (**)(id, CMSCloudExtensionSession *, void, CMSContentFailureRequest *))v20 + 2))(v20, self, 0, v22);
LABEL_20:

    id v15 = v41;
  }
}

void __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) request];
    id v4 = (void *)[v3 mutableCopy];

    [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [v4 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [*(id *)(a1 + 40) _updateDynamicHeadersOnRequest:v4 withDeadline:0];
    [v4 setHTTPMethod:@"POST"];
    [v4 setHTTPBody:*(void *)(a1 + 48)];
    id v5 = (void *)WeakRetained[18];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke_2;
    id v12 = &unk_264888848;
    id v6 = *(id *)(a1 + 64);
    id v13 = WeakRetained;
    id v14 = v6;
    id v7 = [v5 dataTaskWithRequest:v4 completionHandler:&v9];
    objc_msgSend(*(id *)(a1 + 56), "associateWithTask:", v7, v9, v10, v11, v12);
    [v7 resume];

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v4);
    goto LABEL_5;
  }
LABEL_6:
}

void __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 statusCode];
  if (v7 && !v9 && v10 == 200)
  {
    id v11 = *(void **)(a1 + 32);
    id v17 = 0;
    id v12 = [v11 _parsedObjectFromData:v7 inResponse:v8 error:&v17];
    id v13 = v17;
    id v14 = cmsSafeDictionary(v12);

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void, void *, id))(v15 + 16))(v15, *(void *)(a1 + 32), v14, v13);
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, *(void *)(a1 + 32), 0, v13);
    }
  }
}

- (void)getAlbumArtDataFromURL:(id)a3 networkActivity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void))v10;
  if (!v8)
  {
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 0;
LABEL_10:
    id v17 = [v15 errorWithDomain:@"com.apple.cloudextension.errors.session" code:v16 userInfo:0];
    ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v17);

    goto LABEL_11;
  }
  id v12 = _CMSILogingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CMSCloudExtensionSession getAlbumArtDataFromURL:networkActivity:completionHandler:]();
  }

  os_unfair_lock_lock(&self->_requestQueueLock);
  BOOL connected = self->_connected;
  os_unfair_lock_unlock(&self->_requestQueueLock);
  if (!connected)
  {
    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 2;
    goto LABEL_10;
  }
  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke;
  block[3] = &unk_264888898;
  objc_copyWeak(&v22, &location);
  uint64_t v21 = v11;
  id v19 = v8;
  id v20 = v9;
  dispatch_async(requestDispatch, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_11:
}

void __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [*((id *)WeakRetained + 1) configForEndpoint:@"queues/playMedia"];
    id v5 = [v4 request];
    id v6 = (void *)[v5 mutableCopy];

    [v6 setURL:*(void *)(a1 + 32)];
    [v6 setValue:@"image/png,image/jpeg" forHTTPHeaderField:@"Accept"];
    id v7 = (void *)v3[18];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke_2;
    v11[3] = &unk_264888050;
    id v12 = *(id *)(a1 + 48);
    id v8 = [v7 dataTaskWithRequest:v6 completionHandler:v11];
    [*(id *)(a1 + 40) associateWithTask:v8];
    [v8 resume];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
    }
  }
}

void __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if ([v9 statusCode] == 204)
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:15 userInfo:0];

    id v8 = (id)v10;
  }
  if (!v14 || v8)
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0, 0, v8);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v12 = [v9 valueForHTTPHeaderField:@"Content-type"];
      (*(void (**)(uint64_t, id, void *, void))(v11 + 16))(v11, v14, v12, 0);
    }
    id v8 = 0;
  }
}

- (double)durationForMethod:(id)a3
{
  p_requestQueueLock = &self->_requestQueueLock;
  id v5 = a3;
  os_unfair_lock_lock(p_requestQueueLock);
  id v6 = [(NSMutableDictionary *)self->_durations objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_requestQueueLock);
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)totalDuration
{
  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  double totalDuration = self->_totalDuration;
  os_unfair_lock_unlock(p_requestQueueLock);
  return totalDuration;
}

- (void)closeWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (self->_connected)
  {
    *(_WORD *)&self->_BOOL connected = 256;
    session = self->_session;
    if (v3) {
      [(NSURLSession *)session invalidateAndCancel];
    }
    else {
      [(NSURLSession *)session finishTasksAndInvalidate];
    }
  }
  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7 = a4;
  double v8 = (NSURLSession *)a3;
  os_unfair_lock_lock(&self->_requestQueueLock);
  session = self->_session;

  if (session == v8)
  {
    *(_WORD *)&self->_BOOL connected = 256;
    objc_storeStrong((id *)&self->_closeError, a4);
    requestDispatch = self->_requestDispatch;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CMSCloudExtensionSession_URLSession_didBecomeInvalidWithError___block_invoke;
    block[3] = &unk_2648888C0;
    void block[4] = self;
    dispatch_async(requestDispatch, block);
  }
  os_unfair_lock_unlock(&self->_requestQueueLock);
}

uint64_t __65__CMSCloudExtensionSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 168);
  *(void *)(v10 + 168) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    uint64_t v15 = *(uint64_t (**)(void))(result + 16);
    return v15();
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"\n{\n config: %@,\n sessionIdentifier: %@\n}", self->_config, self->_sessionIdentifier];
}

- (void)getFairplayCertificateUsingNetworkActivity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CMSILogingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CMSCloudExtensionSession getFairplayCertificateUsingNetworkActivity:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke;
  v19[3] = &unk_2648888E8;
  objc_copyWeak(&v22, &location);
  id v20 = v6;
  id v21 = v7;
  id v17 = v6;
  id v18 = v7;
  dispatch_async(requestDispatch, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [*((id *)WeakRetained + 1) configForEndpoint:@"queues/contentProtectionKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 fairPlayKeySystemCertificateUrl];

      if (v6)
      {
        id v7 = [v5 request];
        uint64_t v8 = (void *)[v7 mutableCopy];

        uint64_t v9 = [v5 fairPlayKeySystemCertificateUrl];
        [v8 setURL:v9];

        [v8 setHTTPMethod:@"GET"];
        uint64_t v10 = (void *)v3[18];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke_2;
        v15[3] = &unk_264888050;
        id v16 = a1[5];
        uint64_t v11 = [v10 dataTaskWithRequest:v8 completionHandler:v15];
        [a1[4] associateWithTask:v11];
        [v11 resume];
      }
      else
      {
        uint64_t v14 = (void (**)(id, void, void *))a1[5];
        uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:1 userInfo:0];
        v14[2](v14, 0, v8);
      }
    }
    else
    {
      uint64_t v12 = (void (**)(id, void, void *))a1[5];
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:1 userInfo:0];
      v12[2](v12, 0, v13);
    }
  }
}

void __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  uint64_t v8 = [a3 statusCode];
  if (v10 && !v7 && v8 == 200)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getContentProtectionKeyForAssetIdentifier:(id)a3 usingKeySystem:(id)a4 andKeyRequest:(id)a5 playerContext:(id)a6 userActivityDictionary:(id)a7 networkActivity:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = _CMSILogingFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[CMSCloudExtensionSession getContentProtectionKeyForAssetIdentifier:usingKeySystem:andKeyRequest:playerContext:userActivityDictionary:networkActivity:completionHandler:](v22, v23, v24, v25, v26, v27, v28, v29);
  }

  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke;
  block[3] = &unk_264888910;
  objc_copyWeak(&v46, &location);
  id v39 = v17;
  id v40 = v16;
  id v44 = v20;
  id v45 = v21;
  id v41 = v15;
  id v42 = v18;
  id v43 = v19;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  id v34 = v15;
  id v35 = v21;
  id v36 = v16;
  id v37 = v17;
  dispatch_async(requestDispatch, block);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

void __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [*((id *)WeakRetained + 1) configForEndpoint:@"queues/contentProtectionKey"];
    id v5 = [v4 request];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [*(id *)(a1 + 32) base64EncodedStringWithOptions:0];
    uint64_t v30 = *MEMORY[0x263EF97F8];
    v31[0] = @"ContentKeySystemFairPlayStreaming";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v9 = [v8 objectForKey:*(void *)(a1 + 40)];
    if (v9)
    {
      uint64_t v24 = v4;
      v28[0] = @"version";
      id v10 = CMSCloudExtensionSpecVersion();
      v29[0] = v10;
      v29[1] = v9;
      v28[1] = @"keySystem";
      v28[2] = @"assetIdentifier";
      v28[3] = @"keyRequest";
      v28[4] = @"context";
      uint64_t v11 = *(void **)(a1 + 56);
      v29[2] = *(void *)(a1 + 48);
      v29[3] = v7;
      uint64_t v23 = v7;
      uint64_t v12 = [v11 cmsCoded];
      v29[4] = v12;
      v28[5] = @"userActivity";
      uint64_t v13 = *(void **)(a1 + 64);
      uint64_t v14 = v13;
      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x263EFF9D0] null];
      }
      v29[5] = v14;
      id v15 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
      if (!v13) {

      }
      id v27 = 0;
      id v16 = CreateDataWithSerializedJSON(v15, &v27);
      id v17 = v27;
      if (v16)
      {
        [v6 setHTTPMethod:@"POST"];
        [v6 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [v6 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [v6 setHTTPBody:v16];
        id v18 = (void *)v3[18];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke_2;
        v25[3] = &unk_264888848;
        id v19 = *(id *)(a1 + 80);
        void v25[4] = v3;
        id v26 = v19;
        id v20 = [v18 dataTaskWithRequest:v6 completionHandler:v25];
        [*(id *)(a1 + 72) associateWithTask:v20];
        [v20 resume];
      }
      else
      {
        uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:13 userInfo:0];

        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
        id v17 = (id)v22;
      }
      uint64_t v4 = v24;

      id v7 = v23;
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 80);
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:13 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v21 + 16))(v21, 0, 0, v15);
    }
  }
}

void __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 statusCode];
  if (v7 && !v9 && v10 == 200)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v19 = 0;
    uint64_t v12 = [v11 _parsedObjectFromData:v7 inResponse:v8 error:&v19];
    id v13 = v19;
    uint64_t v14 = cmsSafeDictionary(v12);

    id v15 = [v14 cmsOptionalStringForKey:@"keyResponse"];
    id v16 = [v14 cmsOptionalNumberForKey:@"leaseRenewalDeadline"];
    if (v15 && [v15 length])
    {
      id v17 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v13 = (id)v18;
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:4 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (CMSCloudExtensionConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)authHeader
{
  return self->_authHeader;
}

- (void)setAuthHeader:(id)a3
{
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_double timeoutInterval = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (BOOL)updateUserTasteProfile
{
  return self->_updateUserTasteProfile;
}

- (void)setUpdateUserTasteProfile:(BOOL)a3
{
  self->_updateUserTasteProfile = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (BOOL)shuffledPlayback
{
  return self->_shuffledPlayback;
}

- (void)setShuffledPlayback:(BOOL)a3
{
  self->_shuffledPlayback = a3;
}

- (CMSPlayerContext)intentPlayerContext
{
  return self->_intentPlayerContext;
}

- (void)setIntentPlayerContext:(id)a3
{
}

- (id)prepareRequestHook
{
  return self->_prepareRequestHook;
}

- (void)setPrepareRequestHook:(id)a3
{
  self->_prepareRequestHook = a3;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (NSString)requesterHomeUserID
{
  return self->_requesterHomeUserID;
}

- (void)setRequesterHomeUserID:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSMutableDictionary)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (NSMutableDictionary)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableDictionary)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
}

- (void)setTotalDuration:(double)a3
{
  self->_double totalDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_requesterHomeUserID, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_intentPlayerContext, 0);
  objc_storeStrong((id *)&self->_authHeader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong(&self->_closeCompletion, 0);
  objc_destroyWeak((id *)&self->_authProvider);
  objc_storeStrong((id *)&self->_closeError, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_requestDispatch, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setQosClass:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  BOOL v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22B0FF000, a2, OS_LOG_TYPE_ERROR, "%@: already connected, can't change qosClass", v4, 0xCu);
}

- (void)_retryRequest:(uint64_t)a3 before:(uint64_t)a4 networkActivity:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_retryRequestAfterAuthTokenRenewal:(uint64_t)a3 parentNetworkActivity:(uint64_t)a4 before:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_4();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_22B0FF000, v2, OS_LOG_TYPE_ERROR, "%s: session %@ retrieved no new authorization, error %@", (uint8_t *)v3, 0x20u);
}

- (void)_handleURLResponseCode:error:before:request:networkActivity:retryHandler:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22B0FF000, v0, v1, "%s: not retrying request, no retry handler provided. statusCode: %d error:%@", v2);
}

- (void)_handleURLResponseCode:(os_log_t)log error:before:request:networkActivity:retryHandler:.cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
  __int16 v3 = 1024;
  int v4 = 4;
  _os_log_error_impl(&dword_22B0FF000, log, OS_LOG_TYPE_ERROR, "%s: Maximum retry count reached: %d", (uint8_t *)&v1, 0x12u);
}

- (void)_handleURLResponseCode:error:before:request:networkActivity:retryHandler:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22B0FF000, v0, v1, "%s: not retrying request. statusCode: %d error:%@", v2);
}

- (void)_handleURLResponse:before:networkActivity:request:data:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Unrecoverable error performing request: %@", v2, v3, v4, v5, v6);
}

- (void)_handleURLResponse:before:networkActivity:request:data:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_22B0FF000, v1, OS_LOG_TYPE_DEBUG, "methodResponses: %@ error: %@", v2, 0x16u);
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22B0FF000, v0, v1, "Scheduling completion for %@", v2, v3, v4, v5, v6);
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Result returned for %@ overriding preceeding result", v2, v3, v4, v5, v6);
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performMethod:(uint64_t)a3 withParams:(uint64_t)a4 networkActivity:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22B0FF000, v0, v1, "requestQueue: %@", v2, v3, v4, v5, v6);
}

- (void)requestQueueForActivity:networkActivity:completion:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_22B0FF000, v0, v1, "%s no support in configuration for endpoint %{public}@", v2, v3, v4, v5, 2u);
}

- (void)getQueueSegmentFromURL:referrer:networkActivity:completion:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_22B0FF000, v0, v1, "%s no support in configuration for endpoint %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_performActivityUpdate:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_22B0FF000, v0, v1, "%s optional endpoint %{public}@ not supported by service", v2, v3, v4, v5, 2u);
}

- (void)_performActivityUpdate:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_performActivityUpdate:completion:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_22B0FF000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_22B0FF000, v0, v1, "%s optional endpoint %{public}@ not supported by service", v2, v3, v4, v5, 2u);
}

- (void)publishContentFailure:(uint64_t)a3 forActivity:(uint64_t)a4 whilePlaying:(uint64_t)a5 previousContentURL:(uint64_t)a6 nextContentURL:(uint64_t)a7 networkActivity:(uint64_t)a8 completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getAlbumArtDataFromURL:networkActivity:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_22B0FF000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)getFairplayCertificateUsingNetworkActivity:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getContentProtectionKeyForAssetIdentifier:(uint64_t)a3 usingKeySystem:(uint64_t)a4 andKeyRequest:(uint64_t)a5 playerContext:(uint64_t)a6 userActivityDictionary:(uint64_t)a7 networkActivity:(uint64_t)a8 completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end