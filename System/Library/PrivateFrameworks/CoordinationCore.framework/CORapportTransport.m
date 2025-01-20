@interface CORapportTransport
+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4;
- (BOOL)_validateSource:(id)a3 options:(id)a4;
- (BOOL)isActivated;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLeaderElection;
- (COCompanionLinkClientProtocol)client;
- (COConstituent)remote;
- (CODiscoveryRecordProtocol)record;
- (COExecutionContext)executionContext;
- (CORapportTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4;
- (COTransportDelegate)delegate;
- (NSError)error;
- (NSMapTable)sinks;
- (NSMutableDictionary)commands;
- (NSMutableDictionary)counters;
- (NSMutableDictionary)registrationCompletions;
- (NSString)description;
- (OS_nw_activity)activity;
- (double)averageRequestTime;
- (double)currentPingTimeout;
- (double)maximumPingInterval;
- (double)minimumPingInterval;
- (id)_eventIDForClass:(Class)a3;
- (id)_serializedDataForCommand:(id)a3;
- (id)activationHandler;
- (id)clientIsUsingOnDemandConnection;
- (id)shortDescription;
- (int)listeningPort;
- (unint64_t)hash;
- (unint64_t)requestCount;
- (void)_commandForIdentifier:(id)a3 fromData:(id)a4 result:(id)a5;
- (void)_commandPayloadFromRapportRepresentationWithValidation:(id)a3 result:(id)a4;
- (void)_handleDisconnect;
- (void)_handleOnDemanNodeCreationRequest;
- (void)_handleRPErrorFlagsUpdate;
- (void)_handleRPIsUsingOnDemandConnection;
- (void)_handleRPStateUpdate;
- (void)_registerHandlersOnClient;
- (void)_setUpRegistrationCompletionHandlers;
- (void)_updateRequestTimesFromRapportRepresentation:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- (void)activateWithCompletion:(id)a3;
- (void)deregisterCommandForClass:(Class)a3;
- (void)deregisterRequestForClass:(Class)a3;
- (void)handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5;
- (void)handleRequestFromUnknownNodeWithIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7;
- (void)handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7;
- (void)handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseHandler:(id)a7 at:(unint64_t)a8;
- (void)invalidateWithError:(id)a3;
- (void)pingWithCallback:(id)a3;
- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4;
- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4;
- (void)removeAsSink:(id)a3;
- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setActivationHandler:(id)a3;
- (void)setAsSink:(id)a3;
- (void)setAverageRequestTime:(double)a3;
- (void)setClient:(id)a3;
- (void)setClientIsUsingOnDemandConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumPingInterval:(double)a3;
- (void)setMinimumPingInterval:(double)a3;
- (void)setRecord:(id)a3;
- (void)setRemote:(id)a3;
- (void)setRequestCount:(unint64_t)a3;
- (void)sourceHasBeenActivated;
@end

@implementation CORapportTransport

- (CORapportTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CORapportTransport;
  v9 = [(CORapportTransport *)&v29 init];
  if (v9)
  {
    v10 = [v8 networkActivityFactory];
    uint64_t v11 = [v10 activityWithLabel:1 parentActivity:0];
    activity = v9->_activity;
    v9->_activity = (OS_nw_activity *)v11;

    uint64_t v13 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    sinks = v9->_sinks;
    v9->_sinks = (NSMapTable *)v13;

    objc_storeStrong((id *)&v9->_record, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v8 constituentForMe];
      remote = v9->_remote;
      v9->_remote = (COConstituent *)v15;
    }
    if ([v7 conformsToProtocol:&unk_26D3EFB70])
    {
      v17 = [v7 companionLinkProvider];
      uint64_t v18 = v17[2]();
      client = v9->_client;
      v9->_client = (COCompanionLinkClientProtocol *)v18;
    }
    objc_storeStrong((id *)&v9->_executionContext, a4);
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    counters = v9->_counters;
    v9->_counters = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    commands = v9->_commands;
    v9->_commands = (NSMutableDictionary *)v22;

    v24 = [v8 objectForKey:0x26D3D7628];
    v9->_minimumPingInterval = (double)[v24 integerValue];

    v25 = [v8 objectForKey:0x26D3D7648];
    v9->_maximumPingInterval = (double)[v25 integerValue];

    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    registrationCompletions = v9->_registrationCompletions;
    v9->_registrationCompletions = (NSMutableDictionary *)v26;

    [(CORapportTransport *)v9 _registerHandlersOnClient];
    [(CORapportTransport *)v9 _setUpRegistrationCompletionHandlers];
  }

  return v9;
}

- (NSString)description
{
  v3 = [(CORapportTransport *)self executionContext];
  v4 = [v3 constituentForMe];

  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [(CORapportTransport *)self remote];
  v9 = [v5 stringWithFormat:@"<%@: %p, %@ -> %@>", v7, self, v4, v8];

  return (NSString *)v9;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(CORapportTransport *)self executionContext];
  v5 = [v4 meshControllerDescription];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v3 stringWithFormat:@"[m:%@] <%@: %p>", v5, v7, self];

  return v8;
}

- (int)listeningPort
{
  v2 = [(COCompanionLinkClientProtocol *)self->_client localDevice];
  int v3 = [v2 listeningPort];

  return v3;
}

- (void)setRecord:(id)a3
{
}

- (void)setAsSink:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CORapportTransport *)self shortDescription];
    int v13 = 138543618;
    v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setting sink for transport %@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(CORapportTransport *)self executionContext];
    [v9 assertDispatchQueue];

    v10 = [v4 record];
    uint64_t v11 = [v10 IDSIdentifier];

    v12 = [(CORapportTransport *)self sinks];
    [v12 setObject:v4 forKey:v11];
  }
}

- (void)removeAsSink:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CORapportTransport *)self shortDescription];
    int v13 = 138543618;
    v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing sink for transport %@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(CORapportTransport *)self executionContext];
    [v9 assertDispatchQueue];

    v10 = [v4 record];
    uint64_t v11 = [v10 IDSIdentifier];

    v12 = [(CORapportTransport *)self sinks];
    [v12 removeObjectForKey:v11];
  }
}

