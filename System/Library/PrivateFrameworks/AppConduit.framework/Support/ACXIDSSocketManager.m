@interface ACXIDSSocketManager
+ (id)sharedV1SocketManager;
+ (id)sharedV2SocketManager;
- (ACXIDSSocketManager)initWithDelegate:(id)a3 queue:(id)a4;
- (ACXIDSSocketManagerDelegateProtocol)delegate;
- (ACXSocket)socket;
- (BOOL)wiFiAsserted;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (BOOL)writeDictionary:(id)a3 error:(id *)a4;
- (IDSService)service;
- (NSString)currentConnectionUUID;
- (NSString)currentSetupMessageUUID;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)socketInUse;
- (OS_dispatch_source)socketSetupTimer;
- (OS_dispatch_source)socketTeardownTimer;
- (id)_initWithDelegate:(id)a3 queue:(id)a4 serviceName:(id)a5;
- (id)_sendMessage:(id)a3 messageDictionary:(id)a4 withAcknowledgement:(BOOL)a5 error:(id *)a6;
- (id)initiateCB;
- (void)_doneUsingSocket;
- (void)_onInternalQueue_armSocketShutdownTimer;
- (void)_onInternalQueue_beginUsingSocketAsDelegate:(id)a3 onQueue:(id)a4 tryWiFi:(BOOL)a5 completion:(id)a6;
- (void)_onInternalQueue_disarmSocketShutdownTimer;
- (void)_onInternalQueue_initiateConnectionWithCompletionBlock:(id)a3;
- (void)_onInternalQueue_resetSocketBecauseOfError:(id)a3;
- (void)_onQueue_startSocketSetupTimer;
- (void)_onQueue_stopSocketSetupTimer;
- (void)_readSourceReturnedDictionaryOrData:(id)a3 error:(id)a4;
- (void)_waitForSocket;
- (void)beginUsingSocketAsDelegate:(id)a3 onQueue:(id)a4 tryWiFi:(BOOL)a5 completion:(id)a6;
- (void)endUsingSocket;
- (void)handleIDSRelayConnection:(id)a3 fromID:(id)a4 UUID:(id)a5 context:(id)a6;
- (void)handleIDSRelayConnectionResponseWithContext:(id)a3;
- (void)resetSocket;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setCurrentConnectionUUID:(id)a3;
- (void)setCurrentSetupMessageUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitiateCB:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSocket:(id)a3;
- (void)setSocketSetupTimer:(id)a3;
- (void)setSocketTeardownTimer:(id)a3;
- (void)setWiFiAsserted:(BOOL)a3;
@end

@implementation ACXIDSSocketManager

+ (id)sharedV1SocketManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000145B4;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A5548 != -1) {
    dispatch_once(&qword_1000A5548, block);
  }
  v2 = (void *)qword_1000A5540;

  return v2;
}

+ (id)sharedV2SocketManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000146A4;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A5558 != -1) {
    dispatch_once(&qword_1000A5558, block);
  }
  v2 = (void *)qword_1000A5550;

  return v2;
}

- (ACXIDSSocketManager)initWithDelegate:(id)a3 queue:(id)a4
{
  return (ACXIDSSocketManager *)[(ACXIDSSocketManager *)self _initWithDelegate:a3 queue:a4 serviceName:@"com.apple.private.alloy.appconduit.v2"];
}

- (id)_initWithDelegate:(id)a3 queue:(id)a4 serviceName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ACXIDSSocketManager;
  v12 = [(ACXIDSSocketManager *)&v24 init];
  if (!v12) {
    goto LABEL_4;
  }
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.AppConduit.SocketManager", v13);
  internalQueue = v12->_internalQueue;
  v12->_internalQueue = (OS_dispatch_queue *)v14;

  dispatch_semaphore_t v16 = dispatch_semaphore_create(1);
  socketInUse = v12->_socketInUse;
  v12->_socketInUse = (OS_dispatch_semaphore *)v16;

  v12->_socketInUseCount = 0;
  objc_storeStrong((id *)&v12->_delegate, a3);
  objc_storeStrong((id *)&v12->_queue, a4);
  v18 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v11];
  service = v12->_service;
  v12->_service = v18;

  if (v12->_service)
  {
    v20 = [(ACXIDSSocketManager *)v12 service];
    v21 = [(ACXIDSSocketManager *)v12 internalQueue];
    [v20 addDelegate:v12 queue:v21];

LABEL_4:
    v22 = v12;
    goto LABEL_9;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  v22 = 0;
LABEL_9:

  return v22;
}

