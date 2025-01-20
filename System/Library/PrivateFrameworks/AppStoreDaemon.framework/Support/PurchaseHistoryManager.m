@interface PurchaseHistoryManager
- (PurchaseHistoryManager)init;
- (void)_handleAccountChangedNotification;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PurchaseHistoryManager

- (PurchaseHistoryManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)PurchaseHistoryManager;
  v2 = [(PurchaseHistoryManager *)&v25 init];
  if (v2)
  {
    v3 = [PurchaseHistoryDatabaseStore alloc];
    uint64_t v4 = sub_1001F5660();
    v5 = sub_1001F5824((os_unfair_lock_s *)v4);
    v6 = [(SQLiteDatabaseStore *)v3 initWithDatabase:v5];
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AppStoreFoundation.PurchaseHistoryManager", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = sub_10030B11C();
    bag = v2->_bag;
    v2->_bag = (URLBag *)v11;

    v13 = sub_1003DA6D4();
    LOBYTE(v4) = [v13 isHRNMode];

    if ((v4 & 1) == 0)
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_opt_class();
        id v16 = v15;
        v17 = +[ActiveAccountObserver activeAccount];
        v18 = [v17 hashedDescription];
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        __int16 v28 = 2114;
        v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Begin observing, current account: %{public}@", buf, 0x16u);
      }
      v19 = +[NSNotificationCenter defaultCenter];
      v20 = +[ActiveAccountObserver sharedInstance];
      [v19 addObserver:v2 selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v20];

      v21 = sub_10035E2CC();
      sub_10035E550((uint64_t)v21, v2, 1);
    }
    v2->_commandRunning = 0;
    uint64_t v22 = objc_opt_new();
    commandStack = v2->_commandStack;
    v2->_commandStack = (NSMutableArray *)v22;
  }
  return v2;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10024C7C8;
  v12[3] = &unk_100521DE0;
  v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  sub_100010948(dispatchQueue, v12);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10024CD00;
  v9[3] = &unk_100521AE0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  sub_100010948(dispatchQueue, v9);
}

- (void)_handleAccountChangedNotification
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@]: Updating after account changed", buf, 0xCu);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024D0F4;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_commandStack, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end