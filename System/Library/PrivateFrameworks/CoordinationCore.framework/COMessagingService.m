@interface COMessagingService
+ (id)serviceWithDelegate:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (COMessagingService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (NSMutableDictionary)connectedClients;
- (NSMutableDictionary)outstandingActivateCompletionHandlers;
- (NSMutableDictionary)requestHandlers;
- (_COMessagingServiceMeter)meter;
- (void)_addOnAdded:(id)a3;
- (void)_addOnRemoved:(id)a3;
- (void)_clientLost:(id)a3;
- (void)_completeActivationForClient:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)activateMessageChannelForTopic:(id)a3 cluster:(id)a4 handlers:(id)a5 withCompletion:(id)a6;
- (void)addOn:(id)a3 receivedRequest:(id)a4 callback:(id)a5;
- (void)sendRequestWithPayload:(id)a3 payloadType:(id)a4 requestType:(int64_t)a5 requestID:(unsigned int)a6 members:(id)a7 activityToken:(id)a8;
- (void)sessionEndedForSubTopic:(id)a3;
- (void)sessionStartedForSubTopic:(id)a3 withMember:(id)a4 produced:(BOOL)a5;
- (void)setConnectedClients:(id)a3;
- (void)setOutstandingActivateCompletionHandlers:(id)a3;
- (void)setRequestHandlers:(id)a3;
@end

@implementation COMessagingService

+ (id)serviceWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[COServiceListenerProvider alloc] initWithServiceName:@"com.apple.coordination.messaging" entitlement:@"com.apple.private.coordination.messaging"];
  v5 = objc_alloc_init(COMessagingAddOnProvider);
  v6 = [[COMessagingService alloc] initWithListenerProvider:v4 addOnProvider:v5 delegate:v3];

  return v6;
}

- (COMessagingService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)COMessagingService;
  v5 = [(COService *)&v20 initWithListenerProvider:a3 addOnProvider:a4 delegate:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    connectedClients = v5->_connectedClients;
    v5->_connectedClients = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    requestHandlers = v5->_requestHandlers;
    v5->_requestHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    outstandingActivateCompletionHandlers = v5->_outstandingActivateCompletionHandlers;
    v5->_outstandingActivateCompletionHandlers = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(_COMessagingServiceMeter);
    meter = v5->_meter;
    v5->_meter = v12;

    v14 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(_COMessagingServiceMeter *)v5->_meter limits];
      *(_DWORD *)buf = 134218242;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p limiting %@", buf, 0x16u);
    }
    v16 = [(_COMessagingServiceMeter *)v5->_meter peaks];
    v17 = [v16 allKeys];

    if ([v17 count])
    {
      v18 = COCoreLogForCategory(10);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v22 = v5;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p evaluating sizing for %@", buf, 0x16u);
      }
    }
    [(COService *)v5 _serviceReady];
  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)COMessagingService;
  id v4 = a3;
  [(COService *)&v14 _configureServiceInterfacesOnConnection:v4];
  v5 = (void *)MEMORY[0x263F08D80];
  uint64_t v6 = &unk_26D3FAD50;
  v7 = [v5 interfaceWithProtocol:v6];
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0, v14.receiver, v14.super_class);
  [v7 setClasses:v10 forSelector:sel_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken_ argumentIndex:4 ofReply:0];
  [v7 setXPCType:MEMORY[0x263EF87A8] forSelector:sel_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken_ argumentIndex:5 ofReply:0];
  [v4 setExportedInterface:v7];
  v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  [v7 setClasses:v11 forSelector:sel_sessionStartedForSubTopic_withMember_produced_ argumentIndex:1 ofReply:0];
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  v12 = &unk_26D409810;

  v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:v12];

  [v4 setRemoteObjectInterface:v13];
}