- (BOOL)supportsLeaderElection
{
  v2 = [(CORapportTransport *)self executionContext];
  char v3 = [v2 leaderElectionConfigured];

  return v3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)sourceHasBeenActivated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v8 = [(CORapportTransport *)self record];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL activated = self->_activated;

    if (!activated)
    {
      id v4 = [(CORapportTransport *)self activationHandler];

      if (v4)
      {
        v5 = COCoreLogForCategory(17);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = [(CORapportTransport *)self shortDescription];
          *(_DWORD *)buf = 138543362;
          v10 = v6;
          _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ completing deferred activation", buf, 0xCu);
        }
        id v7 = [(CORapportTransport *)self activationHandler];
        [(CORapportTransport *)self activateWithCompletion:v7];
        [(CORapportTransport *)self setActivationHandler:0];
      }
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  v5 = [(CORapportTransport *)self executionContext];
  [v5 assertDispatchQueue];

  if (self->_activated)
  {
    v6 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CORapportTransport *)self shortDescription];
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Rapport Transport is already active", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(CORapportTransport *)self record];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      self->_BOOL activated = 1;
      v10 = [(CORapportTransport *)self activity];

      if (v10)
      {
        uint64_t v11 = [(CORapportTransport *)self activity];
        nw_activity_activate();
      }
      v4[2](v4, 0);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v6 = [(CORapportTransport *)self sinks];
      uint64_t v12 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v6);
            }
            uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            id v16 = [(CORapportTransport *)self sinks];
            uint64_t v17 = [v16 objectForKey:v15];

            [v17 sourceHasBeenActivated];
          }
          uint64_t v12 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);
      }
    }
    else
    {
      v6 = self->_record;
      uint64_t v18 = [v6 sourceTransport];
      if ([v18 isActivated])
      {
        objc_initWeak((id *)buf, self);
        v19 = [(CORapportTransport *)self client];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __45__CORapportTransport_activateWithCompletion___block_invoke;
        v22[3] = &unk_2645CB3E0;
        objc_copyWeak(&v24, (id *)buf);
        v23 = v4;
        [v19 activateWithCompletion:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v20 = COCoreLogForCategory(17);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [(CORapportTransport *)self shortDescription];
          *(_DWORD *)buf = 138543362;
          v31 = v21;
          _os_log_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring activation since source transport is not yet active", buf, 0xCu);
        }
        [(CORapportTransport *)self setActivationHandler:v4];
      }
    }
  }
}

void __45__CORapportTransport_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained executionContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__CORapportTransport_activateWithCompletion___block_invoke_2;
    v7[3] = &unk_2645CB3B8;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v8 = v3;
    v9 = v5;
    id v10 = *(id *)(a1 + 32);
    [v6 dispatchAsync:v7];

    objc_destroyWeak(&v11);
  }
}

void __45__CORapportTransport_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 32))
    {
      id v3 = [*(id *)(a1 + 40) activity];

      if (v3)
      {
        id v4 = [*(id *)(a1 + 40) activity];
        nw_activity_activate();
      }
      v5 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [WeakRetained shortDescription];
        id v7 = [WeakRetained client];
        int v8 = 138543618;
        v9 = v6;
        __int16 v10 = 2112;
        id v11 = v7;
        _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ activated transport with client %@", (uint8_t *)&v8, 0x16u);
      }
      WeakRetained[8] = 1;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [WeakRetained _handleOnDemanNodeCreationRequest];
  }
}

- (void)invalidateWithError:(id)a3
{
  id v16 = a3;
  id v4 = [(CORapportTransport *)self executionContext];
  [v4 assertDispatchQueue];

  v5 = [(CORapportTransport *)self activity];
  if (v5 && nw_activity_is_activated())
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      uint64_t v7 = mach_continuous_time();
      uint64_t activation_time = nw_activity_get_activation_time();
      xpc_dictionary_set_uint64(v6, "lifetime", v7 - activation_time);
      [(CORapportTransport *)self averageRequestTime];
      xpc_dictionary_set_double(v6, "rtt", v9);
      xpc_dictionary_set_uint64(v6, "requests", [(CORapportTransport *)self requestCount]);
      xpc_dictionary_set_uint64(v6, "transport_type", 1uLL);
      __int16 v10 = [(CORapportTransport *)self remote];
      id v11 = v10;
      if (v10)
      {
        xpc_dictionary_set_uint64(v6, "nodeType", [v10 type]);
        xpc_dictionary_set_uint64(v6, "nodeFlags", [v11 flags]);
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  uint64_t v12 = [(CORapportTransport *)self client];
  [v12 invalidate];

  uint64_t v13 = [(CORapportTransport *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 transport:self didInvalidateWithError:v16];
  }
  v14 = [(CORapportTransport *)self record];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CORapportTransport *)self removeAsSink:self];
  }
  else
  {
    uint64_t v15 = [v14 sourceTransport];
    [v15 removeAsSink:self];
  }
}

- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4
{
  xpc_object_t v6 = (void (**)(void))a4;
  uint64_t v7 = [(CORapportTransport *)self executionContext];
  [v7 assertDispatchQueue];

  int v8 = [(CORapportTransport *)self _eventIDForClass:a3];
  double v9 = [(CORapportTransport *)self commands];
  [v9 setObject:a3 forKey:v8];

  __int16 v10 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v12 = [(CORapportTransport *)self registrationCompletions];
      uint64_t v13 = (void *)MEMORY[0x223C8B4A0](v6);
      [v12 setObject:v13 forKey:v8];

      objc_initWeak(&location, self);
      v14 = [(CORapportTransport *)self client];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke;
      v15[3] = &unk_2645CB430;
      objc_copyWeak(&v17, &location);
      id v16 = v8;
      [v14 registerRequestID:v16 options:0 handler:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6);
  }
}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = [WeakRetained executionContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2;
    v14[3] = &unk_2645CB408;
    id v15 = v8;
    id v16 = v12;
    id v17 = *(id *)(a1 + 32);
    id v18 = v7;
    id v19 = v9;
    __uint64_t v20 = v10;
    [v13 dispatchAsync:v14];
  }
}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F62C88]];
  if ([v2 length]
    && ([*(id *)(a1 + 40) sinks],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:v2],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    [v4 handleRequestIdentifier:*(void *)(a1 + 48) rapportRepresentation:*(void *)(a1 + 56) options:*(void *)(a1 + 32) responseHandler:*(void *)(a1 + 64) at:*(void *)(a1 + 72)];
  }
  else
  {
    v5 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) handleRequestFromUnknownNodeWithIdentifier:*(void *)(a1 + 48) rapportRepresentation:*(void *)(a1 + 56) options:*(void *)(a1 + 32) responseHandler:*(void *)(a1 + 64) at:*(void *)(a1 + 72)];
  }
}

- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4
{
  xpc_object_t v6 = (void (**)(void))a4;
  id v7 = [(CORapportTransport *)self executionContext];
  [v7 assertDispatchQueue];

  id v8 = [(CORapportTransport *)self _eventIDForClass:a3];
  id v9 = [(CORapportTransport *)self commands];
  [v9 setObject:a3 forKey:v8];

  __uint64_t v10 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v12 = [(CORapportTransport *)self registrationCompletions];
      uint64_t v13 = (void *)MEMORY[0x223C8B4A0](v6);
      [v12 setObject:v13 forKey:v8];

      objc_initWeak(&location, self);
      v14 = [(CORapportTransport *)self client];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke;
      v15[3] = &unk_2645CB480;
      objc_copyWeak(&v17, &location);
      id v16 = v8;
      [v14 registerEventID:v16 options:0 handler:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6);
  }
}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained executionContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2;
    v10[3] = &unk_2645CB458;
    id v11 = v6;
    uint64_t v12 = v8;
    id v13 = *(id *)(a1 + 32);
    id v14 = v5;
    [v9 dispatchAsync:v10];
  }
}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F62C88]];
  if ([v2 length]
    && ([*(id *)(a1 + 40) sinks],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:v2],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    [v4 handleEventIdentifier:*(void *)(a1 + 48) rapportRepresentation:*(void *)(a1 + 56) options:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v2, v4);
    }
  }
}

