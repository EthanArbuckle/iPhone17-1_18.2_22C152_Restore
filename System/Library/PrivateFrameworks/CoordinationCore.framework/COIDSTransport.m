@interface COIDSTransport
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimerEnabled;
- (BOOL)supportsLeaderElection;
- (COConstituent)remote;
- (CODiscoveryRecordProtocol)record;
- (COExecutionContext)executionContext;
- (COIDSServiceDirector)director;
- (COIDSTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4;
- (COTransportDelegate)delegate;
- (NSMutableDictionary)acceptableResponses;
- (NSMutableDictionary)outstandingRequests;
- (NSMutableSet)registeredCommands;
- (NSString)description;
- (OS_dispatch_source)timer;
- (OS_nw_activity)activity;
- (double)requestTimeout;
- (id)acceptableResponsesForRequest:(Class)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (void)_configureTimer;
- (void)_handleErrorFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5;
- (void)_handleRequestFromMessage:(id)a3 incomingRequestIdentifier:(id)a4 from:(id)a5;
- (void)_handleResponseFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5;
- (void)_timerFired;
- (void)_timerRequestAdded:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)deregisterRequestForClass:(Class)a3;
- (void)handleMessage:(id)a3 requestIdentifier:(id)a4 responseIdentifier:(id)a5 from:(id)a6;
- (void)invalidateWithError:(id)a3;
- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4;
- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4;
- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setAcceptableResponses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setRegisteredCommands:(id)a3;
- (void)setRemote:(id)a3;
- (void)setRequestTimeout:(double)a3;
- (void)setTimerEnabled:(BOOL)a3;
@end

@implementation COIDSTransport

- (COIDSTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25.receiver = self;
    v25.super_class = (Class)COIDSTransport;
    v9 = [(COIDSTransport *)&v25 init];
    if (v9)
    {
      v10 = [v8 networkActivityFactory];
      uint64_t v11 = [v10 activityWithLabel:1 parentActivity:0];
      activity = v9->_activity;
      v9->_activity = (OS_nw_activity *)v11;

      objc_storeStrong((id *)&v9->_record, a3);
      uint64_t v13 = [v7 serviceDirector];
      director = v9->_director;
      v9->_director = (COIDSServiceDirector *)v13;

      objc_storeStrong((id *)&v9->_executionContext, a4);
      uint64_t v15 = [MEMORY[0x263EFF9C0] set];
      registeredCommands = v9->_registeredCommands;
      v9->_registeredCommands = (NSMutableSet *)v15;

      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      acceptableResponses = v9->_acceptableResponses;
      v9->_acceptableResponses = (NSMutableDictionary *)v17;

      uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
      outstandingRequests = v9->_outstandingRequests;
      v9->_outstandingRequests = (NSMutableDictionary *)v19;

      v9->_requestTimeout = 180.0;
      dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
      timer = v9->_timer;
      v9->_timer = (OS_dispatch_source *)v21;

      [(COIDSTransport *)v9 _configureTimer];
    }
    self = v9;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  v3 = [(COIDSTransport *)self record];
  v4 = [v3 IDSIdentifier];

  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"<%@: %p, ids = %@>", v7, self, v4];

  return (NSString *)v8;
}

- (id)shortDescription
{
  v3 = [(COIDSTransport *)self record];
  v4 = [v3 IDSIdentifier];

  v5 = NSString;
  v6 = [(COIDSTransport *)self executionContext];
  id v7 = [v6 meshControllerDescription];
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v10 = v4;
  uint64_t v11 = [v5 stringWithFormat:@"[m:%@] <%@: %p, ids = %.8s>", v7, v9, self, objc_msgSend(v10, "UTF8String")];

  return v11;
}

- (BOOL)supportsLeaderElection
{
  return 0;
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v13 = (void (**)(id, void))a3;
  v4 = [(COIDSTransport *)self activity];

  if (v4)
  {
    v5 = [(COIDSTransport *)self activity];
    nw_activity_activate();
  }
  v13[2](v13, 0);
  v6 = [(COIDSTransport *)self record];
  id v7 = [v6 onDemandRequest];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 message];
    id v10 = [v8 requestIdentifier];
    uint64_t v11 = [v8 responseIdentifier];
    v12 = [v8 fromURIToken];
    [(COIDSTransport *)self handleMessage:v9 requestIdentifier:v10 responseIdentifier:v11 from:v12];
  }
}

