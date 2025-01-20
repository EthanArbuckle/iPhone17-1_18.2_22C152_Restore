@interface CKDAKSLockMonitor
+ (id)monitor;
- (BOOL)locked;
- (BOOL)unlockedSinceBoot;
- (CKDAKSLockMonitor)init;
- (CKDLockListener)listener;
- (OS_dispatch_queue)queue;
- (XPCNotificationDispatcher)dispatcher;
- (id)notificationBlock;
- (void)_onqueueRecheck;
- (void)connectTo:(id)a3;
- (void)handleNotification:(const char *)a3;
- (void)notifyListener;
- (void)recheck;
- (void)setDispatcher:(id)a3;
- (void)setListener:(id)a3;
- (void)setNotificationBlock:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CKDAKSLockMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);

  objc_destroyWeak((id *)&self->_listener);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationBlock:(id)a3
{
}

- (id)notificationBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDispatcher:(id)a3
{
}

- (XPCNotificationDispatcher)dispatcher
{
  return (XPCNotificationDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void)setListener:(id)a3
{
}

- (CKDLockListener)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);

  return (CKDLockListener *)WeakRetained;
}

- (BOOL)locked
{
  return self->_locked;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)_onqueueRecheck
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFTypeRef cf = 0;
  *(_DWORD *)buf = -1431655766;
  int v3 = sub_100004298(0, buf);
  if (sub_10000ED18(v3, &cf, v4, v5, v6, v7, v8, v9, v3))
  {
    BOOL v11 = buf[0] & 1;
  }
  else
  {
    v10 = sub_10000E250("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      CFTypeRef v19 = cf;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Got error querying lock state: %@", buf, 0x16u);
    }

    if (cf) {
      CFRelease(cf);
    }
    BOOL v11 = 1;
  }
  unsigned int v12 = [(CKDAKSLockMonitor *)self locked];
  self->_locked = v11;
  if (![(CKDAKSLockMonitor *)self locked]) {
    self->_unlockedSinceBoot = 1;
  }
  if (v12 != [(CKDAKSLockMonitor *)self locked])
  {
    v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004644;
    block[3] = &unk_100018E08;
    block[4] = self;
    dispatch_async(v13, block);
  }
}

- (void)recheck
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000046C0;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)connectTo:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);

  [(CKDAKSLockMonitor *)self notifyListener];
}

- (void)notifyListener
{
  int v3 = [(CKDAKSLockMonitor *)self listener];
  if (v3)
  {
    id v4 = v3;
    if ([(CKDAKSLockMonitor *)self locked]) {
      [v4 locked];
    }
    else {
      [v4 unlocked];
    }
    int v3 = v4;
  }
}

- (void)handleNotification:(const char *)a3
{
  if (!strcmp(a3, "com.apple.mobile.keybagd.lock_status"))
  {
    [(CKDAKSLockMonitor *)self recheck];
  }
}

- (CKDAKSLockMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKDAKSLockMonitor;
  id v2 = [(CKDAKSLockMonitor *)&v12 init];
  if (v2)
  {
    int v3 = +[XPCNotificationDispatcher dispatcher];
    dispatch_queue_t v4 = dispatch_queue_create("CKDAKSLockMonitor", 0);
    uint64_t v5 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v4;

    *((_WORD *)v2 + 4) = 256;
    int out_token = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    uint64_t v6 = *((void *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004924;
    handler[3] = &unk_1000188D8;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v6, handler);
    [v2 recheck];
    [v3 addListener:v2];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return (CKDAKSLockMonitor *)v2;
}

+ (id)monitor
{
  id v2 = objc_alloc_init(CKDAKSLockMonitor);

  return v2;
}

@end