- (void)_clientLost:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COMessagingService *)self connectedClients];
  v52 = v4;
  uint64_t v6 = [v5 objectForKey:v4];

  v7 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 client];
    uint64_t v9 = [v8 connection];
    *(_DWORD *)buf = 134218240;
    v73 = self;
    __int16 v74 = 1024;
    LODWORD(v75) = [v9 processIdentifier];
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p Lost client %d", buf, 0x12u);
  }
  v60 = [v6 topic];
  uint64_t v10 = [v6 cluster];
  group = dispatch_group_create();
  v48 = (void *)v10;
  v49 = self;
  v11 = [(COService *)self _addOnForCluster:v10];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = [v6 sessions];
  v56 = v6;
  uint64_t v57 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v57)
  {
    uint64_t v54 = *(void *)v69;
    uint64_t v53 = *MEMORY[0x263F33DE8];
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v69 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        objc_super v14 = [v6 sessions];
        v15 = [v14 objectForKey:v13];

        v16 = [v15 member];
        v17 = [MEMORY[0x263F087E8] errorWithDomain:v53 code:-1211 userInfo:0];
        v18 = (void *)[objc_alloc(MEMORY[0x263F33FA0]) initWithCommandType:2 error:v17 topic:v60 subTopic:v13];
        v19 = [MEMORY[0x263F08910] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
        if ([v15 producedSession]) {
          [NSString _commandTypeForConsumerWithSubTopic:v13];
        }
        else {
        objc_super v20 = [NSString _commandTypeForProducerWithSubTopic:v13];
        }
        v21 = [[COMessagingRequest alloc] initWithRequestID:arc4random() requestType:0 payload:v19 payloadType:v20 topic:v60];
        if (v11)
        {
          dispatch_group_enter(group);
          [MEMORY[0x263EFFA08] setWithObject:v16];
          v59 = v19;
          v22 = v18;
          __int16 v23 = v17;
          uint64_t v25 = v24 = v16;
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __34__COMessagingService__clientLost___block_invoke;
          v66[3] = &unk_2645CD9A0;
          v67 = group;
          [v11 sendRequest:v21 members:v25 withCompletionHandler:v66];

          v16 = v24;
          v17 = v23;
          v18 = v22;
          v19 = v59;
        }
        uint64_t v6 = v56;
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
    }
    while (v57);
  }

  dispatch_time_t v26 = dispatch_walltime(0, 10000000000);
  dispatch_group_wait(group, v26);
  v27 = v49;
  v28 = [(COMessagingService *)v49 requestHandlers];
  v29 = v48;
  v30 = [v28 objectForKey:v48];
  v31 = [v30 objectForKey:v60];

  if (v31)
  {
    v58 = v11;
    v32 = (void *)[v31 mutableCopy];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v55 = v31;
    id v33 = v31;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v63 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          v39 = [v33 objectForKeyedSubscript:v38];
          int v40 = [v39 isEqual:v52];

          if (v40)
          {
            v41 = COCoreLogForCategory(10);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              v73 = v49;
              __int16 v74 = 2112;
              v75 = v52;
              __int16 v76 = 2112;
              uint64_t v77 = v38;
              _os_log_impl(&dword_2217C1000, v41, OS_LOG_TYPE_DEFAULT, "%p Lost client %@ which had a request handler registered for class of type %@", buf, 0x20u);
            }

            [v32 removeObjectForKey:v38];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v78 count:16];
      }
      while (v35);
    }

    uint64_t v42 = [v32 count];
    v27 = v49;
    v43 = [(COMessagingService *)v49 requestHandlers];
    v29 = v48;
    v44 = [v43 objectForKey:v48];
    v45 = v44;
    if (v42)
    {
      [v44 setObject:v32 forKey:v60];
      uint64_t v6 = v56;
    }
    else
    {
      [v44 removeObjectForKey:v60];

      v46 = [(COMessagingService *)v49 requestHandlers];
      v43 = [v46 objectForKey:v48];

      uint64_t v6 = v56;
      if ([v43 count])
      {
        v11 = v58;
        v31 = v55;
        goto LABEL_32;
      }
      v45 = [(COMessagingService *)v49 requestHandlers];
      [v45 removeObjectForKey:v48];
    }
    v11 = v58;
    v31 = v55;