- (unint64_t)hash
{
  v2 = [(COIDSTransport *)self record];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)invalidateWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(COIDSTransport *)self shortDescription];
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidated", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [(COIDSTransport *)self activity];
  if (v7 && nw_activity_is_activated())
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      uint64_t v9 = mach_continuous_time();
      uint64_t activation_time = nw_activity_get_activation_time();
      xpc_dictionary_set_uint64(v8, "lifetime", v9 - activation_time);
      xpc_dictionary_set_uint64(v8, "transport_type", 2uLL);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  uint64_t v11 = [(COIDSTransport *)self outstandingRequests];
  [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_11];

  v12 = [(COIDSTransport *)self outstandingRequests];
  [v12 removeAllObjects];

  uint64_t v13 = [(COIDSTransport *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 transport:self didInvalidateWithError:v4];
  }
}

void __38__COIDSTransport_invalidateWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = (void *)MEMORY[0x263F087E8];
  id v4 = a3;
  id v7 = [v3 errorWithDomain:0x26D3D5E28 code:-4100 userInfo:0];
  v5 = [v4 request];
  v6 = [v4 callback];

  ((void (**)(void, void *, void, id))v6)[2](v6, v5, 0, v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(COIDSTransport *)self record];
    id v7 = [v5 record];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4
{
}

- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = NSStringFromClass(a3);
  char v8 = [(COIDSTransport *)self registeredCommands];
  [v8 addObject:v7];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(objc_class *)a3 acceptableResponses];
    id v10 = [MEMORY[0x263EFF9C0] set];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__COIDSTransport_registerRequestForClass_withCompletion___block_invoke;
    v13[3] = &unk_2645CE650;
    id v14 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:v13];
    v12 = [(COIDSTransport *)self acceptableResponses];
    [v12 setObject:v11 forKey:v7];
  }
  v6[2](v6);
}

void __57__COIDSTransport_registerRequestForClass_withCompletion___block_invoke(uint64_t a1, Class aClass)
{
  v2 = *(void **)(a1 + 32);
  NSStringFromClass(aClass);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)deregisterRequestForClass:(Class)a3
{
  NSStringFromClass(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(COIDSTransport *)self registeredCommands];
  [v4 removeObject:v6];

  id v5 = [(COIDSTransport *)self acceptableResponses];
  [v5 removeObjectForKey:v6];
}

- (id)acceptableResponsesForRequest:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [(COIDSTransport *)self acceptableResponses];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }

  return v6;
}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v5 = [(COIDSTransport *)self executionContext];
  [v5 assertDispatchQueue];

  v6[2](v6, 0);
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id, void, uint64_t))a4;
  char v8 = [(COIDSTransport *)self executionContext];
  [v8 assertDispatchQueue];

  uint64_t v9 = [(COIDSTransport *)self director];
  id v10 = [v9 messageFactory];
  id v11 = [v10 encodeRequest:v6 withIDSIdentifier:!self->_resolvedIDSIdentifier];

  v12 = [v6 activity];
  uint64_t v13 = [(COIDSTransport *)self executionContext];
  id v14 = [v13 networkActivityFactory];
  uint64_t v15 = [v14 activityWithLabel:2 parentActivity:v12];

  if (v15) {
    nw_activity_activate();
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__26;
  v46 = __Block_byref_object_dispose__26;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__26;
  v40 = __Block_byref_object_dispose__26;
  id v41 = 0;
  uint64_t v16 = [(COIDSTransport *)self director];
  uint64_t v17 = [v11 dictionaryRepresentation];
  v18 = [(COIDSTransport *)self record];
  uint64_t v19 = [v18 deviceTokenURI];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __50__COIDSTransport_sendRequest_withResponseHandler___block_invoke;
  v35[3] = &unk_2645CE678;
  v35[4] = &v36;
  v35[5] = &v42;
  [v16 sendMessage:v17 toDestination:v19 completionHandler:v35];

  if (v43[5]) {
    goto LABEL_4;
  }
  if (!v37[5])
  {
    uint64_t v31 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
    v32 = (void *)v43[5];
    v43[5] = v31;

LABEL_4:
    if (v15)
    {
      xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
      dispatch_source_t v21 = v20;
      if (v20)
      {
        xpc_dictionary_set_uint64(v20, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();
    }
    v7[2](v7, v6, 0, v43[5]);
    goto LABEL_17;
  }
  v22 = [[COIDSOutstandingRequestInfo alloc] initWithRequest:v6 at:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) callback:v7 activity:v15];
  v23 = [(COIDSTransport *)self outstandingRequests];
  [v23 setObject:v22 forKey:v37[5]];

  [(COIDSTransport *)self _timerRequestAdded:v22];
  if (!self->_resolvedIDSIdentifier)
  {
    self->_resolvedIDSIdentifier = 1;
    v24 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = [(COIDSTransport *)self shortDescription];
      v33 = [(COIDSTransport *)self director];
      objc_super v25 = [v33 messageFactory];
      v26 = [v25 idsIdentifier];
      uint64_t v27 = v37[5];
      *(_DWORD *)buf = 138543874;
      id v49 = v34;
      __int16 v50 = 2114;
      id v51 = v26;
      __int16 v52 = 2114;
      uint64_t v53 = v27;
      _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ advertised IDS identifier %{public}@ via message %{public}@", buf, 0x20u);
    }
  }
  v28 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(COIDSTransport *)self shortDescription];
    uint64_t v30 = v37[5];
    *(_DWORD *)buf = 138543874;
    id v49 = v29;
    __int16 v50 = 2114;
    id v51 = v6;
    __int16 v52 = 2114;
    uint64_t v53 = v30;
    _os_log_impl(&dword_2217C1000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ sent request %{public}@ via message %{public}@", buf, 0x20u);
  }
