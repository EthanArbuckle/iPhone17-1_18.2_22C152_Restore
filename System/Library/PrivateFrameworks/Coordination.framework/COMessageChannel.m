@interface COMessageChannel
+ (COMessageChannel)messageChannelWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5;
- (BOOL)activated;
- (COClusterRoleMonitor)clusterRoleMonitor;
- (COClusterRoleMonitorConnectionProvider)roleMonitorConnectionProvider;
- (COMessageChannel)initWithConnectionProvider:(id)a3 roleMonitorConnectionProvider:(id)a4 topic:(id)a5 cluster:(id)a6;
- (COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4;
- (COMessageChannelConnectionProvider)provider;
- (Class)_payloadClassFromType:(id)a3;
- (NSMutableDictionary)outstandingRequests;
- (NSMutableDictionary)requestHandlers;
- (NSMutableDictionary)roleSnapshotsCache;
- (NSMutableDictionary)sessionConsumers;
- (NSMutableDictionary)sessionProducers;
- (NSMutableDictionary)sessionsInflight;
- (NSSet)groupedHomeKitIdentifiers;
- (NSString)clusterLabel;
- (NSString)topic;
- (NSXPCConnection)lastConnection;
- (OS_dispatch_queue)workQueue;
- (id)_payloadTypeFromClass:(Class)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)cluster;
- (id)foundHandler;
- (id)lostHandler;
- (id)recorder;
- (os_unfair_lock_s)lock;
- (unint64_t)receiveLimit;
- (unint64_t)sendLimit;
- (unsigned)_generateRequestID;
- (unsigned)baseRequestID;
- (void)_activateWithCompletion:(id)a3;
- (void)_broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6;
- (void)_callbackProducersAndConsumersAfterActivationWithError:(id)a3;
- (void)_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6;
- (void)_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5;
- (void)_deliverFailedToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5;
- (void)_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5;
- (void)_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6;
- (void)_handleAddedMembers:(id)a3;
- (void)_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5;
- (void)_handleRemovedMembers:(id)a3;
- (void)_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5;
- (void)_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5;
- (void)_invokeResponseCallbackForInfo:(id)a3 snapshot:(id)a4 response:(id)a5 error:(id)a6;
- (void)_lostConnectionToService;
- (void)_sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6;
- (void)_setupClusterMonitor;
- (void)_startSessionWithProducer:(id)a3 member:(id)a4;
- (void)_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5;
- (void)_submitMetricsForActivationCompletionWithError:(id)a3;
- (void)_submitMetricsForRequest:(id)a3 withRequestInfo:(id)a4 withError:(id)a5;
- (void)_submitMetricsForResponse:(id)a3 size:(unint64_t)a4 withError:(id)a5;
- (void)_submitMetricsForSession:(id)a3 withError:(id)a4;
- (void)_withLock:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5;
- (void)broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6;
- (void)dealloc;
- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4;
- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4;
- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7;
- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7;
- (void)registerHandler:(id)a3 forRequestClass:(Class)a4;
- (void)registerHandler:(id)a3 forRequestClassType:(id)a4;
- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5;
- (void)sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6;
- (void)sendRequest:(id)a3 type:(id)a4 withCompletionHandler:(id)a5;
- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)setActivated:(BOOL)a3;
- (void)setBaseRequestID:(unsigned int)a3;
- (void)setClusterRoleMonitor:(id)a3;
- (void)setFoundHandler:(id)a3;
- (void)setLastConnection:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLostHandler:(id)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setReceiveLimit:(unint64_t)a3;
- (void)setRecorder:(id)a3;
- (void)setRequestHandlers:(id)a3;
- (void)setRoleSnapshotsCache:(id)a3;
- (void)setSendLimit:(unint64_t)a3;
- (void)setSessionConsumers:(id)a3;
- (void)setSessionProducers:(id)a3;
- (void)setSessionsInflight:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startSessionWithProducer:(id)a3 members:(id)a4;
- (void)stopMessageSession:(id)a3 withNotice:(id)a4;
- (void)unregisterHandlerForRequestClass:(Class)a3;
- (void)unregisterHandlerForRequestClassType:(id)a3;
@end

@implementation COMessageChannel

- (COMessageChannel)initWithConnectionProvider:(id)a3 roleMonitorConnectionProvider:(id)a4 topic:(id)a5 cluster:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a5;
  id v14 = a6;
  v41.receiver = self;
  v41.super_class = (Class)COMessageChannel;
  v15 = [(COMessageChannel *)&v41 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topic, a5);
    objc_storeStrong(&v16->_cluster, a6);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coordination.messageChannel.%p", v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v20;

    v16->_lock._os_unfair_lock_opaque = 0;
    v16->_baseRequestID = arc4random();
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    sessionConsumers = v16->_sessionConsumers;
    v16->_sessionConsumers = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    sessionProducers = v16->_sessionProducers;
    v16->_sessionProducers = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    sessionsInflight = v16->_sessionsInflight;
    v16->_sessionsInflight = (NSMutableDictionary *)v28;

    if (v11 | v12)
    {
      objc_storeStrong((id *)&v16->_provider, a3);
      objc_storeStrong((id *)&v16->_roleMonitorConnectionProvider, a4);
      if (+[COFeatureStatus isCOClusterEnabled]) {
        [v14 label];
      }
      else {
      uint64_t v30 = +[COCluster inferClusterLabelFromCluster:v14];
      }
      clusterLabel = v16->_clusterLabel;
      v16->_clusterLabel = (NSString *)v30;

      uint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
      outstandingRequests = v16->_outstandingRequests;
      v16->_outstandingRequests = (NSMutableDictionary *)v32;

      uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
      roleSnapshotsCache = v16->_roleSnapshotsCache;
      v16->_roleSnapshotsCache = (NSMutableDictionary *)v34;

      id recorder = v16->_recorder;
      v16->_id recorder = &__block_literal_global_5;

      v37 = COLogForCategory(5);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 134218754;
        v43 = v16;
        __int16 v44 = 2112;
        id v45 = v13;
        __int16 v46 = 2112;
        id v47 = v14;
        __int16 v48 = 2112;
        v49 = v39;
        _os_log_impl(&dword_21D3E0000, v37, OS_LOG_TYPE_DEFAULT, "%p message channel created with topic %@, cluster %@ and %@ provider", buf, 0x2Au);
      }
    }
  }

  return v16;
}

uint64_t __91__COMessageChannel_initWithConnectionProvider_roleMonitorConnectionProvider_topic_cluster___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F18A48](a2, a3);
}

- (COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4
{
  id v6 = a3;
  v7 = +[COCluster _clusterForCluster:a4];
  v8 = objc_alloc_init(_COMessageChannelConnectionProvider);
  v9 = [(COMessageChannel *)self initWithConnectionProvider:v8 roleMonitorConnectionProvider:0 topic:v6 cluster:v7];

  return v9;
}

+ (COMessageChannel)messageChannelWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  if (+[COFeatureStatus isNoDaemonMessageChannelEnabled])
  {
    BOOL v9 = !v5;
  }
  else
  {
    BOOL v9 = 1;
  }
  if (v9) {
    v10 = [[COMessageChannel alloc] initWithTopic:v8 cluster:v7];
  }
  else {
    v10 = [[_COMessageChannel alloc] initWithTopic:v8 cluster:v7 manualGrouping:1];
  }
  unint64_t v11 = v10;

  return (COMessageChannel *)v11;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__COMessageChannel_dealloc__block_invoke;
  v4[3] = &unk_2644445A8;
  v4[4] = self;
  [(COMessageChannel *)self _withLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)COMessageChannel;
  [(COMessageChannel *)&v3 dealloc];
}

void __27__COMessageChannel_dealloc__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lastConnection];
  v1 = objc_msgSend(v3, "co_originalInterruptionHandler");
  objc_msgSend(v3, "co_setOriginalInterruptionHandler:", v1);

  v2 = objc_msgSend(v3, "co_originalInvalidationHandler");
  objc_msgSend(v3, "co_setOriginalInvalidationHandler:", v2);

  [v3 invalidate];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__COMessageChannel_activateWithCompletion___block_invoke;
  block[3] = &unk_264444F70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__COMessageChannel_activateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _activateWithCompletion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(COMessageChannel *)self _payloadTypeFromClass:objc_opt_class()];
  [(COMessageChannel *)self sendRequest:v7 type:v8 withCompletionHandler:v6];
}

- (void)sendRequest:(id)a3 type:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__COMessageChannel_sendRequest_type_withCompletionHandler___block_invoke;
  v15[3] = &unk_264444508;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

uint64_t __59__COMessageChannel_sendRequest_type_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 48) members:0 withCompletionHandler:*(void *)(a1 + 56)];
}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(COMessageChannel *)self _payloadTypeFromClass:objc_opt_class()];
  [(COMessageChannel *)self sendRequest:v10 type:v11 members:v9 withCompletionHandler:v8];
}

- (void)sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__COMessageChannel_sendRequest_type_members_withCompletionHandler___block_invoke;
  block[3] = &unk_264444838;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(workQueue, block);
}

uint64_t __67__COMessageChannel_sendRequest_type_members_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 48) members:*(void *)(a1 + 56) withCompletionHandler:*(void *)(a1 + 64)];
}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(COMessageChannel *)self _payloadTypeFromClass:objc_opt_class()];
  [(COMessageChannel *)self broadcastRequest:v10 type:v11 recipientsCallback:v9 responseCompletionHandler:v8];
}

- (void)broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__COMessageChannel_broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke;
  block[3] = &unk_264444F98;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(workQueue, block);
}

uint64_t __87__COMessageChannel_broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _broadcastRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 48) recipientsCallback:*(void *)(a1 + 56) responseCompletionHandler:*(void *)(a1 + 64)];
}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(COMessageChannel *)self _payloadTypeFromClass:a4];
  [(COMessageChannel *)self registerHandler:v6 forRequestClassType:v7];
}

- (void)registerHandler:(id)a3 forRequestClassType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke;
  block[3] = &unk_264444FC0;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke(void *a1)
{
  uint64_t v3 = (uint64_t)(a1 + 4);
  v2 = (unsigned char *)a1[4];
  if (v2[8])
  {
    id v4 = COLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id v12 = [v2 requestHandlers];
    id v11 = (void *)MEMORY[0x21D4BD7F0](a1[6]);
    [v12 setObject:v11 forKey:a1[5]];
  }
}

- (void)unregisterHandlerForRequestClass:(Class)a3
{
  id v4 = [(COMessageChannel *)self _payloadTypeFromClass:a3];
  [(COMessageChannel *)self unregisterHandlerForRequestClassType:v4];
}

- (void)unregisterHandlerForRequestClassType:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke;
  v7[3] = &unk_2644444E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    id v4 = COLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    id v11 = [v2 requestHandlers];
    [v11 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_264444FE8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v3 = COLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1();
    }

    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1202 userInfo:0];
    if (objc_opt_respondsToSelector())
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_59;
      block[3] = &unk_264444FE8;
      uint64_t v5 = *(NSObject **)(a1 + 56);
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      id v19 = v6;
      uint64_t v20 = v7;
      id v21 = v8;
      id v4 = v4;
      id v22 = v4;
      dispatch_async(v5, block);
    }
  }
  else
  {
    id v4 = [NSString _commandTypeForProducerWithSubTopic:*(void *)(a1 + 40)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    v14[3] = &unk_264445010;
    objc_copyWeak(&v16, &location);
    id v15 = *(id *)(a1 + 40);
    id v9 = (void *)MEMORY[0x21D4BD7F0](v14);
    id v10 = [*(id *)(a1 + 32) requestHandlers];
    id v11 = (void *)MEMORY[0x21D4BD7F0](v9);
    [v10 setObject:v11 forKey:v4];

    id v12 = [[COMessageSessionProducer alloc] initWithChannel:*(void *)(a1 + 32) subTopic:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48) dispatchQueue:*(void *)(a1 + 56)];
    id v13 = [*v2 sessionProducers];
    [v13 setObject:v12 forKey:*(void *)(a1 + 40)];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

uint64_t __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddProducerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = v7;
    if ([v11 commandType] == 2)
    {
      [WeakRetained _handleStopCommand:v11 fromMember:v8 callback:v9];
    }
    else if ([v11 commandType])
    {
      id v12 = COLogForCategory(6);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2_cold_1();
      }
    }
    else
    {
      [WeakRetained _handleCapableCommand:v11 fromMember:v8 callback:v9];
    }
  }
}

- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_264444FE8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v3 = COLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1();
    }

    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1203 userInfo:0];
    if (objc_opt_respondsToSelector())
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_64;
      block[3] = &unk_264444FE8;
      uint64_t v5 = *(NSObject **)(a1 + 56);
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      id v21 = v6;
      uint64_t v22 = v7;
      id v23 = v8;
      id v4 = v4;
      id v24 = v4;
      dispatch_async(v5, block);
    }
  }
  else
  {
    id v4 = [NSString _commandTypeForConsumerWithSubTopic:*(void *)(a1 + 40)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    id v17 = &unk_264445038;
    objc_copyWeak(&v18, &location);
    id v9 = (void *)MEMORY[0x21D4BD7F0](&v14);
    id v10 = objc_msgSend(*(id *)(a1 + 32), "requestHandlers", v14, v15, v16, v17);
    id v11 = (void *)MEMORY[0x21D4BD7F0](v9);
    [v10 setObject:v11 forKey:v4];

    id v12 = [[COMessageSessionConsumer alloc] initWithChannel:*(void *)(a1 + 32) subTopic:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48) dispatchQueue:*(void *)(a1 + 56)];
    id v13 = [*v2 sessionConsumers];
    [v13 setObject:v12 forKey:*(void *)(a1 + 40)];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

uint64_t __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddConsumerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[13];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    v13[3] = &unk_264444508;
    id v14 = v7;
    uint64_t v15 = v11;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v12, v13);
  }
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if ([v2 commandType] == 1)
  {
    uint64_t v3 = COLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [v2 subTopic];
      uint64_t v6 = *(void *)(a1 + 48);
      int v13 = 134218498;
      uint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_21D3E0000, v3, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to start a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 40) _handleStartCommand:v2 withMember:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = [v2 commandType];
    id v8 = COLogForCategory(5);
    id v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = [v2 subTopic];
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = 134218498;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to stop a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);
      }
      [*(id *)(a1 + 40) _handleStopCommand:v2 fromMember:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(a1, v2, v9);
      }
    }
  }
}