- (void)deregisterRequestForClass:(Class)a3
{
  id v5 = [(CORapportTransport *)self executionContext];
  [v5 assertDispatchQueue];

  id v10 = [(CORapportTransport *)self _eventIDForClass:a3];
  id v6 = [(CORapportTransport *)self commands];
  [v6 removeObjectForKey:v10];

  id v7 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && [(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [(CORapportTransport *)self client];
    [v9 deregisterRequestID:v10];
  }
}

- (void)deregisterCommandForClass:(Class)a3
{
  id v5 = [(CORapportTransport *)self executionContext];
  [v5 assertDispatchQueue];

  id v10 = [(CORapportTransport *)self _eventIDForClass:a3];
  id v6 = [(CORapportTransport *)self commands];
  [v6 removeObjectForKey:v10];

  id v7 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && [(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [(CORapportTransport *)self client];
    [v9 deregisterEventID:v10];
  }
}

- (void)_setUpRegistrationCompletionHandlers
{
  id v3 = [(CORapportTransport *)self executionContext];
  [v3 assertDispatchQueue];

  objc_initWeak(&location, self);
  id v4 = [(CORapportTransport *)self client];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke;
  v8[3] = &unk_2645CB4A8;
  objc_copyWeak(&v9, &location);
  [v4 setRequestIDRegistrationCompletion:v8];

  id v5 = [(CORapportTransport *)self client];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_99;
  v6[3] = &unk_2645CB4A8;
  objc_copyWeak(&v7, &location);
  [v5 setEventIDRegistrationCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained executionContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2;
    v7[3] = &unk_2645CAE80;
    void v7[4] = v5;
    id v8 = v3;
    [v6 dispatchAsync:v7];
  }
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) registrationCompletions];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      id v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered request ID %{public}@", (uint8_t *)&v7, 0x16u);
    }
    v3[2](v3);
  }
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_99(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained executionContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2_100;
    v7[3] = &unk_2645CAE80;
    void v7[4] = v5;
    id v8 = v3;
    [v6 dispatchAsync:v7];
  }
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2_100(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) registrationCompletions];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      id v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered event ID %{public}@", (uint8_t *)&v7, 0x16u);
    }
    v3[2](v3);
  }
}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  id v8 = [(CORapportTransport *)self executionContext];
  [v8 assertDispatchQueue];

  __int16 v9 = [(CORapportTransport *)self _eventIDForClass:objc_opt_class()];
  uint64_t v10 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(CORapportTransport *)self shortDescription];
    *(_DWORD *)buf = 138543618;
    v31 = v11;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sending %@", buf, 0x16u);
  }
  uint64_t v12 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [(CORapportTransport *)self executionContext];
    id v15 = [v14 constituentForMe];
    [(CORapportTransport *)self setRemote:v15];

    id v16 = [(CORapportTransport *)self delegate];
    id v17 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(CORapportTransport *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Got a command %{public}@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [v16 transport:self didReceiveCommand:v6];
    }
    v7[2](v7, 0);
  }
  else
  {
    id v16 = [(CORapportTransport *)self _serializedDataForCommand:v6];
    id v19 = [(CORapportTransport *)self executionContext];
    __uint64_t v20 = [v19 constituentForMe];

    v28[0] = @"source";
    v21 = [MEMORY[0x263F08910] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
    v28[1] = @"command";
    v29[0] = v21;
    v29[1] = v16;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    objc_initWeak((id *)buf, self);
    v23 = [(CORapportTransport *)self client];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke;
    v24[3] = &unk_2645CB4F8;
    objc_copyWeak(&v27, (id *)buf);
    id v25 = v9;
    long long v26 = v7;
    [v23 sendEventID:v25 event:v22 options:0 completion:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
}

void __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained executionContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_2645CB4D0;
    void v7[4] = v5;
    id v8 = a1[4];
    id v9 = v3;
    id v10 = a1[5];
    [v6 dispatchAsync:v7];
  }
}

uint64_t __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  v53[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v35 = a4;
  int v7 = [(CORapportTransport *)self executionContext];
  [v7 assertDispatchQueue];

  objc_initWeak(&location, self);
  id v8 = [(CORapportTransport *)self record];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(CORapportTransport *)self executionContext];
    uint64_t v11 = [v10 constituentForMe];
    [(CORapportTransport *)self setRemote:v11];

    uint64_t v12 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(CORapportTransport *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      v47 = v13;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Got a request %{public}@", buf, 0x16u);
    }
    id v14 = [(CORapportTransport *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke;
      v41[3] = &unk_2645CB548;
      objc_copyWeak(&v44, &location);
      id v43 = v35;
      id v42 = v6;
      [v14 transport:self didReceiveRequest:v42 callback:v41];

      objc_destroyWeak(&v44);
    }
  }
  else
  {
    id v14 = [(CORapportTransport *)self _serializedDataForCommand:v6];
    id v15 = [(CORapportTransport *)self executionContext];
    uint64_t v34 = [v15 constituentForMe];

    v52[0] = @"source";
    id v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v34 requiringSecureCoding:1 error:0];
    v52[1] = @"command";
    v53[0] = v16;
    v53[1] = v14;
    id v17 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

    id v18 = [(CORapportTransport *)self _eventIDForClass:objc_opt_class()];
    id v19 = [(CORapportTransport *)self client];
    [v6 responseTimeout];
    if (v20 >= 0.0) {
      double v21 = v20;
    }
    else {
      double v21 = 0.0;
    }
    if (v21 <= 0.0)
    {
      id v25 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [(CORapportTransport *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        v47 = v27;
        __int16 v48 = 2114;
        id v49 = v18;
        _os_log_impl(&dword_2217C1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@", buf, 0x16u);
      }
      id v24 = 0;
    }
    else
    {
      uint64_t v22 = NSDictionary;
      v23 = [NSNumber numberWithDouble:v21];
      id v24 = [v22 dictionaryWithObject:v23 forKey:*MEMORY[0x263F62CA0]];

      id v25 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = [(CORapportTransport *)self shortDescription];
        *(_DWORD *)buf = 138543874;
        v47 = v26;
        __int16 v48 = 2114;
        id v49 = v18;
        __int16 v50 = 2048;
        double v51 = v21;
        _os_log_impl(&dword_2217C1000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@ with timeout of %g", buf, 0x20u);
      }
    }

    long long v28 = [v6 activity];
    objc_super v29 = [(CORapportTransport *)self executionContext];
    v30 = [v29 networkActivityFactory];
    v31 = [v30 activityWithLabel:2 parentActivity:v28];

    if (v31) {
      nw_activity_activate();
    }
    __int16 v32 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_109;
    v36[3] = &unk_2645CB598;
    objc_copyWeak(v40, &location);
    id v33 = v31;
    id v37 = v33;
    id v38 = v6;
    id v39 = v35;
    v40[1] = v32;
    [v19 sendRequestID:v18 request:v17 options:v24 responseHandler:v36];

    objc_destroyWeak(v40);
  }

  objc_destroyWeak(&location);
}

