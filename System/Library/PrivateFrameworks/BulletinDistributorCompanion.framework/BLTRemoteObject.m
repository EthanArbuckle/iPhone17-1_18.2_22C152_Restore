@interface BLTRemoteObject
- (BLTAbstractIDSService)service;
- (BLTPBProtobufSequenceNumberManager)sequenceNumberManager;
- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4;
- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4 andClientQueue:(id)a5;
- (BLTSimpleCache)mruCacheOfReceives;
- (BLTSimpleCache)mruCacheOfSends;
- (BOOL)_callSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5;
- (BOOL)_idsQueueCallSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5;
- (BOOL)_sequenceErrorDidHappenAndHandled:(int64_t)a3 service:(id)a4 incomingIdentifier:(id)a5;
- (BOOL)isPairedDeviceReady;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (id)_wrapError:(id)a3 identifier:(id)a4;
- (unint64_t)connectionStatus;
- (unint64_t)lastKnownConnectionStatus;
- (void)_deviceConnectionStatusChanged:(id)a3;
- (void)_handleNewSessionState:(unint64_t)a3;
- (void)_queueHandleIDSProtobuf:(id)a3;
- (void)_queuePerformSend:(id)a3 responseToRequest:(id)a4 withTimeout:(id)a5 withDescription:(id)a6 shortDescription:(id)a7 onlyOneFor:(id)a8 allowCloudDelivery:(BOOL)a9 nonWaking:(BOOL)a10 didSend:(id)a11 andResponse:(id)a12;
- (void)_queueSendRequest:(id)a3;
- (void)_queueUpdateConnectionStatusWithResetDefaulteDevice:(BOOL)a3;
- (void)_removeAndHandleResponseHandler:(id)a3;
- (void)_sendAckInitialSequenceNumberForSession:(id)a3 sessionState:(unint64_t)a4;
- (void)_sendAckInitialSequenceNumberForSession:(id)a3 withAssert:(BOOL)a4 sessionState:(unint64_t *)a5;
- (void)_sendAssertForSession;
- (void)_setStandaloneTestModeEnabled:(BOOL)a3;
- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5;
- (void)_updateConnectionStatus;
- (void)_updateConnectionStatusWithResetDefaulteDevice:(BOOL)a3;
- (void)dealloc;
- (void)disableStandaloneTestMode;
- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6;
- (void)handleAckInitialSequenceNumberRequest:(id)a3;
- (void)handleIDSProtobuf:(id)a3;
- (void)handleIncomingMessage:(id)a3;
- (void)sendFileURL:(id)a3 withTimeout:(id)a4 extraMetadata:(id)a5 responseHandlers:(id)a6 didSend:(id)a7 didQueue:(id)a8;
- (void)sendRequest:(id)a3;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6 didQueue:(id)a7;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 didSend:(id)a7;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9;
- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setLastKnownConnectionStatus:(unint64_t)a3;
- (void)setMruCacheOfReceives:(id)a3;
- (void)setMruCacheOfSends:(id)a3;
- (void)setPairedDeviceReady:(BOOL)a3;
- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
@end

@implementation BLTRemoteObject

- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4
{
  return [(BLTRemoteObject *)self initWithServiceName:a3 idsQueueName:a4 andClientQueue:0];
}

- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4 andClientQueue:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_queue_t v9 = (dispatch_queue_t)a5;
  v45.receiver = self;
  v45.super_class = (Class)BLTRemoteObject;
  v10 = [(BLTRemoteObject *)&v45 init];
  v11 = v10;
  if (v10)
  {
    v10->_pairedDeviceReady = 1;
    uint64_t v12 = [v8 copy];
    serviceName = v11->_serviceName;
    v11->_serviceName = (NSString *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    idsSendIDToCompletionHandler = v11->_idsSendIDToCompletionHandler;
    v11->_idsSendIDToCompletionHandler = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    idsSendIDToResponseHandler = v11->_idsSendIDToResponseHandler;
    v11->_idsSendIDToResponseHandler = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    idsFileIDToResponseHandler = v11->_idsFileIDToResponseHandler;
    v11->_idsFileIDToResponseHandler = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v22 = dispatch_queue_create(a4, v21);
    idsQueue = v11->_idsQueue;
    v11->_idsQueue = (OS_dispatch_queue *)v22;

    if (!v9)
    {
      v24 = [NSString stringWithUTF8String:a4];
      v25 = [v24 stringByAppendingString:@".client"];

      id v26 = v25;
      v27 = (const char *)[v26 UTF8String];
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create(v27, v28);
    }
    objc_storeStrong((id *)&v11->_clientQueue, v9);
    v29 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    sequenceNumberSendLock = v11->_sequenceNumberSendLock;
    v11->_sequenceNumberSendLock = v29;

    id v31 = [v8 stringByAppendingString:@".connectionstatusqueue"];
    v32 = (const char *)[v31 UTF8String];
    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create(v32, v33);
    connectionStatusQueue = v11->_connectionStatusQueue;
    v11->_connectionStatusQueue = (OS_dispatch_queue *)v34;

    v36 = [[BLTSimpleCache alloc] initWithCapacity:10];
    mruCacheOfSends = v11->_mruCacheOfSends;
    v11->_mruCacheOfSends = v36;

    v38 = [[BLTSimpleCache alloc] initWithCapacity:10];
    mruCacheOfReceives = v11->_mruCacheOfReceives;
    v11->_mruCacheOfReceives = v38;

    [(BLTRemoteObject *)v11 disableStandaloneTestMode];
    v40 = blt_ids_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v8;
      _os_log_impl(&dword_222F4C000, v40, OS_LOG_TYPE_INFO, "Created IDS service %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v11);
    v41 = BLTWorkQueue();
    objc_copyWeak(&v44, (id *)buf);
    v11->_stateHandler = os_state_add_handler();

    [(BLTRemoteObject *)v11 _updateConnectionStatus];
    v42 = [MEMORY[0x263F08A00] defaultCenter];
    [v42 addObserver:v11 selector:sel__deviceConnectionStatusChanged_ name:@"BLTIDSDeviceConnectionStatusChangedNotification" object:0];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }
  return v11;
}

_DWORD *__67__BLTRemoteObject_initWithServiceName_idsQueueName_andClientQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [WeakRetained description];
  v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(BLTAbstractIDSService *)self->_service removeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)BLTRemoteObject;
  [(BLTRemoteObject *)&v4 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  objc_super v4 = [(BLTRemoteObject *)self mruCacheOfSends];
  id v5 = (id)[v3 appendObject:v4 withName:@"mruCacheOfSends" skipIfNil:0];

  v6 = [(BLTRemoteObject *)self mruCacheOfReceives];
  id v7 = (id)[v3 appendObject:v6 withName:@"mruCacheOfReceives" skipIfNil:0];

  id v8 = (id)[v3 appendObject:self->_serviceName withName:@"serviceName" skipIfNil:0];
  dispatch_queue_t v9 = [v3 build];

  return (NSString *)v9;
}