- (void)startSessionWithProducer:(id)a3 members:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        workQueue = self->_workQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __53__COMessageChannel_startSessionWithProducer_members___block_invoke;
        block[3] = &unk_2644448B0;
        void block[4] = self;
        id v15 = v6;
        uint64_t v16 = v11;
        dispatch_async(workQueue, block);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

uint64_t __53__COMessageChannel_startSessionWithProducer_members___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSessionWithProducer:*(void *)(a1 + 40) member:*(void *)(a1 + 48)];
}

- (void)stopMessageSession:(id)a3 withNotice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke;
  block[3] = &unk_2644448B0;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __50__COMessageChannel_stopMessageSession_withNotice___block_invoke(id *a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] member];
  uint64_t v3 = COLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 134218498;
    id v52 = v4;
    __int16 v53 = 2112;
    v54 = v5;
    __int16 v55 = 2112;
    v56 = v2;
    _os_log_impl(&dword_21D3E0000, v3, OS_LOG_TYPE_DEFAULT, "%p Stopping session %@ with member %@", buf, 0x20u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = [a1[5] roleSnapshotsCache];
  id v7 = [v6 allValues];

  uint64_t v8 = 0;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        int v13 = [v12 member];
        BOOL v14 = [v13 memberType] == 1;

        if (v14)
        {
          id v15 = v12;

          uint64_t v8 = v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v9);
  }

  if (a1[6])
  {
    [a1[4] setDidUseNotice:1];
    id v16 = a1[6];
    id v43 = 0;
    long long v17 = [MEMORY[0x263F08910] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v43];
    id v18 = v43;
    if (v18)
    {
      long long v19 = v18;
      long long v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08608];
      id v49 = v18;
      id v21 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v22 = [v20 errorWithDomain:@"COMessageSessionErrorDomain" code:-1205 userInfo:v21];

      id v23 = COLogForCategory(6);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v37 = a1[4];
        id v36 = a1[5];
        *(_DWORD *)buf = 134218498;
        id v52 = v36;
        __int16 v53 = 2112;
        v54 = v22;
        __int16 v55 = 2112;
        v56 = v37;
        _os_log_error_impl(&dword_21D3E0000, v23, OS_LOG_TYPE_ERROR, "%p Failed to encode request with error %@ when stopping session %@", buf, 0x20u);
      }

      [a1[5] _deliverDidEndDelegateForSession:a1[4] notice:a1[6] initiator:v8 error:v22];
      id v24 = 0;
    }
    else
    {
      v27 = [COMessageSessionManagementRequest alloc];
      uint64_t v22 = [a1[5] _payloadTypeFromClass:objc_opt_class()];
      uint64_t v28 = [a1[5] topic];
      v29 = [a1[4] subTopic];
      id v24 = [(COMessageSessionManagementRequest *)v27 initWithCommandType:2 payload:v17 payloadType:v22 topic:v28 subTopic:v29];
    }
  }
  else
  {
    v25 = [COMessageSessionManagementRequest alloc];
    uint64_t v22 = [a1[5] topic];
    uint64_t v26 = [a1[4] subTopic];
    id v24 = [(COMessageSessionManagementRequest *)v25 initWithCommandType:2 payload:0 payloadType:0 topic:v22 subTopic:v26];

    long long v17 = 0;
  }

  uint64_t v30 = NSString;
  v31 = [a1[4] subTopic];
  uint64_t v32 = [v30 _commandTypeForConsumerWithSubTopic:v31];

  objc_initWeak((id *)buf, a1[5]);
  id v33 = a1[5];
  uint64_t v34 = [MEMORY[0x263EFFA08] setWithObject:v2];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_70;
  v38[3] = &unk_264445088;
  objc_copyWeak(&v42, (id *)buf);
  id v39 = a1[4];
  id v40 = a1[6];
  id v35 = v8;
  id v41 = v35;
  [v33 _sendRequest:v24 type:v32 members:v34 withCompletionHandler:v38];

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);
}

void __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_70(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained[13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_2;
    block[3] = &unk_264445060;
    void block[4] = WeakRetained;
    id v10 = a1[4];
    id v11 = a1[5];
    id v12 = a1[6];
    id v13 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverDidEndDelegateForSession:*(void *)(a1 + 40) notice:*(void *)(a1 + 48) initiator:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__COMessageChannel_failedToSendRequestWithID_withError___block_invoke;
  block[3] = &unk_2644450B0;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

void __56__COMessageChannel_failedToSendRequestWithID_withError___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  id v4 = [v2 objectForKey:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v5 removeObjectForKey:v6];

  if (v4)
  {
    uint64_t v7 = [v4 requestType];
    id v8 = COLogForCategory(5);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        int v17 = *(_DWORD *)(a1 + 48);
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 40);
        int v23 = 134218498;
        uint64_t v24 = v18;
        __int16 v25 = 1024;
        *(_DWORD *)uint64_t v26 = v17;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v19;
        _os_log_error_impl(&dword_21D3E0000, v8, OS_LOG_TYPE_ERROR, "%p Failed to send broadcast request with ID %u. Error %@", (uint8_t *)&v23, 0x1Cu);
      }

      uint64_t v10 = [v4 recipientCallback];
      unsigned int v11 = (void *)v10;
      if (v10) {
        (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, *(void *)(a1 + 40));
      }
    }
    else
    {
      if (v9)
      {
        int v20 = *(_DWORD *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v22 = *(void *)(a1 + 40);
        int v23 = 134218498;
        uint64_t v24 = v21;
        __int16 v25 = 1024;
        *(_DWORD *)uint64_t v26 = v20;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v22;
        _os_log_error_impl(&dword_21D3E0000, v8, OS_LOG_TYPE_ERROR, "%p Failed to send request with ID %u. Error %@", (uint8_t *)&v23, 0x1Cu);
      }

      [*(id *)(a1 + 32) _invokeResponseCallbackForInfo:v4 snapshot:0 response:0 error:*(void *)(a1 + 40)];
    }
    id v16 = *(void **)(a1 + 32);
    id v12 = [v4 request];
    [v16 _submitMetricsForRequest:v12 withRequestInfo:v4 withError:*(void *)(a1 + 40)];
  }
  else
  {
    id v12 = COLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = *(_DWORD *)(a1 + 48);
      int v23 = 134218498;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      *(void *)uint64_t v26 = v14;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)&v26[10] = v15;
      _os_log_error_impl(&dword_21D3E0000, v12, OS_LOG_TYPE_ERROR, " %p Got an error %@ for request ID %u which is not being followed by this message channel", (uint8_t *)&v23, 0x1Cu);
    }
  }
}

- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke;
  v21[3] = &unk_264445100;
  v21[4] = self;
  id v22 = v13;
  unsigned int v26 = a5;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(workQueue, v21);
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _payloadClassFromType:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)MEMORY[0x263F08928];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v38 = 0;
    uint64_t v7 = (id *)&v38;
    id v8 = &v38;
  }
  else
  {
    if (([*v2 hasPrefix:@"SessionConsumer+"] & 1) == 0
      && ![*v2 hasPrefix:@"SessionProducer+"])
    {
      BOOL v12 = 0;
      uint64_t v10 = 0;
      id v14 = 0;
      goto LABEL_12;
    }
    BOOL v9 = (void *)MEMORY[0x263F08928];
    uint64_t v4 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v37 = 0;
    uint64_t v7 = (id *)&v37;
    id v8 = &v37;
    id v5 = v9;
  }
  uint64_t v10 = [v5 unarchivedObjectOfClass:v4 fromData:v6 error:v8];
  id v11 = *v7;
  BOOL v12 = v11 != 0;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13)
  {
    uint64_t v19 = [*(id *)(a1 + 32) sendLimit];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74;
    v34[3] = &unk_2644450D8;
    v34[4] = *(void *)(a1 + 32);
    uint64_t v36 = v19;
    id v35 = *(id *)(a1 + 64);
    id v20 = (void *)MEMORY[0x21D4BD7F0](v34);
    uint64_t v21 = [*(id *)(a1 + 32) requestHandlers];
    id v22 = [v21 objectForKey:*(void *)(a1 + 40)];

    id v23 = COLogForCategory(5);
    id v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        int v26 = *(_DWORD *)(a1 + 72);
        uint64_t v27 = (void *)MEMORY[0x21D4BD7F0](v22);
        *(_DWORD *)buf = 134218754;
        uint64_t v42 = v25;
        __int16 v43 = 2114;
        *(void *)long long v44 = v10;
        *(_WORD *)&v44[8] = 1024;
        *(_DWORD *)&v44[10] = v26;
        __int16 v45 = 2048;
        long long v46 = v27;
        _os_log_impl(&dword_21D3E0000, v24, OS_LOG_TYPE_DEFAULT, "%p Dispatching request %{public}@ for message %u to %p", buf, 0x26u);
      }
      ((void (**)(void, void *, void, void *))v22)[2](v22, v10, *(void *)(a1 + 56), v20);
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_cold_1();
      }

      uint64_t v29 = *(void *)(a1 + 64);
      uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1101 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v29 + 16))(v29, 0, 0, v30);
    }
    id v14 = 0;
    goto LABEL_27;
  }
  id v14 = v11;
LABEL_12:
  id v15 = COLogForCategory(5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    int v32 = *(_DWORD *)(a1 + 72);
    uint64_t v33 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218754;
    uint64_t v42 = v31;
    __int16 v43 = 1024;
    *(_DWORD *)long long v44 = v32;
    *(_WORD *)&v44[4] = 2112;
    *(void *)&v44[6] = v33;
    __int16 v45 = 2112;
    long long v46 = v14;
    _os_log_error_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_ERROR, "%p Failed to unarchive request ID %u received from member with snapshot %@. Error = %@", buf, 0x26u);
  }

  uint64_t v16 = *(void *)(a1 + 64);
  id v17 = (void *)MEMORY[0x263F087E8];
  if (v12)
  {
    uint64_t v39 = *MEMORY[0x263F08608];
    id v40 = v14;
    id v18 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v28 = [v17 errorWithDomain:@"COMessageChannelErrorDomain" code:-1106 userInfo:v18];
  (*(void (**)(uint64_t, void, void, void *))(v16 + 16))(v16, 0, 0, v28);

  if (v12) {
LABEL_27:
  }
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v23 = 0;
    uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v23];
    id v8 = v23;
    if (v8)
    {
      BOOL v9 = v8;
      uint64_t v10 = COLogForCategory(5);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74_cold_2();
      }

      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08608];
      v25[0] = v9;
      BOOL v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      BOOL v13 = [v11 errorWithDomain:@"COMessageChannelErrorDomain" code:-1105 userInfo:v12];

      if (!v13) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ((unint64_t)[v7 length] <= *(void *)(a1 + 48))
  {
    BOOL v9 = 0;
LABEL_14:
    uint64_t v21 = *(void *)(a1 + 40);
    id v22 = [*(id *)(a1 + 32) _payloadTypeFromClass:objc_opt_class()];
    (*(void (**)(uint64_t, void *, void *, id))(v21 + 16))(v21, v7, v22, v6);

    BOOL v13 = 0;
    goto LABEL_15;
  }
  id v14 = COLogForCategory(5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74_cold_1(a1, v14, v15, v16, v17, v18, v19, v20);
  }

  BOOL v13 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1103 userInfo:0];
  BOOL v9 = 0;
  if (!v13) {
    goto LABEL_14;
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricsForResponse:size:withError:", v5, objc_msgSend(v7, "length"), v13);
}

- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __103__COMessageChannel_receivedResponseForRequestID_responsePayload_responseType_responseError_fromMember___block_invoke;
  v21[3] = &unk_264445128;
  unsigned int v26 = a3;
  v21[4] = self;
  id v22 = v14;
  id v23 = v15;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(workQueue, v21);
}

void __103__COMessageChannel_receivedResponseForRequestID_responsePayload_responseType_responseError_fromMember___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  uint64_t v4 = [v2 objectForKey:v3];

  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_invokeResponseCallbackForInfo:snapshot:response:error:", v4, *(void *)(a1 + 48), 0);
    goto LABEL_15;
  }
  if (*(void *)(a1 + 56) && *(void *)(a1 + 64))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_payloadClassFromType:");
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 56);
      id v23 = 0;
      uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v5 fromData:v6 error:&v23];
      id v8 = v23;
      if (!v8) {
        goto LABEL_9;
      }
