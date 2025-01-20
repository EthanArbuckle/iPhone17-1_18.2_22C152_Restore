@interface TestFlightFeedbackManager
- (TestFlightFeedbackManager)init;
- (void)_handleNetworkStateDidChangeNotification:(id)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation TestFlightFeedbackManager

- (TestFlightFeedbackManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)TestFlightFeedbackManager;
  v2 = [(TestFlightFeedbackManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activeTaskPIDs = v2->_activeTaskPIDs;
    v2->_activeTaskPIDs = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    activeTaskPIDsLock = v2->_activeTaskPIDsLock;
    v2->_activeTaskPIDsLock = (NSLock *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.TestFlightManager.callout", v7);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = [TestFlightFeedbackDatabaseStore alloc];
    sub_1001F5660();
    v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v12 = sub_1001F5734(v11);
    v13 = [(SQLiteDatabaseStore *)v10 initWithDatabase:v12];
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.appstored.TestFlightManager.dispatch", v15);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v16;
  }
  return v2;
}

- (void)_handleNetworkStateDidChangeNotification:(id)a3
{
  v4 = sub_100259614();
  unsigned int v5 = [v4 isConnected];

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100276694;
    block[3] = &unk_100521388;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100277970;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_activeTaskPIDsLock, 0);
  objc_storeStrong((id *)&self->_activeTaskPIDs, 0);
}

@end