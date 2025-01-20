@interface CAMOverlayServer
+ (CAMOverlayServer)sharedInstance;
- (BSServiceConnectionListener)_listener;
- (NSHashTable)_registeredObservers;
- (NSMutableDictionary)_connectionsByProcessID;
- (NSSet)allConnections;
- (OS_dispatch_queue)_connectionQueue;
- (id)_init;
- (id)activeConnectionForProcess:(int64_t)a3;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
- (void)set_registeredObservers:(id)a3;
- (void)start;
@end

@implementation CAMOverlayServer

+ (CAMOverlayServer)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006918;
  block[3] = &unk_10001C898;
  block[4] = a1;
  if (qword_100023530 != -1) {
    dispatch_once(&qword_100023530, block);
  }
  v2 = (void *)qword_100023538;

  return (CAMOverlayServer *)v2;
}

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)CAMOverlayServer;
  v2 = [(CAMOverlayServer *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    connectionsByProcessID = v2->__connectionsByProcessID;
    v2->__connectionsByProcessID = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSHashTable hashTableWithOptions:517];
    registeredObservers = v2->__registeredObservers;
    v2->__registeredObservers = (NSHashTable *)v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.camera.overlay-client-connection", v7);
    connectionQueue = v2->__connectionQueue;
    v2->__connectionQueue = (OS_dispatch_queue *)v8;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006A98;
    v14[3] = &unk_10001C8C0;
    v10 = v2;
    v15 = v10;
    uint64_t v11 = +[BSServiceConnectionListener listenerWithConfigurator:v14];
    listener = v10->__listener;
    v10->__listener = (BSServiceConnectionListener *)v11;
  }
  return v2;
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->__listener invalidate];
  listener = self->__listener;
  self->__listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServer;
  [(CAMOverlayServer *)&v4 dealloc];
}

- (void)start
{
  id v2 = [(CAMOverlayServer *)self _listener];
  [v2 activate];
}

- (id)activeConnectionForProcess:(int64_t)a3
{
  objc_super v4 = [(CAMOverlayServer *)self _connectionsByProcessID];
  uint64_t v5 = +[NSNumber numberWithLongLong:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = [v6 bs_firstObjectPassingTest:&stru_10001C900];

  return v7;
}

- (NSSet)allConnections
{
  uint64_t v3 = objc_opt_new();
  objc_super v4 = [(CAMOverlayServer *)self _connectionsByProcessID];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006D30;
  v7[3] = &unk_10001C928;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMOverlayServer *)self _registeredObservers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMOverlayServer *)self _registeredObservers];
  [v5 removeObject:v4];
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(CAMOverlayServer *)self _registeredObservers];
  id v6 = [v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CAMOverlayServiceSpecification identifierKey];
  uint64_t v10 = [v7 decodeStringForKey:v9];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100007124;
  v22[3] = &unk_10001C950;
  id v23 = v10;
  id v11 = v10;
  [v8 configureConnection:v22];
  long long v12 = [CAMOverlayClientConnection alloc];
  long long v13 = [(CAMOverlayServer *)self _connectionQueue];
  long long v14 = [(CAMOverlayClientConnection *)v12 initWithBoardServiceConnection:v8 queue:v13];

  long long v15 = [(CAMOverlayClientConnection *)v14 auditToken];
  id v16 = [v15 versionedPID];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007130;
  v18[3] = &unk_10001C9A0;
  v19 = v14;
  v20 = self;
  id v21 = v16;
  v17 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
}

- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000733C;
  v5[3] = &unk_10001C9C8;
  id v7 = self;
  unint64_t v8 = a4;
  id v6 = a3;
  id v4 = v6;
  [(CAMOverlayServer *)v7 _enumerateObserversWithBlock:v5];
}

- (BSServiceConnectionListener)_listener
{
  return self->__listener;
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (NSMutableDictionary)_connectionsByProcessID
{
  return self->__connectionsByProcessID;
}

- (NSHashTable)_registeredObservers
{
  return self->__registeredObservers;
}

- (void)set_registeredObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredObservers, 0);
  objc_storeStrong((id *)&self->__connectionsByProcessID, 0);
  objc_storeStrong((id *)&self->__connectionQueue, 0);

  objc_storeStrong((id *)&self->__listener, 0);
}

@end