LABEL_11:
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08608];
      id v31 = v8;
      id v14 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      BOOL v9 = [v13 errorWithDomain:@"COMessageChannelErrorDomain" code:-1107 userInfo:v14];

      id v15 = COLogForCategory(5);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v22 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218498;
        uint64_t v25 = v21;
        __int16 v26 = 2112;
        uint64_t v27 = v22;
        __int16 v28 = 2112;
        uint64_t v29 = v9;
        _os_log_error_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_ERROR, "%p Failed to unarchive response of type %@. Error = %@", buf, 0x20u);
      }

      goto LABEL_14;
    }
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *(void *)(a1 + 64);
    int v32 = @"COMessageChannelUnknownClassErrorKey";
    v33[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v8 = [v10 errorWithDomain:@"COMessageChannelErrorDomain" code:-1108 userInfo:v12];

    uint64_t v7 = 0;
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:
  BOOL v9 = 0;
LABEL_14:
  [*(id *)(a1 + 32) _invokeResponseCallbackForInfo:v4 snapshot:*(void *)(a1 + 48) response:v7 error:v9];

LABEL_15:
  uint64_t v16 = [v4 receivedResponses] + 1;
  [v4 setReceivedResponses:v16];
  if (v16 == [v4 expectedRecipients])
  {
    id v17 = *(void **)(*(void *)(a1 + 32) + 88);
    id v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    [v17 removeObjectForKey:v18];

    id v19 = *(void **)(a1 + 32);
    id v20 = [v4 request];
    [v19 _submitMetricsForRequest:v20 withRequestInfo:v4 withError:0];
  }
}

- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__COMessageChannel_receivedRecipientListForRequestID_recipients___block_invoke;
  block[3] = &unk_2644450B0;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

void __65__COMessageChannel_receivedRecipientListForRequestID_recipients___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKey:v3];

  uint64_t v5 = COLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v8 = [v6 count];
    int v9 = *(_DWORD *)(a1 + 48);
    int v14 = 134218754;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p Received a recipient list %@ with count %lu for request ID %u", (uint8_t *)&v14, 0x26u);
  }

  objc_msgSend(v4, "setExpectedRecipients:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v10 = *(void **)(*(void *)(a1 + 32) + 88);
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "requestID"));
  [v10 setObject:v4 forKey:v11];

  uint64_t v12 = [v4 recipientCallback];
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, *(void *)(a1 + 40), 0);
  }
}

- (unsigned)_generateRequestID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  unsigned int result = self->_baseRequestID;
  self->_baseRequestID = result + 1;
  return result;
}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (a3)
  {
    uint64_t v4 = NSStringFromClass(a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6
{
  v72[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void (**)(void, void, void, void))v13;
  if (!self->_activated)
  {
    __int16 v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = -1110;
    goto LABEL_8;
  }
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1116 userInfo:0];
    uint64_t v29 = COLogForCategory(5);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[COMessageChannel _sendRequest:type:members:withCompletionHandler:]();
    }

    goto LABEL_16;
  }
  if (v12) {
    goto LABEL_9;
  }
  uint64_t v15 = [(COMessageChannel *)self cluster];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || ([(COMessageChannel *)self cluster],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v17 configuration],
        __int16 v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 options],
        v18,
        v17,
        (v19 & 1) != 0))
  {
LABEL_9:
    id v64 = 0;
    uint64_t v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v64];
    id v23 = v64;
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F08608];
      v72[0] = v23;
      __int16 v26 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      uint64_t v27 = [v25 errorWithDomain:@"COMessageChannelErrorDomain" code:-1104 userInfo:v26];

      __int16 v28 = COLogForCategory(5);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:]();
      }

LABEL_21:
      ((void (**)(void, void, void, void *))v14)[2](v14, 0, 0, v27);
      [(COMessageChannel *)self _submitMetricsForRequest:v10 withRequestInfo:0 withError:v27];
LABEL_22:

      goto LABEL_23;
    }
    unint64_t v30 = [v22 length];
    if (v30 > [(COMessageChannel *)self sendLimit])
    {
      id v31 = COLogForCategory(5);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:]();
      }

      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1102 userInfo:0];
      goto LABEL_21;
    }
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __68__COMessageChannel__sendRequest_type_members_withCompletionHandler___block_invoke;
    v61[3] = &unk_264445150;
    id v32 = v14;
    id v63 = v32;
    v61[4] = self;
    id v33 = v10;
    id v62 = v33;
    uint64_t v57 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v61];
    uint64_t v34 = [(COMessageChannel *)self _generateRequestID];
    unsigned int v60 = v34;
    v58 = v33;
    id v35 = [[COMessageChannelRequestInfo alloc] initWithRequestID:v34 type:0 request:v33];
    -[COMessageChannelRequestInfo setMessageSize:](v35, "setMessageSize:", [v22 length]);
    [(COMessageChannelRequestInfo *)v35 setResponseCallback:v32];
    v59 = v35;
    if (v12)
    {
      -[COMessageChannelRequestInfo setExpectedRecipients:](v35, "setExpectedRecipients:", [v12 count]);
      if ([v12 count] != 1) {
        goto LABEL_31;
      }
      uint64_t v36 = [(COMessageChannel *)self roleSnapshotsCache];
      uint64_t v37 = [v12 allObjects];
      uint64_t v38 = [v37 firstObject];
      uint64_t v39 = [v36 objectForKey:v38];

      id v40 = [v39 role];
      id v41 = +[COClusterRole roleForCoordinator];
      LODWORD(v38) = [v40 satisfiesRole:v41];

      uint64_t v42 = COMessagingTypeAdHocSingle;
      if (v38) {
        uint64_t v42 = COMessagingTypeAdHocLeader;
      }
      __int16 v43 = *v42;

      id v35 = v59;
    }
    else
    {
      [(COMessageChannelRequestInfo *)v35 setExpectedRecipients:1];
      __int16 v43 = @"coordinator";
    }
    if (v43)
    {
LABEL_37:
      [(COMessageChannelRequestInfo *)v35 setDestinationInfo:v43];
      outstandingRequests = self->_outstandingRequests;
      __int16 v53 = [NSNumber numberWithUnsignedInt:v60];
      [(NSMutableDictionary *)outstandingRequests setObject:v35 forKey:v53];

      v54 = [v58 networkActivity];
      if (v54) {
        __int16 v55 = (void *)nw_activity_copy_xpc_token();
      }
      else {
        __int16 v55 = 0;
      }
      v56 = COLogForCategory(5);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v66 = self;
        __int16 v67 = 2048;
        v68 = v58;
        __int16 v69 = 1024;
        unsigned int v70 = v60;
        _os_log_impl(&dword_21D3E0000, v56, OS_LOG_TYPE_DEFAULT, "%p sending request %p with id '%u'", buf, 0x1Cu);
      }

      [v57 sendRequestWithPayload:v22 payloadType:v11 requestType:0 requestID:v60 members:v12 activityToken:v55];
      uint64_t v27 = v63;
      goto LABEL_22;
    }
LABEL_31:
    long long v44 = (void *)MEMORY[0x263EFF9C0];
    __int16 v45 = [(COMessageChannel *)self roleSnapshotsCache];
    long long v46 = [v45 allKeys];
    uint64_t v47 = [v44 setWithArray:v46];

    uint64_t v48 = +[COClusterMember memberForCurrentDevice];
    [v47 addObject:v48];

    unint64_t v49 = [v12 count];
    if (v49 <= [v47 count])
    {
      uint64_t v51 = [v12 count];
      uint64_t v50 = COMessagingTypeAdHocSubset;
      if (v51 == [v47 count])
      {
        [v47 minusSet:v12];
        if (![v47 count]) {
          uint64_t v50 = COMessagingTypeAdHocEntireCluster;
        }
      }
    }
    else
    {
      uint64_t v50 = COMessagingTypeAdHocSuperset;
    }
    __int16 v43 = *v50;

    id v35 = v59;
    goto LABEL_37;
  }
  __int16 v20 = (void *)MEMORY[0x263F087E8];
  uint64_t v21 = -1111;
LABEL_8:
  uint64_t v22 = [v20 errorWithDomain:@"COMessageChannelErrorDomain" code:v21 userInfo:0];
  ((void (**)(void, void, void, void *))v14)[2](v14, 0, 0, v22);
LABEL_16:
  [(COMessageChannel *)self _submitMetricsForRequest:v10 withRequestInfo:0 withError:v22];
LABEL_23:
}

void __68__COMessageChannel__sendRequest_type_members_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void (**)(uint64_t, void, void, id))(v3 + 16);
  id v5 = a2;
  v4(v3, 0, 0, v5);
  [*(id *)(a1 + 32) _submitMetricsForRequest:*(void *)(a1 + 40) withRequestInfo:0 withError:v5];
}

- (void)_broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6
{
  v47[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a5;
  id v13 = a6;
  int v14 = v13;
  if (!self->_activated)
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1110 userInfo:0];
LABEL_11:
    v12[2](v12, 0, v15);
    goto LABEL_12;
  }
  if (v13)
  {
    id v39 = 0;
    uint64_t v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v39];
    id v16 = v39;
    if (v16)
    {
      id v17 = v16;
      __int16 v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08608];
      v47[0] = v16;
      char v19 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      __int16 v20 = [v18 errorWithDomain:@"COMessageChannelErrorDomain" code:-1104 userInfo:v19];

      uint64_t v21 = COLogForCategory(5);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:]();
      }
    }
    else
    {
      unint64_t v23 = [v15 length];
      if (v23 <= [(COMessageChannel *)self sendLimit])
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __88__COMessageChannel__broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke;
        v36[3] = &unk_264445150;
        uint64_t v25 = v12;
        id v38 = v25;
        v36[4] = self;
        id v26 = v10;
        id v37 = v26;
        uint64_t v34 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v36];
        uint64_t v27 = [(COMessageChannel *)self _generateRequestID];
        __int16 v28 = [[COMessageChannelRequestInfo alloc] initWithRequestID:v27 type:1 request:v26];
        -[COMessageChannelRequestInfo setMessageSize:](v28, "setMessageSize:", [v15 length]);
        [(COMessageChannelRequestInfo *)v28 setRecipientCallback:v25];
        [(COMessageChannelRequestInfo *)v28 setResponseCallback:v14];
        [(COMessageChannelRequestInfo *)v28 setDestinationInfo:0x26CDCBB68];
        outstandingRequests = self->_outstandingRequests;
        unsigned int v35 = v27;
        unint64_t v30 = [NSNumber numberWithUnsignedInt:v27];
        [(NSMutableDictionary *)outstandingRequests setObject:v28 forKey:v30];

        id v31 = [v26 networkActivity];
        if (v31) {
          id v33 = (void *)nw_activity_copy_xpc_token();
        }
        else {
          id v33 = 0;
        }
        id v32 = COLogForCategory(5);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          id v41 = self;
          __int16 v42 = 2048;
          id v43 = v26;
          __int16 v44 = 1024;
          unsigned int v45 = v35;
          _os_log_impl(&dword_21D3E0000, v32, OS_LOG_TYPE_DEFAULT, "%p broadcasting request %p with id '%u'", buf, 0x1Cu);
        }

        [v34 sendRequestWithPayload:v15 payloadType:v11 requestType:1 requestID:v35 members:0 activityToken:v33];
        __int16 v20 = v38;
        goto LABEL_18;
      }
      id v24 = COLogForCategory(5);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:]();
      }

      __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1102 userInfo:0];
    }
    v12[2](v12, 0, v20);
    [(COMessageChannel *)self _submitMetricsForRequest:v10 withRequestInfo:0 withError:v20];
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1116 userInfo:0];
  uint64_t v22 = COLogForCategory(5);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[COMessageChannel _broadcastRequest:type:recipientsCallback:responseCompletionHandler:]();
  }

  if (v12) {
    goto LABEL_11;
  }
LABEL_12:
  [(COMessageChannel *)self _submitMetricsForRequest:v10 withRequestInfo:0 withError:v15];
LABEL_19:
}

void __88__COMessageChannel__broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void (**)(uint64_t, void, id))(v3 + 16);
  id v5 = a2;
  v4(v3, 0, v5);
  [*(id *)(a1 + 32) _submitMetricsForRequest:*(void *)(a1 + 40) withRequestInfo:0 withError:v5];
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__COMessageChannel__activateWithCompletion___block_invoke;
  v23[3] = &unk_2644445D0;
  objc_copyWeak(&v25, &location);
  id v5 = v4;
  id v24 = v5;
  id v6 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v23];
  if (!self->_activated
    || ([(COMessageChannel *)self lastConnection],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 activated],
        v7,
        (v8 & 1) == 0))
  {
    int v9 = [MEMORY[0x263EFF9C0] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [(COMessageChannel *)self requestHandlers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          [v9 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v11);
    }

    int v14 = [(COMessageChannel *)self topic];
    uint64_t v15 = [(COMessageChannel *)self cluster];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__COMessageChannel__activateWithCompletion___block_invoke_81;
    v16[3] = &unk_2644451A0;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    id v17 = v5;
    [v6 activateMessageChannelForTopic:v14 cluster:v15 handlers:v9 withCompletion:v16];

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __44__COMessageChannel__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__COMessageChannel__activateWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained _submitMetricsForActivationCompletionWithError:v3];
  }
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_81(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained[13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__COMessageChannel__activateWithCompletion___block_invoke_2;
    v12[3] = &unk_264445178;
    id v13 = v7;
    int v14 = v9;
    uint64_t v17 = a3;
    uint64_t v18 = a4;
    id v11 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v11;
    dispatch_async(v10, v12);
  }
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
    id v13 = [*(id *)(a1 + 40) lastConnection];
    [v13 setActivated:1];

    id v4 = 0;
    goto LABEL_15;
  }
  id v4 = v2;
  id v5 = [*v3 domain];
  if (![v5 isEqualToString:@"COMessageChannelErrorDomain"]) {
    goto LABEL_11;
  }
  uint64_t v6 = [*v3 code];

  if (v6 == -1100)
  {
    id v5 = [*v3 userInfo];
    id v7 = [v5 objectForKey:@"COMessageChannelFailedRequestHandlerErrorKey"];
    if ([v7 hasPrefix:@"SessionProducer+"])
    {
      char v8 = [v7 _sessionProducerSubTopic];
      int v9 = (void *)MEMORY[0x263F087E8];
      long long v19 = @"COMessageChannelDuplicateSessionProducerKey";
      v20[0] = v8;
      id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v11 = v9;
      uint64_t v12 = -1112;
    }
    else
    {
      if (![v7 hasPrefix:@"SessionConsumer+"])
      {
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      char v8 = [v7 _sessionConsumerSubTopic];
      int v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = @"COMessageChannelDuplicateSessionConsumerKey";
      uint64_t v18 = v8;
      id v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v11 = v14;
      uint64_t v12 = -1113;
    }
    uint64_t v15 = [v11 errorWithDomain:@"COMessageChannelErrorDomain" code:v12 userInfo:v10];

    id v4 = (id)v15;
    goto LABEL_10;
  }
LABEL_12:
  id v16 = COLogForCategory(5);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __44__COMessageChannel__activateWithCompletion___block_invoke_2_cold_1();
  }