LABEL_32:
  }
  [(COService *)v27 _releaseAssertionForCluster:v29];
  v47 = [(COMessagingService *)v27 connectedClients];
  [v47 removeObjectForKey:v52];

  v61.receiver = v27;
  v61.super_class = (Class)COMessagingService;
  [(COService *)&v61 _clientLost:v52];
}

void __34__COMessagingService__clientLost___block_invoke(uint64_t a1)
{
}

- (void)activateMessageChannelForTopic:(id)a3 cluster:(id)a4 handlers:(id)a5 withCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p Activate message channel for topic %@ and cluster %@ with handlers %@", buf, 0x2Au);
  }

  v15 = [(COService *)self currentClient];
  v16 = [[COMessagingClientInfo alloc] initWithTopic:v10 cluster:v11 handledClasses:v12 client:v15 activateCompletionHanlder:v13];
  [(COService *)self _takeAssertionForCluster:v11];
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__COMessagingService_activateMessageChannelForTopic_cluster_handlers_withCompletion___block_invoke;
  v19[3] = &unk_2645CD9C8;
  objc_copyWeak(&v22, (id *)buf);
  id v17 = v11;
  id v20 = v17;
  v18 = v16;
  v21 = v18;
  [(COService *)self _addOnForCluster:v17 completion:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __85__COMessagingService_activateMessageChannelForTopic_cluster_handlers_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained _completeActivationForClient:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v6 = COCoreLogForCategory(10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v14 = 134218242;
        v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p Cluster %@ is currently unavailable. Channel activation will wait for cluster availability", (uint8_t *)&v14, 0x16u);
      }

      uint64_t v8 = [v5 outstandingActivateCompletionHandlers];
      uint64_t v9 = [v8 objectForKey:*(void *)(a1 + 32)];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x263EFF9C0] set];
      }
      id v12 = v11;

      [v12 addObject:*(void *)(a1 + 40)];
      id v13 = [v5 outstandingActivateCompletionHandlers];
      [v13 setObject:v12 forKey:*(void *)(a1 + 32)];
    }
  }
}

- (void)_completeActivationForClient:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 client];
  if (v5)
  {
    uint64_t v37 = [v4 completionHandler];
    [v4 setCompletionHandler:0];
    uint64_t v36 = [(COMessagingService *)self meter];
    uint64_t v35 = [v5 clientBundleIdentifier];
    uint64_t v6 = [v4 topic];
    uint64_t v7 = [v4 cluster];
    uint64_t v8 = [(COMessagingService *)self connectedClients];
    uint64_t v42 = v5;
    [v8 setObject:v4 forKey:v5];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v38 = v4;
    uint64_t v9 = v4;
    id v10 = (void *)v6;
    obuint64_t j = [v9 handledClasses];
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    int v40 = (void *)v6;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v41 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v15 = [(COMessagingService *)self requestHandlers];
          __int16 v16 = [v15 objectForKey:v7];

          if (v16)
          {
            uint64_t v17 = [v16 objectForKeyedSubscript:v10];
            uint64_t v18 = v17;
            if (v17)
            {
              uint64_t v19 = [v17 objectForKeyedSubscript:v14];
              if (v19)
              {
                __int16 v29 = (void *)v19;
                id v30 = COCoreLogForCategory(10);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  [(COMessagingService *)(uint64_t)self _completeActivationForClient:v30];
                }

                uint64_t v31 = (void *)MEMORY[0x263F087E8];
                uint64_t v32 = *MEMORY[0x263F33DD8];
                uint64_t v47 = *MEMORY[0x263F33DE0];
                uint64_t v48 = v14;
                id v33 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
                uint64_t v34 = [v31 errorWithDomain:v32 code:-1100 userInfo:v33];

                __int16 v27 = (void *)v35;
                id v26 = v36;
                id v28 = (void *)v37;
                (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v37 + 16))(v37, v34, [v36 sendLimitForIdentifier:v35], objc_msgSend(v36, "receiveLimitForIdentifier:", v35));

                goto LABEL_20;
              }
              id v20 = [(COMessagingService *)self requestHandlers];
              v21 = [v20 objectForKey:v7];
              id v22 = [v21 objectForKey:v10];
              __int16 v23 = v22;
              v24 = v42;
              uint64_t v25 = v14;
            }
            else
            {
              id v20 = [MEMORY[0x263EFF9A0] dictionary];
              [v20 setObject:v42 forKey:v14];
              v21 = [(COMessagingService *)self requestHandlers];
              id v22 = [v21 objectForKey:v7];
              uint64_t v25 = (uint64_t)v10;
              __int16 v23 = v22;
              v24 = v20;
            }
            [v22 setObject:v24 forKey:v25];

            id v10 = v40;
          }
          else
          {
            uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
            id v20 = [MEMORY[0x263EFF9A0] dictionary];
            [v20 setObject:v42 forKey:v14];
            [v18 setObject:v20 forKey:v10];
            v21 = [(COMessagingService *)self requestHandlers];
            [v21 setObject:v18 forKey:v7];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    __int16 v27 = (void *)v35;
    id v26 = v36;
    id v28 = (void *)v37;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 16))(v37, 0, [v36 sendLimitForIdentifier:v35], objc_msgSend(v36, "receiveLimitForIdentifier:", v35));