LABEL_17:
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

void __50__COIDSTransport_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)handleMessage:(id)a3 requestIdentifier:(id)a4 responseIdentifier:(id)a5 from:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(COIDSTransport *)self executionContext];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__COIDSTransport_handleMessage_requestIdentifier_responseIdentifier_from___block_invoke;
  v19[3] = &unk_2645CB038;
  id v20 = v10;
  dispatch_source_t v21 = self;
  id v22 = v11;
  id v23 = v13;
  id v24 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  [v14 dispatchAsync:v19];
}

void __74__COIDSTransport_handleMessage_requestIdentifier_responseIdentifier_from___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) type];
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 8))
  {
    id v3 = [*(id *)(a1 + 32) metadata];
    id v4 = [v3 objectForKey:0x26D3D6C68];
    *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
    id v5 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) shortDescription];
      uint64_t v7 = *(void *)(a1 + 48);
      int v12 = 138543874;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received IDS identifier %{public}@ from message %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  switch(v2)
  {
    case 2:
      [*(id *)(a1 + 40) _handleErrorFromMessage:*(void *)(a1 + 32) incomingResponseIdentifier:*(void *)(a1 + 64) from:*(void *)(a1 + 56)];
      break;
    case 1:
      char v8 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 40) shortDescription];
        id v10 = *(void **)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 64);
        int v12 = 138543874;
        id v13 = v9;
        __int16 v14 = 2114;
        id v15 = v10;
        __int16 v16 = 2114;
        uint64_t v17 = v11;
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ received response %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);
      }
      [*(id *)(a1 + 40) _handleResponseFromMessage:*(void *)(a1 + 32) incomingResponseIdentifier:*(void *)(a1 + 64) from:*(void *)(a1 + 56)];
      break;
    case 0:
      [*(id *)(a1 + 40) _handleRequestFromMessage:*(void *)(a1 + 32) incomingRequestIdentifier:*(void *)(a1 + 48) from:*(void *)(a1 + 56)];
      break;
  }
}

- (void)_configureTimer
{
  id v3 = [(COIDSTransport *)self timer];
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  [(COIDSTransport *)self setTimerEnabled:0];
  objc_initWeak(&location, self);
  id v4 = [(COIDSTransport *)self timer];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  char v8 = __33__COIDSTransport__configureTimer__block_invoke;
  uint64_t v9 = &unk_2645CB2E0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  id v5 = [(COIDSTransport *)self timer];
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__COIDSTransport__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _timerFired];
    id WeakRetained = v2;
  }
}