LABEL_15:
  [*(id *)(a1 + 40) setSendLimit:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) setReceiveLimit:*(void *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!v4) {
    [*(id *)(a1 + 48) _setupClusterMonitor];
  }
  [*(id *)(a1 + 40) _submitMetricsForActivationCompletionWithError:v4];
  [*(id *)(a1 + 48) _callbackProducersAndConsumersAfterActivationWithError:v4];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4;
  void v12[4] = __Block_byref_object_dispose__4;
  id v13 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke;
  v8[3] = &unk_2644451C8;
  id v10 = v12;
  id v11 = &v14;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(COMessageChannel *)self _withLock:v8];
  id v6 = (id)v15[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) provider];
  uint64_t v3 = [v2 messageChannelServiceConnection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v7 = [*(id *)(a1 + 32) lastConnection];

  if (v6 != v7)
  {
    char v8 = (void *)MEMORY[0x263F08D80];
    id v9 = &unk_26CDD48C0;
    id v10 = [v8 interfaceWithProtocol:v9];
    id v11 = [[COMessageChannelClientInterfaceMediator alloc] initWithMessageChannel:*(void *)(a1 + 32)];
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    [v10 setClasses:v14 forSelector:sel_receivedRecipientListForRequestID_recipients_ argumentIndex:1 ofReply:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExportedInterface:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExportedObject:v11];
    uint64_t v15 = &unk_26CDD9A98;

    uint64_t v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:v15];

    uint64_t v17 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v17 forSelector:sel_activateMessageChannelForTopic_cluster_handlers_withCompletion_ argumentIndex:1 ofReply:0];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRemoteObjectInterface:v16];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) interruptionHandler];
    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidationHandler];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInterruptionHandler:v18];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInvalidationHandler:v19];
    long long v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2;
    v30[3] = &unk_264444A18;
    id v21 = v18;
    id v31 = v21;
    objc_copyWeak(&v32, &location);
    [v20 setInterruptionHandler:v30];
    long long v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_154;
    v27[3] = &unk_264444A18;
    id v23 = v19;
    id v28 = v23;
    objc_copyWeak(&v29, &location);
    [v22 setInvalidationHandler:v27];
    [*(id *)(a1 + 32) setLastConnection:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resume];
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();
    }

    [WeakRetained _lostConnectionToService];
  }
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_154(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_154_cold_1();
    }

    [WeakRetained _lostConnectionToService];
  }
}

- (void)_lostConnectionToService
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__COMessageChannel__lostConnectionToService__block_invoke;
  v4[3] = &unk_264444AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__COMessageChannel__lostConnectionToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && WeakRetained[8])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __44__COMessageChannel__lostConnectionToService__block_invoke_2;
    v3[3] = &unk_2644451F0;
    v3[4] = WeakRetained;
    [WeakRetained _activateWithCompletion:v3];
  }
}

void __44__COMessageChannel__lostConnectionToService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = COLogForCategory(5);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__COMessageChannel__lostConnectionToService__block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) _lostConnectionToService];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "Successfully re-established connection to the service for %p", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_invokeResponseCallbackForInfo:(id)a3 snapshot:(id)a4 response:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 responseCallback];

  if (v13)
  {
    uint64_t v14 = [v9 responseCallback];
    ((void (**)(void, id, id, id))v14)[2](v14, v10, v11, v12);
  }
  else
  {
    uint64_t v15 = COLogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[COMessageChannel _invokeResponseCallbackForInfo:snapshot:response:error:]();
    }
  }
}

- (void)_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5
{
  v55[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v34 = a4;
  id v9 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  id v32 = [v8 subTopic];
  id v10 = [(COMessageChannel *)self sessionConsumers];
  id v11 = [v10 objectForKey:v32];

  id v33 = [v11 delegate];
  queue = [v11 delegateQueue];
  id v12 = [v8 payload];
  uint64_t v13 = [v8 payloadType];
  uint64_t v14 = (void *)v13;
  id v15 = 0;
  if (v12 && v13)
  {
    uint64_t v16 = [(COMessageChannel *)self _payloadClassFromType:v13];
    if (v16)
    {
      id v45 = 0;
      id v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v16 fromData:v12 error:&v45];
      id v17 = v45;
      if (v17)
      {
LABEL_5:
        uint64_t v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08608];
        id v53 = v17;
        id v19 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        long long v20 = [v18 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v19];

        id v21 = COLogForCategory(6);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          unint64_t v30 = [v34 member];
          *(_DWORD *)buf = 138412802;
          uint64_t v47 = v11;
          __int16 v48 = 2112;
          unint64_t v49 = v14;
          __int16 v50 = 2112;
          uint64_t v51 = v30;
          _os_log_error_impl(&dword_21D3E0000, v21, OS_LOG_TYPE_ERROR, "%@ Consumer failed to unarchive request of type %@. Session start with member %@ failed", buf, 0x20u);
        }
        long long v22 = [[COMessageSessionManagementResponse alloc] initWithRemoteError:v20];
        v9[2](v9, v22, 0);

        goto LABEL_14;
      }
    }
    else
    {
      id v23 = (void *)MEMORY[0x263F087E8];
      v54 = @"COMessageSessionUnknownClassErrorKey";
      v55[0] = v14;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
      id v17 = [v23 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v24];

      id v15 = 0;
      if (v17) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v25 = [COMessageConsumedSession alloc];
  id v26 = [v34 member];
  long long v20 = [(COMessageConsumedSession *)v25 initWithMember:v26 consumer:v11];

  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    uint64_t v27 = COLogForCategory(6);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v8 subTopic];
      -[COMessageChannel _handleStartCommand:withMember:callback:]((uint64_t)self, v28, buf, v27);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke;
    block[3] = &unk_264445268;
    id v36 = v33;
    id v37 = v11;
    id v38 = v34;
    id v15 = v15;
    id v39 = v15;
    objc_copyWeak(&v43, &location);
    id v40 = self;
    long long v20 = v20;
    id v41 = v20;
    __int16 v42 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    id v29 = objc_alloc_init(COMessageSessionManagementResponse);
    v9[2](v9, v29, 0);
  }
LABEL_14:
}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_2;
  v6[3] = &unk_264445240;
  objc_copyWeak(&v11, (id *)(a1 + 88));
  v6[4] = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  [v2 consumer:v3 shouldStartSessionWithMember:v4 request:v5 completionHandler:v6];

  objc_destroyWeak(&v11);
}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_3;
    block[3] = &unk_264445218;
    char v19 = a2;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    dispatch_async(v8, block);
  }
}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_3(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      id v14 = 0;
      uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v14];
      id v4 = v14;
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = *MEMORY[0x263F08608];
        v16[0] = v4;
        id v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        id v8 = [v6 errorWithDomain:@"COMessageSessionErrorDomain" code:-1207 userInfo:v7];

        if (v8)
        {
          id v9 = [[COMessageSessionManagementResponse alloc] initWithRemoteError:v8];
          [*(id *)(a1 + 40) _deliverFailedToStartSessionWithMember:*(void *)(a1 + 48) consumer:*(void *)(a1 + 56) error:v8];

LABEL_9:
          goto LABEL_10;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    id v12 = [COMessageSessionManagementResponse alloc];
    id v13 = [*(id *)(a1 + 40) _payloadTypeFromClass:objc_opt_class()];
    id v9 = [(COMessageSessionManagementResponse *)v12 initWithPayload:v3 payloadType:v13];

    [*(id *)(a1 + 40) _deliverSuccessfullyStartedSession:*(void *)(a1 + 64) withMember:*(void *)(a1 + 48) consumer:*(void *)(a1 + 56)];
    goto LABEL_9;
  }
  uint64_t v10 = [COMessageSessionManagementResponse alloc];
  id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1213 userInfo:0];
  id v9 = [(COMessageSessionManagementResponse *)v10 initWithRemoteError:v11];

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 sessions];
  uint64_t v15 = [v12 member];
  [v14 setObject:v10 forKey:v15];

  id v16 = COLogForCategory(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl(&dword_21D3E0000, v16, OS_LOG_TYPE_DEFAULT, "%@ Producer successfully created a session %@", buf, 0x16u);
  }

  id v17 = [v13 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v18 = [v13 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke;
    block[3] = &unk_264445060;
    id v28 = v17;
    id v29 = v13;
    id v30 = v10;
    id v31 = v12;
    id v32 = v11;
    dispatch_async(v18, block);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2;
  v24[3] = &unk_264445290;
  id v25 = v13;
  id v26 = v10;
  id v19 = v10;
  id v20 = v13;
  id v21 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v24];
  long long v22 = [v20 subTopic];
  id v23 = [v12 member];
  [v21 sessionStartedForSubTopic:v22 withMember:v23 produced:1];
}

uint64_t __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didStartSession:*(void *)(a1 + 48) member:*(void *)(a1 + 56) response:*(void *)(a1 + 64)];
}

void __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2()
{
  v0 = COLogForCategory(6);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2_cold_1();
  }
}

- (void)_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v9 sessions];
  id v12 = [v10 member];
  [v11 setObject:v8 forKey:v12];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke;
  v24[3] = &unk_264445290;
  id v13 = v9;
  id v25 = v13;
  id v14 = v8;
  id v26 = v14;
  uint64_t v15 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v24];
  id v16 = [v13 subTopic];
  id v17 = [v10 member];

  [v15 sessionStartedForSubTopic:v16 withMember:v17 produced:0];
  id v18 = [v13 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v13 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_164;
    block[3] = &unk_2644448B0;
    id v21 = v18;
    id v22 = v13;
    id v23 = v14;
    dispatch_async(v19, block);
  }
}

void __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke()
{
  v0 = COLogForCategory(6);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_cold_1();
  }
}

uint64_t __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_164(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didStartSession:*(void *)(a1 + 48)];
}

- (void)_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 delegate];
  id v12 = [v9 delegateQueue];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __75__COMessageChannel__deliverDidFailToStartSessionWithMember_producer_error___block_invoke;
    id v16 = &unk_264444FE8;
    id v17 = v11;
    id v18 = v9;
    id v19 = v8;
    id v20 = v10;
    dispatch_async(v12, &v13);
  }
  -[COMessageChannel _submitMetricsForSession:withError:](self, "_submitMetricsForSession:withError:", 0, v10, v13, v14, v15, v16);
}

uint64_t __75__COMessageChannel__deliverDidFailToStartSessionWithMember_producer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didFailToStartSessionWithMember:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_deliverFailedToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 delegate];
  id v11 = [v8 delegateQueue];
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__COMessageChannel__deliverFailedToStartSessionWithMember_consumer_error___block_invoke;
    v12[3] = &unk_264444FE8;
    id v13 = v10;
    id v14 = v8;
    id v15 = v7;
    id v16 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t __74__COMessageChannel__deliverFailedToStartSessionWithMember_consumer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didFailToStartSessionWithMember:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  id v11 = [v8 subTopic];
  id v12 = [(COMessageChannel *)self sessionConsumers];
  id v13 = [v12 objectForKey:v11];

  id v14 = [v13 sessions];
  id v15 = [v9 member];
  id v16 = [v14 objectForKey:v15];

  if (v16) {
    goto LABEL_3;
  }
  id v17 = [(COMessageChannel *)self sessionProducers];
  id v18 = [v17 objectForKey:v11];

  id v19 = [v18 sessions];
  id v20 = [v9 member];
  id v16 = [v19 objectForKey:v20];

  if (v16)
  {
LABEL_3:
    id v30 = v13;
    id v21 = [v8 payload];
    id v22 = [v8 payloadType];
    uint64_t v23 = [v8 remoteError];
    if (v23)
    {
      id v24 = (id)v23;
    }
    else
    {
      id v25 = 0;
      id v24 = 0;
      if (!v21 || !v22) {
        goto LABEL_6;
      }
      uint64_t v27 = [(COMessageChannel *)self _payloadClassFromType:v22];
      if (v27)
      {
        id v31 = 0;
        id v25 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v27 fromData:v21 error:&v31];
        id v24 = v31;
        goto LABEL_6;
      }
      id v29 = (void *)MEMORY[0x263F087E8];
      id v32 = @"COMessageSessionUnknownClassErrorKey";
      v33[0] = v22;
      id v28 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      id v24 = [v29 errorWithDomain:@"COMessageSessionErrorDomain" code:-1206 userInfo:v28];
    }
    id v25 = 0;
