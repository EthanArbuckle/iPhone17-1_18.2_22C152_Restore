@interface DADeviceObserverWatch
- (BOOL)firstResponseSent;
- (DADeviceObserverWatch)init;
- (NSCondition)firstResponseLock;
- (NSMutableDictionary)handlers;
- (NSMutableSet)devices;
- (OS_dispatch_queue)nanoObservationQueue;
- (OS_dispatch_queue)nanoRegistrationQueue;
- (id)_createDeviceWithNanoDevice:(id)a3;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_beginObserving;
- (void)_endObserving;
- (void)_nanoRegistryDevicePaired:(id)a3;
- (void)_nanoRegistryDeviceUnpaired:(id)a3;
- (void)_updateDevicesWithSerialNumber:(id)a3;
- (void)_updateHandlers;
- (void)_waitUntilFirstResponse;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)setDevices:(id)a3;
- (void)setFirstResponseLock:(id)a3;
- (void)setFirstResponseSent:(BOOL)a3;
- (void)setHandlers:(id)a3;
- (void)setNanoObservationQueue:(id)a3;
- (void)setNanoRegistrationQueue:(id)a3;
@end

@implementation DADeviceObserverWatch

- (DADeviceObserverWatch)init
{
  v14.receiver = self;
  v14.super_class = (Class)DADeviceObserverWatch;
  v2 = [(DADeviceObserverWatch *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.nanoObservationQueue", 0);
    nanoObservationQueue = v2->_nanoObservationQueue;
    v2->_nanoObservationQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Diagnostics.nanoRegistrationQueue", 0);
    nanoRegistrationQueue = v2->_nanoRegistrationQueue;
    v2->_nanoRegistrationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    firstResponseLock = v2->_firstResponseLock;
    v2->_firstResponseLock = (NSCondition *)v7;

    *(_WORD *)&v2->_isObserving = 0;
    uint64_t v9 = +[NSMutableSet set];
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v11;
  }
  return v2;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  [(DADeviceObserverWatch *)self _updateDevicesWithSerialNumber:0];
  [(DADeviceObserverWatch *)self _waitUntilFirstResponse];
  id v5 = [(DADeviceObserverWatch *)self devices];
  v4[2](v4, v5);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  v6 = [(DADeviceObserverWatch *)self handlers];
  objc_sync_enter(v6);
  id v7 = [v4 copy];
  id v8 = objc_retainBlock(v7);
  uint64_t v9 = [(DADeviceObserverWatch *)self handlers];
  [v9 setObject:v8 forKeyedSubscript:v5];

  [(DADeviceObserverWatch *)self _beginObserving];
  objc_sync_exit(v6);

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = [(DADeviceObserverWatch *)self handlers];
  objc_sync_enter(v4);
  id v5 = [(DADeviceObserverWatch *)self handlers];
  [v5 removeObjectForKey:v8];

  v6 = [(DADeviceObserverWatch *)self handlers];
  id v7 = [v6 count];

  if (!v7) {
    [(DADeviceObserverWatch *)self _endObserving];
  }
  objc_sync_exit(v4);
}

- (void)_waitUntilFirstResponse
{
  dispatch_queue_t v3 = [(DADeviceObserverWatch *)self firstResponseLock];
  [v3 lock];

  if (![(DADeviceObserverWatch *)self firstResponseSent])
  {
    do
    {
      id v4 = [(DADeviceObserverWatch *)self firstResponseLock];
      [v4 wait];
    }
    while (![(DADeviceObserverWatch *)self firstResponseSent]);
  }
  id v5 = [(DADeviceObserverWatch *)self firstResponseLock];
  [v5 unlock];
}

- (void)_beginObserving
{
  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    dispatch_queue_t v3 = [(DADeviceObserverWatch *)self nanoRegistrationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A7CC;
    block[3] = &unk_1000147C8;
    block[4] = self;
    dispatch_async(v3, block);
  }
  id v4 = dispatch_get_global_queue(21, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A878;
  v5[3] = &unk_1000147C8;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (void)_nanoRegistryDevicePaired:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceObserverWatch *)self nanoObservationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A938;
  v7[3] = &unk_100014708;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_nanoRegistryDeviceUnpaired:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceObserverWatch *)self nanoObservationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AB3C;
  v7[3] = &unk_100014708;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_createDeviceWithNanoDevice:(id)a3
{
  id v3 = a3;
  id v4 = NSClassFromString(@"DADeviceWatchProxy");
  if (v4)
  {
    id v5 = (DADeviceRepresentation *)[[v4 alloc] initWithNanoDevice:v3];
  }
  else
  {
    id v6 = [v3 valueForProperty:NRDevicePropertySerialNumber];
    id v5 = [[DADeviceRepresentation alloc] initWithSerialNumber:v6 isLocal:0 attributes:&__NSDictionary0__struct];
  }
  return v5;
}

- (void)_endObserving
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    id v3 = [(DADeviceObserverWatch *)self firstResponseLock];
    [v3 lock];

    [(DADeviceObserverWatch *)self setFirstResponseSent:0];
    id v4 = [(DADeviceObserverWatch *)self firstResponseLock];
    [v4 unlock];

    id v5 = [(DADeviceObserverWatch *)self nanoRegistrationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AE08;
    block[3] = &unk_1000147C8;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)_updateDevicesWithSerialNumber:(id)a3
{
  id v4 = [(DADeviceObserverWatch *)self nanoObservationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEE8;
  block[3] = &unk_1000147C8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_updateHandlers
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(DADeviceObserverWatch *)self handlers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
        v10 = [(DADeviceObserverWatch *)self handlers];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          v12 = [(DADeviceObserverWatch *)self devices];
          ((void (**)(void, void *))v11)[2](v11, v12);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v13 = [(DADeviceObserverWatch *)self firstResponseLock];
  [v13 lock];

  [(DADeviceObserverWatch *)self setFirstResponseSent:1];
  objc_super v14 = [(DADeviceObserverWatch *)self firstResponseLock];
  [v14 signal];

  v15 = [(DADeviceObserverWatch *)self firstResponseLock];
  [v15 unlock];
}

- (OS_dispatch_queue)nanoObservationQueue
{
  return self->_nanoObservationQueue;
}

- (void)setNanoObservationQueue:(id)a3
{
}

- (OS_dispatch_queue)nanoRegistrationQueue
{
  return self->_nanoRegistrationQueue;
}

- (void)setNanoRegistrationQueue:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSCondition)firstResponseLock
{
  return self->_firstResponseLock;
}

- (void)setFirstResponseLock:(id)a3
{
}

- (BOOL)firstResponseSent
{
  return self->_firstResponseSent;
}

- (void)setFirstResponseSent:(BOOL)a3
{
  self->_firstResponseSent = a3;
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_firstResponseLock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_nanoRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_nanoObservationQueue, 0);
}

@end