void __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained executionContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2;
    v10[3] = &unk_2645CB520;
    id v14 = a1[5];
    id v11 = a1[4];
    id v12 = v5;
    id v13 = v6;
    [v9 dispatchAsync:v10];
  }
}

uint64_t __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_109(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained executionContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2_110;
    v15[3] = &unk_2645CB570;
    id v16 = *(id *)(a1 + 32);
    id v17 = v9;
    id v18 = v11;
    id v19 = *(id *)(a1 + 40);
    id v20 = v7;
    id v21 = v8;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    id v22 = v13;
    uint64_t v23 = v14;
    [v12 dispatchAsync:v15];
  }
}

uint64_t __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2_110(void *a1)
{
  if (a1[4])
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    id v3 = v2;
    if (v2)
    {
      xpc_dictionary_set_uint64(v2, "transport_type", 1uLL);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  uint64_t v7 = a1[5];
  id v6 = (void *)a1[6];
  uint64_t v8 = a1[9];
  uint64_t v9 = a1[10];
  uint64_t v10 = a1[11];
  return [v6 handleResponseToRequest:v4 rapportRepresentation:v5 options:v8 error:v7 responseHandler:v9 at:v10];
}

- (void)_handleOnDemanNodeCreationRequest
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(CORapportTransport *)self executionContext];
  [v3 assertDispatchQueue];

  uint64_t v4 = [(CORapportTransport *)self record];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 unhandledRequest];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(CORapportTransport *)self shortDescription];
        int v13 = 138543362;
        uint64_t v14 = v8;
        _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found an outstanding on demand node creation request", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v9 = [v6 identifier];
      uint64_t v10 = [v6 data];
      id v11 = [v6 options];
      id v12 = [v6 handler];
      -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:](self, "handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:", v9, v10, v11, v12, [v6 timestamp]);
    }
  }
}

- (void)_commandForIdentifier:(id)a3 fromData:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, id))a5;
  id v11 = [(CORapportTransport *)self executionContext];
  [v11 assertDispatchQueue];

  if (!v9)
  {
    id v17 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CORapportTransport _commandForIdentifier:fromData:result:](self);
    }

    id v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = -4000;
    goto LABEL_10;
  }
  id v12 = [(CORapportTransport *)self commands];
  uint64_t v13 = [v12 objectForKey:v8];

  if (!v13)
  {
    id v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = -4001;
LABEL_10:
    id v15 = [v18 errorWithDomain:@"COMeshNodeErrorDomain" code:v19 userInfo:0];
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  id v20 = 0;
  uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v13 fromData:v9 error:&v20];
  id v15 = v20;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];

      uint64_t v14 = 0;
      id v15 = (id)v16;
    }
  }
LABEL_11:
  v10[2](v10, v14, v15);
}

- (void)handleRequestFromUnknownNodeWithIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(CORapportTransport *)self executionContext];
  [v16 assertDispatchQueue];

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy__4;
  id v49 = __Block_byref_object_dispose__4;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__4;
  id v43 = __Block_byref_object_dispose__4;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  id v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke;
  v26[3] = &unk_2645CB5C0;
  v26[4] = &v27;
  v26[5] = &v33;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:v13 result:v26];
  uint64_t v17 = v34[5];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2;
  v25[3] = &unk_2645CB5E8;
  v25[4] = &v45;
  v25[5] = &v39;
  [(CORapportTransport *)self _commandForIdentifier:v12 fromData:v17 result:v25];
  if (v28[5]) {
    objc_msgSend((id)v40[5], "_setSendingConstituent:");
  }
  [(id)v40[5] _setRapportOptions:v14];
  if (v46[5])
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }
  else
  {
    id v18 = [(CORapportTransport *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(CORapportTransport *)self shortDescription];
        *(_DWORD *)buf = 138543362;
        v52 = v20;
        _os_log_impl(&dword_2217C1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for unknown node. Informing delegate", buf, 0xCu);
      }
      id v21 = [COUnhandledRapportRequest alloc];
      id v22 = [(COUnhandledRapportRequest *)v21 initWithRequest:v40[5] identifier:v12 data:v13 options:v14 handler:v15 at:a7];
      [v18 transport:self didReceiveUnhandledRequest:v22];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      id v24 = (void *)v46[5];
      v46[5] = v23;

      (*((void (**)(id, void, void, uint64_t))v15 + 2))(v15, 0, 0, v46[5]);
    }
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  *uint64_t v7 = v9;
}