- (void)_handleNewSessionState:(unint64_t)a3
{
  if (a3)
  {
    id v6 = [(BLTRemoteObject *)self sequenceNumberManager];
    id v5 = [v6 recvSessionIdentifier];
    [(BLTRemoteObject *)self _sendAckInitialSequenceNumberForSession:v5 sessionState:a3];
  }
}

- (BOOL)_sequenceErrorDidHappenAndHandled:(int64_t)a3 service:(id)a4 incomingIdentifier:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 & 2) != 0)
  {
    v11 = blt_ids_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "Detected a duplicate message!", v14, 2u);
    }

    goto LABEL_10;
  }
  if (v6)
  {
    BLTAnalyticsLogOutOfOrderMessage();
    uint64_t v12 = blt_ids_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BLTRemoteObject _sequenceErrorDidHappenAndHandled:service:incomingIdentifier:]((uint64_t)v8, (uint64_t)v9, v12);
    }

    [(BLTRemoteObject *)self _sendAssertForSession];
LABEL_10:
    BOOL v10 = 1;
    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)handleIDSProtobuf:(id)a3
{
  mruCacheOfReceives = self->_mruCacheOfReceives;
  id v11 = a3;
  id v5 = [v11 context];
  char v6 = [v5 outgoingResponseIdentifier];
  id v7 = [v11 context];
  id v8 = [v7 incomingResponseIdentifier];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"messageType:%u", objc_msgSend(v11, "type"));
  BOOL v10 = +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:v6 IDSResponseIdentifier:v8 requestDescription:v9 sequenceNumber:0 sessionIdentifier:0 sessionState:0];
  [(BLTSimpleCache *)mruCacheOfReceives cacheObject:v10];

  [(BLTRemoteObject *)self _queueHandleIDSProtobuf:v11];
}

- (void)_queueHandleIDSProtobuf:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v5 = [v4 context];
  char v6 = [v5 incomingResponseIdentifier];

  id v7 = blt_ids_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 context];
    id v9 = [v8 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Received message with IDS identifier: %@ and incoming response id: %@", buf, 0x16u);
  }
  int v10 = [v4 isResponse];
  if (v6) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  if (v11 != 1) {
    goto LABEL_31;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BLTRemoteObject__queueHandleIDSProtobuf___block_invoke;
  block[3] = &unk_264683B88;
  id v26 = buf;
  block[4] = self;
  id v13 = v6;
  id v25 = v13;
  dispatch_sync(idsQueue, block);
  uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
  if (v14)
  {
    if ([(BLTRemoteObject *)self _callSendCompletionHandlerWithSuccess:1 identifier:v13 error:0])
    {
      v15 = blt_ids_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_DEFAULT, "Response arrived before IDS delegate didSendWithSuccess.", v27, 2u);
      }
    }
    v16 = blt_ids_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315394;
      v28 = "-[BLTRemoteObject _queueHandleIDSProtobuf:]";
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_222F4C000, v16, OS_LOG_TYPE_DEFAULT, "%s: matched response %@, executing block", v27, 0x16u);
    }

    (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
  }
  else
  {
    v17 = blt_ids_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315394;
      v28 = "-[BLTRemoteObject _queueHandleIDSProtobuf:]";
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_DEFAULT, "%s: no ack block found for response %@, ignoring", v27, 0x16u);
    }
  }
  _Block_object_dispose(buf, 8);

  if (!v14)
  {
LABEL_31:
    if ([v4 isResponse]) {
      uint64_t v18 = 0x10000;
    }
    else {
      uint64_t v18 = 0;
    }
    v19 = objc_msgSend(NSNumber, "numberWithInteger:", v18 | objc_msgSend(v4, "type"));
    v20 = [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector objectForKeyedSubscript:v19];
    v21 = v20;
    if (v20)
    {
      ((void (*)(BLTRemoteObject *, uint64_t, id))[v20 method])(self, objc_msgSend(v20, "selector"), v4);
    }
    else
    {
      dispatch_queue_t v22 = blt_ids_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = [v4 type];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_222F4C000, v22, OS_LOG_TYPE_DEFAULT, "No method registered for message with type: %d", buf, 8u);
      }
    }
  }
}

