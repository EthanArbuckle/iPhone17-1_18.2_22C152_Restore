@interface NMSMessageCenter
- (IDSDevice)connectedDevice;
- (IDSService)idsService;
- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3;
- (NMSMessageCenterDelegate)delegate;
- (NSString)description;
- (OS_dispatch_queue)actionQ;
- (OS_dispatch_queue)queue;
- (double)timeSinceLastDataReceived;
- (id)_findPendingRequestByIdentifier:(id)a3;
- (id)_pbMappingForMessageID:(unsigned __int16)a3;
- (id)_queue;
- (void)_checkConnectedDevice;
- (void)_handleError:(id)a3 forRequest:(id)a4;
- (void)_handleError:(id)a3 forResponse:(id)a4;
- (void)_invalidateOutgoingRequest:(id)a3;
- (void)_notifyDidChangeConnectedState;
- (void)_sendResponse:(id)a3;
- (void)_setConnectedDevice:(id)a3;
- (void)addTarget:(id)a3 action:(SEL)a4 forMessageID:(unsigned __int16)a5;
- (void)dropExtantMessages;
- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5;
- (void)resume;
- (void)sendRequest:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NMSMessageCenter

- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NMSMessageCenter;
  v5 = [(NMSMessageCenter *)&v20 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = v6;

    id v8 = +[NSString stringWithFormat:@"NMSQ.%@", v5->_serviceIdentifier];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestHandlers = v5->_requestHandlers;
    v5->_requestHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingRequests = v5->_pendingRequests;
    v5->_pendingRequests = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingResponses = v5->_pendingResponses;
    v5->_pendingResponses = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pbMapping = v5->_pbMapping;
    v5->_pbMapping = v17;
  }
  return v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@:%p identifier:%@>", v4, self, self->_serviceIdentifier];

  return (NSString *)v5;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forMessageID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v14 = a3;
  if (self->_service)
  {
    dispatch_queue_t v9 = NSStringFromSelector(a2);
    +[NSException raise:@"NMSMisuseException", @"Cannot use %@ after using -resume", v9 format];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = NSStringFromSelector(a4);
    +[NSException raise:@"NMSMisuseException", @"Target must respond to selector %@", v10 format];
  }
  v11 = objc_alloc_init(NMSRequestHandler);
  [(NMSRequestHandler *)v11 setTarget:v14];
  [(NMSRequestHandler *)v11 setAction:a4];
  requestHandlers = self->_requestHandlers;
  v13 = +[NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)requestHandlers setObject:v11 forKeyedSubscript:v13];
}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v11 = objc_alloc_init(NMSPBMapping);
  [(NMSPBMapping *)v11 setRequestClass:a3];
  [(NMSPBMapping *)v11 setResponseClass:a4];
  pbMapping = self->_pbMapping;
  v10 = +[NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)pbMapping setObject:v11 forKeyedSubscript:v10];
}

- (id)_pbMappingForMessageID:(unsigned __int16)a3
{
  pbMapping = self->_pbMapping;
  id v4 = +[NSNumber numberWithUnsignedShort:a3];
  uint64_t v5 = [(NSMutableDictionary *)pbMapping objectForKeyedSubscript:v4];

  return v5;
}

- (void)resume
{
  if (self->_service)
  {
    v3 = NSStringFromSelector(a2);
    +[NSException raise:@"NMSMisuseException", @"Cannot use %@ after using -resume", v3 format];
  }
  id v4 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:self->_serviceIdentifier];
  service = self->_service;
  self->_service = v4;

  [(IDSService *)self->_service addDelegate:self queue:self->_queue];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CBB8;
  block[3] = &unk_1000308D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (IDSService)idsService
{
  return self->_service;
}

- (OS_dispatch_queue)actionQ
{
  return self->_queue;
}