LABEL_20:
    id v4 = v38;
    v5 = v42;
  }
}

- (void)sendRequestWithPayload:(id)a3 payloadType:(id)a4 requestType:(int64_t)a5 requestID:(unsigned int)a6 members:(id)a7 activityToken:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v44 = a4;
  id v43 = a7;
  id v40 = a8;
  uint64_t v14 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a5;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v44;
    __int16 v82 = 2112;
    id v83 = v43;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p Service got request %u of type %ld and payload type %@ directed to members %@", buf, 0x30u);
  }

  v15 = [(COService *)self currentClient];
  __int16 v16 = [(COMessagingService *)self connectedClients];
  long long v45 = [v16 objectForKey:v15];

  uint64_t v17 = [v45 cluster];
  uint64_t v42 = [(COService *)self _addOnForCluster:v17];

  uint64_t v41 = [v15 connection];
  uint64_t v18 = [(COMessagingService *)self meter];
  uint64_t v19 = [v15 clientBundleIdentifier];
  if (objc_msgSend(v18, "clientIdentifier:canSendLength:", v19, objc_msgSend(v46, "length")))
  {
    if (v42)
    {
      id v20 = [COMessagingRequest alloc];
      v21 = [v45 topic];
      id v22 = [(COMessagingRequest *)v20 initWithRequestID:v10 requestType:a5 payload:v46 payloadType:v44 topic:v21];

      if (v40)
      {
        __int16 v23 = (void *)nw_activity_create_from_xpc_token();
        v24 = +[CONetworkActivityFactory activityWithLabel:5 parentActivity:v23];

        if (!v24) {
          goto LABEL_16;
        }
      }
      else
      {
        v24 = +[CONetworkActivityFactory activityWithLabel:5 parentActivity:0];
        if (!v24)
        {
LABEL_16:
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          *(void *)&buf[24] = 0;
          v72[0] = 0;
          v72[1] = v72;
          v72[2] = 0x2020000000;
          v72[3] = 0;
          v70[0] = 0;
          v70[1] = v70;
          v70[2] = 0x2020000000;
          uint64_t v71 = 0;
          uint64_t v71 = [v43 count];
          uint64_t v31 = [v46 length];
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_104;
          v61[3] = &unk_2645CDA18;
          long long v65 = buf;
          v66 = v72;
          v67 = v70;
          id v39 = v24;
          id v62 = v39;
          int64_t v68 = a5;
          uint64_t v69 = v31;
          id v63 = v44;
          id v32 = v15;
          id v64 = v32;
          id v33 = (void *)MEMORY[0x223C8B4A0](v61);
          objc_initWeak(&location, self);
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2;
          v53[3] = &unk_2645CDA68;
          id v34 = v33;
          id v57 = v34;
          objc_copyWeak(&v58, &location);
          id v54 = v18;
          id v55 = v19;
          int v59 = v10;
          id v35 = v32;
          id v56 = v35;
          uint64_t v36 = (void *)MEMORY[0x223C8B4A0](v53);
          if (a5 == 1)
          {
            v47[0] = MEMORY[0x263EF8330];
            v47[1] = 3221225472;
            v47[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_113;
            v47[3] = &unk_2645CDAB8;
            uint64_t v50 = v70;
            id v49 = v34;
            objc_copyWeak(&v51, &location);
            id v48 = v35;
            int v52 = v10;
            objc_msgSend(v42, "broadcastRequest:recipientsCallback:completionHandler:", v22, v47, v36, v39);

            objc_destroyWeak(&v51);
          }
          else if (!a5)
          {
            objc_msgSend(v42, "sendRequest:members:withCompletionHandler:", v22, v43, v36, v39);
          }

          objc_destroyWeak(&v58);
          objc_destroyWeak(&location);

          _Block_object_dispose(v70, 8);
          _Block_object_dispose(v72, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_21;
        }
      }
      [(COMeshRequest *)v22 setActivity:v24];
      nw_activity_activate();
      goto LABEL_16;
    }
    id v28 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[COMessagingService sendRequestWithPayload:payloadType:requestType:requestID:members:activityToken:]((uint64_t)self, v45, v28);
    }

    __int16 v29 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33DC0] code:-2001 userInfo:0];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_102;
    v73[3] = &unk_2645CD9F0;
    v73[4] = self;
    id v74 = v29;
    id v75 = v41;
    int v76 = v10;
    id v22 = v29;
    id v30 = [v75 remoteObjectProxyWithErrorHandler:v73];
    [v30 failedToSendRequestWithID:v10 withError:v22];
  }
  else
  {
    uint64_t v25 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = [v46 length];
      uint64_t v38 = [v18 sendLimitForIdentifier:v19];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v38;
      _os_log_error_impl(&dword_2217C1000, v25, OS_LOG_TYPE_ERROR, "%p Service got a request of size %ld which is greater than max allowable size limit %ld", buf, 0x20u);
    }

    id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33DD8] code:-1102 userInfo:0];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke;
    v77[3] = &unk_2645CD9F0;
    v77[4] = self;
    id v78 = v26;
    id v79 = v41;
    int v80 = v10;
    id v22 = v26;
    __int16 v27 = [v79 remoteObjectProxyWithErrorHandler:v77];
    [v27 failedToSendRequestWithID:v10 withError:v22];
  }