void __43__BLTRemoteObject__queueHandleIDSProtobuf___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = a1[5];
    char v6 = *(void **)(a1[4] + 16);
    [v6 removeObjectForKey:v5];
  }
}

- (void)handleIncomingMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [BLTPBProtobuf alloc];
  char v6 = [(BLTRemoteObject *)self sequenceNumberManager];
  id v7 = [(BLTPBProtobuf *)v5 initWithIDSProtobuf:v4 sequenceNumberManager:v6];

  if (v7)
  {
    id v25 = v4;
    id v8 = [v4 transportData];
    mruCacheOfReceives = self->_mruCacheOfReceives;
    id v9 = [(BLTPBProtobuf *)v7 context];
    int v10 = [v9 outgoingResponseIdentifier];
    int v11 = [(BLTPBProtobuf *)v7 context];
    uint64_t v12 = [v11 incomingResponseIdentifier];
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"messageType:%u", -[BLTPBProtobuf type](v7, "type"));
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "sequenceNumber"));
    v15 = sessionUUIDFromTransportData(v8);
    v24 = v8;
    v16 = +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v10, v12, v13, v14, v15, [v8 sessionState]);
    [(BLTSimpleCache *)mruCacheOfReceives cacheObject:v16];

    [(BLTRemoteObject *)self _handleNewSessionState:[(BLTPBProtobuf *)v7 sessionState]];
    uint64_t v17 = [(BLTPBProtobuf *)v7 sequenceNumberError];
    uint64_t v18 = [(BLTPBProtobuf *)v7 context];
    v19 = [v18 serviceIdentifier];
    v20 = [(BLTPBProtobuf *)v7 context];
    v21 = [v20 outgoingResponseIdentifier];
    LOBYTE(v17) = [(BLTRemoteObject *)self _sequenceErrorDidHappenAndHandled:v17 service:v19 incomingIdentifier:v21];

    if ((v17 & 1) == 0)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__BLTRemoteObject_handleIncomingMessage___block_invoke;
      block[3] = &unk_264683BB0;
      block[4] = self;
      v27 = v7;
      dispatch_async(clientQueue, block);
    }
    id v4 = v25;
  }
}

uint64_t __41__BLTRemoteObject_handleIncomingMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueHandleIDSProtobuf:*(void *)(a1 + 40)];
}

- (void)_sendAssertForSession
{
}

- (void)_sendAckInitialSequenceNumberForSession:(id)a3 sessionState:(unint64_t)a4
{
  unint64_t v4 = a4;
  [(BLTRemoteObject *)self _sendAckInitialSequenceNumberForSession:a3 withAssert:0 sessionState:&v4];
}

- (void)_sendAckInitialSequenceNumberForSession:(id)a3 withAssert:(BOOL)a4 sessionState:(unint64_t *)a5
{
  BOOL v6 = a4;
  v12[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(BLTPBAckInitialSequenceNumberRequest);
  if (v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    [v8 getUUIDBytes:v12];
    int v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:16];
    [(BLTPBAckInitialSequenceNumberRequest *)v9 setSessionIdentifier:v10];
  }
  if (v6) {
    [(BLTPBAckInitialSequenceNumberRequest *)v9 setAssert:1];
  }
  if (a5) {
    [(BLTPBAckInitialSequenceNumberRequest *)v9 setSessionState:*(unsigned int *)a5];
  }
  int v11 = +[BLTRemoteRequest remoteRequestWithProtobuf:v9 type:12];
  [(BLTRemoteObject *)self _queueSendRequest:v11];
}

- (void)handleAckInitialSequenceNumberRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [BLTPBAckInitialSequenceNumberRequest alloc];
  BOOL v6 = [v4 data];

  v16 = [(BLTPBAckInitialSequenceNumberRequest *)v5 initWithData:v6];
  if (![(BLTPBAckInitialSequenceNumberRequest *)v16 hasSessionIdentifier])
  {
    id v9 = [(BLTRemoteObject *)self sequenceNumberManager];
    [v9 setSessionState:0];
    goto LABEL_10;
  }
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  id v8 = [(BLTPBAckInitialSequenceNumberRequest *)v16 sessionIdentifier];
  id v9 = objc_msgSend(v7, "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));

  int v10 = [(BLTRemoteObject *)self sequenceNumberManager];
  int v11 = [v10 currentSessionIdentifier];
  char v12 = [v9 isEqual:v11];

  if (v12)
  {
    if ([(BLTPBAckInitialSequenceNumberRequest *)v16 sessionState] == 1)
    {
      id v13 = [(BLTRemoteObject *)self sequenceNumberManager];
      uint64_t v14 = v13;
      uint64_t v15 = 2;
    }
    else
    {
      if ([(BLTPBAckInitialSequenceNumberRequest *)v16 sessionState] != 2) {
        goto LABEL_10;
      }
      id v13 = [(BLTRemoteObject *)self sequenceNumberManager];
      uint64_t v14 = v13;
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v13 = [(BLTRemoteObject *)self sequenceNumberManager];
    uint64_t v14 = v13;
    uint64_t v15 = 1;
  }
  [v13 setSessionState:v15];

LABEL_10:
}

- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5
{
  unsigned int v6 = a4;
  int v10 = objc_alloc_init(BLTPBSelectorItem);
  [(BLTPBSelectorItem *)v10 setSelector:a3];
  [(BLTPBSelectorItem *)v10 setMethod:[(BLTRemoteObject *)self methodForSelector:a3]];
  id v9 = [NSNumber numberWithInteger:v6 | (unint64_t)(a5 << 16)];
  [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector setObject:v10 forKeyedSubscript:v9];
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(BLTRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:0];
  id v6 = [(BLTRemoteObject *)self service];
  [v6 setProtobufAction:sel_handleIncomingMessage_ forIncomingRequestsOfType:v4];
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(BLTRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:1];
  id v6 = [(BLTRemoteObject *)self service];
  [v6 setProtobufAction:sel_handleIncomingMessage_ forIncomingResponsesOfType:v4];
}

- (unint64_t)connectionStatus
{
  connectionStatusQueue = self->_connectionStatusQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BLTRemoteObject_connectionStatus__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_sync(connectionStatusQueue, block);
  return [(BLTRemoteObject *)self lastKnownConnectionStatus];
}

uint64_t __35__BLTRemoteObject_connectionStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueUpdateConnectionStatusWithResetDefaulteDevice:0];
}

