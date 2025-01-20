@interface HMDRemoteEventRouterClient
+ (id)logCategory;
+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6;
+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 retryIntervalProvider:(id)a6 logCategory:(const char *)a7;
- (BOOL)client:(id)a3 isConnectionTerminatingError:(id)a4;
- (BOOL)clientIsEnabled:(id)a3;
- (BOOL)isConnected;
- (BOOL)isNetworkAvailable;
- (BOOL)isPrimaryResident;
- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 logCategory:(const char *)a11 logEventSubmitter:(id)a12 eventRouterClientFactory:(id)a13;
- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12;
- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 logCategory:(const char *)a13;
- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 retryIntervalProvider:(id)a13 logCategory:(const char *)a14;
- (HMDRemoteEventRouterClientDataSource)dataSource;
- (HMEMessageDatagramClient)eventRouterClient;
- (HMFMessageDispatcher)messageDispatcher;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSNotificationCenter)notificationCenter;
- (NSString)multiHopFetchResponseMessageName;
- (NSString)requestMessageName;
- (NSString)updateMessageName;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4;
- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4;
- (id)client:(id)a3 sendConnectWithAddedFilters:(id)a4 completion:(id)a5;
- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4;
- (id)dumpStateDescription;
- (id)logIdentifier;
- (id)responseHandlerForMessageIdentifier:(id)a3 serverIdentifier:(id)a4 messageType:(int64_t)a5 completion:(id)a6;
- (id)sendMessageWithPayloadMessage:(id)a3 client:(id)a4 messageType:(int64_t)a5 completion:(id)a6;
- (unint64_t)messageTransportRestriction;
- (void)_handleCachedEventMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6;
- (void)_handleEventUpdateMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6;
- (void)_handleMultiHopFetchResponse:(id)a3 originalMessage:(id)a4;
- (void)_handleUpdateMessage:(id)a3;
- (void)_handleUpdatedEventsRequest:(id)a3 originalMessage:(id)a4;
- (void)_registerForMessages:(id)a3;
- (void)client:(id)a3 fetchWithFilters:(id)a4 isMultiHop:(BOOL)a5 completion:(id)a6;
- (void)client:(id)a3 sendChangeRegistrationsWithAddedFilters:(id)a4 removedFilters:(id)a5 completion:(id)a6;
- (void)clientDidConnect:(id)a3 serverIdentifier:(id)a4;
- (void)clientDidDisconnect:(id)a3;
- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5;
- (void)didChangeFetchAvailableCondition:(BOOL)a3;
- (void)didChangeHasForegroundClient:(BOOL)a3;
- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3;
- (void)networkAvailabilityDidChange:(BOOL)a3;
- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 client:(id)a5 completion:(id)a6;
- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5;
- (void)sendDisconnectForClient:(id)a3 completion:(id)a4;
- (void)sendKeepAliveForClient:(id)a3 completion:(id)a4;
- (void)sendMessageWithPayloadMessage:(id)a3 messageType:(int64_t)a4 destination:(id)a5 serverIdentifier:(id)a6 completion:(id)a7;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNetworkAvailable:(BOOL)a3;
@end

@implementation HMDRemoteEventRouterClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterClient, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_multiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_requestMessageName, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMEMessageDatagramClient)eventRouterClient
{
  return (HMEMessageDatagramClient *)objc_getProperty(self, a2, 104, 1);
}

- (HMDRemoteEventRouterClientDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDRemoteEventRouterClientDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  return (HMMLogEventSubmitting *)WeakRetained;
}

- (void)setIsNetworkAvailable:(BOOL)a3
{
  self->_isNetworkAvailable = a3;
}

- (BOOL)isNetworkAvailable
{
  return self->_isNetworkAvailable;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (NSString)multiHopFetchResponseMessageName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)updateMessageName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)requestMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (id)dumpStateDescription
{
  v3 = NSString;
  v4 = HMFBooleanToString();
  v5 = [(HMDRemoteEventRouterClient *)self messageTargetUUID];
  v6 = [(HMDRemoteEventRouterClient *)self eventRouterClient];
  v7 = [v6 dumpStateDescription];
  v8 = [v3 stringWithFormat:@"[HMDRemoteEventRouterClient primary: %@, messageTarget: %@, client: %@]", v4, v5, v7];

  return v8;
}

- (void)didChangeFetchAvailableCondition:(BOOL)a3
{
  v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HMDRemoteEventRouterClient_didChangeFetchAvailableCondition___block_invoke;
  v6[3] = &unk_264A2B870;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __63__HMDRemoteEventRouterClient_didChangeFetchAvailableCondition___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 2;
  }
  id v2 = [*(id *)(a1 + 32) eventRouterClient];
  [v2 updateDormantFetchCondition:v1 completion:&__block_literal_global_70];
}

- (void)didChangeHasForegroundClient:(BOOL)a3
{
  v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMDRemoteEventRouterClient_didChangeHasForegroundClient___block_invoke;
  v6[3] = &unk_264A2B870;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __59__HMDRemoteEventRouterClient_didChangeHasForegroundClient___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 2;
  }
  id v2 = [*(id *)(a1 + 32) eventRouterClient];
  [v2 updateConnectionMode:v1 completion:&__block_literal_global_68];
}

