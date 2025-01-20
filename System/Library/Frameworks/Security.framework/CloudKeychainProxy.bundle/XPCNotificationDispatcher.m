@interface XPCNotificationDispatcher
+ (id)dispatcher;
- (NSPointerArray)listeners;
- (OS_dispatch_queue)queue;
- (XPCNotificationDispatcher)init;
- (void)addListener:(id)a3;
- (void)notification:(const char *)a3;
- (void)removeListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation XPCNotificationDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setListeners:(id)a3
{
}

- (NSPointerArray)listeners
{
  return (NSPointerArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  v5 = [(XPCNotificationDispatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004AB4;
  v7[3] = &unk_100018E58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  v5 = [(XPCNotificationDispatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004BBC;
  v7[3] = &unk_100018E58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)notification:(const char *)a3
{
  v5 = [(XPCNotificationDispatcher *)self listeners];
  [v5 compact];

  id v6 = [(XPCNotificationDispatcher *)self listeners];
  v7 = [v6 allObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004CE4;
  v8[3] = &unk_100018940;
  v8[4] = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (XPCNotificationDispatcher)init
{
  v10.receiver = self;
  v10.super_class = (Class)XPCNotificationDispatcher;
  v2 = [(XPCNotificationDispatcher *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("XPC Notification Dispatch", 0);
    [(XPCNotificationDispatcher *)v2 setQueue:v3];

    id v4 = +[NSPointerArray weakObjectsPointerArray];
    [(XPCNotificationDispatcher *)v2 setListeners:v4];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v5 = [(XPCNotificationDispatcher *)v2 queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004E50;
    v7[3] = &unk_100018920;
    objc_copyWeak(&v8, &location);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)dispatcher
{
  if (qword_10001E1E8 != -1) {
    dispatch_once(&qword_10001E1E8, &stru_1000188F8);
  }
  v2 = (void *)qword_10001E1F0;

  return v2;
}

@end