- (void)_updateConnectionStatus
{
}

- (void)_updateConnectionStatusWithResetDefaulteDevice:(BOOL)a3
{
  connectionStatusQueue = self->_connectionStatusQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__BLTRemoteObject__updateConnectionStatusWithResetDefaulteDevice___block_invoke;
  v4[3] = &unk_264683C00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(connectionStatusQueue, v4);
}

uint64_t __66__BLTRemoteObject__updateConnectionStatusWithResetDefaulteDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueUpdateConnectionStatusWithResetDefaulteDevice:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_queueUpdateConnectionStatusWithResetDefaulteDevice:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 || (uint64_t v4 = self->_defaultPairedDevice) == 0)
  {
    BOOL v5 = [(BLTRemoteObject *)self service];
    id v6 = [v5 defaultPairedDevice];
    defaultPairedDevice = self->_defaultPairedDevice;
    self->_defaultPairedDevice = v6;

    id v8 = blt_ids_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_defaultPairedDevice;
      int v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "Found default paired device %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v4 = self->_defaultPairedDevice;
  }
  if ([(BLTAbstractIDSDevice *)v4 isNearby])
  {
    uint64_t v10 = 1;
  }
  else if ([(BLTAbstractIDSDevice *)self->_defaultPairedDevice isConnected])
  {
    uint64_t v10 = 2;
  }
  else if ([(BLTAbstractIDSDevice *)self->_defaultPairedDevice isCloudReachable])
  {
    uint64_t v10 = 3;
  }
  else
  {
    uint64_t v10 = 0;
  }
  int v11 = blt_ids_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = off_264683DD8[v10];
    unint64_t v13 = [(BLTRemoteObject *)self lastKnownConnectionStatus];
    if (v13 > 3) {
      uint64_t v14 = "unknown";
    }
    else {
      uint64_t v14 = off_264683DD8[v13];
    }
    int v15 = 136315394;
    v16 = v12;
    __int16 v17 = 2080;
    uint64_t v18 = v14;
    _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "Default paired device connection status: %s last known status: %s", (uint8_t *)&v15, 0x16u);
  }

  if (v10 != [(BLTRemoteObject *)self lastKnownConnectionStatus]) {
    [(BLTRemoteObject *)self setLastKnownConnectionStatus:v10];
  }
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  [(BLTRemoteObject *)self _setStandaloneTestModeEnabled:1];
  int v11 = self->_service;
  [(BLTAbstractIDSService *)v11 setMinimumSendDelay:a3];
  [(BLTAbstractIDSService *)v11 setMaximumSendDelay:a4];
  [(BLTAbstractIDSService *)v11 setMinimumResponseDelay:a5];
  [(BLTAbstractIDSService *)v11 setMaximumResponseDelay:a6];
}

- (void)disableStandaloneTestMode
{
}

- (void)_setStandaloneTestModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  connectionStatusQueue = self->_connectionStatusQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BLTRemoteObject__setStandaloneTestModeEnabled___block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_sync(connectionStatusQueue, block);
  service = self->_service;
  if (service) {
    [(BLTAbstractIDSService *)service removeDelegate:self];
  }
  serviceName = self->_serviceName;
  if (v3)
  {
    id v8 = [(NSString *)serviceName stringByAppendingString:@".test"];
    id v9 = off_2646837C0;
  }
  else
  {
    id v8 = serviceName;
    id v9 = off_264683470;
  }
  uint64_t v10 = (BLTAbstractIDSService *)[objc_alloc(*v9) initWithService:v8];
  int v11 = self->_service;
  self->_service = v10;

  char v12 = [BLTPBProtobufSequenceNumberManager alloc];
  unint64_t v13 = -[BLTPBProtobufSequenceNumberManager initWithServiceName:updateSequenceNumbersOnOutOfOrder:](v12, "initWithServiceName:updateSequenceNumbersOnOutOfOrder:", v8, [MEMORY[0x263F57700] activePairedDeviceSupportsNotSendingTemporarySequenceNumbers] ^ 1);
  sequenceNumberManager = self->_sequenceNumberManager;
  self->_sequenceNumberManager = v13;

  int v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  idsRequestMessageTypeToSelector = self->_idsRequestMessageTypeToSelector;
  self->_idsRequestMessageTypeToSelector = v15;

  [(BLTRemoteObject *)self setProtobufAction:sel_handleAckInitialSequenceNumberRequest_ forIncomingRequestsOfType:12];
  [(BLTRemoteObject *)self registerProtobufHandlers];
  [(BLTAbstractIDSService *)self->_service addDelegate:self queue:self->_idsQueue];
}