- (void)_onInternalQueue_beginUsingSocketAsDelegate:(id)a3 onQueue:(id)a4 tryWiFi:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7 && ![(ACXIDSSocketManager *)self wiFiAsserted])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXIDSSocketManager *)self setWiFiAsserted:1];
    v13 = [(ACXIDSSocketManager *)self socket];
    [v13 noteWifiAsserted:1];

    dispatch_queue_t v14 = [(ACXIDSSocketManager *)self service];
    [v14 setPreferInfraWiFi:1];
  }
  [(ACXIDSSocketManager *)self setDelegate:v10];
  [(ACXIDSSocketManager *)self setQueue:v11];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014A2C;
  v17[3] = &unk_10008D108;
  id v18 = v12;
  id v15 = v12;
  sub_100006BB8(v11, v17);
  dispatch_semaphore_t v16 = [(ACXIDSSocketManager *)self socket];
  [v16 resumeReadSource];
}

- (void)beginUsingSocketAsDelegate:(id)a3 onQueue:(id)a4 tryWiFi:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10 || !v11) {
    sub_10005B7E0();
  }
  v13 = v12;
  [(ACXIDSSocketManager *)self _waitForSocket];
  dispatch_queue_t v14 = [(ACXIDSSocketManager *)self internalQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100014B5C;
  v18[3] = &unk_10008D158;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v13;
  BOOL v22 = a5;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  sub_100006BB8(v14, v18);
}