- (void)networkAvailabilityDidChange:(BOOL)a3
{
  v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMDRemoteEventRouterClient_networkAvailabilityDidChange___block_invoke;
  v6[3] = &unk_264A2B870;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __59__HMDRemoteEventRouterClient_networkAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) isNetworkAvailable];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v4[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      BOOL v7 = HMFBooleanToString();
      int v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "Network availability changed to %@", (uint8_t *)&v11, 0xCu);

      int v3 = *(unsigned __int8 *)(a1 + 40);
      v4 = *(void **)(a1 + 32);
    }
    [v4 setIsNetworkAvailable:v3 != 0];
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  if (v3)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v8 eventRouterClient];
    LODWORD(v8) = [v8 clientIsEnabled:v9];

    if (v8)
    {
      v10 = [*(id *)(a1 + 32) eventRouterClient];
      [v10 connectionCapabilityDidChange];
    }
  }
}

- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5
{
  BOOL v5 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = logger;
    int v11 = HMFBooleanToString();
    v12 = HMFBooleanToString();
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "Configuring isPrimaryResident: %@, networkAvailable: %@", (uint8_t *)&v13, 0x16u);
  }
  self->_isPrimaryResident = a3;
  [(HMDRemoteEventRouterClient *)self setIsNetworkAvailable:v5];
  [(HMDRemoteEventRouterClient *)self _registerForMessages:v8];
}

- (id)responseHandlerForMessageIdentifier:(id)a3 serverIdentifier:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke;
  v18[3] = &unk_264A18138;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a5;
  id v20 = v11;
  id v21 = v12;
  id v19 = v10;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  v16 = _Block_copy(v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  return v16;
}

void __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke_2;
    block[3] = &unk_264A27B50;
    block[4] = v8;
    id v13 = v5;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 64);
    id v14 = v10;
    uint64_t v18 = v11;
    id v15 = v6;
    id v17 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
}

void __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_ERROR))
    {
      id v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_error_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "Failed to send message: %@ error: %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 80) == 1) {
      [v2 client:*(void *)(a1 + 32) connectDidFailWithError:*(void *)(a1 + 40)];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent message: %@", buf, 0xCu);
  }
  if ([v3 isHMError] && objc_msgSend(v3, "code") == 3202)
  {
    BOOL v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Event router message rejected by remote due to it being non-primary, kicking primary discovery", buf, 0xCu);
    }
    [v2 discoverPrimaryResidentForEventRouterClient:*(void *)(a1 + 32)];
  }
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 56), "hmf_dataForKey:", @"message.payload");
  id v12 = 0;
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_BOOLForKey:", @"isFragmented") && v11)
  {
    id v13 = *(void **)(a1 + 32);
    id v19 = 0;
    id v14 = [v13 _underlyingMessageDataFromFragmentMessageData:v11 error:&v19];
    id v12 = v19;

    if (!v14 || v12)
    {
      id v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if (!v12) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      uint64_t v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v21 = v18;
      _os_log_error_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "Unable to decode fragment payload with error: %@", buf, 0xCu);
      if (v12)
      {
LABEL_19:
        id v12 = v12;

        id v3 = v12;
      }
    }
  }
  else
  {
    id v14 = v11;
  }
LABEL_21:
  uint64_t v16 = *(void *)(a1 + 72);
  if (v16) {
    (*(void (**)(uint64_t, void, void *, id))(v16 + 16))(v16, *(void *)(a1 + 64), v14, v3);
  }
}

- (void)sendMessageWithPayloadMessage:(id)a3 messageType:(int64_t)a4 destination:(id)a5 serverIdentifier:(id)a6 completion:(id)a7
{
  v30[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(HMDRemoteEventRouterClient *)self dataSource];
  if ([v15 routerClientSupportsFragmentMessageForServerIdentifier:v13])
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = objc_alloc_init(HMDRemoteEventRouterProtoFragmentedMessage);
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 setFragmentNumber:0];
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 setFragmentData:v11];
    [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 setTotalFragments:1];
    uint64_t v18 = [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 fragmentData];
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalSize:](v17, "setTotalSize:", [v18 length]);

    [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 setRouterVersion:0];
    uint64_t v19 = [(HMDRemoteEventRouterProtoFragmentedMessage *)v17 data];

    id v11 = (id)v19;
  }
  id v20 = [(HMDRemoteEventRouterClient *)self requestMessageName];
  v29[0] = @"message.payload";
  id v21 = (void *)[v11 copy];
  v29[1] = @"isFragmented";
  v30[0] = v21;
  v30[1] = MEMORY[0x263EFFA88];
  __int16 v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v23 = +[HMDRemoteMessage secureMessageWithName:v20 qualityOfService:-1 destination:v12 messagePayload:v22 timeout:[(HMDRemoteEventRouterClient *)self messageTransportRestriction] restriction:150.0];

  uint64_t v24 = [v23 identifier];
  v25 = [(HMDRemoteEventRouterClient *)self responseHandlerForMessageIdentifier:v24 serverIdentifier:v13 messageType:v28 completion:v14];
  [v23 setResponseHandler:v25];

  v26 = [(HMDRemoteEventRouterClient *)self messageDispatcher];
  [v26 sendMessage:v23];
}