void __49__BLTRemoteObject__setStandaloneTestModeEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 didSend:(id)a7
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9
{
  uint64_t v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = +[BLTRemoteRequest remoteRequestWithProtobuf:a3 type:v13];
  [v21 setTimeout:v20];

  [v21 setRequestDescription:v19];
  [v21 setUniqueID:v18];

  [v21 setDidSend:v17];
  [v21 setResponseCompletion:v16];

  [(BLTRemoteObject *)self sendRequest:v21];
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9
{
  uint64_t v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = +[BLTRemoteRequest remoteRequestWithProtobuf:a3 type:v13];
  [v21 setResponseToRequest:v20];

  [v21 setTimeout:v19];
  [v21 setRequestDescription:v18];

  [v21 setUniqueID:v17];
  [v21 setDidSend:v16];

  [(BLTRemoteObject *)self sendRequest:v21];
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6 didQueue:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = +[BLTRemoteRequest remoteRequestWithProtobuf:a3 type:v9];
  [v15 setTimeout:v14];

  [v15 setDidSend:v13];
  [v15 setDidQueue:v12];

  if (v9 == 27)
  {
    [v15 setAllowCloudDelivery:0];
    [v15 setNonWaking:1];
  }
  [(BLTRemoteObject *)self sendRequest:v15];
}

- (void)sendRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  idsQueue = self->_idsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__BLTRemoteObject_sendRequest___block_invoke;
  v7[3] = &unk_264683BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(idsQueue, v7);
}

uint64_t __31__BLTRemoteObject_sendRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueSendRequest:*(void *)(a1 + 40)];
}

- (void)_queuePerformSend:(id)a3 responseToRequest:(id)a4 withTimeout:(id)a5 withDescription:(id)a6 shortDescription:(id)a7 onlyOneFor:(id)a8 allowCloudDelivery:(BOOL)a9 nonWaking:(BOOL)a10 didSend:(id)a11 andResponse:(id)a12
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v57 = (uint64_t (**)(id, void *, id *, id *, id *))a3;
  id v18 = a4;
  id v19 = a5;
  id v59 = a6;
  id v56 = a7;
  id v61 = a8;
  id v20 = a11;
  id v21 = a12;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  dispatch_queue_t v22 = "response";
  v60 = v18;
  if (!v18) {
    dispatch_queue_t v22 = "request";
  }
  int v23 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v22);
  if (v19)
  {
    double v24 = *MEMORY[0x263F49E68];
    id v25 = [NSNumber numberWithDouble:*MEMORY[0x263F49E68]];
    uint64_t v26 = [v19 compare:v25];

    if (v26 == 1)
    {
      v27 = blt_ids_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        [v19 doubleValue];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v24;
        _os_log_impl(&dword_222F4C000, v27, OS_LOG_TYPE_INFO, "Timeout: %f is greater than IDS max: %f and will be clamped to max", buf, 0x16u);
      }

      uint64_t v29 = [NSNumber numberWithDouble:v24];

      id v30 = (id)v29;
    }
    else
    {
      id v30 = v19;
    }
    v55 = v30;
    objc_msgSend(v23, "setObject:forKeyedSubscript:");
    [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49ED8]];
    id v31 = "remote timeout is ENFORCED";
  }
  else
  {
    v55 = 0;
    id v31 = "";
  }
  if (v61) {
    [v23 setObject:v61 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  if (v18)
  {
    v32 = [v18 context];
    v33 = [v32 outgoingResponseIdentifier];
    [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x263F49F40]];
  }
  id v34 = [NSNumber numberWithBool:a9];
  [v23 setObject:v34 forKeyedSubscript:*MEMORY[0x263F49EB0]];

  if (a10) {
    [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F30]];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3020000000;
  char v81 = 0;
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke;
  v69[3] = &unk_264683C50;
  id v35 = v21;
  id v70 = v35;
  v71 = buf;
  v69[4] = self;
  v36 = (void *)MEMORY[0x223CAC810](v69);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_3;
  v65[3] = &unk_264683CC8;
  id v53 = v20;
  v65[4] = self;
  id v66 = v53;
  id v54 = v35;
  id v67 = v54;
  id v37 = v36;
  id v68 = v37;
  v58 = (void (**)(void, void, void))MEMORY[0x223CAC810](v65);
  id v63 = 0;
  id v64 = 0;
  id v62 = 0;
  uint64_t v38 = v57[2](v57, v23, &v64, &v63, &v62);
  id v39 = v64;
  id v40 = v63;
  id v41 = v62;
  if (v39) {
    char v42 = 0;
  }
  else {
    char v42 = v38;
  }
  if (v42)
  {
    v43 = (void *)MEMORY[0x223CAC810](v58);
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler setObject:v43 forKeyedSubscript:v40];

    id v44 = (void *)MEMORY[0x223CAC810](v37);
    [(NSMutableDictionary *)self->_idsSendIDToResponseHandler setObject:v44 forKeyedSubscript:v40];
  }
  else
  {
    _BLTLogIDSSendFail([(BLTRemoteObject *)self isPairedDeviceReady], v39, v40);
    if ([v39 code] == 27) {
      self->_full = 1;
    }
    objc_super v45 = [(BLTRemoteObject *)self _wrapError:v39 identifier:v40];
    ((void (**)(void, uint64_t, void *))v58)[2](v58, v38, v45);

    (*((void (**)(id, void))v37 + 2))(v37, 0);
  }
  v46 = blt_ids_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v72 = 136315906;
    uint64_t v73 = v52;
    __int16 v74 = 2112;
    id v75 = v59;
    __int16 v76 = 2112;
    id v77 = v40;
    __int16 v78 = 2080;
    v79 = v31;
    _os_log_impl(&dword_222F4C000, v46, OS_LOG_TYPE_DEFAULT, "Sent IDS %s %@ got identifier: %@ %s", v72, 0x2Au);
  }

  mruCacheOfSends = self->_mruCacheOfSends;
  uint64_t v48 = [v23 objectForKeyedSubscript:*MEMORY[0x263F49F40]];
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v41, "sequenceNumber"));
  v50 = sessionUUIDFromTransportData(v41);
  v51 = +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v40, v48, v59, v49, v50, [v41 sessionState]);
  [(BLTSimpleCache *)mruCacheOfSends cacheObject:v51];

  _Block_object_dispose(buf, 8);
}