- (void)_checkConnectedDevice
{
  v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[NMSMessageCenter _checkConnectedDevice]";
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/Shared/NanoMessagingService.m";
    __int16 v20 = 1024;
    int v21 = 195;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(IDSService *)self->_service devices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice])
        {
          if ([v9 isConnected]) {
            v10 = v9;
          }
          else {
            v10 = 0;
          }
          [(NMSMessageCenter *)self _setConnectedDevice:v10];
          goto LABEL_16;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)_setConnectedDevice:(id)a3
{
  id v5 = (IDSDevice *)a3;
  id v6 = sub_10001C470();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    dispatch_queue_t v9 = "-[NMSMessageCenter _setConnectedDevice:]";
    __int16 v10 = 2080;
    long long v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/Shared/NanoMessagingService.m";
    __int16 v12 = 1024;
    int v13 = 208;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  if (self->_connectedDevice != v5)
  {
    uint64_t v7 = sub_10001C470();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      dispatch_queue_t v9 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connected device changed to: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)&self->_connectedDevice, a3);
    [(NMSMessageCenter *)self _notifyDidChangeConnectedState];
  }
}

- (void)_notifyDidChangeConnectedState
{
  v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[NMSMessageCenter _notifyDidChangeConnectedState]";
    __int16 v9 = 2080;
    __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/Shared/NanoMessagingService.m";
    __int16 v11 = 1024;
    int v12 = 220;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 messageCenter:self didChangeConnectedState:self->_connectedDevice != 0];
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  char v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "-[NMSMessageCenter service:connectedDevicesChanged:]";
    __int16 v8 = 2080;
    __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/Shared/NanoMessagingService.m";
    __int16 v10 = 1024;
    int v11 = 231;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  [(NMSMessageCenter *)self _checkConnectedDevice];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  char v5 = sub_10001C470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    int v7 = "-[NMSMessageCenter service:devicesChanged:]";
    __int16 v8 = 2080;
    __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/Shared/NanoMessagingService.m";
    __int16 v10 = 1024;
    int v11 = 238;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  [(NMSMessageCenter *)self _checkConnectedDevice];
}

- (void)sendRequest:(id)a3
{
  id v5 = a3;
  if (!self->_service)
  {
    int v6 = NSStringFromSelector(a2);
    +[NSException raise:@"NMSMisuseException", @"Cannot use %@ after until -resume is used", v6 format];
  }
  int v7 = [v5 idsIdentifier];

  if (v7) {
    +[NSException raise:@"NMSMisuseException" format:@"You cannot call sendRequest twice for the same request object"];
  }
  __int16 v8 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D33C;
  block[3] = &unk_100030D88;
  id v13 = v5;
  long long v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v5;
  dispatch_async(queue, block);
}

- (void)_sendResponse:(id)a3
{
  id v5 = a3;
  if (!self->_service)
  {
    int v6 = NSStringFromSelector(a2);
    +[NSException raise:@"NMSMisuseException", @"Cannot use %@ after until -resume is used", v6 format];
  }
  int v7 = [v5 request];
  __int16 v8 = [v7 idsIdentifier];

  if (!v8) {
    +[NSException raise:@"NMSMisuseException" format:@"Response's request needs an idsIdentifier"];
  }
  if ([v5 isSent]) {
    +[NSException raise:@"NMSMisuseException" format:@"You cannot call send twice for the same response object"];
  }
  [v5 setSent:1];
  __int16 v9 = [v5 request];
  id v10 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D910;
  block[3] = &unk_100030DB0;
  id v16 = v5;
  id v17 = v9;
  __int16 v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v5;
  dispatch_async(queue, block);
}

- (void)_handleError:(id)a3 forRequest:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v6 invalidateReplyTimer];
  int v7 = [v6 idsIdentifier];

  if (v7)
  {
    pendingRequests = self->_pendingRequests;
    __int16 v9 = [v6 idsIdentifier];
    [(NSMutableDictionary *)pendingRequests removeObjectForKey:v9];
  }
  id v10 = [v6 errorHandler];

  if (v10)
  {
    id v11 = [v6 errorHandler];
    ((void (**)(void, id))v11)[2](v11, v12);
  }
}