- (void)handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(CORapportTransport *)self executionContext];
  [v16 assertDispatchQueue];

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__4;
  v61 = __Block_byref_object_dispose__4;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__4;
  v55 = __Block_byref_object_dispose__4;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy__4;
  id v49 = __Block_byref_object_dispose__4;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__4;
  id v43 = __Block_byref_object_dispose__4;
  id v44 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke;
  v38[3] = &unk_2645CB5C0;
  v38[4] = &v39;
  v38[5] = &v45;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:v13 result:v38];
  uint64_t v17 = v46[5];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2;
  v37[3] = &unk_2645CB5E8;
  v37[4] = &v57;
  v37[5] = &v51;
  [(CORapportTransport *)self _commandForIdentifier:v12 fromData:v17 result:v37];
  id v18 = (void *)v52[5];
  if (!v18)
  {
    (*((void (**)(id, void, void, uint64_t))v15 + 2))(v15, 0, 0, v58[5]);
    goto LABEL_21;
  }
  if (v40[5])
  {
    objc_msgSend(v18, "_setSendingConstituent:");
    id v18 = (void *)v52[5];
  }
  [v18 _setRapportOptions:v14];
  uint64_t v19 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    [(CORapportTransport *)self shortDescription];
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:]();
  }

  if ([(CORapportTransport *)self _validateSource:v40[5] options:v14]) {
    goto LABEL_16;
  }
  id v20 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    [(CORapportTransport *)self shortDescription];
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:]();
  }

  id v21 = [(CORapportTransport *)self delegate];
  id location = 0;
  p_id location = &location;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  if (v40[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v22 = [(CORapportTransport *)self remote];
    uint64_t v23 = v40[5];
    uint64_t v24 = v52[5];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_123;
    v32[3] = &unk_2645CB610;
    v32[4] = &location;
    [v21 transport:self shouldUpdateRemoteConstituent:v22 to:v23 forCommand:v24 completionHandler:v32];
  }
  if (*((unsigned char *)p_location + 24))
  {
    id v25 = [(CORapportTransport *)self remote];
    [(CORapportTransport *)self setRemote:v40[5]];
    if (objc_opt_respondsToSelector()) {
      [v21 transport:self didUpdateRemoteConstituent:v25 to:v40[5]];
    }

    _Block_object_dispose(&location, 8);
LABEL_16:
    id v21 = [(CORapportTransport *)self delegate];
    objc_initWeak(&location, self);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v26 = v52[5];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      void v29[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2_127;
      v29[3] = &unk_2645CB660;
      objc_copyWeak(v31, &location);
      v31[1] = (id)a7;
      id v30 = v15;
      [v21 transport:self didReceiveRequest:v26 callback:v29];

      objc_destroyWeak(v31);
    }
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
  long long v28 = (void *)v58[5];
  v58[5] = v27;

  (*((void (**)(id, void, void, uint64_t))v15 + 2))(v15, 0, 0, v58[5]);
  _Block_object_dispose(&location, 8);
LABEL_19:

LABEL_21:
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  *uint64_t v7 = v9;
}

uint64_t __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_123(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2_127(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained executionContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3;
    v12[3] = &unk_2645CB638;
    id v13 = v6;
    id v14 = v8;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v15 = v10;
    uint64_t v17 = v11;
    id v16 = *(id *)(a1 + 32);
    [v9 dispatchAsync:v12];
  }
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    xpc_object_t v2 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_2();
    }
    id v3 = 0;
  }
  else
  {
    xpc_object_t v2 = [*(id *)(a1 + 40) _serializedDataForCommand:*(void *)(a1 + 48)];
    uint64_t v4 = [*(id *)(a1 + 40) _eventIDForClass:objc_opt_class()];
    id v5 = [*(id *)(a1 + 40) executionContext];
    id v6 = [v5 constituentForMe];

    uint64_t v7 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_1();
    }

    v10[0] = @"source";
    id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    v11[0] = v8;
    v11[1] = v2;
    v10[1] = @"command";
    v10[2] = @"response";
    v11[2] = v4;
    v10[3] = @"overhead";
    id v9 = [NSNumber numberWithDouble:(double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a1 + 64))];
    v11[3] = v9;
    id v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseHandler:(id)a7 at:(unint64_t)a8
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v50 = a5;
  id v15 = a6;
  id v16 = a7;
  __uint64_t v48 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__4;
  v75 = __Block_byref_object_dispose__4;
  id v17 = v15;
  id v76 = v17;
  id v18 = [(CORapportTransport *)self executionContext];
  [v18 assertDispatchQueue];

  uint64_t v19 = [v14 objectForKey:@"response"];
  objc_initWeak(&location, self);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke;
  v65[3] = &unk_2645CB688;
  objc_copyWeak(&v69, &location);
  v68 = &v71;
  id v20 = v13;
  id v66 = v20;
  id v21 = v16;
  id v67 = v21;
  id v22 = (void (**)(void))MEMORY[0x223C8B4A0](v65);
  if (!v72[5])
  {
    uint64_t v24 = [(id)objc_opt_class() acceptableResponses];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_128;
    v63[3] = &unk_2645CB6B0;
    v63[4] = self;
    id v64 = v19;
    uint64_t v47 = v24;
    id v25 = [v24 objectsPassingTest:v63];
    uint64_t v26 = [v25 anyObject];

    if (!v26)
    {
      uint64_t v32 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      uint64_t v33 = (void *)v72[5];
      v72[5] = v32;

      v22[2](v22);
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__4;
    v89 = __Block_byref_object_dispose__4;
    id v90 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__4;
    v61 = __Block_byref_object_dispose__4;
    id v62 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    void v52[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_2;
    v52[3] = &unk_2645CB6D8;
    v52[4] = &v85;
    v52[5] = &v57;
    v52[6] = &v53;
    [(CORapportTransport *)self _commandPayloadFromRapportRepresentationWithValidation:v14 result:v52];
    if (v58[5])
    {
      uint64_t v27 = v86[5];
      if (v27)
      {
        id v51 = 0;
        v46 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v26 fromData:v27 error:&v51];
        id v45 = v51;
        if (v46)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!*((unsigned char *)v54 + 24))
            {
              long long v28 = COCoreLogForCategory(17);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                [(CORapportTransport *)self shortDescription];
                objc_claimAutoreleasedReturnValue();
                -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:]();
              }

              uint64_t v29 = [(CORapportTransport *)self delegate];
              if (objc_opt_respondsToSelector())
              {
                id v30 = [(CORapportTransport *)self remote];
                [v29 transport:self willUpdateRemoteConstituent:v30 to:v58[5]];
              }
              [(CORapportTransport *)self setRemote:v58[5]];
              if (objc_opt_respondsToSelector())
              {
                v31 = [(CORapportTransport *)self remote];
                [v29 transport:self didUpdateRemoteConstituent:v31 to:v58[5]];
              }
            }
            [(CORapportTransport *)self _updateRequestTimesFromRapportRepresentation:v14 start:a8 end:v48];
            [v46 _setRapportOptions:v50];
            (*((void (**)(id, id, void *, void))v21 + 2))(v21, v20, v46, 0);
          }
          else
          {
            uint64_t v40 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
            uint64_t v41 = (void *)v72[5];
            v72[5] = v40;

            v22[2](v22);
          }
        }
        else
        {
          id v38 = COCoreLogForCategory(17);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            id v44 = [(CORapportTransport *)self shortDescription];
            *(_DWORD *)buf = 138543874;
            v80 = v44;
            __int16 v81 = 2114;
            id v82 = v20;
            __int16 v83 = 2114;
            id v84 = v45;
            _os_log_error_impl(&dword_2217C1000, v38, OS_LOG_TYPE_ERROR, "%{public}@ failed to unarchive response for request %{public}@ with error = %{public}@", buf, 0x20u);
          }
          if (v45)
          {
            uint64_t v77 = *MEMORY[0x263F08608];
            id v78 = v45;
            uint64_t v39 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          }
          else
          {
            uint64_t v39 = 0;
          }
          uint64_t v42 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:v39];
          id v43 = (void *)v72[5];
          v72[5] = v42;

          v22[2](v22);
        }

        goto LABEL_35;
      }
      char v36 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        [(CORapportTransport *)self shortDescription];
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:]();
      }

      uint64_t v35 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
    }
    else
    {
      uint64_t v34 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        [(CORapportTransport *)self shortDescription];
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:]();
      }

      uint64_t v35 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    }
    id v37 = (void *)v72[5];
    v72[5] = v35;

    v22[2](v22);
LABEL_35:
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);

    _Block_object_dispose(&v85, 8);
    goto LABEL_36;
  }
  uint64_t v23 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    [(CORapportTransport *)self shortDescription];
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:].cold.4();
  }

  v22[2](v22);
LABEL_37:

  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v71, 8);
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained remote];
    if (v4 || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code] != -6714)
    {
    }
    else
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) domain];
      char v6 = [v5 isEqualToString:*MEMORY[0x263F62C18]];

      if (v6)
      {
LABEL_10:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_11;
      }
    }
    uint64_t v7 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_cold_1();
    }

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_128(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) _eventIDForClass:a2];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  *a3 = v6;

  return v6;
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_2(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  id v11 = a3;
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a4;
}