- (id)sendMessageWithPayloadMessage:(id)a3 client:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDRemoteEventRouterClient *)self dataSource];
  id v20 = 0;
  id v13 = [v12 routerClientMessageDestination:self serverIdentifier:&v20];
  id v14 = v20;
  id v15 = v14;
  if (v13 && v14)
  {
    [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v9 messageType:a5 destination:v13 serverIdentifier:v14 completion:v10];
    id v16 = v15;
    goto LABEL_8;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v22 = v15;
    _os_log_error_impl(&dword_22F52A000, logger, OS_LOG_TYPE_ERROR, "Did not find resident destination for server identifier %@.", buf, 0xCu);
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v18);
  }
LABEL_7:
  id v16 = 0;
LABEL_8:

  return v16;
}

- (void)clientDidDisconnect:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v4);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_22F52A000, logger, OS_LOG_TYPE_DEFAULT, "Client disconnected from server", v10, 2u);
  }
  if ([(HMDRemoteEventRouterClient *)self isConnected])
  {
    id v6 = [(HMDRemoteEventRouterClient *)self notificationCenter];
    id v11 = @"HMDRemoteEventRouterClientHomeUUIDKey";
    BOOL v7 = [(HMDRemoteEventRouterClient *)self identifier];
    v12[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v6 postNotificationName:@"HMDRemoteEventRouterClientDidDisconnect" object:self userInfo:v8];
  }
  [(HMDRemoteEventRouterClient *)self setIsConnected:0];
  id v9 = [(HMDRemoteEventRouterClient *)self dataSource];
  objc_msgSend(v9, "client:connectionStatusDidChange:", self, -[HMDRemoteEventRouterClient isConnected](self, "isConnected"));
}

- (void)clientDidConnect:(id)a3 serverIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v6);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, logger, OS_LOG_TYPE_DEFAULT, "Client did connect to server %@", buf, 0xCu);
  }
  if (![(HMDRemoteEventRouterClient *)self isConnected])
  {
    id v8 = [(HMDRemoteEventRouterClient *)self notificationCenter];
    id v9 = [(HMDRemoteEventRouterClient *)self identifier];
    id v13 = v9;
    id v10 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 postNotificationName:@"HMDRemoteEventRouterClientDidConnect" object:self userInfo:v10];
  }
  [(HMDRemoteEventRouterClient *)self setIsConnected:1];
  id v11 = [(HMDRemoteEventRouterClient *)self dataSource];
  objc_msgSend(v11, "client:connectionStatusDidChange:", self, -[HMDRemoteEventRouterClient isConnected](self, "isConnected"));
}

- (void)client:(id)a3 fetchWithFilters:(id)a4 isMultiHop:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  id v15 = [MEMORY[0x263F08C38] UUID];
  uint64_t v16 = [v15 UUIDString];
  [(HMDRemoteEventRouterProtoMessage *)v14 setIdentifier:v16];

  id v17 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsMessage);
  [(HMDRemoteEventRouterProtoMessage *)v14 setFetchEvents:v17];

  uint64_t v18 = [(HMDRemoteEventRouterProtoMessage *)v14 fetchEvents];
  [v18 setFetchType:v7];

  uint64_t v19 = objc_msgSend(v12, "na_map:", &__block_literal_global_60_24648);

  id v20 = (void *)[v19 mutableCopy];
  id v21 = [(HMDRemoteEventRouterProtoMessage *)v14 fetchEvents];
  [v21 setTopics:v20];

  __int16 v22 = [(HMDRemoteEventRouterProtoMessage *)v14 data];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_2;
  v26[3] = &unk_264A18110;
  v26[4] = self;
  id v27 = v10;
  id v28 = v11;
  id v23 = v11;
  id v24 = v10;
  id v25 = [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v22 client:v24 messageType:1 completion:v26];
}

void __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = (void *)MEMORY[0x263EFFA78];
  if (v8 && !v9)
  {
    id v12 = [[HMDRemoteEventRouterProtoFetchEventsResponse alloc] initWithData:v8];
    if (v12)
    {
      id v9 = 0;
    }
    else
    {
      id v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "Did not find fetch response", buf, 2u);
      }
      id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    v34 = v10;
    if ([(HMDRemoteEventRouterProtoFetchEventsResponse *)v12 changedEventsCount])
    {
      id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = NSNumber;
        uint64_t v16 = v14;
        id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoFetchEventsResponse changedEventsCount](v12, "changedEventsCount"));
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        *(_DWORD *)buf = 138412546;
        v38 = v17;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "Received %@ events in fetch response of size %@", buf, 0x16u);
      }
      uint64_t v19 = (void *)MEMORY[0x263F49388];
      id v20 = [(HMDRemoteEventRouterProtoFetchEventsResponse *)v12 changedEvents];
      id v21 = [v19 eventsMapFromProtoEvents:v20];
    }
    else
    {
      id v21 = (void *)MEMORY[0x263EFFA78];
    }
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v21 count];
      *(_DWORD *)buf = 138543618;
      v38 = v25;
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch got topics %ld", buf, 0x16u);
    }
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = *(id *)(a1 + 32);
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v21;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Fetch got topics %@", buf, 0x16u);
    }
    v31 = [*(id *)(a1 + 40) didReceiveFetchResponseWithCachedEvents:v21];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_63;
    v35[3] = &unk_264A18078;
    id v32 = v31;
    id v36 = v32;
    id v11 = objc_msgSend(v21, "na_filter:", v35);

    if ([v11 count])
    {
      v33 = [*(id *)(a1 + 32) dataSource];
      [v33 client:*(void *)(a1 + 32) didReceiveFetchedCachedEvents:v11];
    }
    id v10 = v34;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

