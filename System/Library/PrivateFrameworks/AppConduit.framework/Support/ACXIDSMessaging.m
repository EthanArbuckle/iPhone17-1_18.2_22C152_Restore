@interface ACXIDSMessaging
+ (id)messagerWithIDSServiceName:(id)a3;
- (ACXIDSMessaging)initWithServiceName:(id)a3;
- (ACXIDSMessaging)initWithServiceName:(id)a3 IDSService:(id)a4;
- (ACXIDSMessagingDelegate)delegate;
- (ACXIDSMessagingDeviceManager)deviceManager;
- (BOOL)serviceDelegateSet;
- (IDSService)service;
- (NRDevice)activePairedDevice;
- (NSMutableDictionary)pendingReplies;
- (NSString)serviceName;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)transaction;
- (void)asyncTransaction:(id)a3;
- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8;
- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setActivePairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setDeviceManager:(id)a3 delegate:(id)a4;
- (void)setServiceDelegateSet:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation ACXIDSMessaging

+ (id)messagerWithIDSServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100018964;
  v17 = sub_100018974;
  id v18 = 0;
  if (qword_1000A5580 != -1) {
    dispatch_once(&qword_1000A5580, &stru_10008D260);
  }
  v5 = qword_1000A5570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000189F8;
  block[3] = &unk_10008D288;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (ACXIDSMessaging)initWithServiceName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)IDSService) initWithService:v4];
  id v6 = [(ACXIDSMessaging *)self initWithServiceName:v4 IDSService:v5];

  return v6;
}

- (ACXIDSMessaging)initWithServiceName:(id)a3 IDSService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ACXIDSMessaging;
  v8 = [(ACXIDSMessaging *)&v18 init];
  if (!v8) {
    goto LABEL_3;
  }
  uint64_t v9 = objc_opt_new();
  pendingReplies = v8->_pendingReplies;
  v8->_pendingReplies = (NSMutableDictionary *)v9;

  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.appconduit.IDSMessaging", v11);
  internalQueue = v8->_internalQueue;
  v8->_internalQueue = (OS_dispatch_queue *)v12;

  v14 = (NSString *)[v6 copy];
  serviceName = v8->_serviceName;
  v8->_serviceName = v14;

  objc_storeStrong((id *)&v8->_service, a4);
  if (!v8->_service)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    v16 = 0;
  }
  else
  {
LABEL_3:
    v16 = v8;
  }

  return v16;
}

- (void)setDeviceManager:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACXIDSMessaging *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018D2C;
  block[3] = &unk_10008CA40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)asyncTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXIDSMessaging *)self internalQueue];
  sub_100006BB8(v5, v4);
}

- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019084;
  v20[3] = &unk_10008D2B0;
  id v24 = a7;
  id v25 = a8;
  double v26 = a6;
  id v21 = v15;
  v22 = self;
  int64_t v27 = a5;
  id v23 = v14;
  id v16 = v24;
  id v17 = v14;
  id v18 = v15;
  id v19 = v25;
  [(ACXIDSMessaging *)self asyncTransaction:v20];
}

- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [v13 idsContext];
  unsigned __int8 v16 = [v15 expectsPeerResponse];

  if (v16)
  {
    id v17 = [(ACXIDSMessaging *)self internalQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000196AC;
    v20[3] = &unk_10008D2D8;
    id v21 = v13;
    id v22 = v14;
    id v23 = self;
    double v25 = a6;
    id v24 = v12;
    int64_t v26 = a5;
    sub_100006BB8(v17, v20);
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v18 = [(ACXIDSMessaging *)self serviceName];
    id v19 = [v13 message];
    MOLogWrite();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v24 = a5;
  id v10 = a6;
  id v11 = a7;
  id v12 = [v11 incomingResponseIdentifier];
  if (v12)
  {
    id v13 = [(ACXIDSMessaging *)self pendingReplies];
    id v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      id v15 = [[ACXIDSMessage alloc] initWithMessage:v24 idsContext:v11 fromID:v10];
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        unsigned __int8 v16 = [(ACXIDSMessaging *)self serviceName];
        id v17 = [v11 incomingResponseIdentifier];
        [v11 outgoingResponseIdentifier];
        id v23 = v20 = v17;
        id v19 = v16;
        MOLogWrite();
      }
      objc_msgSend(v14, "runReplyHandlerWithMessage:error:", v15, 0, v19, v20, v23);
      goto LABEL_18;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v15 = [(ACXIDSMessaging *)self serviceName];
      id v22 = [v11 outgoingResponseIdentifier];
      MOLogWrite();

LABEL_18:
    }
  }
  else
  {
    id v14 = [(ACXIDSMessaging *)self delegate];
    if (v14)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v18 = [(ACXIDSMessaging *)self serviceName];
        id v21 = [v11 outgoingResponseIdentifier];
        MOLogWrite();
      }
      id v15 = [[ACXIDSMessage alloc] initWithMessage:v24 idsContext:v11 fromID:v10];
      [v14 incomingMessage:v15 fromDevice:v10];
      goto LABEL_18;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v15 = [(ACXIDSMessaging *)self serviceName];
      MOLogWrite();
      goto LABEL_18;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v14 = a5;
  id v10 = a7;
  if (!a6)
  {
    id v11 = [(ACXIDSMessaging *)self pendingReplies];
    id v12 = [v11 objectForKeyedSubscript:v14];

    if (v12)
    {
      [v12 runReplyHandlerWithMessage:0 error:v10];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v13 = [(ACXIDSMessaging *)self serviceName];
      MOLogWrite();
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v8 = a4;
  id v5 = [(ACXIDSMessaging *)self deviceManager];
  id v6 = v5;
  if (v5)
  {
    [v5 updatedIDSDevices:v8 forMessager:self];
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v7 = [(ACXIDSMessaging *)self serviceName];
    MOLogWrite();
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSMutableDictionary)pendingReplies
{
  return self->_pendingReplies;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (IDSService)service
{
  return self->_service;
}

- (NRDevice)activePairedDevice
{
  return self->_activePairedDevice;
}

- (void)setActivePairedDevice:(id)a3
{
}

- (BOOL)serviceDelegateSet
{
  return self->_serviceDelegateSet;
}

- (void)setServiceDelegateSet:(BOOL)a3
{
  self->_serviceDelegateSet = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (ACXIDSMessagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXIDSMessagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACXIDSMessagingDeviceManager)deviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceManager);

  return (ACXIDSMessagingDeviceManager *)WeakRetained;
}

- (void)setDeviceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activePairedDevice, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingReplies, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end