- (void)_updateRequestTimesFromRapportRepresentation:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  uint64_t v8 = [a3 objectForKey:@"overhead"];
  if ([v8 BOOLValue])
  {
    unint64_t v9 = [(CORapportTransport *)self requestCount] + 1;
    id v10 = [(CORapportTransport *)self executionContext];
    id v11 = [v10 analyticsRecorder];

    if (v9 < 0x3E9)
    {
      [v8 doubleValue];
      double v21 = ((double)(a5 - a4) - v20) / 1000000.0;
      [(CORapportTransport *)self averageRequestTime];
      double v23 = v22 * 1000.0;
      if (v21 <= v23) {
        double v21 = v23 + (v21 - v23) / (double)v9;
      }
      else {
        unint64_t v9 = 1;
      }
      [(CORapportTransport *)self setRequestCount:v9];
      double v24 = v21 / 1000.0;
      [(CORapportTransport *)self setAverageRequestTime:v24];
      HIDWORD(v25) = -1030792151 * (unsigned __int16)v9;
      LODWORD(v25) = HIDWORD(v25);
      if ((v25 >> 2) > 0x28F5C28) {
        goto LABEL_12;
      }
      uint64_t v26 = [(CORapportTransport *)self executionContext];
      uint64_t v27 = [v26 label];

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      void v29[2] = __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke_135;
      v29[3] = &unk_2645CB700;
      *(double *)&v30[1] = v24;
      v30[2] = v9;
      id v16 = (id *)v30;
      v30[0] = v27;
      long long v28 = (void (*)(void *, uint64_t, void *))v11[2];
      id v18 = v27;
      v28(v11, 0x26D3D61A8, v29);
    }
    else
    {
      [(CORapportTransport *)self averageRequestTime];
      uint64_t v13 = v12;
      id v14 = [(CORapportTransport *)self executionContext];
      id v15 = [v14 label];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      id v31[2] = __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke;
      v31[3] = &unk_2645CB700;
      v32[1] = v13;
      v32[2] = v9;
      id v16 = (id *)v32;
      v32[0] = v15;
      id v17 = (void (*)(void *, uint64_t, void *))v11[2];
      id v18 = v15;
      v17(v11, 0x26D3D61A8, v31);
      [(CORapportTransport *)self setRequestCount:0];
      [(CORapportTransport *)self setAverageRequestTime:0.0];
      uint64_t v19 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CORapportTransport _updateRequestTimesFromRapportRepresentation:start:end:](self);
      }
    }
LABEL_12:
  }
}

id __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = 0x26D3D6408;
  xpc_object_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = 0x26D3D63E8;
  id v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v7[2] = 0x26D3D61E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke_135(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = 0x26D3D6408;
  xpc_object_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = 0x26D3D63E8;
  id v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v7[2] = 0x26D3D61E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CORapportTransport *)self executionContext];
  [v11 assertDispatchQueue];

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__4;
  uint64_t v34 = __Block_byref_object_dispose__4;
  id v35 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__4;
  long long v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__CORapportTransport_handleEventIdentifier_rapportRepresentation_options___block_invoke;
  v23[3] = &unk_2645CB5C0;
  v23[4] = &v24;
  v23[5] = &v30;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:v9 result:v23];
  if (v31[5])
  {
    uint64_t v12 = [(CORapportTransport *)self commands];
    uint64_t v13 = [v12 objectForKey:v8];

    if (v13)
    {
      id v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v13 fromData:v31[5] error:0];
      id v15 = 0;
      goto LABEL_9;
    }
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
  }
  else
  {
    id v16 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(CORapportTransport *)self shortDescription];
      objc_claimAutoreleasedReturnValue();
      -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.5();
    }

    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
  }
  id v15 = (void *)v17;
  id v14 = 0;
LABEL_9:
  if (v25[5])
  {
    if (!v15) {
      goto LABEL_15;
    }
  }
  else
  {
    id v18 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [(CORapportTransport *)self shortDescription];
      objc_claimAutoreleasedReturnValue();
      -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.4();
    }

    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];

    id v15 = (void *)v19;
    if (!v19)
    {
LABEL_15:
      if (v14)
      {
        if (v25[5]) {
          objc_msgSend(v14, "_setSendingConstituent:");
        }
        [v14 _setRapportOptions:v10];
      }
      double v20 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        [(CORapportTransport *)self shortDescription];
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:]();
      }

      if ([(CORapportTransport *)self _validateSource:v25[5] options:v10])
      {
        double v21 = [(CORapportTransport *)self delegate];
        if (v14)
        {
          if (objc_opt_respondsToSelector()) {
            [v21 transport:self didReceiveCommand:v14];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          double v22 = COCoreLogForCategory(17);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            [(CORapportTransport *)self shortDescription];
            objc_claimAutoreleasedReturnValue();
            -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:]();
          }

          id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
          [v21 transport:self didReceiveError:v15 forCommand:0];
          goto LABEL_32;
        }
      }
      else
      {
        double v21 = COCoreLogForCategory(17);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          [(CORapportTransport *)self shortDescription];
          objc_claimAutoreleasedReturnValue();
          -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:]();
        }
      }
      id v15 = 0;
LABEL_32:
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void __74__CORapportTransport_handleEventIdentifier_rapportRepresentation_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CORapportTransport *)self record];
    id v6 = [v4 record];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  xpc_object_t v2 = [(CORapportTransport *)self record];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (double)currentPingTimeout
{
  [(CORapportTransport *)self averageRequestTime];
  double v4 = ceil(v3 + v3);
  [(CORapportTransport *)self minimumPingInterval];
  if (v4 < v5) {
    double v4 = v5;
  }
  [(CORapportTransport *)self maximumPingInterval];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (void)_commandPayloadFromRapportRepresentationWithValidation:(id)a3 result:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, uint64_t, uint64_t, void))a4;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v8 = objc_opt_class();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__CORapportTransport__commandPayloadFromRapportRepresentationWithValidation_result___block_invoke;
  v9[3] = &unk_2645CB728;
  v9[6] = &v20;
  v9[7] = &v10;
  v9[4] = self;
  v9[5] = &v14;
  [v8 _commandPayloadFromRapportRepresentation:v6 result:v9];
  v7[2](v7, v15[5], v21[5], *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __84__CORapportTransport__commandPayloadFromRapportRepresentationWithValidation_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _validateSource:v12 options:0];
}

+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *, id))a4;
  id v6 = [v10 objectForKey:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
    id v8 = [v10 objectForKey:@"command"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      id v6 = v9;
    }
    else
    {
      id v9 = 0;
      id v6 = v8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v9 = 0;
  }
  v5[2](v5, v7, v9);
}