HMDRemoteEventRouterProtoTopic *__76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(HMDRemoteEventRouterProtoTopic);
  [(HMDRemoteEventRouterProtoTopic *)v3 setTopic:v2];

  return v3;
}

- (void)sendDisconnectForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  id v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  [(HMDRemoteEventRouterProtoMessage *)v8 setIdentifier:v10];

  id v11 = objc_alloc_init(HMDRemoteEventRouterProtoDisconnectMessage);
  [(HMDRemoteEventRouterProtoMessage *)v8 setDisconnect:v11];

  id v12 = [(HMDRemoteEventRouterProtoMessage *)v8 data];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__HMDRemoteEventRouterClient_sendDisconnectForClient_completion___block_invoke;
  v15[3] = &unk_264A180C8;
  id v16 = v7;
  id v13 = v7;
  id v14 = [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v12 client:v6 messageType:4 completion:v15];
}

uint64_t __65__HMDRemoteEventRouterClient_sendDisconnectForClient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendKeepAliveForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  id v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  [(HMDRemoteEventRouterProtoMessage *)v8 setIdentifier:v10];

  id v11 = objc_alloc_init(HMDRemoteEventRouterProtoKeepAliveMessage);
  [(HMDRemoteEventRouterProtoMessage *)v8 setKeepAlive:v11];

  id v12 = [(HMDRemoteEventRouterProtoMessage *)v8 data];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__HMDRemoteEventRouterClient_sendKeepAliveForClient_completion___block_invoke;
  v15[3] = &unk_264A180C8;
  id v16 = v7;
  id v13 = v7;
  id v14 = [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v12 client:v6 messageType:2 completion:v15];
}

uint64_t __64__HMDRemoteEventRouterClient_sendKeepAliveForClient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)client:(id)a3 sendConnectWithAddedFilters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  id v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = [v12 UUIDString];
  [(HMDRemoteEventRouterProtoMessage *)v11 setIdentifier:v13];

  id v14 = objc_alloc_init(HMDRemoteEventRouterProtoConnectMessage);
  [(HMDRemoteEventRouterProtoConnectMessage *)v14 setRouterVersion:0];
  id v15 = (void *)[v9 mutableCopy];

  [(HMDRemoteEventRouterProtoConnectMessage *)v14 setTopicFilterAdditions:v15];
  [(HMDRemoteEventRouterProtoMessage *)v11 setConnect:v14];
  id v16 = [(HMDRemoteEventRouterProtoMessage *)v11 data];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__HMDRemoteEventRouterClient_client_sendConnectWithAddedFilters_completion___block_invoke;
  v20[3] = &unk_264A180A0;
  v20[4] = self;
  id v21 = v8;
  id v17 = v8;
  uint64_t v18 = [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v16 client:v10 messageType:1 completion:v20];

  return v18;
}

