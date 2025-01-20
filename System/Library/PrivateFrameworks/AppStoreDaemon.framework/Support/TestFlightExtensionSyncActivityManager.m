@interface TestFlightExtensionSyncActivityManager
- (TestFlightExtensionSyncActivityManager)init;
- (void)_handleBagChangedNotification:(id)a3;
- (void)dealloc;
- (void)testFlightServiceHost:(id)a3 didUpdateExtensionStatus:(int64_t)a4;
@end

@implementation TestFlightExtensionSyncActivityManager

- (TestFlightExtensionSyncActivityManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)TestFlightExtensionSyncActivityManager;
  v2 = [(TestFlightExtensionSyncActivityManager *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.TestFlightExtensionSyncActivityManager.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = sub_100402D0C((id *)[TestFlightServiceHost alloc], v2->_dispatchQueue);
    serviceHost = v2->_serviceHost;
    v2->_serviceHost = (TestFlightServiceHost *)v6;

    v8 = v2->_serviceHost;
    if (v8) {
      objc_storeWeak((id *)&v8->_delegate, v2);
    }
    v9 = [[_TtC9appstored31TestFlightExtensionSyncActivity alloc] initWithTestFlightServiceHost:v2->_serviceHost];
    syncActivity = v2->_syncActivity;
    v2->_syncActivity = v9;

    v2->_isActivityRegistered = 0;
    v11 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100205C84;
    block[3] = &unk_100521388;
    v12 = v2;
    v16 = v12;
    dispatch_async(v11, block);
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v12 selector:"_handleBagChangedNotification:" name:AMSBagChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TestFlightExtensionSyncActivityManager;
  [(TestFlightExtensionSyncActivityManager *)&v4 dealloc];
}

- (void)testFlightServiceHost:(id)a3 didUpdateExtensionStatus:(int64_t)a4
{
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100206038;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_serviceHost, 0);
  objc_storeStrong((id *)&self->_syncActivity, 0);
}

@end