LABEL_21:
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke()
{
  v0 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1();
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_102()
{
  v0 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1();
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_104(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  ++*(void *)(*(void *)(v4 + 8) + 24);
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) <= *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24)
                                                                    + *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 24)
    && *(void *)(a1 + 32))
  {
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    if (xdict)
    {
      xpc_dictionary_set_int64(xdict, "type", *(void *)(a1 + 80));
      xpc_dictionary_set_uint64(xdict, "size", *(void *)(a1 + 88));
      xpc_dictionary_set_string(xdict, "command", (const char *)[*(id *)(a1 + 40) UTF8String]);
      v5 = [*(id *)(a1 + 48) clientBundleIdentifier];
      uint64_t v6 = v5;
      if (!v5)
      {
        v2 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v6 = [v2 bundleIdentifier];
      }
      xpc_dictionary_set_string(xdict, "client", (const char *)[v6 UTF8String]);
      if (!v5)
      {
      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    id v13 = [WeakRetained dispatchQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3;
    v14[3] = &unk_2645CDA40;
    id v15 = v9;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = v12;
    int v22 = *(_DWORD *)(a1 + 72);
    id v19 = v8;
    id v20 = *(id *)(a1 + 48);
    id v21 = v10;
    dispatch_async(v13, v14);
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [v2 payload];
  LOBYTE(v3) = objc_msgSend(v3, "clientIdentifier:canReceiveLength:", v4, objc_msgSend(v5, "length"));

  if (v3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      id v26 = [v2 payload];
      uint64_t v27 = [v26 length];
      uint64_t v28 = [*(id *)(a1 + 40) receiveLimitForIdentifier:*(void *)(a1 + 48)];
      int v29 = *(_DWORD *)(a1 + 88);
      *(_DWORD *)buf = 134218752;
      uint64_t v39 = v25;
      __int16 v40 = 2048;
      uint64_t v41 = v27;
      __int16 v42 = 2048;
      *(void *)id v43 = v28;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)&v43[10] = v29;
      _os_log_error_impl(&dword_2217C1000, v7, OS_LOG_TYPE_ERROR, "%p Response message is too big (%ld > %ld) for request ID %u", buf, 0x26u);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33DD8] code:-1103 userInfo:0];
  }
  id v8 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(_DWORD *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218754;
    uint64_t v39 = v11;
    __int16 v40 = 2112;
    uint64_t v41 = v9;
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = v10;
    *(_WORD *)&v43[4] = 2112;
    *(void *)&v43[6] = v12;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p Received response %@ for request %u from node %@", buf, 0x26u);
  }

  id v13 = [*(id *)(a1 + 64) memberSnapshot];
  uint64_t v14 = [*(id *)(a1 + 72) connection];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  id v32 = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_111;
  id v33 = &unk_2645CD9F0;
  uint64_t v34 = *(void *)(a1 + 56);
  id v15 = v14;
  id v35 = v15;
  id v36 = *(id *)(a1 + 64);
  int v37 = *(_DWORD *)(a1 + 88);
  id v16 = [v15 remoteObjectProxyWithErrorHandler:&v30];
  id v17 = v16;
  if (v6)
  {
    objc_msgSend(v16, "receivedResponseForRequestID:responsePayload:responseType:responseError:fromMember:", *(unsigned int *)(a1 + 88), 0, 0, v6, v13, v30, v31, v32, v33, v34, v35);
  }
  else
  {
    id v18 = *(id *)(a1 + 80);
    id v19 = *(void **)(a1 + 80);
    if (v19)
    {
      objc_msgSend(v19, "domain", v30, v31, v32, v33, v34, v35);
      id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v20 == @"COMeshControllerErrorDomain"
        && (unint64_t)([*(id *)(a1 + 80) code] + 4101) <= 1)
      {
        uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33DD8] code:-1109 userInfo:0];

        id v18 = (id)v21;
      }
    }
    uint64_t v22 = *(unsigned int *)(a1 + 88);
    __int16 v23 = objc_msgSend(v2, "payload", v30, v31, v32, v33, v34);
    v24 = [v2 payloadType];
    [v17 receivedResponseForRequestID:v22 responsePayload:v23 responseType:v24 responseError:v18 fromMember:v13];
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_111()
{
  v0 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_111_cold_1();
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained dispatchQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2_114;
    v7[3] = &unk_2645CDA90;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = v5;
    id v10 = v3;
    int v11 = *(_DWORD *)(a1 + 64);
    dispatch_async(v6, v7);
  }
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_2_114(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_115;
  v16[3] = &unk_2645CD9F0;
  v16[4] = *(void *)(a1 + 40);
  id v3 = v2;
  id v17 = v3;
  id v18 = *(id *)(a1 + 48);
  int v19 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v16];
  v5 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "memberSnapshot", (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v8);
  }

  [v4 receivedRecipientListForRequestID:*(unsigned int *)(a1 + 56) recipients:v5];
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_115()
{
  v0 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_115_cold_1();
  }
}

