@interface NDSpringBoard
+ (id)sharedSpringBoard;
- (BOOL)applicationIsForeground:(id)a3;
- (BOOL)identifierIsForSpringBoardApplication:(id)a3;
- (NDSpringBoard)init;
- (unsigned)applicationStateForBundleID:(id)a3;
- (void)addObserver:(id)a3 forApplication:(id)a4;
- (void)handleApplicationStateChange:(id)a3;
- (void)removeObserver:(id)a3 forApplication:(id)a4;
- (void)setupMonitor;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
@end

@implementation NDSpringBoard

+ (id)sharedSpringBoard
{
  if (qword_100016478 != -1) {
    dispatch_once(&qword_100016478, &stru_1000107D0);
  }
  v2 = (void *)qword_100016480;
  return v2;
}

- (NDSpringBoard)init
{
  v15.receiver = self;
  v15.super_class = (Class)NDSpringBoard;
  v2 = [(NDSpringBoard *)&v15 init];
  if (v2)
  {
    v3 = (BKSApplicationStateMonitor *)objc_alloc_init((Class)BKSApplicationStateMonitor);
    monitor = v2->_monitor;
    v2->_monitor = v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    appStates = v2->_appStates;
    v2->_appStates = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableSet set];
    monitoredBundleIDs = v2->_monitoredBundleIDs;
    v2->_monitoredBundleIDs = (NSMutableSet *)v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.nsnetwork.SpringBoard-queue", v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (void)setupMonitor
{
  monitor = self->_monitor;
  v4 = [(NSMutableSet *)self->_monitoredBundleIDs allObjects];
  [(BKSApplicationStateMonitor *)monitor updateInterestedBundleIDs:v4];

  uint64_t v5 = self->_monitor;
  [(BKSApplicationStateMonitor *)v5 setHandler:&stru_100010810];
}

- (void)handleApplicationStateChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000098E0;
  v7[3] = &unk_100010838;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D4C;
  block[3] = &unk_100010860;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009EB0;
  block[3] = &unk_100010860;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009FA0;
  v7[3] = &unk_100010838;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A100;
  v7[3] = &unk_100010838;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unsigned)applicationStateForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A244;
  block[3] = &unk_100010888;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return queue;
}

- (BOOL)applicationIsForeground:(id)a3
{
  return [(NDSpringBoard *)self applicationStateForBundleID:a3] == 8;
}

- (BOOL)identifierIsForSpringBoardApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v5 = [v4 applicationIsInstalled:v3];

  if (v5)
  {
    uint64_t v9 = 0;
    unsigned __int8 v6 = 1;
    id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
    if ([v7 isPlaceholder]) {
      unsigned __int8 v6 = [v7 isUpdate];
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_appStates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end