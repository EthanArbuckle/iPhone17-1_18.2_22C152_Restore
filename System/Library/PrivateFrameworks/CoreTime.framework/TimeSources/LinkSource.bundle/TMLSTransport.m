@interface TMLSTransport
- (IDSService)idsService;
- (OS_dispatch_queue)idsQueue;
- (OS_dispatch_workloop)workloop;
- (TMLSTransport)initWithDelegate:(id)a3 clock:(id)a4 workloop:(id)a5;
- (TMLSTransportDelegate)delegate;
- (TMMonotonicClock)clock;
- (id)destinationsIncludingTinker:(BOOL)a3;
- (void)dealloc;
- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5 queueOne:(id)a6 withHandler:(id)a7 includeTinker:(BOOL)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setClock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdsQueue:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setWorkloop:(id)a3;
@end

@implementation TMLSTransport

- (TMLSTransport)initWithDelegate:(id)a3 clock:(id)a4 workloop:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TMLSTransport;
  v12 = [(TMLSTransport *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clock, a4);
    objc_storeStrong((id *)&v13->_delegate, a3);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.timeSync.timeLink.transport", 0);
    idsQueue = v13->_idsQueue;
    v13->_idsQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_workloop, a5);
    v16 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.timesync"];
    idsService = v13->_idsService;
    v13->_idsService = v16;

    [(IDSService *)v13->_idsService addDelegate:v13 queue:v13->_idsQueue];
    v18 = [(TMLSTransport *)v13 workloop];
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v18, &stru_10390);
  }
  return v13;
}

- (void)dealloc
{
  [(TMLSTransport *)self setIdsService:0];
  [(TMLSTransport *)self setIdsQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)TMLSTransport;
  [(TMLSTransport *)&v3 dealloc];
}

- (id)destinationsIncludingTinker:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [(TMLSTransport *)self idsService];
  v5 = [v4 linkedDevicesWithRelationship:v3];

  id v6 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  v8 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)IDSCopyIDForDevice();
        objc_msgSend(v6, "addObject:", v12, v14);
      }
      id v9 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)sendData:(id)a3 localOnly:(BOOL)a4 nonWaking:(BOOL)a5 queueOne:(id)a6 withHandler:(id)a7 includeTinker:(BOOL)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  long long v17 = [v14 objectForKey:@"kTMLSLinkMsgKey"];
  int v18 = [v17 intValue];

  v19 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_95D8(v18, v19);
  }
  objc_super v20 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:0];
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2EEC;
  block[3] = &unk_103E0;
  BOOL v29 = a8;
  block[4] = self;
  id v26 = v20;
  BOOL v30 = a4;
  BOOL v31 = a5;
  id v27 = v15;
  id v28 = v16;
  id v22 = v16;
  id v23 = v15;
  id v24 = v20;
  dispatch_async((dispatch_queue_t)idsQueue, block);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  id v9 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_9740(v9, v8);
  }
  uint64_t v10 = [(TMLSTransport *)self workloop];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_32AC;
  v12[3] = &unk_10408;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, v12);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = TIMELINK_FACILITY;
  if (((v15 != 0) ^ v8))
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 1024;
      BOOL v31 = v8;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "TMLSTransport service:%@ account:%@ identifier:%@ didSendWithSuccess:%d error:%@", buf, 0x30u);
    }
  }
  else if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413314;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    __int16 v32 = 2112;
    id v33 = v15;
    _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "TMLSTransport service:%@ account:%@ identifier:%@ didSendWithSuccess:%d error:%@", buf, 0x30u);
  }
  long long v17 = [(TMLSTransport *)self workloop];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_3534;
  v20[3] = &unk_10430;
  v20[4] = self;
  id v21 = v14;
  BOOL v23 = v8;
  id v22 = v15;
  id v18 = v15;
  id v19 = v14;
  dispatch_async(v17, v20);
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
}

- (TMLSTransportDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);

  objc_storeStrong((id *)&self->_clock, 0);
}

@end