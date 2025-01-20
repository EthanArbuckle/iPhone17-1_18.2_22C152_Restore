@interface IAPClientPort
- (IAPClientPort)initWithUUID:(id)a3 queue:(id)a4 sendHandler:(id)a5;
- (NSString)uuid;
- (OS_dispatch_queue)clientPortEventQueue;
- (OS_dispatch_queue)sendDataHandlerQueue;
- (id)sendDataHandler;
- (void)dealloc;
- (void)setSendDataHandler:(id)a3;
@end

@implementation IAPClientPort

- (IAPClientPort)initWithUUID:(id)a3 queue:(id)a4 sendHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)IAPClientPort;
  v8 = [(IAPClientPort *)&v13 init];
  v9 = v8;
  if (v8)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v10;
    long long v29 = v10;
    long long v26 = v10;
    long long v27 = v10;
    long long v24 = v10;
    long long v25 = v10;
    long long v22 = v10;
    long long v23 = v10;
    long long v20 = v10;
    long long v21 = v10;
    long long v18 = v10;
    long long v19 = v10;
    long long v16 = v10;
    long long v17 = v10;
    *(_OWORD *)__str = v10;
    long long v15 = v10;
    v8->_uuid = (NSString *)a3;
    id v11 = a3;
    v9->_sendDataHandlerQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    v9->_sendDataHandler = _Block_copy(a5);
    snprintf(__str, 0x100uLL, "com.apple.IAPClientPort.%s.event_queue", (const char *)[a3 UTF8String]);
    v9->_clientPortEventQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, 0);
  }
  return v9;
}

- (void)dealloc
{
  dispatch_sync((dispatch_queue_t)self->_clientPortEventQueue, &__block_literal_global_3);
  dispatch_release((dispatch_object_t)self->_clientPortEventQueue);
  dispatch_release((dispatch_object_t)self->_sendDataHandlerQueue);
  _Block_release(self->_sendDataHandler);

  v3.receiver = self;
  v3.super_class = (Class)IAPClientPort;
  [(IAPClientPort *)&v3 dealloc];
}

- (NSString)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)sendDataHandlerQueue
{
  return self->_sendDataHandlerQueue;
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
  self->_sendDataHandler = a3;
}

- (OS_dispatch_queue)clientPortEventQueue
{
  return self->_clientPortEventQueue;
}

@end