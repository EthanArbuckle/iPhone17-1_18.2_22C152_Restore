@interface BadgingCoordinator
- (BadgingCoordinator)init;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation BadgingCoordinator

- (BadgingCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)BadgingCoordinator;
  v2 = [(BadgingCoordinator *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.BadgingCoordinator.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      id v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering the push token for badge pushes", buf, 0xCu);
    }
    v9 = sub_10035E2CC();
    sub_10035E550((uint64_t)v9, v2, 35);
  }
  return v2;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  v6 = (id *)a4;
  v7 = (void (**)(id, void))a5;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    objc_super v11 = sub_100316A18(v6, @"aps");
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Ignoring: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v7[2](v7, 0);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
}

@end