void __76__HMDRemoteEventRouterClient_client_sendConnectWithAddedFilters_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  id v11 = (void *)MEMORY[0x263EFFA78];
  if (v8 && !v9)
  {
    id v12 = [[HMDRemoteEventRouterProtoConnectResponse alloc] initWithData:v8];
    if (v12)
    {
      id v10 = 0;
    }
    else
    {
      id v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "Did not find connect response", (uint8_t *)&v22, 2u);
      }
      id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    if ([(HMDRemoteEventRouterProtoConnectResponse *)v12 cachedEventsCount])
    {
      id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = NSNumber;
        id v16 = v14;
        id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoConnectResponse cachedEventsCount](v12, "cachedEventsCount"));
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        int v22 = 138412546;
        id v23 = v17;
        __int16 v24 = 2112;
        id v25 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "Received %@ events in connect response of size %@", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v19 = (void *)MEMORY[0x263F49388];
      id v20 = [(HMDRemoteEventRouterProtoConnectResponse *)v12 cachedEvents];
      id v11 = [v19 eventsMapFromProtoEvents:v20];
    }
    if (v7)
    {
      if (!v10)
      {
        id v21 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        if (os_signpost_enabled(v21))
        {
          int v22 = 138412290;
          id v23 = v7;
          _os_signpost_emit_with_name_impl(&dword_22F52A000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientConnected", "serverIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)client:(id)a3 sendChangeRegistrationsWithAddedFilters:(id)a4 removedFilters:(id)a5 completion:(id)a6
{
}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  id v15 = [MEMORY[0x263F08C38] UUID];
  id v16 = [v15 UUIDString];
  [(HMDRemoteEventRouterProtoMessage *)v14 setIdentifier:v16];

  id v17 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsMessage);
  [(HMDRemoteEventRouterProtoMessage *)v14 setChangeRegistrations:v17];

  uint64_t v18 = (void *)[v13 mutableCopy];
  uint64_t v19 = [(HMDRemoteEventRouterProtoMessage *)v14 changeRegistrations];
  [v19 setTopicFilterAdditions:v18];

  id v20 = (void *)[v12 mutableCopy];
  id v21 = [(HMDRemoteEventRouterProtoMessage *)v14 changeRegistrations];
  [v21 setTopicFilterRemovals:v20];

  int v22 = [(HMDRemoteEventRouterProtoMessage *)v14 data];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __110__HMDRemoteEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_client_completion___block_invoke;
  v25[3] = &unk_264A180A0;
  v25[4] = self;
  id v26 = v11;
  id v23 = v11;
  id v24 = [(HMDRemoteEventRouterClient *)self sendMessageWithPayloadMessage:v22 client:v10 messageType:3 completion:v25];
}

void __110__HMDRemoteEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_client_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = (void *)MEMORY[0x263EFFA78];
  if (v6 && !v7)
  {
    id v10 = [[HMDRemoteEventRouterProtoChangeRegistrationsResponse alloc] initWithData:v6];
    if (v10)
    {
      id v8 = 0;
    }
    else
    {
      id v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "Did not find change registrations response", (uint8_t *)&v19, 2u);
      }
      id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    if ([(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)v10 cachedEventsCount])
    {
      id v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = NSNumber;
        id v14 = v12;
        id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoChangeRegistrationsResponse cachedEventsCount](v10, "cachedEventsCount"));
        id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
        int v19 = 138412546;
        id v20 = v15;
        __int16 v21 = 2112;
        int v22 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "Received %@ events in change registrations response of size %@", (uint8_t *)&v19, 0x16u);
      }
      id v17 = (void *)MEMORY[0x263F49388];
      uint64_t v18 = [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)v10 cachedEvents];
      id v9 = [v17 eventsMapFromProtoEvents:v18];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDRemoteEventRouterClient *)self eventRouterClient];
  [(HMDRemoteEventRouterClient *)self sendChangeRegistrationsMessageWithAddedFilters:v10 removedFilters:v9 client:v11 completion:v8];
}

- (BOOL)client:(id)a3 isConnectionTerminatingError:(id)a4
{
  id v4 = a4;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0C710]];

  if (!v6)
  {
    id v8 = [v4 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F41FD8]];

    if (v9
      || ([v4 domain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToString:*MEMORY[0x263F49370]],
          v10,
          v11)
      && [v4 code] != 4
      && [v4 code] != 1)
    {
      [v4 code];
    }
    goto LABEL_13;
  }
  if ([v4 code] == 2
    || [v4 code] == 27
    || [v4 code] == 3
    || [v4 code] != 54 && objc_msgSend(v4, "code") != 78)
  {
LABEL_13:
    BOOL v7 = 1;
    goto LABEL_14;
  }
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4
{
  id v5 = a4;
  int v6 = [(HMDRemoteEventRouterClient *)self dataSource];
  BOOL v7 = [v6 client:self forwardingTopicsForTopics:v5];

  return v7;
}

- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5 = a4;
  int v6 = [(HMDRemoteEventRouterClient *)self messageTargetUUID];
  BOOL v7 = +[HMDHomeEventsGenerated upstreamHomeTopicForTopic:v5 homeUUID:v6];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFFA08] setWithObject:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)clientIsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  BOOL v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  int v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [[HMDRemoteEventRouterProtoFragmentedMessage alloc] initWithData:v6];
  id v8 = v7;
  if (v7)
  {
    if ([(HMDRemoteEventRouterProtoFragmentedMessage *)v7 fragmentNumber]
      || [(HMDRemoteEventRouterProtoFragmentedMessage *)v8 totalFragments] != 1)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_error_impl(&dword_22F52A000, logger, OS_LOG_TYPE_ERROR, "Cannot decode fragmented data yet.", v13, 2u);
      }
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = [(HMDRemoteEventRouterProtoFragmentedMessage *)v8 fragmentData];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_handleMultiHopFetchResponse:(id)a3 originalMessage:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [(HMDRemoteEventRouterClient *)self dataSource];
  id v10 = [v7 remoteSourceDevice];
  int v11 = [v10 identifier];

  id v12 = [v9 routerClientPrimaryResidentDeviceIdentifier:self];
  if (objc_msgSend(v11, "hmf_isEqualToUUID:", v12))
  {
    if ([v6 changedEventsCount])
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = (void *)MEMORY[0x263F49388];
      id v15 = [v6 changedEvents];
      id v16 = [v14 eventsMapFromProtoEvents:v15];

      id v17 = [(HMDRemoteEventRouterClient *)self eventRouterClient];
      uint64_t v18 = [v17 didReceiveFetchResponseWithCachedEvents:v16];

      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __75__HMDRemoteEventRouterClient__handleMultiHopFetchResponse_originalMessage___block_invoke;
      v26[3] = &unk_264A18078;
      id v19 = v18;
      id v27 = v19;
      id v20 = objc_msgSend(v16, "na_filter:", v26);

      if ([v20 count]) {
        [v9 client:self didReceiveFetchedCachedEvents:v20];
      }
    }
    [v7 respondWithSuccess];
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990]();
    int v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      __int16 v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received fetch response from non-primary: %@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2037];
    [v7 respondWithError:v25];
  }
}