- (void)_handleError:(id)a3 forResponse:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [v6 idsIdentifier];

  if (v7)
  {
    pendingResponses = self->_pendingResponses;
    __int16 v9 = [v6 idsIdentifier];
    [(NSMutableDictionary *)pendingResponses removeObjectForKey:v9];
  }
  id v10 = [v6 errorHandler];

  if (v10)
  {
    id v11 = [v6 errorHandler];
    ((void (**)(void, id))v11)[2](v11, v12);
  }
}

- (id)_findPendingRequestByIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(NSMutableDictionary *)self->_pendingRequests objectForKey:v5];

  return v6;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v24 = a5;
  id v10 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v24];
  id v12 = v11;
  if (v11)
  {
    if (a6)
    {
      id v13 = [v11 didSendHandler];

      if (v13)
      {
        id v14 = [v12 didSendHandler];
        v14[2]();
      }
      id v15 = [v12 responseHandler];

      if (v15)
      {
        id v15 = 0;
        goto LABEL_21;
      }
      pendingRequests = self->_pendingRequests;
LABEL_20:
      [(NSMutableDictionary *)pendingRequests removeObjectForKey:v24];
      goto LABEL_21;
    }
    id v15 = 0;
  }
  else
  {
    id v16 = [(NSMutableDictionary *)self->_pendingResponses objectForKeyedSubscript:v24];
    id v15 = v16;
    if (a6)
    {
      id v17 = [v16 response];

      if (!v17) {
        goto LABEL_21;
      }
      __int16 v18 = [v15 response];
      id v19 = [v18 didSendHandler];

      if (v19)
      {
        __int16 v20 = [v15 response];
        int v21 = [v20 didSendHandler];
        v21[2]();
      }
      pendingRequests = self->_pendingResponses;
      goto LABEL_20;
    }
  }
  if (v10)
  {
    if (v12)
    {
LABEL_15:
      [(NMSMessageCenter *)self _handleError:v10 forRequest:v12];
      goto LABEL_21;
    }
  }
  else
  {
    id v10 = +[NSError errorWithDomain:@"NMSErrorDomain" code:3 userInfo:0];
    if (v12) {
      goto LABEL_15;
    }
  }
  if (v15)
  {
    v23 = [v15 response];
    [(NMSMessageCenter *)self _handleError:v10 forResponse:v23];
  }