- (id)_serializedDataForCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(CORapportTransport *)self executionContext];
  [v5 assertDispatchQueue];

  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  if (!v7)
  {
    if (class_getMethodImplementation(v6, sel_supportsSecureCoding)
      && class_getMethodImplementation(v6, sel_encodeWithCoder_))
    {
      id v8 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CORapportTransport _serializedDataForCommand:]();
      }
    }
    else
    {
      id v8 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CORapportTransport _serializedDataForCommand:](v6, v8);
      }
    }

    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08160] reason:0 userInfo:0];
    [v9 raise];
  }
  id v10 = [(CORapportTransport *)self counters];
  id v11 = NSStringFromClass(v6);
  id v12 = [v10 objectForKey:v11];
  if (!v12)
  {
    id v12 = objc_alloc_init(COMeshNodeMessageCounter);
    [v10 setObject:v12 forKey:v11];
  }
  unint64_t v13 = [(COMeshNodeMessageCounter *)v12 count] + 1;
  unint64_t v14 = [v7 length];
  id v15 = [(CORapportTransport *)self executionContext];
  uint64_t v16 = [v15 analyticsRecorder];

  unint64_t v17 = [(COMeshNodeMessageCounter *)v12 size];
  if (v13 > 0x3E7)
  {
    uint64_t v34 = v7;
    double v27 = (double)v17;
    long long v28 = [(CORapportTransport *)self executionContext];
    id v29 = [v28 label];

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __48__CORapportTransport__serializedDataForCommand___block_invoke_2;
    v35[3] = &unk_2645CB750;
    *(double *)&v37[1] = v27;
    v37[2] = v13;
    double v23 = (id *)v37;
    id v36 = v11;
    v37[0] = v29;
    uint64_t v30 = v11;
    v31 = v10;
    uint64_t v32 = (void (*)(void *, uint64_t, void *))v16[2];
    id v26 = v29;
    v32(v16, 0x26D3D61C8, v35);
    id v10 = v31;
    id v11 = v30;
    uint64_t v22 = &v36;
    [(COMeshNodeMessageCounter *)v12 setCount:0];
    [(COMeshNodeMessageCounter *)v12 setSize:0];
  }
  else
  {
    unint64_t v18 = v14 / v13 + v17 - v17 / v13;
    [(COMeshNodeMessageCounter *)v12 setCount:v13];
    [(COMeshNodeMessageCounter *)v12 setSize:v18];
    HIDWORD(v19) = -1030792151 * (unsigned __int16)v13;
    LODWORD(v19) = HIDWORD(v19);
    if ((v19 >> 2) > 0x28F5C28) {
      goto LABEL_16;
    }
    uint64_t v34 = v7;
    uint64_t v20 = [(CORapportTransport *)self executionContext];
    uint64_t v21 = [v20 label];

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __48__CORapportTransport__serializedDataForCommand___block_invoke;
    v38[3] = &unk_2645CB750;
    v40[1] = v18;
    id v40[2] = v13;
    uint64_t v22 = &v39;
    double v23 = (id *)v40;
    id v39 = v11;
    v40[0] = v21;
    uint64_t v24 = (void *)v21;
    id v25 = (void (*)(void *, uint64_t, void *))v16[2];
    id v26 = v24;
    v25(v16, 0x26D3D61C8, v38);
  }

  uint64_t v7 = v34;
LABEL_16:

  return v7;
}

id __48__CORapportTransport__serializedDataForCommand___block_invoke(void *a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = 0x26D3D6428;
  xpc_object_t v2 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  v9[0] = v2;
  v8[1] = 0x26D3D63E8;
  double v3 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x26D3D6448;
  v8[3] = 0x26D3D61E8;
  v9[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

id __48__CORapportTransport__serializedDataForCommand___block_invoke_2(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = 0x26D3D6428;
  xpc_object_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v9[0] = v2;
  v8[1] = 0x26D3D63E8;
  double v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x26D3D6448;
  v8[3] = 0x26D3D61E8;
  v9[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)_eventIDForClass:(Class)a3
{
  uint64_t v4 = [(CORapportTransport *)self executionContext];
  uint64_t v5 = [v4 meshName];

  id v6 = NSStringFromClass(a3);
  uint64_t v7 = [v5 stringByAppendingFormat:@".%@", v6];

  return v7;
}

- (BOOL)_validateSource:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORapportTransport *)self remote];
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = [(CORapportTransport *)self record];
  id v10 = [v9 IDSIdentifier];

  id v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F62C88]];
  if (!v11)
  {
    unint64_t v14 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CORapportTransport _validateSource:options:](self);
    }
    goto LABEL_15;
  }
  if (([v10 isEqualToString:v11] & 1) == 0)
  {
    unint64_t v14 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v19 = [(CORapportTransport *)self shortDescription];
      int v20 = 138543874;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      double v23 = v11;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_error_impl(&dword_2217C1000, v14, OS_LOG_TYPE_ERROR, "%{public}@ validation failed. IDS ID received %@ does not match record %@", (uint8_t *)&v20, 0x20u);
    }
LABEL_15:

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D6748 code:-5002 userInfo:0];
    [(CORapportTransport *)self invalidateWithError:v15];

LABEL_16:
    BOOL v12 = 0;
LABEL_17:

    goto LABEL_18;
  }

LABEL_5:
  if (!v6) {
    goto LABEL_9;
  }
  if (!v8)
  {
    unint64_t v17 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = [(CORapportTransport *)self shortDescription];
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      double v23 = v6;
      _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting remote %@", (uint8_t *)&v20, 0x16u);
    }
    id v10 = [(CORapportTransport *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 transport:self willUpdateRemoteConstituent:0 to:v6];
    }
    [(CORapportTransport *)self setRemote:v6];
    if (objc_opt_respondsToSelector()) {
      [v10 transport:self didUpdateRemoteConstituent:0 to:v6];
    }
    BOOL v12 = 1;
    goto LABEL_17;
  }
  if (([v8 isEqual:v6] & 1) == 0)
  {
LABEL_9:
    id v10 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = [(CORapportTransport *)self shortDescription];
      int v20 = 138543874;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      double v23 = v8;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_error_impl(&dword_2217C1000, v10, OS_LOG_TYPE_ERROR, "%{public}@ validation failed. Remote = %{public}@ and source = %{public}@", (uint8_t *)&v20, 0x20u);
    }
    goto LABEL_16;
  }
  BOOL v12 = 1;
LABEL_18:

  return v12;
}