uint64_t __75__HMDRemoteEventRouterClient__handleMultiHopFetchResponse_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)_handleCachedEventMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDRemoteEventRouterClient *)self eventRouterClient];
  [v13 didReceiveMessageWithCachedEvents:v10 serverIdentifier:v11 completion:v9];
}

- (void)_handleEventUpdateMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(HMDRemoteEventRouterClient *)self eventRouterClient];
  [v13 didReceiveMessageWithEvents:v10 serverIdentifier:v11 completion:v9];
}

- (void)_handleUpdatedEventsRequest:(id)a3 originalMessage:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 remoteSourceDevice];
  id v10 = [v9 identifier];

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__24681;
  v37[4] = __Block_byref_object_dispose__24682;
  id v38 = 0;
  id v11 = dispatch_group_create();
  if ([v6 eventsCount])
  {
    id v12 = [v6 events];
    id v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_31);

    if (v13 && [v13 count])
    {
      id v14 = self->_logger;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = NSNumber;
        id v16 = [v7 dataForKey:@"message.payload"];
        id v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = v13;
        __int16 v41 = 2112;
        v42 = v17;
        _os_log_impl(&dword_22F52A000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Received update events request %@, payloadSize: %@", buf, 0x16u);
      }
      logger = self->_logger;
      if (os_signpost_enabled(logger))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v10;
        _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientHandleUpdatedEvents", "serverIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
      }
      dispatch_group_enter(v11);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_33;
      v34[3] = &unk_264A2AFC8;
      v34[4] = self;
      id v36 = v37;
      v35 = v11;
      [(HMDRemoteEventRouterClient *)self _handleEventUpdateMessage:v7 fromServer:v10 events:v13 completion:v34];
    }
  }
  if ([v6 cachedEventsCount])
  {
    id v19 = [v6 cachedEvents];
    id v20 = objc_msgSend(v19, "na_map:", &__block_literal_global_36);

    if (v20 && [v20 count])
    {
      __int16 v21 = self->_logger;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = NSNumber;
        uint64_t v23 = [v7 dataForKey:@"message.payload"];
        id v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "length"));
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = v20;
        __int16 v41 = 2112;
        v42 = v24;
        _os_log_impl(&dword_22F52A000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "Received cached events request %@, payloadSize: %@", buf, 0x16u);
      }
      id v25 = self->_logger;
      if (os_signpost_enabled(v25))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v10;
        _os_signpost_emit_with_name_impl(&dword_22F52A000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientHandleCachedEvents", "serverIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
      }
      dispatch_group_enter(v11);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_37;
      v31[3] = &unk_264A2AFC8;
      v31[4] = self;
      v33 = v37;
      uint64_t v32 = v11;
      [(HMDRemoteEventRouterClient *)self _handleCachedEventMessage:v7 fromServer:v10 events:v20 completion:v31];
    }
  }
  id v26 = [(HMDRemoteEventRouterClient *)self workQueue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2_38;
  v28[3] = &unk_264A2F0A0;
  id v29 = v7;
  __int16 v30 = v37;
  id v27 = v7;
  dispatch_group_notify(v11, v26, v28);

  _Block_object_dispose(v37, 8);
}

void __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_33(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    if (!v7) {
      objc_storeStrong(v6, a2);
    }
  }
  os_unfair_lock_unlock(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_37(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    if (!v7) {
      objc_storeStrong(v6, a2);
    }
  }
  os_unfair_lock_unlock(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2_38(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(v2 + 8) + 8) + 40)) {
    return objc_msgSend(v1, "respondWithError:");
  }
  else {
    return [v1 respondWithSuccess];
  }
}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F49388] fromProtobuff:a2];
}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F49388] fromProtobuff:a2];
}

- (void)_handleUpdateMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update message: %@", buf, 0x16u);
  }
  id v11 = [v4 dataForKey:@"message.payload"];
  int v12 = [v4 BOOLForKey:@"isFragmented"];
  if (!v11)
  {
    logger = v7->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22F52A000, logger, OS_LOG_TYPE_ERROR, "Did not find message payload.", buf, 2u);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    goto LABEL_10;
  }
  if (!v12)
  {
    id v14 = v11;
    goto LABEL_12;
  }
  id v25 = 0;
  uint64_t v13 = [(HMDRemoteEventRouterClient *)v7 _underlyingMessageDataFromFragmentMessageData:v11 error:&v25];
  id v14 = v25;

  if (!v13)
  {
    int v22 = v7->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "Unable to decode payload from fragment message.", buf, 2u);
      if (!v14) {
        goto LABEL_23;
      }
    }
    else if (!v14)
    {
LABEL_23:
      uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v23];

      id v14 = 0;
      goto LABEL_20;
    }
LABEL_10:
    [v4 respondWithError:v14];
    goto LABEL_20;
  }

  id v14 = (id)v13;
