@interface IAPApplicationStateMonitor
- (BOOL)isAnyAppOpenInForeground;
- (IAPApplicationStateMonitor)init;
- (IAPApplicationStateMonitorDelegate)delegate;
- (NSMutableSet)foregroundAppBundleIDsMutable;
- (NSSet)foregroundAppBundleIDs;
- (OS_dispatch_queue)foregroundBundleIDsQueue;
- (id)applicationInfoForBundleIDSync:(id)a3;
- (id)applicationInfoForPIDSync:(int)a3;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setForegroundAppBundleIDsMutable:(id)a3;
- (void)setForegroundBundleIDsQueue:(id)a3;
- (void)sharedInit;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation IAPApplicationStateMonitor

- (void)sharedInit
{
  v3 = +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:0];
  sharedDisplayLayoutMonitor = self->_sharedDisplayLayoutMonitor;
  self->_sharedDisplayLayoutMonitor = v3;

  id v5 = objc_alloc_init((Class)NSMutableSet);
  [(IAPApplicationStateMonitor *)self setForegroundAppBundleIDsMutable:v5];

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.iap.appStateMonitorQueue", 0);
  [(IAPApplicationStateMonitor *)self setForegroundBundleIDsQueue:v6];

  self->_observingFBSLayoutMonitor = 0;
}

- (IAPApplicationStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)IAPApplicationStateMonitor;
  v2 = [(IAPApplicationStateMonitor *)&v6 init];
  if (v2)
  {
    v3 = (BKSApplicationStateMonitor *)objc_alloc_init((Class)BKSApplicationStateMonitor);
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v3;

    [(IAPApplicationStateMonitor *)v2 sharedInit];
  }
  return v2;
}

- (void)dealloc
{
  if ((((int)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
    appStateMonitor = self->_appStateMonitor;
    self->_appStateMonitor = 0;

    [(IAPApplicationStateMonitor *)self setForegroundAppBundleIDsMutable:0];
    [(IAPApplicationStateMonitor *)self setForegroundBundleIDsQueue:0];
    v4.receiver = self;
    v4.super_class = (Class)IAPApplicationStateMonitor;
    [(IAPApplicationStateMonitor *)&v4 dealloc];
  }
}

- (void)startObserving
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  id v5 = sub_100058754;
  objc_super v6 = &unk_1001255F8;
  objc_copyWeak(&v7, &location);
  if (((unint64_t)&self->_appStateMonitor & 7) != 0
    || ([(BKSApplicationStateMonitor *)self->_appStateMonitor setHandler:&v3],
        self->_observingFBSLayoutMonitor = 1,
        (((int)self + 16) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    -[FBSDisplayLayoutMonitor addObserver:](self->_sharedDisplayLayoutMonitor, "addObserver:", self, v3, v4, v5, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)stopObserving
{
  if ((((int)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
    v3 = [(IAPApplicationStateMonitor *)self foregroundBundleIDsQueue];
    if (v3)
    {
      uint64_t v4 = v3;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100058AC4;
      block[3] = &unk_100125620;
      block[4] = self;
      dispatch_sync(v3, block);

      return;
    }
  }
  __break(0x5510u);
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IAPApplicationStateMonitor *)self foregroundBundleIDsQueue];
  if (v11)
  {
    v12 = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100058C18;
    v14[3] = &unk_100125648;
    v14[4] = self;
    id v15 = v9;
    id v13 = v9;
    dispatch_sync(v12, v14);
  }
  else
  {
    __break(0x5510u);
  }
}

- (id)applicationInfoForBundleIDSync:(id)a3
{
  id result = a3;
  if (((unint64_t)&self->_appStateMonitor & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = result;
    objc_super v6 = [(BKSApplicationStateMonitor *)self->_appStateMonitor applicationInfoForApplication:result];

    return v6;
  }
  return result;
}

- (id)applicationInfoForPIDSync:(int)a3
{
  if (((unint64_t)&self->_appStateMonitor & 7) == 0) {
    return [(BKSApplicationStateMonitor *)self->_appStateMonitor applicationInfoForPID:*(void *)&a3];
  }
  __break(0x5516u);
  return [(IAPApplicationStateMonitor *)self applicationInfoForPID:*(void *)&a3];
}

- (NSSet)foregroundAppBundleIDs
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100058F40;
  id v9 = sub_100058F50;
  id v10 = 0;
  if (((unint64_t)&self[6] & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_7;
  }
  isa = self[6].super.isa;
  if (!isa)
  {
LABEL_7:
    __break(0x5510u);
    return self;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058F58;
  v4[3] = &unk_100125670;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(isa, v4);
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v3;
}

- (IAPApplicationStateMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IAPApplicationStateMonitorDelegate *)a3;
}

- (BOOL)isAnyAppOpenInForeground
{
  unsigned int isAnyAppOpenInForeground = self->_isAnyAppOpenInForeground;
  if (isAnyAppOpenInForeground >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = isAnyAppOpenInForeground != 0;
  }
  return (char)self;
}

- (NSMutableSet)foregroundAppBundleIDsMutable
{
  return self->_foregroundAppBundleIDsMutable;
}

- (void)setForegroundAppBundleIDsMutable:(id)a3
{
}

- (OS_dispatch_queue)foregroundBundleIDsQueue
{
  return self->_foregroundBundleIDsQueue;
}

- (void)setForegroundBundleIDsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundBundleIDsQueue, 0);
  objc_storeStrong((id *)&self->_foregroundAppBundleIDsMutable, 0);
  objc_storeStrong((id *)&self->_sharedDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end