void __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40)
    && (atomic_fetch_or((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 1u) & 1) == 0)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_2;
    v5[3] = &unk_264683C28;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_4;
    block[3] = &unk_264683C78;
    id v14 = v6;
    char v15 = a2;
    id v13 = v5;
    dispatch_async(v7, block);
  }
  if (a2 && *(void *)(a1 + 48))
  {
    dispatch_time_t v8 = dispatch_time(0, 30000000000);
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_5;
    v10[3] = &unk_264683CA0;
    id v11 = *(id *)(a1 + 56);
    dispatch_after(v8, v9, v10);
  }
}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_wrapError:(id)a3 identifier:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    id v7 = [v6 userInfo];
    dispatch_time_t v8 = (void *)[v7 mutableCopy];

    [v8 setObject:v5 forKeyedSubscript:@"BLTTransportSendIdentifier"];
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = [v6 domain];
    uint64_t v11 = [v6 code];

    id v4 = [v9 errorWithDomain:v10 code:v11 userInfo:v8];
  }
  return v4;
}

- (void)_queueSendRequest:(id)a3
{
  id v4 = a3;
  context = (void *)MEMORY[0x223CAC5D0]();
  id v5 = [v4 protobuf];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __37__BLTRemoteObject__queueSendRequest___block_invoke;
  v27[3] = &unk_264683CF0;
  id v25 = self;
  uint8_t v27[4] = self;
  id v6 = v5;
  id v28 = v6;
  id v7 = v4;
  id v29 = v7;
  double v24 = [v7 responseToRequest];
  int v23 = [v7 timeout];
  dispatch_time_t v8 = [v7 requestDescription];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    id v21 = [v6 redact];
    dispatch_queue_t v22 = (void *)v12;
    uint64_t v9 = [v10 stringWithFormat:@"%@: %@", v12, v21];
  }
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  char v15 = [v7 uniqueID];
  char v16 = [v7 allowCloudDelivery];
  char v17 = [v7 nonWaking];
  id v18 = [v7 didSend];
  id v19 = [v7 responseCompletion];
  BYTE1(v20) = v17;
  LOBYTE(v20) = v16;
  -[BLTRemoteObject _queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:](v25, "_queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:", v27, v24, v23, v9, v14, v15, v20, v18, v19);

  if (!v8)
  {
  }
}

uint64_t __37__BLTRemoteObject__queueSendRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v6 = a2;
  id v7 = (void *)MEMORY[0x223CAC5D0]([*(id *)(*(void *)(a1 + 32) + 72) lock]);
  dispatch_time_t v8 = [BLTPBProtobuf alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 48) type];
  uint64_t v11 = [*(id *)(a1 + 48) responseToRequest];
  uint64_t v12 = [*(id *)(a1 + 32) sequenceNumberManager];
  id v13 = [(BLTPBProtobuf *)v8 initWithProtobuf:v9 type:v10 isResponse:v11 != 0 sequenceNumberManager:v12];

  id v14 = [(IDSProtobuf *)v13 transportData];
  char v15 = [*(id *)(a1 + 32) service];
  char v16 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v27 = 0;
  id v28 = 0;
  char v17 = v6;
  uint64_t v18 = [v15 sendProtobuf:v13 toDestinations:v16 priority:300 options:v6 identifier:&v28 error:&v27];
  id v19 = v28;
  id v20 = v27;

  [*(id *)(*(void *)(a1 + 32) + 72) unlock];
  id v21 = [*(id *)(a1 + 48) didQueue];

  if (v21)
  {
    dispatch_queue_t v22 = [*(id *)(a1 + 48) didQueue];
    v22[2]();
  }
  if (a3) {
    *a3 = v20;
  }
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v14;
  }

  return v18;
}

- (void)sendFileURL:(id)a3 withTimeout:(id)a4 extraMetadata:(id)a5 responseHandlers:(id)a6 didSend:(id)a7 didQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke;
  block[3] = &unk_264683D40;
  void block[4] = self;
  id v28 = v16;
  id v29 = v14;
  id v30 = v17;
  id v31 = v15;
  id v32 = v19;
  id v33 = v18;
  id v21 = v18;
  id v22 = v15;
  id v23 = v17;
  id v24 = v19;
  id v25 = v14;
  id v26 = v16;
  dispatch_sync(idsQueue, block);
}