LABEL_6:
    [(COMessageChannel *)self _deliverDidEndDelegateForSession:v16 notice:v25 initiator:v9 error:v24];

    id v13 = v30;
  }
  id v26 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v26, 0);
}

- (void)_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, COMessageSessionManagementResponse *, void))a5;
  id v11 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v11, 0);

  id v12 = [(COMessageChannel *)self sessionsInflight];
  id v13 = [v9 member];
  id v14 = [v12 objectForKey:v13];

  if (v14)
  {
    id v15 = COLogForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v9 member];
      id v17 = [v8 subTopic];
      int v27 = 134218498;
      id v28 = self;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%p Received a command indicating inflight member %@ is now capable of consuming subTopic %@", (uint8_t *)&v27, 0x20u);
    }
    id v18 = [(COMessageChannel *)self sessionProducers];
    id v19 = [v8 subTopic];
    id v20 = [v18 objectForKey:v19];

    id v21 = [MEMORY[0x263EFF9D0] null];
    if ([v14 isEqual:v21]) {
      id v22 = 0;
    }
    else {
      id v22 = v14;
    }
    id v23 = v22;

    id v24 = [(COMessageChannel *)self sessionsInflight];
    id v25 = [v9 member];
    [v24 removeObjectForKey:v25];

    id v26 = [v9 member];
    [(COMessageChannel *)self _startSessionWithProducer:v20 member:v26 request:v23];
  }
}

- (void)_startSessionWithProducer:(id)a3 member:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sessions];
  id v9 = [v8 objectForKey:v7];

  id v10 = COLogForCategory(6);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218242;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Session with member %@ is already active. Not starting again", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218498;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Attempting to start a session with member %@ using producer %@", buf, 0x20u);
    }

    id v10 = [v6 delegateQueue];
    id v12 = [v6 delegate];
    objc_initWeak(&location, self);
    id v13 = [(COMessageChannel *)self roleSnapshotsCache];
    id v14 = [v13 objectForKey:v7];

    if (objc_opt_respondsToSelector())
    {
      id v15 = COLogForCategory(6);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[COMessageChannel _startSessionWithProducer:member:]();
      }

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke;
      v17[3] = &unk_2644452E0;
      id v18 = v12;
      id v19 = v6;
      id v20 = v14;
      objc_copyWeak(&v22, &location);
      id v21 = v7;
      dispatch_async(v10, v17);

      objc_destroyWeak(&v22);
    }
    else
    {
      id v16 = COLogForCategory(6);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v25 = self;
        _os_log_impl(&dword_21D3E0000, v16, OS_LOG_TYPE_DEFAULT, "%p Client does not implement producer:shouldStartSessionWithMember:completionHandler:", buf, 0xCu);
      }

      [(COMessageChannel *)self _startSessionWithProducer:v6 member:v7 request:0];
    }

    objc_destroyWeak(&location);
  }
}

void __53__COMessageChannel__startSessionWithProducer_member___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke_2;
  v5[3] = &unk_2644452B8;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  [v2 producer:v3 shouldStartSessionWithMember:v4 completionHandler:v5];

  objc_destroyWeak(&v8);
}

void __53__COMessageChannel__startSessionWithProducer_member___block_invoke_2(id *a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v7 = COLogForCategory(6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        id v9 = a1[4];
        *(_DWORD *)buf = 134218498;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v5;
        _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p Client wants to start a session with member %@ with request %@", buf, 0x20u);
      }

      id v10 = WeakRetained[13];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke_172;
      v12[3] = &unk_264444FE8;
      void v12[4] = WeakRetained;
      id v13 = a1[5];
      id v14 = a1[4];
      id v15 = v5;
      dispatch_async(v10, v12);
    }
    else
    {
      if (v8)
      {
        id v11 = a1[4];
        *(_DWORD *)buf = 134218242;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p Client does not want to start a session with member %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __53__COMessageChannel__startSessionWithProducer_member___block_invoke_172(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSessionWithProducer:*(void *)(a1 + 40) member:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
}

- (void)_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COMessageChannel *)self roleSnapshotsCache];
  id v12 = [v11 objectForKey:v9];

  id v33 = 0;
  __int16 v26 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v33];
  id v13 = v33;
  id v14 = v13;
  if (v13)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08608];
    v35[0] = v13;
    id v16 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v17 = [v15 errorWithDomain:@"COMessageSessionErrorDomain" code:-1205 userInfo:v16];

    [(COMessageChannel *)self _deliverDidFailToStartSessionWithMember:v12 producer:v8 error:v17];
  }
  else
  {
    __int16 v18 = [COMessageSessionManagementRequest alloc];
    id v19 = [(COMessageChannel *)self _payloadTypeFromClass:objc_opt_class()];
    __int16 v20 = [(COMessageChannel *)self topic];
    id v21 = [v8 subTopic];
    id v17 = [(COMessageSessionManagementRequest *)v18 initWithCommandType:1 payload:v26 payloadType:v19 topic:v20 subTopic:v21];

    uint64_t v22 = NSString;
    id v23 = [v8 subTopic];
    id v24 = [v22 _commandTypeForConsumerWithSubTopic:v23];

    objc_initWeak(&location, self);
    id v25 = [MEMORY[0x263EFFA08] setWithObject:v9];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke;
    v27[3] = &unk_264445088;
    objc_copyWeak(&v31, &location);
    id v28 = v10;
    id v29 = v8;
    id v30 = v9;
    [(COMessageChannel *)self _sendRequest:v17 type:v24 members:v25 withCompletionHandler:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = [v9 domain];
      if ([v11 isEqualToString:@"COMessageChannelErrorDomain"])
      {
        uint64_t v12 = [v9 code];

        if (v12 == -1114)
        {
          id v13 = COLogForCategory(6);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v63 = WeakRetained;
            __int16 v64 = 2112;
            id v65 = v7;
            _os_log_impl(&dword_21D3E0000, v13, OS_LOG_TYPE_DEFAULT, "%@ Member %@ does not have an active message channel for Sessions. Deferring session creation.", buf, 0x16u);
          }

          id v14 = *(void **)(a1 + 32);
          if (v14)
          {
            id v15 = v14;
          }
          else
          {
            id v15 = [MEMORY[0x263EFF9D0] null];
          }
          id v16 = v15;
          id v40 = [WeakRetained sessionsInflight];
          id v41 = [v7 member];
          [v40 setObject:v16 forKey:v41];

          goto LABEL_33;
        }
      }
      else
      {
      }
      id v21 = [v9 domain];
      if ([v21 isEqualToString:@"COMessageChannelErrorDomain"])
      {
        uint64_t v22 = [v9 code];

        if (v22 == -1101)
        {
          id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1210 userInfo:0];
LABEL_19:
          [WeakRetained _deliverDidFailToStartSessionWithMember:v7 producer:*(void *)(a1 + 40) error:v16];
LABEL_33:

          goto LABEL_34;
        }
      }
      else
      {
      }
      id v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v60 = *MEMORY[0x263F08608];
      id v61 = v9;
      id v24 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v16 = [v23 errorWithDomain:@"COMessageSessionErrorDomain" code:-1204 userInfo:v24];

      goto LABEL_19;
    }
    id v16 = v8;
    id v17 = [v16 remoteError];

    if (v17)
    {
      __int16 v18 = COLogForCategory(6);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_2(a1, v16, v18);
      }

      uint64_t v19 = *(void *)(a1 + 40);
      __int16 v20 = [v16 remoteError];
      [WeakRetained _deliverDidFailToStartSessionWithMember:v7 producer:v19 error:v20];
      goto LABEL_32;
    }
    __int16 v20 = [v16 payload];
    uint64_t v25 = [v16 payloadType];
    uint64_t v26 = 0;
    v54 = (void *)v25;
    if (v20)
    {
      uint64_t v27 = v25;
      if (v25)
      {
        uint64_t v28 = [WeakRetained _payloadClassFromType:v25];
        if (v28)
        {
          id v55 = 0;
          uint64_t v26 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v28 fromData:v20 error:&v55];
          id v29 = (COMessageProducedSession *)v55;
          if (v29)
          {
LABEL_24:
            unint64_t v49 = (void *)v26;
            id v30 = COLogForCategory(6);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_1();
            }

            __int16 v50 = (void *)MEMORY[0x263F087E8];
            uint64_t v56 = *MEMORY[0x263F08608];
            uint64_t v57 = v29;
            id v31 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
            uint64_t v51 = [v50 errorWithDomain:@"COMessageSessionErrorDomain" code:-1208 userInfo:v31];

            [WeakRetained _deliverDidFailToStartSessionWithMember:v7 producer:*(void *)(a1 + 40) error:v51];
            uint64_t v47 = [COMessageSessionManagementRequest alloc];
            id v32 = [WeakRetained topic];
            id v33 = [*(id *)(a1 + 40) subTopic];
            __int16 v48 = [(COMessageSessionManagementRequest *)v47 initWithCommandType:2 error:v51 topic:v32 subTopic:v33];

            uint64_t v34 = NSString;
            __int16 v35 = [*(id *)(a1 + 40) subTopic];
            id v36 = [v34 _commandTypeForConsumerWithSubTopic:v35];

            uint64_t v37 = (void *)MEMORY[0x263EFFA08];
            uint64_t v46 = [v7 member];
            id v38 = [v37 setWithObject:v46];
            [WeakRetained _sendRequest:v48 type:v36 members:v38 withCompletionHandler:&__block_literal_global_176_0];

            id v39 = v49;
            goto LABEL_31;
          }
        }
        else
        {
          uint64_t v52 = (void *)MEMORY[0x263F087E8];
          v58 = @"COMessageSessionUnknownClassErrorKey";
          uint64_t v59 = v27;
          __int16 v42 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v29 = [v52 errorWithDomain:@"COMessageSessionErrorDomain" code:-1208 userInfo:v42];

          uint64_t v26 = 0;
          if (v29) {
            goto LABEL_24;
          }
        }
      }
    }
    id v43 = [COMessageProducedSession alloc];
    [v7 member];
    id v53 = v20;
    v45 = __int16 v44 = (void *)v26;
    id v29 = [(COMessageProducedSession *)v43 initWithMember:v45 producer:*(void *)(a1 + 40)];

    id v39 = v44;
    __int16 v20 = v53;
    [(COMessageSession *)v29 setDidUseRequest:*(void *)(a1 + 32) != 0];
    [(COMessageSession *)v29 setDidUseResponse:v39 != 0];
    [WeakRetained _deliverSuccessfullyStartedSession:v29 withResponse:v39 withMember:v7 producer:*(void *)(a1 + 40)];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
LABEL_34:
}

- (void)_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v10 producer];
    id v15 = [v14 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v16 = [v14 delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke;
      block[3] = &unk_264445328;
      id v33 = v15;
      id v34 = v14;
      id v35 = v10;
      id v36 = v12;
      id v37 = v11;
      id v38 = v13;
      dispatch_async(v16, block);
    }
    [(COMessageChannel *)self _submitMetricsForSession:v10 withError:v13];
  }
  else
  {
    id v14 = [v10 consumer];
    id v15 = [v14 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v17 = [v14 delegateQueue];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      void v25[2] = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2;
      v25[3] = &unk_264445328;
      id v15 = v15;
      id v26 = v15;
      id v14 = v14;
      id v27 = v14;
      id v28 = v10;
      id v29 = v12;
      id v30 = v11;
      id v31 = v13;
      dispatch_async(v17, v25);
    }
  }

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3;
  v21[3] = &unk_264445350;
  objc_copyWeak(&v23, &location);
  id v18 = v10;
  id v22 = v18;
  uint64_t v19 = [(COMessageChannel *)self _remoteInterfaceWithErrorHandler:v21];
  __int16 v20 = [v18 subTopic];
  [v19 sessionEndedForSubTopic:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

uint64_t __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didStopSession:*(void *)(a1 + 48) initiator:*(void *)(a1 + 56) notice:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

uint64_t __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didStopSession:*(void *)(a1 + 48) initiator:*(void *)(a1 + 56) notice:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = COLogForCategory(6);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3_cold_1();
    }
  }
}