LABEL_12:
  id v16 = [[HMDRemoteEventRouterProtoServerMessage alloc] initWithData:v14];
  if ([(HMDRemoteEventRouterProtoServerMessage *)v16 hasMessage])
  {
    switch([(HMDRemoteEventRouterProtoServerMessage *)v16 message])
    {
      case 0:
        id v17 = v7->_logger;
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        uint64_t v18 = "Unable to find request type.";
        goto LABEL_30;
      case 1:
        __int16 v21 = [(HMDRemoteEventRouterProtoServerMessage *)v16 updatedEvents];
        [(HMDRemoteEventRouterClient *)v7 _handleUpdatedEventsRequest:v21 originalMessage:v4];
        goto LABEL_19;
      case 2:
      case 3:
        goto LABEL_17;
      case 4:
        __int16 v21 = [(HMDRemoteEventRouterProtoServerMessage *)v16 multiHopFetchEventsResponse];
        [(HMDRemoteEventRouterClient *)v7 _handleMultiHopFetchResponse:v21 originalMessage:v4];
        goto LABEL_19;
      default:
        id v24 = v7->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "Received an unrecognized request type.", buf, 2u);
        }
        id v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = -1;
        goto LABEL_18;
    }
  }
  id v17 = v7->_logger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v18 = "Decoded payload does not have request.";
LABEL_30:
    _os_log_error_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
  }
LABEL_17:
  id v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = 3;
LABEL_18:
  __int16 v21 = [v19 hmErrorWithCode:v20];
  [v4 respondWithError:v21];
LABEL_19:

LABEL_20:
}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v5);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, logger, OS_LOG_TYPE_DEFAULT, "Received primary resident change notification %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v7 = [(HMDRemoteEventRouterClient *)self dataSource];
  uint64_t v8 = [v7 isCurrentDevicePrimaryResident];
  if (v8 != [(HMDRemoteEventRouterClient *)self isPrimaryResident])
  {
    id v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSNumber;
      id v11 = v9;
      int v12 = [v10 numberWithBool:v8];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "Primary resident status changed to %@", (uint8_t *)&v13, 0xCu);
    }
    self->_isPrimaryResident = v8;
  }
}

- (void)_registerForMessages:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v18[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v4];

  uint64_t v8 = [(HMDRemoteEventRouterClient *)self messageDispatcher];
  id v9 = [(HMDRemoteEventRouterClient *)self updateMessageName];
  [v8 registerForMessage:v9 receiver:self policies:v7 selector:sel__handleUpdateMessage_];

  id v10 = [(HMDRemoteEventRouterClient *)self messageDispatcher];
  id v11 = [(HMDRemoteEventRouterClient *)self multiHopFetchResponseMessageName];
  [v10 registerForMessage:v11 receiver:self policies:v7 selector:sel__handleUpdateMessage_];

  int v12 = [(HMDRemoteEventRouterClient *)self dataSource];
  int v13 = [v12 primaryResidentChangeMonitorForRouterClient:self];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v13;
    _os_log_impl(&dword_22F52A000, logger, OS_LOG_TYPE_DEFAULT, "Registering for primary resident change notification %@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v15 = [(HMDRemoteEventRouterClient *)self notificationCenter];
  [v15 addObserver:self selector:sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_ name:@"HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification" object:v13];
}