void __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke_2;
  v7[3] = &unk_264683D18;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = [*(id *)(a1 + 48) absoluteString];
  id v5 = [*(id *)(a1 + 48) relativeString];
  LOWORD(v6) = 1;
  objc_msgSend(v2, "_queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:", v7, 0, v3, v4, v5, 0, v6, *(void *)(a1 + 80), 0);
}

uint64_t __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v7 = a2;
  id v8 = (void *)MEMORY[0x223CAC5D0]([*(id *)(*(void *)(a1 + 32) + 72) lock]);
  id v9 = [BLTPBFileURLMetaData alloc];
  id v10 = [*(id *)(a1 + 32) sequenceNumberManager];
  id v11 = [(BLTPBFileURLMetaData *)v9 initWithSequenceNumberManager:v10 extraMetadata:*(void *)(a1 + 40)];

  id v22 = [(BLTPBFileURLMetaData *)v11 transportData];
  uint64_t v12 = [*(id *)(a1 + 32) service];
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = [(BLTPBFileURLMetaData *)v11 metadata];
  id v15 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v26 = 0;
  id v27 = 0;
  id v25 = v7;
  uint64_t v16 = [v12 sendResourceAtURL:v13 metadata:v14 toDestinations:v15 priority:300 options:v7 identifier:&v27 error:&v26];
  id v17 = v27;
  id v18 = v26;

  [*(id *)(*(void *)(a1 + 32) + 72) unlock];
  uint64_t v19 = *(void *)(a1 + 64);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
  if (a3) {
    *a3 = v18;
  }
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v22;
  }
  if (v18) {
    int v20 = 0;
  }
  else {
    int v20 = v16;
  }
  if (v20 == 1 && *(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addEntriesFromDictionary:");
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 56) forKeyedSubscript:v17];
  }

  return v16;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = blt_ids_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Devices changed!", v6, 2u);
  }

  [(BLTRemoteObject *)self _updateConnectionStatusWithResetDefaulteDevice:1];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = blt_ids_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Nearby devices changed!", v6, 2u);
  }

  [(BLTRemoteObject *)self _updateConnectionStatusWithResetDefaulteDevice:1];
}

- (void)_deviceConnectionStatusChanged:(id)a3
{
  id v4 = blt_ids_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "Device connection status changed!", v5, 2u);
  }

  [(BLTRemoteObject *)self _updateConnectionStatus];
}

- (void)_removeAndHandleResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_idsSendIDToResponseHandler objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_idsSendIDToResponseHandler removeObjectForKey:v4];
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__BLTRemoteObject__removeAndHandleResponseHandler___block_invoke;
    block[3] = &unk_264683CA0;
    id v8 = v5;
    dispatch_async(clientQueue, block);
  }
}

uint64_t __51__BLTRemoteObject__removeAndHandleResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  [(BLTRemoteObject *)self _idsQueueCallSendCompletionHandlerWithSuccess:v8 identifier:v10 error:v11];
  uint64_t v12 = [(NSMutableDictionary *)self->_idsFileIDToResponseHandler objectForKeyedSubscript:v10];
  if (v12) {
    [(NSMutableDictionary *)self->_idsFileIDToResponseHandler removeObjectForKey:v10];
  }
  if (v11 || !v8)
  {
    _BLTLogIDSSendFail([(BLTRemoteObject *)self isPairedDeviceReady], v11, v10);
    [(BLTRemoteObject *)self _removeAndHandleResponseHandler:v10];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[BLTRemoteObject _removeAndHandleResponseHandler:](self, "_removeAndHandleResponseHandler:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v15);
    }
  }
  else
  {
    uint64_t v13 = blt_ids_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_222F4C000, v13, OS_LOG_TYPE_DEFAULT, "IDS success sending request: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_idsQueueCallSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler objectForKeyedSubscript:v8];
  if (v10)
  {
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler removeObjectForKey:v8];
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__BLTRemoteObject__idsQueueCallSendCompletionHandlerWithSuccess_identifier_error___block_invoke;
    block[3] = &unk_264683D68;
    BOOL v17 = a3;
    id v16 = v10;
    void block[4] = self;
    id v14 = v9;
    id v15 = v8;
    dispatch_async(clientQueue, block);
  }
  return v10 != 0;
}

void __82__BLTRemoteObject__idsQueueCallSendCompletionHandlerWithSuccess_identifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) _wrapError:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

- (BOOL)_callSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BLTRemoteObject__callSendCompletionHandlerWithSuccess_identifier_error___block_invoke;
  block[3] = &unk_264683D90;
  BOOL v18 = a3;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = &v19;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(idsQueue, block);
  LOBYTE(idsQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)idsQueue;
}