- (void)sessionStartedForSubTopic:(id)a3 withMember:(id)a4 produced:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v14 = [(COService *)self currentClient];
  uint64_t v10 = [(COMessagingService *)self connectedClients];
  int v11 = [v10 objectForKey:v14];

  long long v12 = [[COMessagingSessionInfo alloc] initWithSubTopic:v9 member:v8 produced:v5];
  long long v13 = [v11 sessions];
  [v13 setObject:v12 forKey:v9];
}

- (void)sessionEndedForSubTopic:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(COService *)self currentClient];
  BOOL v5 = [(COMessagingService *)self connectedClients];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [v6 sessions];
    [v7 removeObjectForKey:v8];
  }
}

- (void)addOn:(id)a3 receivedRequest:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(COService *)self dispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke;
  v15[3] = &unk_2645CB4D0;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = [v2 payloadType];
    *(_DWORD *)buf = 134218498;
    uint64_t v56 = v4;
    __int16 v57 = 2112;
    id v58 = v2;
    __int16 v59 = 2112;
    v60 = v5;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p Received a request %@ of type %@", buf, 0x20u);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [*(id *)(a1 + 40) _clustersForAddOn:*(void *)(a1 + 48)];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v50;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v49 + 1) + 8 * v9);
        int v11 = [*(id *)(a1 + 40) requestHandlers];
        id v12 = [v11 objectForKey:v10];

        id v13 = [v2 topic];
        id v14 = [v12 objectForKey:v13];

        long long v15 = [v2 payloadType];
        id v16 = [v14 objectForKey:v15];

        if (v16)
        {

          id v26 = [v16 connection];
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_119;
          v45[3] = &unk_2645CDAE0;
          v45[4] = *(void *)(a1 + 40);
          id v27 = v16;
          id v46 = v27;
          id v28 = v2;
          id v47 = v28;
          id v48 = *(id *)(a1 + 56);
          int v29 = [v26 remoteObjectProxyWithErrorHandler:v45];

          uint64_t v30 = [*(id *)(a1 + 32) sender];
          uint64_t v31 = [v30 memberSnapshot];

          objc_initWeak((id *)buf, *(id *)(a1 + 40));
          id v32 = [v28 payload];
          id v33 = [v28 payloadType];
          uint64_t v34 = [v28 requestID];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_120;
          v41[3] = &unk_2645CDB30;
          objc_copyWeak(&v44, (id *)buf);
          id v35 = v27;
          id v42 = v35;
          id v43 = *(id *)(a1 + 56);
          [v29 receivedRequestWithPayload:v32 payloadType:v33 requestID:v34 fromMember:v31 withCallback:v41];

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);

          goto LABEL_23;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = objc_msgSend(*(id *)(a1 + 40), "connectedClients", 0);
  id v18 = [v17 allValues];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    while (2)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = [*(id *)(*((void *)&v37 + 1) + 8 * v21) topic];
        __int16 v23 = [v2 topic];
        char v24 = [v22 isEqualToString:v23];

        if (v24)
        {
          uint64_t v25 = -1101;
          goto LABEL_22;
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v53 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  uint64_t v25 = -1114;
LABEL_22:

  id v36 = objc_alloc(MEMORY[0x263F087E8]);
  id v35 = (id)[v36 initWithDomain:*MEMORY[0x263F33DD8] code:v25 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_23:
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_119(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_119_cold_1();
  }

  BOOL v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F33DD8];
  uint64_t v9 = *MEMORY[0x263F08608];
  v10[0] = v3;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v8 = [v5 errorWithDomain:v6 code:-1115 userInfo:v7];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_120(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained dispatchQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_2;
    v13[3] = &unk_2645CDB08;
    v13[4] = v11;
    id v14 = a1[4];
    id v15 = v7;
    id v18 = a1[5];
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v12, v13);
  }
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) meter];
  id v3 = [*(id *)(a1 + 40) clientBundleIdentifier];
  char v4 = objc_msgSend(v2, "clientIdentifier:canReceiveLength:", v3, objc_msgSend(*(id *)(a1 + 48), "length"));

  if (v4)
  {
    id v8 = objc_alloc_init(COMessagingResponse);
    [(COMessagingResponse *)v8 setPayload:*(void *)(a1 + 48)];
    [(COMessagingResponse *)v8 setPayloadType:*(void *)(a1 + 56)];
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33DD8] code:-1103 userInfo:0];
    BOOL v5 = *(void (**)(void))(v6 + 16);
    id v8 = (COMessagingResponse *)v7;
  }
  v5();
}

