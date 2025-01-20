@interface ACXTestFlightInstallQueue
+ (id)sharedInstaller;
- (ACXTestFlightInstallQueue)init;
- (ACXTimedIdentifierList)list;
- (OS_dispatch_queue)internalQueue;
- (void)installWatchApp:(id)a3 targetDevice:(id)a4;
- (void)removePendingInstallForApp:(id)a3;
- (void)removePendingInstallForAppWithBundleID:(id)a3;
@end

@implementation ACXTestFlightInstallQueue

+ (id)sharedInstaller
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000119E8;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A5518 != -1) {
    dispatch_once(&qword_1000A5518, block);
  }
  v2 = (void *)qword_1000A5510;

  return v2;
}

- (ACXTestFlightInstallQueue)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACXTestFlightInstallQueue;
  v2 = [(ACXTestFlightInstallQueue *)&v10 init];
  if (v2)
  {
    v3 = [[ACXTimedIdentifierList alloc] initWithTimeout:30.0];
    list = v2->_list;
    v2->_list = v3;

    v5 = [(ACXTestFlightInstallQueue *)v2 list];
    [v5 setTimeoutHandler:&stru_10008CFB8];

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appconduitd.TestFlightInstallQueue.internal", v6);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)installWatchApp:(id)a3 targetDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACXTestFlightInstallQueue *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011CE8;
  v11[3] = &unk_10008CA40;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (void)removePendingInstallForApp:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  [(ACXTestFlightInstallQueue *)self removePendingInstallForAppWithBundleID:v4];
}

- (void)removePendingInstallForAppWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(ACXTestFlightInstallQueue *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001218C;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (ACXTimedIdentifierList)list
{
  return self->_list;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end