uint64_t __74__BLTRemoteObject__callSendCompletionHandlerWithSuccess_identifier_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _idsQueueCallSendCompletionHandlerWithSuccess:*(unsigned __int8 *)(a1 + 64) identifier:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v42 = a4;
  id v44 = a5;
  id v45 = a6;
  id v43 = a7;
  id v14 = a8;
  id v15 = [BLTPBFileURLMetaData alloc];
  id v16 = [(BLTRemoteObject *)self sequenceNumberManager];
  BOOL v17 = [(BLTPBFileURLMetaData *)v15 initWithMetadata:v45 sequenceNumberManager:v16];

  if (v17)
  {
    v46 = [(BLTPBFileURLMetaData *)v17 transportData];
    mruCacheOfReceives = self->_mruCacheOfReceives;
    uint64_t v19 = [v14 outgoingResponseIdentifier];
    long long v20 = [v14 incomingResponseIdentifier];
    uint64_t v21 = [NSString stringWithFormat:@"incomingResource:%@", v44];
    char v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v46, "sequenceNumber"));
    id v23 = sessionUUIDFromTransportData(v46);
    id v24 = +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v19, v20, v21, v22, v23, [v46 sessionState]);
    [(BLTSimpleCache *)mruCacheOfReceives cacheObject:v24];

    [(BLTRemoteObject *)self _handleNewSessionState:[(BLTPBFileURLMetaData *)v17 sessionState]];
    uint64_t v25 = [(BLTPBFileURLMetaData *)v17 sequenceNumberError];
    id v26 = [v14 serviceIdentifier];
    id v27 = [v14 outgoingResponseIdentifier];
    LOBYTE(v25) = [(BLTRemoteObject *)self _sequenceErrorDidHappenAndHandled:v25 service:v26 incomingIdentifier:v27];

    if ((v25 & 1) == 0)
    {
      id v28 = blt_ids_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [v14 outgoingResponseIdentifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v29;
        _os_log_impl(&dword_222F4C000, v28, OS_LOG_TYPE_DEFAULT, "Received resource with IDS identifier: %@", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__263;
      id v61 = __Block_byref_object_dispose__264;
      id v62 = 0;
      id v30 = NSString;
      id v31 = [v14 serviceIdentifier];
      id v32 = [v14 outgoingResponseIdentifier];
      id v33 = [v30 stringWithFormat:@"%@:%@", v31, v32];
      id v34 = BLTFileURLInPairingPath(v33);

      if (v34
        && ([MEMORY[0x263F08850] defaultManager],
            id v35 = objc_claimAutoreleasedReturnValue(),
            uint64_t v36 = *((void *)&buf + 1),
            id obj = *(id *)(*((void *)&buf + 1) + 40),
            char v37 = [v35 copyItemAtURL:v44 toURL:v34 error:&obj],
            objc_storeStrong((id *)(v36 + 40), obj),
            v35,
            (v37 & 1) != 0))
      {
        clientQueue = self->_clientQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke;
        block[3] = &unk_264683DB8;
        void block[4] = self;
        id v48 = v34;
        v49 = v17;
        p_long long buf = &buf;
        dispatch_async(clientQueue, block);
      }
      else
      {
        id v39 = blt_ids_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)uint64_t v52 = 138412802;
          id v53 = v44;
          __int16 v54 = 2112;
          v55 = v34;
          __int16 v56 = 2112;
          uint64_t v57 = v40;
          _os_log_error_impl(&dword_222F4C000, v39, OS_LOG_TYPE_ERROR, "Error creating link for incoming URL: %@ at %@ error: %@", v52, 0x20u);
        }
      }
      _Block_object_dispose(&buf, 8);
    }
  }
}

void __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (uint64_t *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 48) extraMetadata];
  [v2 handleFileURL:v4 extraMetadata:v5];

  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = *v3;
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = a1 + 56;
  uint64_t v10 = *(void *)(v9 + 8);
  id obj = *(id *)(v10 + 40);
  LOBYTE(v5) = [v6 removeItemAtURL:v7 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);

  if ((v5 & 1) == 0)
  {
    id v11 = blt_ids_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1(v3, v8, v11);
    }
  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (unint64_t)lastKnownConnectionStatus
{
  return self->_lastKnownConnectionStatus;
}

- (void)setLastKnownConnectionStatus:(unint64_t)a3
{
  self->_lastKnownConnectionStatus = a3;
}

- (BOOL)isPairedDeviceReady
{
  return self->_pairedDeviceReady;
}

- (void)setPairedDeviceReady:(BOOL)a3
{
  self->_pairedDeviceReady = a3;
}

- (BLTAbstractIDSService)service
{
  return self->_service;
}

- (BLTPBProtobufSequenceNumberManager)sequenceNumberManager
{
  return self->_sequenceNumberManager;
}

- (BLTSimpleCache)mruCacheOfSends
{
  return self->_mruCacheOfSends;
}

- (void)setMruCacheOfSends:(id)a3
{
}

- (BLTSimpleCache)mruCacheOfReceives
{
  return self->_mruCacheOfReceives;
}

- (void)setMruCacheOfReceives:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mruCacheOfReceives, 0);
  objc_storeStrong((id *)&self->_mruCacheOfSends, 0);
  objc_storeStrong((id *)&self->_sequenceNumberManager, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_connectionStatusQueue, 0);
  objc_storeStrong((id *)&self->_sequenceNumberSendLock, 0);
  objc_storeStrong((id *)&self->_idsRequestMessageTypeToSelector, 0);
  objc_storeStrong((id *)&self->_defaultPairedDevice, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsFileIDToResponseHandler, 0);
  objc_storeStrong((id *)&self->_idsSendIDToResponseHandler, 0);
  objc_storeStrong((id *)&self->_idsSendIDToCompletionHandler, 0);
}

- (void)_sequenceErrorDidHappenAndHandled:(uint64_t)a1 service:(uint64_t)a2 incomingIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_222F4C000, a2, a3, "Out of order message received from IDS on %@ with identifer %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  OUTLINED_FUNCTION_0(&dword_222F4C000, a2, a3, "Error removing %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end