LABEL_21:
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  queue = self->_queue;
  id v13 = (IDSService *)a3;
  dispatch_assert_queue_V2(queue);
  service = self->_service;

  if (service == v13)
  {
    self->_lastDataReceived = sub_10001E5AC();
    id v15 = [v11 incomingResponseIdentifier];

    id v16 = [v10 length];
    if (v15)
    {
      if ((unint64_t)v16 >= 2)
      {
        id v17 = v10;
        uint64_t v18 = *(unsigned __int16 *)[v17 bytes];
        objc_msgSend(v17, "subdataWithRange:", 2, (char *)objc_msgSend(v17, "length") - 2);
        id v19 = (NMSIncomingRequest *)objc_claimAutoreleasedReturnValue();
        __int16 v20 = [v11 incomingResponseIdentifier];
        int v21 = [(NMSMessageCenter *)self _findPendingRequestByIdentifier:v20];

        v22 = sub_10001C470();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v17 length];
          id v24 = [v11 incomingResponseIdentifier];
          int v48 = 67109634;
          int v49 = v18;
          __int16 v50 = 2048;
          id v51 = v23;
          __int16 v52 = 2112;
          v53 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received incoming response ID %hu of size %tu with incomingResponseIdentifer %@", (uint8_t *)&v48, 0x1Cu);
        }
        if (v21)
        {
          v25 = [v21 responseHandler];
          pendingRequests = self->_pendingRequests;
          v27 = [v11 incomingResponseIdentifier];
          [(NSMutableDictionary *)pendingRequests removeObjectForKey:v27];

          [v21 invalidateReplyTimer];
          v28 = [v21 responseHandler];

          if (v28) {
            ((void (*)(NMSUnpairedResponse *, NMSIncomingRequest *))v25->_messageCenter)(v25, v19);
          }
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          char v42 = objc_opt_respondsToSelector();

          if ((v42 & 1) == 0)
          {
LABEL_17:

            goto LABEL_18;
          }
          v25 = objc_alloc_init(NMSUnpairedResponse);
          [(NMSUnpairedResponse *)v25 setMessageCenter:self];
          [(NMSUnpairedResponse *)v25 setData:v19];
          [(NMSUnpairedResponse *)v25 setMessageID:v18];
          v43 = [v11 incomingResponseIdentifier];
          [(NMSUnpairedResponse *)v25 setIdsIdentifier:v43];

          id v44 = objc_loadWeakRetained((id *)&self->_delegate);
          [v44 messageCenter:self didReceiveUnpairedResponse:v25];
        }
        goto LABEL_17;
      }
    }
    else if ((unint64_t)v16 >= 3)
    {
      id v29 = v10;
      v30 = (unsigned __int16 *)[v29 bytes];
      uint64_t v31 = *v30;
      uint64_t v32 = *((unsigned __int8 *)v30 + 2);
      id v19 = objc_alloc_init(NMSIncomingRequest);
      [(NMSIncomingRequest *)v19 setMessageCenter:self];
      [(NMSIncomingRequest *)v19 setMessageID:v31];
      v33 = [v11 outgoingResponseIdentifier];
      [(NMSIncomingRequest *)v19 setIdsIdentifier:v33];

      [(NMSIncomingRequest *)v19 setPriority:v32];
      -[NMSIncomingRequest setExpectsResponse:](v19, "setExpectsResponse:", [v11 expectsPeerResponse]);
      v34 = objc_msgSend(v29, "subdataWithRange:", 3, (char *)objc_msgSend(v29, "length") - 3);
      [(NMSIncomingRequest *)v19 setData:v34];

      [(NMSIncomingRequest *)v19 configureResponse];
      v35 = sub_10001C470();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [v29 length];
        v37 = [(NMSIncomingRequest *)v19 idsIdentifier];
        int v48 = 67109634;
        int v49 = v31;
        __int16 v50 = 2048;
        id v51 = v36;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Received incoming request ID %hu of size %tu with outgoingResponseIdentifier %@", (uint8_t *)&v48, 0x1Cu);
      }
      requestHandlers = self->_requestHandlers;
      v39 = +[NSNumber numberWithUnsignedShort:v31];
      int v21 = [(NSMutableDictionary *)requestHandlers objectForKeyedSubscript:v39];

      if (v21)
      {
        v40 = [v21 target];
        objc_msgSend(v40, "performSelector:withObject:", objc_msgSend(v21, "action"), v19);
      }
      else
      {
        id v45 = objc_loadWeakRetained((id *)&self->_delegate);
        char v46 = objc_opt_respondsToSelector();

        if (v46)
        {
          id v47 = objc_loadWeakRetained((id *)&self->_delegate);
          [v47 messageCenter:self didReceiveUnknownRequest:v19];
        }
        else
        {
          [(NMSIncomingRequest *)v19 setExpectsResponse:0];
        }
      }
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)_invalidateOutgoingRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E694;
  v7[3] = &unk_1000305C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_queue
{
  return self->_queue;
}

- (double)timeSinceLastDataReceived
{
  return sub_10001E5AC() - self->_lastDataReceived;
}

- (void)dropExtantMessages
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E794;
  block[3] = &unk_1000308D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (NMSMessageCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NMSMessageCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSDevice)connectedDevice
{
  return self->_connectedDevice;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectedDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end