- (void)_addOnAdded:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDelegate:self];
  uint64_t v19 = v4;
  BOOL v5 = [(COService *)self _clustersForAddOn:v4];
  uint64_t v6 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v35 = self;
    __int16 v36 = 2112;
    long long v37 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p Add-on added for clusters %@", buf, 0x16u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v5;
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v7;
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        id v9 = [(COMessagingService *)self outstandingActivateCompletionHandlers];
        uint64_t v10 = [v9 objectForKey:v8];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              id v17 = COCoreLogForCategory(10);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                id v35 = self;
                __int16 v36 = 2112;
                long long v37 = v8;
                _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "%p Invoking clients waiting on message channel activation for cluster %@", buf, 0x16u);
              }

              [(COMessagingService *)self _completeActivationForClient:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v13);
        }

        if (v11)
        {
          id v18 = [(COMessagingService *)self outstandingActivateCompletionHandlers];
          [v18 removeObjectForKey:v8];
        }
        uint64_t v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)_addOnRemoved:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDelegate:0];
  BOOL v5 = [(COService *)self _clustersForAddOn:v4];

  uint64_t v6 = COCoreLogForCategory(10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p Add-on removed for clusters %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  id v3 = [a3 configuration];
  unint64_t v4 = ((unint64_t)[v3 requiredServices] >> 3) & 1;

  return v4;
}