- (void)_callbackProducersAndConsumersAfterActivationWithError:(id)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v48 = a3;
  uint64_t v4 = [(COMessageChannel *)self sessionProducers];
  if ([v4 count])
  {
  }
  else
  {
    id v5 = [(COMessageChannel *)self sessionConsumers];
    uint64_t v6 = [v5 count];

    if (!v6) {
      goto LABEL_57;
    }
  }
  id v7 = COLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v48;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p Channel activation complete with error %@. Calling producer and consumer delegates", buf, 0x16u);
  }

  if (v48)
  {
    if ([v48 code] == -1112)
    {
      id v8 = [v48 userInfo];
      id v9 = [v8 objectForKey:@"COMessageChannelDuplicateSessionProducerKey"];

      if (v9)
      {
        v99 = @"COMessageSessionDuplicateSessionProducerKey";
        v100 = v9;
        id v10 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      }
      else
      {
        id v10 = 0;
      }
      id obja = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1209 userInfo:v10];
    }
    else if ([v48 code] == -1113)
    {
      id v29 = [v48 userInfo];
      id v9 = [v29 objectForKey:@"COMessageChannelDuplicateSessionConsumerKey"];

      if (v9)
      {
        v97 = @"COMessageSessionDuplicateSessionConsumerKey";
        v98 = v9;
        id v30 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      }
      else
      {
        id v30 = 0;
      }
      id obja = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1209 userInfo:v30];
    }
    else
    {
      id v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v95 = *MEMORY[0x263F08608];
      id v96 = v48;
      id v9 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      id obja = [v31 errorWithDomain:@"COMessageSessionErrorDomain" code:-1209 userInfo:v9];
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v51 = [(COMessageChannel *)self sessionProducers];
    uint64_t v32 = [v51 countByEnumeratingWithState:&v69 objects:v94 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v70 != v33) {
            objc_enumerationMutation(v51);
          }
          uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          id v36 = [(COMessageChannel *)self sessionProducers];
          id v37 = [v36 objectForKey:v35];

          id v38 = [v37 delegate];
          id v39 = [v37 delegateQueue];
          if (objc_opt_respondsToSelector())
          {
            v64[0] = MEMORY[0x263EF8330];
            v64[1] = 3221225472;
            v64[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_188;
            v64[3] = &unk_264444FE8;
            id v65 = v38;
            uint64_t v66 = self;
            uint64_t v67 = v35;
            id v68 = obja;
            dispatch_async(v39, v64);
          }
        }
        uint64_t v32 = [v51 countByEnumeratingWithState:&v69 objects:v94 count:16];
      }
      while (v32);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v52 = [(COMessageChannel *)self sessionConsumers];
    uint64_t v40 = [v52 countByEnumeratingWithState:&v60 objects:v93 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v61 != v41) {
            objc_enumerationMutation(v52);
          }
          uint64_t v43 = *(void *)(*((void *)&v60 + 1) + 8 * j);
          __int16 v44 = [(COMessageChannel *)self sessionConsumers];
          id v45 = [v44 objectForKey:v43];

          uint64_t v46 = [v45 delegate];
          uint64_t v47 = [v45 delegateQueue];
          if (objc_opt_respondsToSelector())
          {
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            v55[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2_189;
            void v55[3] = &unk_264444FE8;
            id v56 = v46;
            uint64_t v57 = self;
            uint64_t v58 = v43;
            id v59 = obja;
            dispatch_async(v47, v55);
          }
        }
        uint64_t v40 = [v52 countByEnumeratingWithState:&v60 objects:v93 count:16];
      }
      while (v40);
    }
  }
  else
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id obj = [(COMessageChannel *)self sessionProducers];
    uint64_t v11 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v90;
      do
      {
        for (uint64_t k = 0; k != v11; ++k)
        {
          if (*(void *)v90 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v89 + 1) + 8 * k);
          id v15 = [(COMessageChannel *)self sessionProducers];
          id v16 = [v15 objectForKey:v14];

          id v17 = [v16 delegate];
          id v18 = [v16 delegateQueue];
          if (objc_opt_respondsToSelector())
          {
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke;
            block[3] = &unk_2644448B0;
            id v86 = v17;
            v87 = self;
            id v88 = v16;
            dispatch_async(v18, block);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v89 objects:v102 count:16];
      }
      while (v11);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obja = [(COMessageChannel *)self sessionConsumers];
    id v50 = (id)[obja countByEnumeratingWithState:&v81 objects:v101 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v82;
      do
      {
        for (m = 0; m != v50; m = (char *)m + 1)
        {
          if (*(void *)v82 != v49) {
            objc_enumerationMutation(obja);
          }
          uint64_t v20 = *(void *)(*((void *)&v81 + 1) + 8 * (void)m);
          id v21 = [(COMessageChannel *)self sessionConsumers];
          id v22 = [v21 objectForKey:v20];

          id v23 = [v22 delegate];
          id v24 = [v22 delegateQueue];
          if (objc_opt_respondsToSelector())
          {
            v77[0] = MEMORY[0x263EF8330];
            v77[1] = 3221225472;
            v77[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2;
            v77[3] = &unk_2644448B0;
            id v78 = v23;
            v79 = self;
            id v80 = v22;
            dispatch_async(v24, v77);
          }
          uint64_t v25 = [COMessageSessionManagementRequest alloc];
          id v26 = [(COMessageChannel *)self topic];
          id v27 = [(COMessageSessionManagementRequest *)v25 initWithCommandType:0 payload:0 payloadType:0 topic:v26 subTopic:v20];

          id v28 = [NSString _commandTypeForProducerWithSubTopic:v20];
          objc_initWeak((id *)buf, self);
          v75[0] = MEMORY[0x263EF8330];
          v75[1] = 3221225472;
          v75[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_3;
          v75[3] = &unk_264445378;
          objc_copyWeak(&v76, (id *)buf);
          v75[4] = v20;
          v73[0] = MEMORY[0x263EF8330];
          v73[1] = 3221225472;
          v73[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_187;
          v73[3] = &unk_2644453A0;
          objc_copyWeak(&v74, (id *)buf);
          v73[4] = v20;
          [(COMessageChannel *)self _broadcastRequest:v27 type:v28 recipientsCallback:v75 responseCompletionHandler:v73];
          objc_destroyWeak(&v74);
          objc_destroyWeak(&v76);
          objc_destroyWeak((id *)buf);
        }
        id v50 = (id)[obja countByEnumeratingWithState:&v81 objects:v101 count:16];
      }
      while (v50);
    }
  }

LABEL_57:
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didAddProducer:*(void *)(a1 + 48)];
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didAddConsumer:*(void *)(a1 + 48)];
}

void __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = COLogForCategory(6);
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 134218498;
        id v12 = WeakRetained;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_error_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_ERROR, "%p Failed to broadcast session capability for subTopic %@. Error = %@", (uint8_t *)&v11, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      id v12 = WeakRetained;
      __int16 v13 = 2048;
      uint64_t v14 = [v5 count];
      _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p Informing %ld clients about session capability", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_187(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = COLogForCategory(6);
    uint64_t v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v13 = 134218754;
        id v14 = WeakRetained;
        __int16 v15 = 2112;
        id v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_error_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_ERROR, "%p Failed to inform client %@ about session capability for subTopic %@. Error = %@", (uint8_t *)&v13, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 134218498;
      id v14 = WeakRetained;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p Successfully informed client %@ about session capability for subTopic %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_188(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddProducerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2_189(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddConsumerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_setupClusterMonitor
{
  roleMonitorConnectionProvider = self->_roleMonitorConnectionProvider;
  uint64_t v4 = [COClusterRoleMonitor alloc];
  if (roleMonitorConnectionProvider)
  {
    id v5 = self->_roleMonitorConnectionProvider;
    id v6 = [(COMessageChannel *)self cluster];
    id v7 = [(COClusterRoleMonitor *)v4 initWithConnectionProvider:v5 cluster:v6];
  }
  else
  {
    id v6 = [(COMessageChannel *)self cluster];
    id v7 = [(COClusterRoleMonitor *)v4 initWithCluster:v6];
  }
  clusterRoleMonitor = self->_clusterRoleMonitor;
  self->_clusterRoleMonitor = v7;

  objc_initWeak(&location, self);
  id v9 = self->_clusterRoleMonitor;
  workQueue = self->_workQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__COMessageChannel__setupClusterMonitor__block_invoke;
  v12[3] = &unk_2644453C8;
  objc_copyWeak(&v13, &location);
  id v11 = [(COClusterRoleMonitor *)v9 addObserverForSnapshotsToDispatchQueue:workQueue block:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__COMessageChannel__setupClusterMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    id v6 = (void *)MEMORY[0x263EFF9C0];
    id v7 = [WeakRetained roleSnapshotsCache];
    id v8 = [v7 allKeys];
    id v9 = [v6 setWithArray:v8];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v40 = v3;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v16 = [v15 member];
          uint64_t v17 = [v16 memberType];

          if (v17 != 1)
          {
            uint64_t v18 = [v15 member];
            [v5 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v12);
    }

    __int16 v19 = (void *)[v5 mutableCopy];
    id v39 = v9;
    id v20 = (void *)[v9 mutableCopy];
    [v20 minusSet:v5];
    id v38 = v20;
    [WeakRetained _handleRemovedMembers:v20];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = v10;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          id v27 = [v26 member];
          int v28 = [v19 containsObject:v27];

          if (v28)
          {
            id v29 = [WeakRetained roleSnapshotsCache];
            id v30 = [v26 member];
            [v29 setObject:v26 forKey:v30];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v23);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v31 = v38;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v41 + 1) + 8 * k);
          id v37 = [WeakRetained roleSnapshotsCache];
          [v37 removeObjectForKey:v36];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v33);
    }

    [v19 minusSet:v39];
    [WeakRetained _handleAddedMembers:v19];

    id v3 = v40;
  }
}

- (void)_handleAddedMembers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(COMessageChannel *)self sessionProducers];
  id v6 = [v5 allValues];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v4;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              [(COMessageChannel *)self _startSessionWithProducer:v11 member:*(void *)(*((void *)&v18 + 1) + 8 * v16++)];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)_handleRemovedMembers:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1212 userInfo:0];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v45;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v6;
        uint64_t v7 = *(void *)(*((void *)&v44 + 1) + 8 * v6);
        uint64_t v8 = [(COMessageChannel *)self sessionProducers];
        uint64_t v9 = (void *)[v8 copy];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v34 = v9;
        uint64_t v10 = [v9 allValues];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v16 = [v15 sessions];
              uint64_t v17 = [v16 objectForKey:v7];

              if (v17)
              {
                [(COMessageChannel *)self _deliverDidEndDelegateForSession:v17 notice:0 initiator:0 error:v5];
                long long v18 = [v15 sessions];
                [v18 removeObjectForKey:v7];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v12);
        }

        long long v19 = [(COMessageChannel *)self sessionConsumers];
        long long v20 = (void *)[v19 copy];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v33 = v20;
        long long v21 = [v20 allValues];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              id v27 = [v26 sessions];
              uint64_t v28 = [v27 objectForKey:v7];

              if (v28)
              {
                [(COMessageChannel *)self _deliverDidEndDelegateForSession:v28 notice:0 initiator:0 error:v5];
                id v29 = [v26 sessions];
                [v29 removeObjectForKey:v7];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v23);
        }

        uint64_t v6 = v35 + 1;
      }
      while (v35 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v32);
  }
}

- (void)_submitMetricsForActivationCompletionWithError:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [(COMessageChannel *)self clusterLabel];
  [v5 setObject:v6 forKeyedSubscript:0x26CDCBA08];

  uint64_t v7 = [(COMessageChannel *)self topic];
  [v5 setObject:v7 forKeyedSubscript:0x26CDCBC48];

  if (v4)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v4, "code"));
    [v5 setObject:v8 forKeyedSubscript:0x26CDCBAA8];

    uint64_t v9 = [v4 domain];
    [v5 setObject:v9 forKeyedSubscript:0x26CDCBA68];
  }
  uint64_t v10 = [(COMessageChannel *)self recorder];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__COMessageChannel__submitMetricsForActivationCompletionWithError___block_invoke;
  v13[3] = &unk_2644453F0;
  id v14 = v5;
  uint64_t v11 = (void (*)(void *, uint64_t, void *))v10[2];
  id v12 = v5;
  v11(v10, 0x26CDCB9A8, v13);
}

id __67__COMessageChannel__submitMetricsForActivationCompletionWithError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForSession:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [(COMessageChannel *)self topic];
  [v8 setObject:v9 forKeyedSubscript:0x26CDCBC48];

  uint64_t v10 = [(COMessageChannel *)self clusterLabel];
  [v8 setObject:v10 forKeyedSubscript:0x26CDCBA08];

  if (v6)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "didUseRequest"));
    [v8 setObject:v11 forKeyedSubscript:0x26CDCBC88];

    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "didUseResponse"));
    [v8 setObject:v12 forKeyedSubscript:0x26CDCBCA8];

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "didUseNotice"));
    [v8 setObject:v13 forKeyedSubscript:0x26CDCBC68];

    double v14 = fmax((double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - [v6 startTime]) / 1000000000.0, 0.0);
  }
  else
  {
    double v14 = 0.0;
  }
  uint64_t v15 = [NSNumber numberWithDouble:v14];
  [v8 setObject:v15 forKeyedSubscript:0x26CDCB2E8];

  if (v7)
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v7, "code"));
    [v8 setObject:v16 forKeyedSubscript:0x26CDCBAA8];

    uint64_t v17 = [v7 domain];
    [v8 setObject:v17 forKeyedSubscript:0x26CDCBA68];
  }
  long long v18 = [(COMessageChannel *)self recorder];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__COMessageChannel__submitMetricsForSession_withError___block_invoke;
  v21[3] = &unk_2644453F0;
  id v22 = v8;
  long long v19 = (void (*)(void *, uint64_t, void *))v18[2];
  id v20 = v8;
  v19(v18, 0x26CDCB9C8, v21);
}

