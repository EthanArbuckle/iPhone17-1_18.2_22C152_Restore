@interface AppInstallScheduler
- (AppInstallScheduler)init;
- (void)_didDeleteEntityNotification:(id)a3;
- (void)_handleDeviceStateDidChangeNotification:(id)a3;
- (void)_handlePolicyNotificationWithMonitorStateDidChangeNotification:(id)a3;
@end

@implementation AppInstallScheduler

- (AppInstallScheduler)init
{
  v3 = sub_1003E0BA4();
  id v4 = v3;
  if (self)
  {
    v18.receiver = self;
    v18.super_class = (Class)AppInstallScheduler;
    self = [(AppInstallScheduler *)&v18 init];
    if (self)
    {
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.AppInstallScheduler", v5);
      dispatchQueue = self->_dispatchQueue;
      self->_dispatchQueue = v6;

      objc_storeStrong((id *)&self->_databaseStore, v3);
      v8 = objc_alloc_init(TaskQueue);
      bootstrapQueue = self->_bootstrapQueue;
      self->_bootstrapQueue = v8;

      v10 = self->_bootstrapQueue;
      if (v10) {
        [(NSOperationQueue *)v10->_operationQueue setName:@"com.apple.appstored.TaskQueue.bootstrapQueue"];
      }
      v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      retryCount = self->_retryCount;
      self->_retryCount = v11;

      v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:self selector:"_didDeleteEntityNotification:" name:@"SQLiteDidDeleteEntityNotification" object:0];

      v14 = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002ED4A8;
      block[3] = &unk_100521388;
      self = self;
      v17 = self;
      dispatch_async(v14, block);
    }
  }

  return self;
}

- (void)_handleDeviceStateDidChangeNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002EF624;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_didDeleteEntityNotification:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"SQLiteUserInfoKeyPersistentID"];

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002EF978;
    v7[3] = &unk_1005218C0;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_handlePolicyNotificationWithMonitorStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002EFA20;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_bootstrapQueue, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_pollTimerLimit, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_flapRetryTimer, 0);
  objc_storeStrong((id *)&self->_flapRetryDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end