- (void)_timerFired
{
  id v3 = [(COIDSTransport *)self executionContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__COIDSTransport__timerFired__block_invoke;
  v4[3] = &unk_2645CB288;
  v4[4] = self;
  [v3 dispatchAsync:v4];
}

void __29__COIDSTransport__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 outstandingRequests];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v4 count];
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fired. Outstanding requests = %lu", buf, 0x16u);
  }
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  char v8 = *(void **)(a1 + 32);
  uint64_t v7 = (id *)(a1 + 32);
  uint64_t v9 = [v8 outstandingRequests];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __29__COIDSTransport__timerFired__block_invoke_35;
  v33[3] = &unk_2645CE6A0;
  id v10 = *v7;
  __uint64_t v35 = v5;
  v33[4] = v10;
  id v11 = v6;
  id v34 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v33];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v17 = [*v7 outstandingRequests];
        [v17 removeObjectForKey:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [*v7 outstandingRequests];
  BOOL v19 = [v18 count] == 0;

  if (v19)
  {
    [*v7 setTimerEnabled:0];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v37 = 0;
    id v20 = [*v7 outstandingRequests];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __29__COIDSTransport__timerFired__block_invoke_2;
    v28[3] = &unk_2645CE6C8;
    v28[4] = buf;
    [v20 enumerateKeysAndObjectsUsingBlock:v28];

    uint64_t v21 = *(void *)(*(void *)&buf[8] + 24);
    [*v7 requestTimeout];
    double v23 = v22;
    id v24 = COCoreLogForCategory(17);
    uint64_t v25 = (uint64_t)-((double)(uint64_t)(v5 - v21) - v23 * 1000000000.0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __29__COIDSTransport__timerFired__block_invoke_cold_1((uint64_t *)v7, v25, v24);
    }

    v26 = [*v7 timer];
    dispatch_time_t v27 = dispatch_time(0, v25);
    dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    _Block_object_dispose(buf, 8);
  }
}

void __29__COIDSTransport__timerFired__block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  double v6 = (double)(unint64_t)(*(void *)(a1 + 48) - [v5 enqeueStart]);
  [*(id *)(a1 + 32) requestTimeout];
  if (v7 * 1000000000.0 <= v6)
  {
    char v8 = [v5 activity];
    if (v8)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      id v10 = v9;
      if (v9)
      {
        xpc_dictionary_set_uint64(v9, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();
    }
    [*(id *)(a1 + 40) addObject:v14];
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4003 userInfo:0];
    id v12 = [v5 callback];
    uint64_t v13 = [v5 request];
    ((void (**)(void, void *, void, void *))v12)[2](v12, v13, 0, v11);
  }
}

unint64_t __29__COIDSTransport__timerFired__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result = [a3 enqeueStart];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v5 + 24) - 1 >= result) {
    *(void *)(v5 + 24) = result;
  }
  return result;
}

- (void)_timerRequestAdded:(id)a3
{
  if (![(COIDSTransport *)self isTimerEnabled])
  {
    id v4 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[COIDSTransport _timerRequestAdded:]((uint64_t)self, v4);
    }

    [(COIDSTransport *)self setTimerEnabled:1];
    [(COIDSTransport *)self requestTimeout];
    int64_t v6 = (uint64_t)(v5 * 1000000000.0);
    double v7 = [(COIDSTransport *)self timer];
    dispatch_time_t v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)_handleResponseFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  id v10 = [(COIDSTransport *)self outstandingRequests];
  id v11 = [v10 objectForKey:v8];

  double v12 = (double)(v9 - [v11 enqeueStart]) / 1000000000.0;
  uint64_t v13 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(COIDSTransport *)self shortDescription];
    *(_DWORD *)buf = 138543874;
    long long v29 = v14;
    __int16 v30 = 2114;
    id v31 = v8;
    __int16 v32 = 2048;
    double v33 = v12;
    _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ message %{public}@ round trip time: %lfs", buf, 0x20u);
  }
  id v15 = [(COIDSTransport *)self outstandingRequests];
  [v15 removeObjectForKey:v8];

  uint64_t v16 = [v11 callback];
  if (v16)
  {
    uint64_t v17 = [v7 payload];

    if (v17)
    {
      uint64_t v18 = [v11 request];
      BOOL v19 = [(COIDSTransport *)self acceptableResponsesForRequest:objc_opt_class()];
      id v27 = 0;
      uint64_t v17 = [v7 unarchivePayloadOfTypes:v19 error:&v27];
      id v20 = v27;
      uint64_t v21 = 0;
      if (!v17)
      {
        double v22 = COCoreLogForCategory(17);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[COIDSTransport _handleResponseFromMessage:incomingResponseIdentifier:from:](self);
        }

        uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    double v23 = [v11 activity];
    if (v23)
    {
      xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
      uint64_t v25 = v24;
      if (v24)
      {
        xpc_dictionary_set_uint64(v24, "transport_type", 2uLL);
        xpc_dictionary_set_double(v25, "rtt", v12);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();
    }
    v26 = [v11 request];
    ((void (**)(void, void *, void *, NSObject *))v16)[2](v16, v26, v17, v21);
  }
  else
  {
    uint64_t v21 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[COIDSTransport _handleResponseFromMessage:incomingResponseIdentifier:from:]();
    }
  }
}