- (NSMutableDictionary)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
}

- (_COMessagingServiceMeter)meter
{
  return self->_meter;
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
}

- (NSMutableDictionary)outstandingActivateCompletionHandlers
{
  return self->_outstandingActivateCompletionHandlers;
}

- (void)setOutstandingActivateCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingActivateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_meter, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
}

- (void)_completeActivationForClient:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%p Found a client already registered for requests of type %@", (uint8_t *)&v3, 0x16u);
}

- (void)sendRequestWithPayload:(NSObject *)a3 payloadType:requestType:requestID:members:activityToken:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v5 = [a2 cluster];
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "%p add-on for cluster %@ doesn't exist on service", (uint8_t *)&v6, 0x16u);
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  [*(id *)(v0 + 48) processIdentifier];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_4(&dword_2217C1000, v1, v2, "%p Failed to deliver an error %@ to client (%d) for request ID %u", v3, v4, v5, v6, v7);
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  [*(id *)(v0 + 40) processIdentifier];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_2217C1000, v1, v2, "%p Failed to notify client (%d) of response from %@ for request ID %u", v3, v4, v5, v6, v7);
}

void __101__COMessagingService_sendRequestWithPayload_payloadType_requestType_requestID_members_activityToken___block_invoke_3_115_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  [*(id *)(v0 + 40) processIdentifier];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_2217C1000, v1, v2, "%p Failed to notify client (%d) of the recipient list %@ for request ID %u", v3, v4, v5, v6, v7);
}

void __53__COMessagingService_addOn_receivedRequest_callback___block_invoke_119_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = [*(id *)(v2 + 40) connection];
  int v5 = [v4 processIdentifier];
  uint64_t v6 = *(void *)(v1 + 48);
  int v7 = 134218498;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%p Client (%d) lost during the processing of request %@", (uint8_t *)&v7, 0x1Cu);
}

@end