- (id)logIdentifier
{
  uint64_t v2 = [(HMDRemoteEventRouterClient *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (unint64_t)messageTransportRestriction
{
  return 8;
}

- (BOOL)isPrimaryResident
{
  id v3 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_isPrimaryResident;
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 logCategory:(const char *)a11 logEventSubmitter:(id)a12 eventRouterClientFactory:(id)a13
{
  id v48 = a3;
  id v43 = a4;
  id v47 = a4;
  id v19 = a5;
  id v44 = a6;
  id v20 = a6;
  id v45 = a7;
  id v21 = a7;
  id v46 = a8;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  id v26 = (void (**)(void))a13;
  v49.receiver = self;
  v49.super_class = (Class)HMDRemoteEventRouterClient;
  id v27 = [(HMDRemoteEventRouterClient *)&v49 init];
  if (v27)
  {
    __int16 v41 = v26;
    id v28 = v23;
    id v29 = v22;
    id v30 = v21;
    id v31 = v20;
    id v32 = v19;
    id v33 = v25;
    id v34 = v24;
    os_log_t v35 = os_log_create("com.apple.HomeKitDaemon", a11);
    logger = v27->_logger;
    v27->_logger = (OS_os_log *)v35;

    os_log_t v37 = v35;
    id v24 = v34;
    id v25 = v33;
    id v19 = v32;
    id v20 = v31;
    id v21 = v30;
    id v22 = v29;
    id v23 = v28;
    id v26 = v41;
    objc_storeStrong((id *)&v27->_logger, v37);
    objc_storeStrong((id *)&v27->_identifier, a3);
    objc_storeStrong((id *)&v27->_workQueue, v43);
    objc_storeWeak((id *)&v27->_dataSource, v19);
    objc_storeStrong((id *)&v27->_messageDispatcher, v44);
    objc_storeStrong((id *)&v27->_notificationCenter, v45);
    objc_storeStrong((id *)&v27->_requestMessageName, v46);
    objc_storeStrong((id *)&v27->_updateMessageName, a9);
    objc_storeStrong((id *)&v27->_multiHopFetchResponseMessageName, a10);
    uint64_t v38 = v26[2](v26);
    eventRouterClient = v27->_eventRouterClient;
    v27->_eventRouterClient = (HMEMessageDatagramClient *)v38;

    [(HMEMessageDatagramClient *)v27->_eventRouterClient setDelegate:v27];
    [(HMEMessageDatagramClient *)v27->_eventRouterClient setDataSource:v27];
    v27->_isPrimaryResident = 0;
    objc_storeWeak((id *)&v27->_logEventSubmitter, v25);
    v27->_lock._os_unfair_lock_opaque = 0;
  }

  return v27;
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 retryIntervalProvider:(id)a13 logCategory:(const char *)a14
{
  id v29 = a4;
  id v18 = a11;
  id v19 = a12;
  id v20 = a13;
  id v32 = a10;
  id v30 = a9;
  id v31 = a8;
  id v28 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v24 = +[HMDMetricsManager sharedLogEventSubmitter];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __247__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke;
  v38[3] = &unk_264A18FA0;
  id v39 = v29;
  id v40 = v18;
  id v41 = v19;
  id v42 = v20;
  id v43 = a14;
  id v36 = v20;
  id v34 = v19;
  id v33 = v18;
  id v25 = v29;
  id v26 = [(HMDRemoteEventRouterClient *)self initWithMessageTargetUUID:v23 queue:v25 dataSource:v22 messageDispatcher:v21 notificationCenter:v28 requestMessageName:v31 updateMessageName:v30 multiHopFetchResponseMessageName:v32 logCategory:a14 logEventSubmitter:v24 eventRouterClientFactory:v38];

  return v26;
}

HMDRemoteEventRouterClient *__247__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke(void *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:a1[4] storeReadHandle:a1[5] storeWriteHandle:a1[6] retryIntervalProvider:a1[7] logCategory:a1[8]];
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 logCategory:(const char *)a13
{
  id v17 = a4;
  id v18 = a11;
  id v19 = a12;
  id v31 = a10;
  id v28 = a9;
  id v29 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v24 = +[HMDMetricsManager sharedLogEventSubmitter];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __225__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_logCategory___block_invoke;
  v35[3] = &unk_264A18030;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = a13;
  id v33 = v19;
  id v30 = v18;
  id v25 = v17;
  id v26 = [(HMDRemoteEventRouterClient *)self initWithMessageTargetUUID:v23 queue:v25 dataSource:v22 messageDispatcher:v21 notificationCenter:v20 requestMessageName:v29 updateMessageName:v28 multiHopFetchResponseMessageName:v31 logCategory:a13 logEventSubmitter:v24 eventRouterClientFactory:v35];

  return v26;
}

HMDRemoteEventRouterClient *__225__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_logCategory___block_invoke(void *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:a1[4] storeReadHandle:a1[5] storeWriteHandle:a1[6] logCategory:a1[7]];
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12
{
  id v17 = a4;
  id v18 = a11;
  id v19 = a12;
  id v37 = a10;
  id v35 = a9;
  id v36 = a8;
  id v34 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [v22 UUIDString];
  id v24 = [@"RemoteEventRouter.Client." stringByAppendingString:v23];

  id v25 = v24;
  uint64_t v26 = [v25 UTF8String];
  id v27 = +[HMDMetricsManager sharedLogEventSubmitter];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __213__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle___block_invoke;
  v39[3] = &unk_264A18008;
  id v40 = v17;
  id v41 = v18;
  id v42 = v19;
  id v43 = v25;
  id v33 = v25;
  id v32 = v19;
  id v31 = v18;
  id v28 = v17;
  id v29 = [(HMDRemoteEventRouterClient *)self initWithMessageTargetUUID:v22 queue:v28 dataSource:v21 messageDispatcher:v20 notificationCenter:v34 requestMessageName:v36 updateMessageName:v35 multiHopFetchResponseMessageName:v37 logCategory:v26 logEventSubmitter:v27 eventRouterClientFactory:v39];

  return v29;
}

HMDRemoteEventRouterClient *__213__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 56) UTF8String];
  return +[HMDRemoteEventRouterClient routerClientWithQueue:v1 storeReadHandle:v2 storeWriteHandle:v3 logCategory:v4];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_24723 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_24723, &__block_literal_global_24724);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_24725;
  return v2;
}

void __41__HMDRemoteEventRouterClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_24725;
  logCategory__hmf_once_v1_24725 = v0;
}

+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = objc_alloc_init(HMDRemoteEventRouterClientRetryIntervals);
  id v14 = [a1 routerClientWithQueue:v12 storeReadHandle:v11 storeWriteHandle:v10 retryIntervalProvider:v13 logCategory:a6];

  return v14;
}

+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 retryIntervalProvider:(id)a6 logCategory:(const char *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = objc_alloc_init(HMDEventRouterTimerProvider);
  int v16 = (void *)[objc_alloc(MEMORY[0x263F493A8]) initWithQueue:v14 timerProvider:v15 keepAliveInterval:v11 dormantFetchTimerInterval:v13 retryIntervalProvider:v12 storeReadHandle:a7 storeWriteHandle:420.0 logCategory:28800.0];

  return v16;
}

@end