- (void)_handleErrorFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  __uint64_t v9 = [(COIDSTransport *)self outstandingRequests];
  id v10 = [v9 objectForKey:v8];

  id v11 = [v10 callback];
  if (v11)
  {
    double v12 = [v10 activity];
    if (v12)
    {
      xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
      id v14 = v13;
      if (v13)
      {
        xpc_dictionary_set_uint64(v13, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();
    }
    id v15 = [v10 request];
    uint64_t v16 = [v7 error];
    ((void (**)(void, void *, void, void *))v11)[2](v11, v15, 0, v16);

    uint64_t v17 = [(COIDSTransport *)self outstandingRequests];
    [v17 removeObjectForKey:v8];
  }
  else
  {
    double v12 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[COIDSTransport _handleErrorFromMessage:incomingResponseIdentifier:from:]();
    }
  }
}

- (void)_handleRequestFromMessage:(id)a3 incomingRequestIdentifier:(id)a4 from:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COIDSTransport *)self registeredCommands];
  id v27 = 0;
  double v12 = [v8 unarchivePayloadOfTypes:v11 error:&v27];
  id v13 = v27;

  id v14 = COCoreLogForCategory(17);
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(COIDSTransport *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      long long v29 = v16;
      __int16 v30 = 2114;
      id v31 = v12;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ received request %{public}@ via message %{public}@", buf, 0x20u);
    }
    uint64_t v17 = [(COIDSTransport *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __75__COIDSTransport__handleRequestFromMessage_incomingRequestIdentifier_from___block_invoke;
      v23[3] = &unk_2645CE6F0;
      objc_copyWeak(&v26, (id *)buf);
      v23[4] = self;
      id v24 = v9;
      id v25 = v10;
      [v17 transport:self didReceiveRequest:v12 callback:v23];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[COIDSTransport _handleRequestFromMessage:incomingRequestIdentifier:from:](self);
    }

    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
    uint64_t v18 = [(COIDSTransport *)self director];
    BOOL v19 = [v18 messageFactory];
    id v20 = [v19 encodeError:v17];

    uint64_t v21 = [(COIDSTransport *)self director];
    double v22 = [v20 dictionaryRepresentation];
    [v21 sendResponse:v22 responseIdentifier:v9 toDestination:v10];
  }
}

void __75__COIDSTransport__handleRequestFromMessage_incomingRequestIdentifier_from___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained director];
    id v9 = [v8 messageFactory];
    id v10 = v9;
    if (v5) {
      [v9 encodeError:v5];
    }
    else {
    id v11 = [v9 encodeResponse:v14];
    }

    double v12 = [*(id *)(a1 + 32) director];
    id v13 = [v11 dictionaryRepresentation];
    [v12 sendResponse:v13 responseIdentifier:*(void *)(a1 + 40) toDestination:*(void *)(a1 + 48)];
  }
}

- (COTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COConstituent)remote
{
  return self->_remote;
}

- (void)setRemote:(id)a3
{
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CODiscoveryRecordProtocol)record
{
  return self->_record;
}

- (COIDSServiceDirector)director
{
  return self->_director;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
}

- (NSMutableSet)registeredCommands
{
  return self->_registeredCommands;
}

- (void)setRegisteredCommands:(id)a3
{
}

- (NSMutableDictionary)acceptableResponses
{
  return self->_acceptableResponses;
}

- (void)setAcceptableResponses:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_acceptableResponses, 0);
  objc_storeStrong((id *)&self->_registeredCommands, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_director, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __29__COIDSTransport__timerFired__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%{public}@ timer reconfiguring to %llu", (uint8_t *)&v4, 0x16u);
}

- (void)_timerRequestAdded:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ enabling timer for default duration", (uint8_t *)&v2, 0xCu);
}

- (void)_handleResponseFromMessage:incomingResponseIdentifier:from:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ No response callback for a response with identifier %{public}@");
}

- (void)_handleResponseFromMessage:(void *)a1 incomingResponseIdentifier:from:.cold.2(void *a1)
{
  os_log_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ error decoding response: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_handleErrorFromMessage:incomingResponseIdentifier:from:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ No response callback for a response with identifier %@");
}

- (void)_handleRequestFromMessage:(void *)a1 incomingRequestIdentifier:from:.cold.1(void *a1)
{
  os_log_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_10_0(&dword_2217C1000, v2, v3, "%{public}@ error decoding request: %@", v4, v5, v6, v7, v8);
}

@end