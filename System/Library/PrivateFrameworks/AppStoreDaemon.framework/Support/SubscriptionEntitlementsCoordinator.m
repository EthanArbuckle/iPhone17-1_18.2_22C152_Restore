@interface SubscriptionEntitlementsCoordinator
+ (id)sharedInstance;
- (SubscriptionEntitlementsCoordinator)init;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setCachedSubscriptionEntitlements:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5;
@end

@implementation SubscriptionEntitlementsCoordinator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320FC4;
  block[3] = &unk_100521BF0;
  block[4] = a1;
  if (qword_1005B0F58 != -1) {
    dispatch_once(&qword_1005B0F58, block);
  }
  v2 = (void *)qword_1005B0F50;
  return v2;
}

- (SubscriptionEntitlementsCoordinator)init
{
  v16.receiver = self;
  v16.super_class = (Class)SubscriptionEntitlementsCoordinator;
  v2 = [(SubscriptionEntitlementsCoordinator *)&v16 init];
  if (v2)
  {
    uint64_t v3 = sub_1002D97AC("com.apple.appstored.SubscriptionEntitlementsCoordinator.network", QOS_CLASS_DEFAULT);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = sub_1002D97AC("com.apple.appstored.SubscriptionEntitlementsCoordinator", QOS_CLASS_DEFAULT);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    completionHandlersBySegment = v2->_completionHandlersBySegment;
    v2->_completionHandlersBySegment = v7;

    v9 = +[NSNotificationCenter defaultCenter];
    v10 = +[ActiveAccountObserver sharedInstance];
    [v9 addObserver:v2 selector:"_handleAccountStoreDidChangeNotification:" name:@"AccountStorePrimaryAccountDidChange" object:v10];

    v11 = sub_10035E2CC();
    sub_10035E550((uint64_t)v11, v2, 17);

    v12 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100321190;
    block[3] = &unk_100521388;
    v15 = v2;
    dispatch_async(v12, block);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[ActiveAccountObserver sharedInstance];
  [v3 removeObserver:self name:@"AccountStorePrimaryAccountDidChange" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)SubscriptionEntitlementsCoordinator;
  [(SubscriptionEntitlementsCoordinator *)&v5 dealloc];
}

- (void)setCachedSubscriptionEntitlements:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100321FDC;
  v13[3] = &unk_100528338;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  v7 = (void **)a4;
  v30 = (void (**)(id, void))a5;
  id v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v31 = v7;
  if (self->_lastAccountID
    && (sub_10031695C(v7),
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isEqualToNumber:self->_lastAccountID],
        v9,
        v10))
  {
    id v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Clearing cached subscription entitlements after push notification", buf, 0xCu);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = [&off_10054DF68 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(&off_10054DF68);
          }
          id v16 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * (void)v15), "unsignedIntegerValue", v30, v31);
          sub_100013CBC(self, (unint64_t)v16, v8);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          dispatchQueue = self->_dispatchQueue;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100321DF0;
          v38 = &unk_100525408;
          v39 = self;
          id v41 = v16;
          id v19 = v17;
          id v40 = v19;
          dispatch_sync(dispatchQueue, buf);

          v20 = objc_alloc_init(SubscriptionRequestInfo);
          v22 = v20;
          if (v20)
          {
            objc_setProperty_atomic(v20, v21, v19, 16);
            v22->_segment = (unint64_t)v16;
          }
          v23 = sub_100416894((uint64_t)XPCRequestToken, 1);
          v25 = v23;
          if (v22)
          {
            objc_setProperty_atomic(v22, v24, v23, 32);

            v22->_ignoreCaches = 0;
            *(_WORD *)&v22->_notifyExternal = 257;
          }
          else
          {
          }
          sub_100008278((uint64_t)self, v22, &stru_1005283C8);

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v26 = [&off_10054DF68 countByEnumeratingWithState:&v32 objects:v36 count:16];
        id v13 = v26;
      }
      while (v26);
    }
  }
  else
  {
    v27 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      lastAccountID = self->_lastAccountID;
      v29 = sub_10031695C(v7);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = lastAccountID;
      *(_WORD *)&buf[22] = 2114;
      v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] Not clearing cached subscription entitlements after push notification. lastAccountID: %{public}@ messageAccountID: %{public}@", buf, 0x20u);
    }
  }
  v30[2](v30, 0);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  v4 = objc_alloc_init(_TtC9appstored6LogKey);
  objc_super v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Updating after account changed", buf, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100323E6C;
  v8[3] = &unk_1005218C0;
  id v9 = v4;
  unsigned int v10 = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlersBySegment, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_hwBundleEntitlementsData, 0);
  objc_storeStrong((id *)&self->_podcastEntitlementsData, 0);
  objc_storeStrong((id *)&self->_iCloudEntitlementsData, 0);
  objc_storeStrong((id *)&self->_tvEntitlementsData, 0);
  objc_storeStrong((id *)&self->_musicEntitlementsData, 0);
  objc_storeStrong((id *)&self->_activityEntitlementsData, 0);
  objc_storeStrong((id *)&self->_appStoreEntitlementsData, 0);
  objc_storeStrong((id *)&self->_newsEntitlementsData, 0);
  objc_storeStrong((id *)&self->_lastAccountID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end