id __55__COMessageChannel__submitMetricsForSession_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForRequest:(id)a3 withRequestInfo:(id)a4 withError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263EFF9A0];
  id v11 = a3;
  id v12 = [v10 dictionary];
  uint64_t v13 = [(COMessageChannel *)self clusterLabel];
  [v12 setObject:v13 forKeyedSubscript:0x26CDCBA08];

  double v14 = [(COMessageChannel *)self topic];
  [v12 setObject:v14 forKeyedSubscript:0x26CDCB9E8];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = [(COMessageChannel *)self _payloadTypeFromClass:v15];
  [v12 setObject:v16 forKeyedSubscript:0x26CDCBA28];

  if (v8)
  {
    uint64_t v17 = [v8 destinationInfo];
    [v12 setObject:v17 forKeyedSubscript:0x26CDCBA48];
  }
  else
  {
    [v12 setObject:0x26CDCBB28 forKeyedSubscript:0x26CDCBA48];
  }
  long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "messageSize"));
  [v12 setObject:v18 forKeyedSubscript:0x26CDCBAE8];

  long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "expectedRecipients") * objc_msgSend(v8, "messageSize"));
  [v12 setObject:v19 forKeyedSubscript:0x26CDCBB08];

  if (v9)
  {
    id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "code"));
    [v12 setObject:v20 forKeyedSubscript:0x26CDCBAA8];

    long long v21 = [v9 domain];
    [v12 setObject:v21 forKeyedSubscript:0x26CDCBA68];

    id v22 = [v9 userInfo];
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v23)
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v23, "code"));
      [v12 setObject:v24 forKeyedSubscript:0x26CDCBAC8];

      long long v25 = [v23 domain];
      [v12 setObject:v25 forKeyedSubscript:0x26CDCBA88];
    }
  }
  id v26 = [(COMessageChannel *)self recorder];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __71__COMessageChannel__submitMetricsForRequest_withRequestInfo_withError___block_invoke;
  v29[3] = &unk_2644453F0;
  id v30 = v12;
  id v27 = (void (*)(void *, uint64_t, void *))v26[2];
  id v28 = v12;
  v27(v26, 0x26CDCB988, v29);
}

id __71__COMessageChannel__submitMetricsForRequest_withRequestInfo_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForResponse:(id)a3 size:(unint64_t)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263EFF9A0];
  id v10 = a3;
  id v11 = [v9 dictionary];
  id v12 = [(COMessageChannel *)self clusterLabel];
  [v11 setObject:v12 forKeyedSubscript:0x26CDCBA08];

  uint64_t v13 = [(COMessageChannel *)self topic];
  [v11 setObject:v13 forKeyedSubscript:0x26CDCB9E8];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(COMessageChannel *)self _payloadTypeFromClass:v14];
  [v11 setObject:v15 forKeyedSubscript:0x26CDCBA28];

  [v11 setObject:0x26CDCBB48 forKeyedSubscript:0x26CDCBA48];
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:a4];
  [v11 setObject:v16 forKeyedSubscript:0x26CDCBAE8];

  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a4];
  [v11 setObject:v17 forKeyedSubscript:0x26CDCBB08];

  if (v8)
  {
    long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v8, "code"));
    [v11 setObject:v18 forKeyedSubscript:0x26CDCBAA8];

    long long v19 = [v8 domain];
    [v11 setObject:v19 forKeyedSubscript:0x26CDCBA68];

    id v20 = [v8 userInfo];
    long long v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v21)
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v21, "code"));
      [v11 setObject:v22 forKeyedSubscript:0x26CDCBAC8];

      uint64_t v23 = [v21 domain];
      [v11 setObject:v23 forKeyedSubscript:0x26CDCBA88];
    }
  }
  uint64_t v24 = [(COMessageChannel *)self recorder];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __61__COMessageChannel__submitMetricsForResponse_size_withError___block_invoke;
  v27[3] = &unk_2644453F0;
  id v28 = v11;
  long long v25 = (void (*)(void *, uint64_t, void *))v24[2];
  id v26 = v11;
  v25(v24, 0x26CDCB988, v27);
}

id __61__COMessageChannel__submitMetricsForResponse_size_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)topic
{
  return self->_topic;
}

- (id)cluster
{
  return self->_cluster;
}

- (NSString)clusterLabel
{
  return self->_clusterLabel;
}

- (NSXPCConnection)lastConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setLastConnection:(id)a3
{
}

- (unint64_t)sendLimit
{
  return self->_sendLimit;
}

- (void)setSendLimit:(unint64_t)a3
{
  self->_sendLimit = a3;
}

- (unint64_t)receiveLimit
{
  return self->_receiveLimit;
}

- (void)setReceiveLimit:(unint64_t)a3
{
  self->_receiveLimit = a3;
}

- (COClusterRoleMonitor)clusterRoleMonitor
{
  return self->_clusterRoleMonitor;
}

- (void)setClusterRoleMonitor:(id)a3
{
}

- (NSMutableDictionary)roleSnapshotsCache
{
  return self->_roleSnapshotsCache;
}

- (void)setRoleSnapshotsCache:(id)a3
{
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_locuint64_t k = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (unsigned)baseRequestID
{
  return self->_baseRequestID;
}

- (void)setBaseRequestID:(unsigned int)a3
{
  self->_baseRequestID = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
}

- (NSMutableDictionary)sessionProducers
{
  return self->_sessionProducers;
}

- (void)setSessionProducers:(id)a3
{
}

- (NSMutableDictionary)sessionConsumers
{
  return self->_sessionConsumers;
}

- (void)setSessionConsumers:(id)a3
{
}

- (NSMutableDictionary)sessionsInflight
{
  return self->_sessionsInflight;
}

- (void)setSessionsInflight:(id)a3
{
}

- (COMessageChannelConnectionProvider)provider
{
  return self->_provider;
}

- (COClusterRoleMonitorConnectionProvider)roleMonitorConnectionProvider
{
  return self->_roleMonitorConnectionProvider;
}

- (id)foundHandler
{
  return self->_foundHandler;
}

- (void)setFoundHandler:(id)a3
{
}

- (id)lostHandler
{
  return self->_lostHandler;
}

- (void)setLostHandler:(id)a3
{
}

- (NSSet)groupedHomeKitIdentifiers
{
  return self->_groupedHomeKitIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedHomeKitIdentifiers, 0);
  objc_storeStrong(&self->_lostHandler, 0);
  objc_storeStrong(&self->_foundHandler, 0);
  objc_storeStrong((id *)&self->_roleMonitorConnectionProvider, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_sessionsInflight, 0);
  objc_storeStrong((id *)&self->_sessionConsumers, 0);
  objc_storeStrong((id *)&self->_sessionProducers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_roleSnapshotsCache, 0);
  objc_storeStrong((id *)&self->_clusterRoleMonitor, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_clusterLabel, 0);
  objc_storeStrong(&self->_cluster, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

void __44___COMessageChannel_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) rapportTransport];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_2;
  v4[3] = &unk_264445630;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 activateWithCompletion:v4];
}

void __44___COMessageChannel_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = COLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v5;
    __int16 v51 = 2112;
    id v52 = v3;
    _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%p channel activation complete with error %@", buf, 0x16u);
  }
  id v30 = v3;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = [*(id *)(a1 + 32) sessionProducers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * v10);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "sessionProducers", v30);
        uint64_t v13 = [v12 objectForKey:v11];

        uint64_t v14 = [v13 delegate];
        uint64_t v15 = [v13 delegateQueue];
        if (objc_opt_respondsToSelector())
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_19;
          block[3] = &unk_2644448B0;
          id v16 = v14;
          uint64_t v17 = *(void *)(a1 + 32);
          id v40 = v16;
          uint64_t v41 = v17;
          id v42 = v13;
          dispatch_async(v15, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v18 = [*(id *)(a1 + 32) sessionConsumers];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend(*(id *)(a1 + 32), "sessionConsumers", v30);
        long long v25 = [v24 objectForKey:v23];

        id v26 = [v25 delegate];
        id v27 = [v25 delegateQueue];
        if (objc_opt_respondsToSelector())
        {
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_2_23;
          v31[3] = &unk_2644448B0;
          id v28 = v26;
          uint64_t v29 = *(void *)(a1 + 32);
          id v32 = v28;
          uint64_t v33 = v29;
          id v34 = v25;
          dispatch_async(v27, v31);
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v20);
  }
}

uint64_t __44___COMessageChannel_activateWithCompletion___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didAddProducer:*(void *)(a1 + 48)];
}

uint64_t __44___COMessageChannel_activateWithCompletion___block_invoke_2_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didAddConsumer:*(void *)(a1 + 48)];
}

uint64_t __63___COMessageChannel_sendRequest_members_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_sendRequest:members:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [*(id *)(a1 + 32) rapportTransport];
  id v4 = [v3 activeMembers];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [v2 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
  uint64_t v22 = v5;

  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        long long v18 = objc_msgSend(v17, "member", v22);
        uint64_t v19 = [*(id *)(a1 + 32) rapportTransport];
        uint64_t v20 = *(void *)(a1 + 40);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke_2;
        v24[3] = &unk_264444620;
        id v21 = *(id *)(a1 + 56);
        void v24[4] = v17;
        id v25 = v21;
        [v19 sendRequest:v20 to:v18 withCompletionHandler:v24];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v14);
  }
}

uint64_t __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

void __72___COMessageChannel__onqueue_sendRequest_members_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53___COMessageChannel_registerHandler_forRequestClass___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activated])
  {
    uint64_t v2 = COLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __53___COMessageChannel_registerHandler_forRequestClass___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) requestHandlers];
    id v3 = (void *)MEMORY[0x21D4BD7F0](*(void *)(a1 + 40));
    id v4 = [*(id *)(a1 + 32) _payloadTypeFromClass:*(void *)(a1 + 48)];
    [v5 setObject:v3 forKey:v4];
  }
}

void __48___COMessageChannel_registerMemberFoundHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activated])
  {
    uint64_t v2 = COLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __48___COMessageChannel_registerMemberFoundHandler___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 setFoundHandler:v4];
  }
}

void __47___COMessageChannel_registerMemberLostHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activated])
  {
    uint64_t v2 = COLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47___COMessageChannel_registerMemberLostHandler___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 setLostHandler:v4];
  }
}

void __46___COMessageChannel_groupedHomeKitIdentifiers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) rapportTransport];
  uint64_t v2 = [v5 groupHKIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __50___COMessageChannel_addGroupedHomeKitIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rapportTransport];
  [v2 addHomeKitGroupIdentifiers:*(void *)(a1 + 40)];
}

void __53___COMessageChannel_removeGroupedHomeKitIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rapportTransport];
  [v2 removeHomeKitGroupIdentifiers:*(void *)(a1 + 40)];
}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 184))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1202 userInfo:0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    block[3] = &unk_264444FE8;
    uint64_t v3 = *(NSObject **)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v17 = v4;
    uint64_t v18 = v5;
    id v19 = *(id *)(a1 + 56);
    id v20 = v2;
    id v6 = v2;
    dispatch_async(v3, block);
  }
  else
  {
    id v6 = [NSString _commandTypeForProducerWithSubTopic:*(void *)(a1 + 56)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    v12[3] = &unk_264445010;
    objc_copyWeak(&v14, &location);
    id v13 = *(id *)(a1 + 56);
    id v7 = (void *)MEMORY[0x21D4BD7F0](v12);
    id v8 = [*(id *)(a1 + 32) requestHandlers];
    uint64_t v9 = (void *)MEMORY[0x21D4BD7F0](v7);
    [v8 setObject:v9 forKey:v6];

    uint64_t v10 = [[COMessageSessionProducer alloc] initWithChannel:*(void *)(a1 + 32) subTopic:*(void *)(a1 + 56) delegate:*(void *)(a1 + 40) dispatchQueue:*(void *)(a1 + 48)];
    uint64_t v11 = [*(id *)(a1 + 32) sessionProducers];
    [v11 setObject:v10 forKey:*(void *)(a1 + 56)];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

uint64_t __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddProducerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = v7;
    if ([v11 commandType] == 2)
    {
      objc_msgSend(WeakRetained, "_onqueue_handleStopCommand:fromMember:callback:", v11, v8, v9);
    }
    else if ([v11 commandType])
    {
      id v12 = COLogForCategory(6);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1((uint64_t)WeakRetained, a1, v12);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_onqueue_handleCapableCommand:fromMember:callback:", v11, v8, v9);
    }
  }
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[184])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1203 userInfo:0];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
      block[3] = &unk_264444FE8;
      id v4 = *(NSObject **)(a1 + 48);
      id v5 = *(id *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 32);
      id v22 = v5;
      uint64_t v23 = v6;
      id v24 = *(id *)(a1 + 56);
      id v25 = v3;
      id v7 = v3;
      dispatch_async(v4, block);
    }
  }
  else
  {
    objc_initWeak(&location, v2);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    uint64_t v18 = &unk_264445038;
    objc_copyWeak(&v19, &location);
    id v8 = (void *)MEMORY[0x21D4BD7F0](&v15);
    id v9 = objc_msgSend(*(id *)(a1 + 32), "requestHandlers", v15, v16, v17, v18);
    uint64_t v10 = (void *)MEMORY[0x21D4BD7F0](v8);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v9 setObject:v10 forKey:v12];

    id v13 = [[COMessageSessionConsumer alloc] initWithChannel:*(void *)(a1 + 32) subTopic:*(void *)(a1 + 56) delegate:*(void *)(a1 + 40) dispatchQueue:*(void *)(a1 + 48)];
    id v14 = [*(id *)(a1 + 32) sessionConsumers];
    [v14 setObject:v13 forKey:*(void *)(a1 + 56)];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

uint64_t __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) channel:*(void *)(a1 + 40) didFailToAddConsumerWithSubTopic:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4;
    v13[3] = &unk_264444508;
    id v14 = v7;
    uint64_t v15 = v11;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v12, v13);
  }
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if ([v2 commandType] == 1)
  {
    uint64_t v3 = COLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [v2 subTopic];
      uint64_t v6 = *(void *)(a1 + 48);
      int v13 = 134218498;
      uint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_21D3E0000, v3, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to start a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_onqueue_handleStartCommand:withMember:callback:", v2, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else
  {
    uint64_t v7 = [v2 commandType];
    id v8 = COLogForCategory(5);
    id v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = [v2 subTopic];
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = 134218498;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to stop a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_onqueue_handleStopCommand:fromMember:callback:", v2, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4_cold_1(a1, v2, v9);
      }
    }
  }
}