- (void)_registerHandlersOnClient
{
  double v3 = [(CORapportTransport *)self client];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke;
  v12[3] = &unk_2645CB2E0;
  objc_copyWeak(&v13, &location);
  [v3 setInvalidationHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_149;
  v10[3] = &unk_2645CB2E0;
  objc_copyWeak(&v11, &location);
  [v3 setInterruptionHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_151;
  v8[3] = &unk_2645CB2E0;
  objc_copyWeak(&v9, &location);
  [v3 setStateUpdatedHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_153;
  v6[3] = &unk_2645CB2E0;
  objc_copyWeak(&v7, &location);
  [v3 setErrorFlagsChangedHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_155;
  v4[3] = &unk_2645CB2E0;
  objc_copyWeak(&v5, &location);
  [v3 setDisconnectHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  xpc_object_t v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = [WeakRetained executionContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2;
    v4[3] = &unk_2645CB288;
    void v4[4] = v2;
    [v3 dispatchAsync:v4];
  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  xpc_object_t v2 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = [*(id *)(a1 + 32) shortDescription];
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidated connection", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D6748 code:-5003 userInfo:0];
    [v4 transport:v5 didInvalidateWithError:v6];
  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_149(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  xpc_object_t v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = [WeakRetained executionContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_150;
    v4[3] = &unk_2645CB288;
    void v4[4] = v2;
    [v3 dispatchAsync:v4];
  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_150(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  xpc_object_t v2 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = [*(id *)(a1 + 32) shortDescription];
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupted connection", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D6748 code:-5003 userInfo:0];
    [v4 transport:v5 didInvalidateWithError:v6];
  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_151(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    xpc_object_t v2 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_151_cold_1(WeakRetained);
    }

    double v3 = [WeakRetained executionContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_152;
    v4[3] = &unk_2645CB288;
    void v4[4] = WeakRetained;
    [v3 dispatchAsync:v4];
  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_152(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRPStateUpdate];
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_153(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    xpc_object_t v2 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_153_cold_1(WeakRetained);
    }

    double v3 = [WeakRetained executionContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_154;
    v4[3] = &unk_2645CB288;
    void v4[4] = WeakRetained;
    [v3 dispatchAsync:v4];
  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_154(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRPErrorFlagsUpdate];
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_155(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    xpc_object_t v2 = COCoreLogForCategory(17);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_155_cold_1(WeakRetained);
    }

    double v3 = [WeakRetained executionContext];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_156;
    v4[3] = &unk_2645CB288;
    void v4[4] = WeakRetained;
    [v3 dispatchAsync:v4];
  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_156(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDisconnect];
}

- (void)_handleRPStateUpdate
{
  double v3 = [(CORapportTransport *)self executionContext];
  [v3 assertDispatchQueue];

  uint64_t v4 = [(CORapportTransport *)self client];
  int v5 = [v4 usingOnDemandConnection];

  if (v5)
  {
    [(CORapportTransport *)self _handleRPIsUsingOnDemandConnection];
  }
}

- (void)_handleRPIsUsingOnDemandConnection
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v3 = [(CORapportTransport *)self executionContext];
  [v3 assertDispatchQueue];

  uint64_t v4 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(CORapportTransport *)self shortDescription];
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ link (IP) connected", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [(CORapportTransport *)self clientIsUsingOnDemandConnection];
  int v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)_handleRPErrorFlagsUpdate
{
  double v3 = [(CORapportTransport *)self executionContext];
  [v3 assertDispatchQueue];

  uint64_t v4 = [(CORapportTransport *)self client];
  __int16 v5 = [v4 errorFlags];

  if ((v5 & 0x200) != 0)
  {
    [(CORapportTransport *)self _handleDisconnect];
  }
}

- (void)_handleDisconnect
{
  v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "%{public}@ link (IP) disconnected, triggering invalidation", v4, v5, v6, v7, v8);
}

- (void)pingWithCallback:(id)a3
{
  id v4 = a3;
  [(CORapportTransport *)self currentPingTimeout];
  uint64_t v6 = [[_COMeshControllerPing alloc] initWithTimeout:v5];
  uint64_t v7 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CORapportTransport pingWithCallback:](self);
  }

  [(CORapportTransport *)self sendRequest:v6 withResponseHandler:v4];
}

- (COTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CODiscoveryRecordProtocol)record
{
  return self->_record;
}

- (double)minimumPingInterval
{
  return self->_minimumPingInterval;
}

- (void)setMinimumPingInterval:(double)a3
{
  self->_minimumPingInterval = a3;
}

- (double)maximumPingInterval
{
  return self->_maximumPingInterval;
}

- (void)setMaximumPingInterval:(double)a3
{
  self->_maximumPingInterval = a3;
}

- (COConstituent)remote
{
  return self->_remote;
}

- (void)setRemote:(id)a3
{
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (double)averageRequestTime
{
  return self->_averageRequestTime;
}

- (void)setAverageRequestTime:(double)a3
{
  self->_averageRequestTime = a3;
}

- (id)clientIsUsingOnDemandConnection
{
  return self->_clientIsUsingOnDemandConnection;
}

- (void)setClientIsUsingOnDemandConnection:(id)a3
{
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (NSMutableDictionary)counters
{
  return self->_counters;
}

- (NSMapTable)sinks
{
  return self->_sinks;
}

- (NSMutableDictionary)commands
{
  return self->_commands;
}

- (NSMutableDictionary)registrationCompletions
{
  return self->_registrationCompletions;
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong((id *)&self->_registrationCompletions, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_clientIsUsingOnDemandConnection, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [*(id *)(v0 + 40) sinks];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11_0(&dword_2217C1000, v2, v3, "%p request from unknown node with IDS %@. My sinks = %@", v4, v5, v6, v7, v8);
}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%p command from unknown node with IDS %@", (uint8_t *)&v4, 0x16u);
}

void __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) shortDescription];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ sent %@ (%@)", v6, 0x20u);
}

- (void)_commandForIdentifier:(void *)a1 fromData:result:.cold.1(void *a1)
{
  v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "%{public}@ no request payload", v4, v5, v6, v7, v8);
}

- (void)handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_1(&dword_2217C1000, v3, (uint64_t)v3, "%{public}@ request failed source validation", v4);
}

- (void)handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  _os_log_debug_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ received request %@", v4, 0x16u);
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [*v0 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%{public}@ responding with %@", v4, v5, v6, v7, v8);
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_9();
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(v1 + 40) shortDescription];
  OUTLINED_FUNCTION_3();
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%{public}@ response error (%@)", v4, 0x16u);
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_6(&dword_2217C1000, "%{public}@ missing source on request %@", v4, v5);
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_6(&dword_2217C1000, "%{public}@ missing payload on request %@", v4, v5);
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  *(_DWORD *)uint64_t v1 = 138543618;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_6(&dword_2217C1000, "%{public}@ response validation for request %{public}@ failed. Changing constituent", v4, v5);
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_6(&dword_2217C1000, "%{public}@ bad response ID (%@)", v4, v5);
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [v0 shortDescription];
  objc_opt_class();
  OUTLINED_FUNCTION_12();
  id v3 = v2;
  OUTLINED_FUNCTION_11_0(&dword_2217C1000, v4, v5, "%{public}@ received %@ for %@", v6, v7, v8, v9, v10);
}

- (void)_updateRequestTimesFromRapportRepresentation:(void *)a1 start:end:.cold.1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%{public}@ received (reset timings)", v4, v5, v6, v7, v8);
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_1(&dword_2217C1000, v3, (uint64_t)v3, "%{public}@ did not produce command", v4);
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_1(&dword_2217C1000, v3, (uint64_t)v3, "%{public}@ command failed source validation", v4);
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  _os_log_debug_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ received %@", v4, 0x16u);
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_1(&dword_2217C1000, v3, (uint64_t)v3, "%{public}@ missing source", v4);
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_1(&dword_2217C1000, v3, (uint64_t)v3, "%{public}@ no event payload", v4);
}

- (void)_serializedDataForCommand:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2217C1000, a2, OS_LOG_TYPE_FAULT, "%{public}@ does not appear to properly support secure coding which is required for all commands!", v4, 0xCu);
}

- (void)_serializedDataForCommand:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2217C1000, v0, OS_LOG_TYPE_FAULT, "Failed to properly archive for sending: %{public}@", v1, 0xCu);
}

- (void)_validateSource:(void *)a1 options:.cold.1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "%{public}@ validation failed since we didn't receive a remote IDS ID", v4, v5, v6, v7, v8);
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_151_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%{public}@ link state updated", v4, v5, v6, v7, v8);
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_153_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2217C1000, v2, v3, "%{public}@ link error flags updated", v4, v5, v6, v7, v8);
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_155_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_2217C1000, v2, v3, "%{public}@ link (IP) disconnected", v4, v5, v6, v7, v8);
}

- (void)pingWithCallback:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_2217C1000, v2, v3, "%{public}@ sending ping (%g)", v4, v5, v6, v7, v8);
}

@end