- (void)endUsingSocket
{
  v3 = [(ACXIDSSocketManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014EA0;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);

  [(ACXIDSSocketManager *)self _doneUsingSocket];
}

- (void)resetSocket
{
  v3 = [(ACXIDSSocketManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F8C;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v9 = [(ACXIDSSocketManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015144;
  block[3] = &unk_10008D180;
  block[4] = self;
  void block[5] = &v12;
  block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_sync(v9, block);

  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)a5;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  BOOL v7 = [(ACXIDSSocketManager *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000152F8;
  v10[3] = &unk_10008D1A8;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)writeDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  BOOL v7 = [(ACXIDSSocketManager *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000154AC;
  v10[3] = &unk_10008D1A8;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  v13 = a4;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)_waitForSocket
{
  v3 = [(ACXIDSSocketManager *)self socketInUse];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (atomic_fetch_add(&self->_socketInUseCount, 1u)) {
    sub_10005B80C();
  }
}

- (void)_doneUsingSocket
{
  if (atomic_fetch_add(&self->_socketInUseCount, 0xFFFFFFFF) != 1) {
    sub_10005B838();
  }
  v2 = [(ACXIDSSocketManager *)self socketInUse];
  dispatch_semaphore_signal(v2);
}

- (void)_onInternalQueue_armSocketShutdownTimer
{
  [(ACXIDSSocketManager *)self socketTeardownTimer];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005B864();
  }
  v3 = [(ACXIDSSocketManager *)self internalQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(ACXIDSSocketManager *)self setSocketTeardownTimer:v4];

  v5 = [(ACXIDSSocketManager *)self socketTeardownTimer];
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  BOOL v7 = [(ACXIDSSocketManager *)self socketTeardownTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015734;
  handler[3] = &unk_10008CD30;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  id v8 = [(ACXIDSSocketManager *)self socketTeardownTimer];
  dispatch_resume(v8);
}

- (void)_onInternalQueue_disarmSocketShutdownTimer
{
  v3 = [(ACXIDSSocketManager *)self socketTeardownTimer];

  if (v3)
  {
    dispatch_source_t v4 = [(ACXIDSSocketManager *)self socketTeardownTimer];
    dispatch_source_cancel(v4);

    [(ACXIDSSocketManager *)self setSocketTeardownTimer:0];
  }
}

- (void)_readSourceReturnedDictionaryOrData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = [(ACXIDSSocketManager *)self internalQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100015AB0;
    v16[3] = &unk_10008CC28;
    v16[4] = self;
    id v17 = v7;
    dispatch_sync(v13, v16);

    uint64_t v12 = v17;
    goto LABEL_6;
  }
  uint64_t v8 = [(ACXIDSSocketManager *)self delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(ACXIDSSocketManager *)self queue];

    if (v10)
    {
      id v11 = [(ACXIDSSocketManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015ABC;
      block[3] = &unk_10008CC28;
      block[4] = self;
      id v15 = v6;
      dispatch_sync(v11, block);

      uint64_t v12 = v15;
LABEL_6:

      goto LABEL_10;
    }
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
LABEL_10:
}

- (void)_onInternalQueue_initiateConnectionWithCompletionBlock:(id)a3
{
  dispatch_source_t v4 = (void (**)(id, id))a3;
  [(ACXIDSSocketManager *)self setInitiateCB:v4];
  v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];
  [(ACXIDSSocketManager *)self setCurrentConnectionUUID:v6];

  v14[0] = @"type";
  v14[1] = @"UUID";
  v15[0] = &off_1000975B8;
  id v7 = [(ACXIDSSocketManager *)self currentConnectionUUID];
  v15[1] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v12 = [(ACXIDSSocketManager *)self currentConnectionUUID];
    MOLogWrite();
  }
  [(ACXIDSSocketManager *)self _onQueue_startSocketSetupTimer];
  id v9 = [(ACXIDSSocketManager *)self service];
  id v13 = 0;
  id v10 = [(ACXIDSSocketManager *)self _sendMessage:v9 messageDictionary:v8 withAcknowledgement:1 error:&v13];
  id v11 = v13;

  if (v10)
  {
    [(ACXIDSSocketManager *)self setCurrentSetupMessageUUID:v10];
  }
  else
  {
    v4[2](v4, v11);
    [(ACXIDSSocketManager *)self setInitiateCB:0];
  }
}

- (id)_sendMessage:(id)a3 messageDictionary:(id)a4 withAcknowledgement:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v9 = IDSDefaultPairedDevice;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[NSSet setWithObject:v9];
  v22[0] = IDSSendMessageOptionTimeoutKey;
  v22[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v23[0] = &off_100097B70;
  v23[1] = &__kCFBooleanTrue;
  v22[2] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  id v13 = +[NSNumber numberWithBool:v7];
  v22[3] = IDSSendMessageOptionBypassDuetKey;
  v23[2] = v13;
  v23[3] = &__kCFBooleanTrue;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  id v15 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:200 options:0 error:0];

  id v20 = 0;
  id v21 = 0;
  LOBYTE(v9) = [v11 sendData:v15 toDestinations:v12 priority:300 options:v14 identifier:&v21 error:&v20];

  id v16 = v21;
  id v17 = v20;
  if (v9)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    id v18 = v16;
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v18 = 0;
    if (a6) {
      *a6 = v17;
    }
  }

  return v18;
}

- (void)_onInternalQueue_resetSocketBecauseOfError:(id)a3
{
  id v4 = a3;
  [(ACXIDSSocketManager *)self _onInternalQueue_disarmSocketShutdownTimer];
  v5 = [(ACXIDSSocketManager *)self socket];
  [v5 invalidate];

  [(ACXIDSSocketManager *)self setSocket:0];
  if (v4)
  {
    uint64_t v6 = [(ACXIDSSocketManager *)self delegate];
    if (v6)
    {
      BOOL v7 = (void *)v6;
      uint64_t v8 = [(ACXIDSSocketManager *)self queue];

      if (v8)
      {
        uint64_t v9 = [(ACXIDSSocketManager *)self queue];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100016068;
        v10[3] = &unk_10008CC28;
        v10[4] = self;
        id v11 = v4;
        sub_100006BB8(v9, v10);
      }
    }
  }
}

- (void)_onQueue_startSocketSetupTimer
{
  v3 = [(ACXIDSSocketManager *)self internalQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(ACXIDSSocketManager *)self setSocketSetupTimer:v4];

  v5 = [(ACXIDSSocketManager *)self socketSetupTimer];
  dispatch_time_t v6 = dispatch_time(0, 130000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  BOOL v7 = [(ACXIDSSocketManager *)self socketSetupTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000161E4;
  handler[3] = &unk_10008CD30;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  uint64_t v8 = [(ACXIDSSocketManager *)self socketSetupTimer];
  dispatch_resume(v8);
}

- (void)_onQueue_stopSocketSetupTimer
{
  v3 = [(ACXIDSSocketManager *)self socketSetupTimer];

  if (v3)
  {
    [(ACXIDSSocketManager *)self setCurrentConnectionUUID:0];
    [(ACXIDSSocketManager *)self setCurrentSetupMessageUUID:0];
    dispatch_source_t v4 = [(ACXIDSSocketManager *)self socketSetupTimer];
    dispatch_source_cancel(v4);

    [(ACXIDSSocketManager *)self setSocketSetupTimer:0];
  }
}

- (void)handleIDSRelayConnection:(id)a3 fromID:(id)a4 UUID:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    BOOL v22 = [v13 outgoingResponseIdentifier];
    id v23 = v12;
    MOLogWrite();
  }
  id v15 = [(ACXIDSSocketManager *)self service];
  id v16 = [v15 deviceForFromID:v11];

  if (v16)
  {
    v35[0] = IDSOpenSocketOptionTransportKey;
    v35[1] = IDSOpenSocketOptionPriorityKey;
    v36[0] = &off_1000975D0;
    v36[1] = &off_1000975E8;
    v35[2] = IDSOpenSocketOptionStreamNameKey;
    v35[3] = IDSOpenSocketOptionClientTimeoutKey;
    v36[2] = v12;
    v36[3] = &off_100097600;
    id v17 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100016618;
    v33 = sub_100016628;
    id v34 = 0;
    id v18 = objc_alloc((Class)IDSDeviceConnection);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100016630;
    v24[3] = &unk_10008D1F8;
    id v25 = v12;
    v26 = self;
    v28 = &v29;
    id v27 = v14;
    id v19 = [(ACXIDSSocketManager *)self internalQueue];
    id v20 = [v18 initSocketWithDevice:v16 options:v17 completionHandler:v24 queue:v19];
    id v21 = (void *)v30[5];
    v30[5] = (uint64_t)v20;

    _Block_object_dispose(&v29, 8);
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)handleIDSRelayConnectionResponseWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(ACXIDSSocketManager *)self currentConnectionUUID];
  [(ACXIDSSocketManager *)self _onQueue_stopSocketSetupTimer];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  dispatch_time_t v6 = [(ACXIDSSocketManager *)self service];
  BOOL v7 = [v6 devices];

  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
      if ([v12 isActive]) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v12;

    if (!v14) {
      goto LABEL_12;
    }
    v36[0] = IDSOpenSocketOptionTransportKey;
    v36[1] = IDSOpenSocketOptionPriorityKey;
    v37[0] = &off_1000975D0;
    v37[1] = &off_1000975E8;
    v36[2] = IDSOpenSocketOptionStreamNameKey;
    v36[3] = IDSOpenSocketOptionClientTimeoutKey;
    v37[2] = v5;
    v37[3] = &off_100097600;
    id v15 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = sub_100016618;
    v30 = sub_100016628;
    id v31 = 0;
    id v16 = objc_alloc((Class)IDSDeviceConnection);
    id v23 = v5;
    id v25 = &v26;
    id v24 = v4;
    id v17 = [(ACXIDSSocketManager *)self internalQueue];
    id v18 = [v16 initSocketWithDevice:v14 options:v15 completionHandler:&v22 queue:v17];
    id v19 = (void *)v27[5];
    v27[5] = (uint64_t)v18;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
LABEL_9:

LABEL_12:
    sub_100007710((uint64_t)"-[ACXIDSSocketManager handleIDSRelayConnectionResponseWithContext:]", 832, @"ACXErrorDomain", 8, 0, 0, @"Failed to create IDSDeviceConnection because an active device could not be located.", v13, v22);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [(ACXIDSSocketManager *)self initiateCB];

    if (v20)
    {
      id v21 = [(ACXIDSSocketManager *)self initiateCB];
      ((void (**)(void, id))v21)[2](v21, v14);

      [(ACXIDSSocketManager *)self setInitiateCB:0];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v21 = 0;
  uint64_t v22 = 0;
  id v14 = +[NSPropertyListSerialization propertyListWithData:a5 options:0 format:&v22 error:&v21];
  id v15 = v21;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v19 = v12;
    id v20 = v14;
    MOLogWrite();
  }
  id v16 = objc_msgSend(v14, "objectForKey:", @"type", v19, v20);
  unsigned int v17 = [v16 unsignedShortValue];

  id v18 = [v14 objectForKey:@"UUID"];
  if (v17 != 2)
  {
    if (v17 == 1)
    {
      [(ACXIDSSocketManager *)self handleIDSRelayConnection:v11 fromID:v12 UUID:v18 context:v13];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!a6)
  {
    id v16 = [(ACXIDSSocketManager *)self currentSetupMessageUUID];
    unsigned __int8 v17 = [v14 isEqualToString:v16];

    if (v17)
    {
      [(ACXIDSSocketManager *)self _onQueue_stopSocketSetupTimer];
      id v19 = v15;
      if (!v19)
      {
        sub_100007710((uint64_t)"-[ACXIDSSocketManager service:account:identifier:didSendWithSuccess:error:]", 929, @"ACXErrorDomain", 1, 0, 0, @"IDS called its didSend callback for failure but with a nil error message", v18, v25);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      CFStringRef v26 = @"IDSMessageID";
      id v27 = v14;
      id v20 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v22 = sub_100007710((uint64_t)"-[ACXIDSSocketManager service:account:identifier:didSendWithSuccess:error:]", 933, @"ACXErrorDomain", 49, v19, v20, @"Socket setup message failed to send with identifier: %@", v21, (uint64_t)v14);

      id v23 = [(ACXIDSSocketManager *)self initiateCB];

      if (v23)
      {
        id v24 = [(ACXIDSSocketManager *)self initiateCB];
        ((void (**)(void, void *))v24)[2](v24, v22);

        [(ACXIDSSocketManager *)self setInitiateCB:0];
      }
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v13 = a5;
  id v8 = a6;
  id v9 = [(ACXIDSSocketManager *)self currentSetupMessageUUID];
  unsigned __int8 v10 = [v13 isEqualToString:v9];

  if (v10)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v12 = [(ACXIDSSocketManager *)self currentConnectionUUID];
      id v11 = v13;
      MOLogWrite();
    }
    -[ACXIDSSocketManager handleIDSRelayConnectionResponseWithContext:](self, "handleIDSRelayConnectionResponseWithContext:", v8, v11, v12);
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (ACXIDSSocketManagerDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_semaphore)socketInUse
{
  return self->_socketInUse;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (IDSService)service
{
  return self->_service;
}

- (ACXSocket)socket
{
  return self->_socket;
}

- (void)setSocket:(id)a3
{
}

- (OS_dispatch_source)socketTeardownTimer
{
  return self->_socketTeardownTimer;
}

- (void)setSocketTeardownTimer:(id)a3
{
}

- (id)initiateCB
{
  return self->_initiateCB;
}

- (void)setInitiateCB:(id)a3
{
}

- (BOOL)wiFiAsserted
{
  return self->_wiFiAsserted;
}

- (void)setWiFiAsserted:(BOOL)a3
{
  self->_wiFiAsserted = a3;
}

- (OS_dispatch_source)socketSetupTimer
{
  return self->_socketSetupTimer;
}

- (void)setSocketSetupTimer:(id)a3
{
}

- (NSString)currentConnectionUUID
{
  return self->_currentConnectionUUID;
}

- (void)setCurrentConnectionUUID:(id)a3
{
}

- (NSString)currentSetupMessageUUID
{
  return self->_currentSetupMessageUUID;
}

- (void)setCurrentSetupMessageUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSetupMessageUUID, 0);
  objc_storeStrong((id *)&self->_currentConnectionUUID, 0);
  objc_storeStrong((id *)&self->_socketSetupTimer, 0);
  objc_storeStrong(&self->_initiateCB, 0);
  objc_storeStrong((id *)&self->_socketTeardownTimer, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_socketInUse, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end