void __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_2;
  v5[3] = &unk_2644452B8;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  [v2 producer:v3 shouldStartSessionWithMember:v4 completionHandler:v5];

  objc_destroyWeak(&v8);
}

void __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_2(id *a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v7 = COLogForCategory(6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        id v9 = a1[4];
        *(_DWORD *)buf = 134218498;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v5;
        _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p Client wants to start a session with member %@ with request %@", buf, 0x20u);
      }

      uint64_t v10 = [WeakRetained workQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_39;
      v12[3] = &unk_264444FE8;
      void v12[4] = WeakRetained;
      id v13 = a1[5];
      id v14 = a1[4];
      id v15 = v5;
      dispatch_async(v10, v12);
    }
    else
    {
      if (v8)
      {
        id v11 = a1[4];
        *(_DWORD *)buf = 134218242;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p Client does not want to start a session with member %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSessionWithProducer:member:request:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = [v9 domain];
      if ([v11 isEqualToString:@"COMessageChannelErrorDomain"])
      {
        uint64_t v12 = [v9 code];

        if (v12 == -1114)
        {
          id v13 = COLogForCategory(6);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v62 = WeakRetained;
            __int16 v63 = 2112;
            id v64 = v7;
            _os_log_impl(&dword_21D3E0000, v13, OS_LOG_TYPE_DEFAULT, "%@ Member %@ does not have an active message channel for Sessions. Deferring session creation.", buf, 0x16u);
          }

          id v14 = *(void **)(a1 + 32);
          if (v14)
          {
            id v15 = v14;
          }
          else
          {
            id v15 = [MEMORY[0x263EFF9D0] null];
          }
          id v16 = v15;
          id v42 = [WeakRetained sessionsInflight];
          long long v43 = [v7 member];
          [v42 setObject:v16 forKey:v43];

          goto LABEL_33;
        }
      }
      else
      {
      }
      id v21 = [v9 domain];
      if ([v21 isEqualToString:@"COMessageChannelErrorDomain"])
      {
        uint64_t v22 = [v9 code];

        if (v22 == -1101)
        {
          id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1210 userInfo:0];
LABEL_19:
          objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(void *)(a1 + 40), v16);
LABEL_33:

          goto LABEL_34;
        }
      }
      else
      {
      }
      uint64_t v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v59 = *MEMORY[0x263F08608];
      id v60 = v9;
      id v24 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id v16 = [v23 errorWithDomain:@"COMessageSessionErrorDomain" code:-1204 userInfo:v24];

      goto LABEL_19;
    }
    id v16 = v8;
    id v17 = [v16 remoteError];

    if (v17)
    {
      __int16 v18 = COLogForCategory(6);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_2(a1, v16, v18);
      }

      uint64_t v19 = *(void *)(a1 + 40);
      __int16 v20 = [v16 remoteError];
      objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, v19, v20);
      goto LABEL_32;
    }
    __int16 v20 = [v16 payload];
    id v25 = [v16 payloadType];
    uint64_t v26 = 0;
    uint64_t v53 = v25;
    if (v20)
    {
      long long v27 = v25;
      if (v25)
      {
        Class v28 = NSClassFromString(v25);
        if (v28)
        {
          id v54 = 0;
          uint64_t v26 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v28 fromData:v20 error:&v54];
          long long v29 = (COMessageProducedSession *)v54;
          if (v29)
          {
LABEL_24:
            uint64_t v50 = (void *)v26;
            long long v30 = COLogForCategory(6);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_1();
            }

            long long v31 = (void *)MEMORY[0x263F087E8];
            uint64_t v55 = *MEMORY[0x263F08608];
            uint64_t v56 = v29;
            long long v32 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
            uint64_t v33 = [v31 errorWithDomain:@"COMessageSessionErrorDomain" code:-1208 userInfo:v32];

            uint64_t v34 = v33;
            long long v49 = (void *)v33;
            objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(void *)(a1 + 40), v33);
            long long v48 = [COMessageSessionManagementRequest alloc];
            long long v35 = [WeakRetained topic];
            uint64_t v36 = [*(id *)(a1 + 40) subTopic];
            long long v37 = [(COMessageSessionManagementRequest *)v48 initWithCommandType:2 error:v34 topic:v35 subTopic:v36];

            long long v38 = (void *)MEMORY[0x263EFFA08];
            long long v39 = [v7 member];
            id v40 = [v38 setWithObject:v39];
            objc_msgSend(WeakRetained, "_onqueue_sendRequest:members:withCompletionHandler:", v37, v40, &__block_literal_global_9);

            uint64_t v41 = v50;
            goto LABEL_31;
          }
        }
        else
        {
          __int16 v51 = (void *)MEMORY[0x263F087E8];
          uint64_t v57 = @"COMessageSessionUnknownClassErrorKey";
          uint64_t v58 = v27;
          long long v44 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          long long v29 = [v51 errorWithDomain:@"COMessageSessionErrorDomain" code:-1208 userInfo:v44];

          uint64_t v26 = 0;
          if (v29) {
            goto LABEL_24;
          }
        }
      }
    }
    long long v45 = [COMessageProducedSession alloc];
    [v7 member];
    id v52 = v20;
    v47 = long long v46 = (void *)v26;
    long long v29 = [(COMessageProducedSession *)v45 initWithMember:v47 producer:*(void *)(a1 + 40)];

    uint64_t v41 = v46;
    __int16 v20 = v52;
    [(COMessageSession *)v29 setDidUseRequest:*(void *)(a1 + 32) != 0];
    [(COMessageSession *)v29 setDidUseResponse:v41 != 0];
    objc_msgSend(WeakRetained, "_onqueue_deliverSuccessfullyStartedSession:withResponse:withMember:producer:", v29, v41, v7, *(void *)(a1 + 40));
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
LABEL_34:
}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_2;
  v9[3] = &unk_264445240;
  objc_copyWeak(&v15, (id *)(a1 + 88));
  id v10 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = *(void **)(a1 + 72);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v14 = *(id *)(a1 + 80);
  [v2 consumer:v3 shouldStartSessionWithMember:v4 request:v5 completionHandler:v9];

  objc_destroyWeak(&v15);
}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_3;
    v12[3] = &unk_2644456A8;
    char v20 = a2;
    id v13 = v5;
    id v14 = v7;
    id v15 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    id v16 = v9;
    uint64_t v17 = v10;
    id v18 = v11;
    id v19 = *(id *)(a1 + 64);
    dispatch_async(v8, v12);
  }
}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_3(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      id v14 = 0;
      uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v14];
      id v4 = v14;
      if (v4)
      {
        id v5 = v4;
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = *MEMORY[0x263F08608];
        v16[0] = v4;
        uint64_t v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        id v8 = [v6 errorWithDomain:@"COMessageSessionErrorDomain" code:-1207 userInfo:v7];

        if (v8)
        {
          id v9 = [[COMessageSessionManagementResponse alloc] initWithRemoteError:v8];
          objc_msgSend(*(id *)(a1 + 40), "_onqueue_deliverDidFailToStartSessionWithMember:consumer:error:", *(void *)(a1 + 48), *(void *)(a1 + 56), v8);

LABEL_9:
          goto LABEL_10;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    uint64_t v12 = [COMessageSessionManagementResponse alloc];
    id v13 = [*(id *)(a1 + 64) _payloadTypeFromClass:objc_opt_class()];
    id v9 = [(COMessageSessionManagementResponse *)v12 initWithPayload:v3 payloadType:v13];

    objc_msgSend(*(id *)(a1 + 40), "_onqueue_deliverSuccessfullyStartedSession:withMember:consumer:", *(void *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 56));
    goto LABEL_9;
  }
  uint64_t v10 = [COMessageSessionManagementResponse alloc];
  id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageSessionErrorDomain" code:-1213 userInfo:0];
  id v9 = [(COMessageSessionManagementResponse *)v10 initWithRemoteError:v11];

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

uint64_t __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_producer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didFailToStartSessionWithMember:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_consumer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didFailToStartSessionWithMember:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __97___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didStartSession:*(void *)(a1 + 48) member:*(void *)(a1 + 56) response:*(void *)(a1 + 64)];
}

uint64_t __84___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withMember_consumer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didStartSession:*(void *)(a1 + 48)];
}

uint64_t __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) producer:*(void *)(a1 + 40) didStopSession:*(void *)(a1 + 48) initiator:*(void *)(a1 + 56) notice:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

uint64_t __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) consumer:*(void *)(a1 + 40) didStopSession:*(void *)(a1 + 48) initiator:*(void *)(a1 + 56) notice:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void __35___COMessageChannel_didFindMember___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) foundHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) foundHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
  id v4 = [*(id *)(a1 + 32) sessionProducers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35___COMessageChannel_didFindMember___block_invoke_2;
  v6[3] = &unk_2644456D0;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __35___COMessageChannel_didFindMember___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSessionWithProducer:member:", a3, *(void *)(a1 + 40));
}

void __35___COMessageChannel_didLoseMember___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lostHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) lostHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

void __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _payloadTypeFromClass:objc_opt_class()];
  uint64_t v3 = [*(id *)(a1 + 32) requestHandlers];
  id v4 = [v3 objectForKey:v2];

  if (v4)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke_2;
    v8[3] = &unk_2644456F8;
    objc_copyWeak(&v10, &location);
    id v9 = *(id *)(a1 + 56);
    id v5 = (void *)MEMORY[0x21D4BD7F0](v8);
    id v6 = +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:*(void *)(a1 + 48)];
    ((void (**)(void, void, void *, void *))v4)[2](v4, *(void *)(a1 + 40), v6, v5);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1101 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Cannot add session producer %@ after activation");
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Received unknown command on producer handler for subTopic %@");
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Cannot add session consumer %@ after activation");
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [a2 subTopic];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "%p Message channel received a session management request without unknown type for subtopic %@", (uint8_t *)&v6, 0x16u);
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Failed to find a connected client that handles request of type %@");
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_74_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Failed to encode response with error %@");
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p No response completion handler for request %@");
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p Failed to send message. Message too big", v2, v3, v4, v5, v6);
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Failed to encode request with error %@");
}

- (void)_broadcastRequest:type:recipientsCallback:responseCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p No response completion handler for broadcast request %@");
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Error connecting to the remote service %@");
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Error activating message channel. Error = %@");
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to Messaging service interrupted", v2, v3, v4, v5, v6);
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_154_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to Messaging service invalidated", v2, v3, v4, v5, v6);
}

void __44__COMessageChannel__lostConnectionToService__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to re-activate lost connection. Error %@");
}

- (void)_invokeResponseCallbackForInfo:snapshot:response:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p No response block found for requestInfo %@");
}

- (void)_handleStartCommand:(uint8_t *)buf withMember:(os_log_t)log callback:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_21D3E0000, log, OS_LOG_TYPE_DEBUG, "%p Message channel reaching out to delegate consumer:shouldStartSessionWithMember:request:completionHandler: for subTopic %@", buf, 0x16u);
}

void __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21D3E0000, v0, OS_LOG_TYPE_ERROR, "%@ Producer failed to inform the service about a new session %@", v1, 0x16u);
}

void __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21D3E0000, v0, OS_LOG_TYPE_ERROR, "%p Consumer failed to inform service about a new session %@", v1, 0x16u);
}

- (void)_startSessionWithProducer:member:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21D3E0000, v0, OS_LOG_TYPE_DEBUG, "%p Reaching out to client delegate producer:shouldStartSessionWithMember:completionHandler: with member %@", v1, 0x16u);
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_21D3E0000, v2, OS_LOG_TYPE_ERROR, "%@ Producer failed to unarchive the response from member %@. Error = %@", v3, 0x20u);
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 subTopic];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [a2 remoteError];
  int v10 = 138413058;
  id v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "%@ Producer failed to start a session with sub-topic %@ with member %@. Error %@", (uint8_t *)&v10, 0x2Au);
}

void __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Failed to inform the service about end of session %@");
}

void __53___COMessageChannel_registerHandler_forRequestClass___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p Handlers cannot be registered after activation", v2, v3, v4, v5, v6);
}

void __48___COMessageChannel_registerMemberFoundHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p Member found handler cannot be registered after activation", v2, v3, v4, v5, v6);
}

void __47___COMessageChannel_registerMemberLostHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p Member lost handler cannot be registered after activation", v2, v3, v4, v5, v6);
}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21D3E0000, log, OS_LOG_TYPE_ERROR, "%p Received unknown command on producer handler for subTopic %@", (uint8_t *)&v4, 0x16u);
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [a2 subTopic];
  int v7 = 134218242;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = v6;
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "%p Message channel received a session management request without unknown type for subtopic %@", (uint8_t *)&v7, 0x16u);
}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_21D3E0000, v3, OS_LOG_TYPE_ERROR, "%@ Producer failed to unarchive the response from member %@. Error = %@", v4, 0x20u);
}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  __int16 v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 subTopic];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = [a2 remoteError];
  int v12 = 138413058;
  id v13 = v6;
  OUTLINED_FUNCTION_1_1();
  __int16 v14 = v7;
  __int16 v15 = v10;
  uint64_t v16 = v8;
  __int16 v17 = v10;
  uint64_t v18 = v11;
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "%@ Producer failed to start a session with sub-topic %@ with member %@. Error %@", (uint8_t *)&v12, 0x2Au);
}

@end