@interface WKUserNotificationInterfaceController
- (WKUserNotificationInterfaceController)init;
- (void)_didReceiveNotification:(id)a3 remoteNotification:(id)a4 localNotification:(id)a5 withCompletion:(id)a6;
- (void)didReceiveLocalNotification:(id)a3 withCompletion:(id)a4;
- (void)didReceiveNotification:(id)a3 withCompletion:(id)a4;
- (void)didReceiveRemoteNotification:(id)a3 withCompletion:(id)a4;
@end

@implementation WKUserNotificationInterfaceController

- (WKUserNotificationInterfaceController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WKUserNotificationInterfaceController;
  return [(WKInterfaceController *)&v3 init];
}

- (void)_didReceiveNotification:(id)a3 remoteNotification:(id)a4 localNotification:(id)a5 withCompletion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_class();
  if (spUtils_subclassForObjectOverridesSelectorFromSuperclass(self, (uint64_t)sel_didReceiveNotification_withCompletion_, v13))
  {
    [(WKUserNotificationInterfaceController *)self didReceiveNotification:v16 withCompletion:v12];
  }
  else if (v11)
  {
    [(WKUserNotificationInterfaceController *)self didReceiveLocalNotification:v11 withCompletion:v12];
  }
  else
  {
    if (v10)
    {
      v14 = self;
      id v15 = v10;
    }
    else
    {
      id v15 = (id)MEMORY[0x263EFFA78];
      v14 = self;
    }
    [(WKUserNotificationInterfaceController *)v14 didReceiveRemoteNotification:v15 withCompletion:v12];
  }
}

- (void)didReceiveNotification:(id)a3 withCompletion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a4;
  v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveNotification:withCompletion:]";
    __int16 v8 = 1024;
    int v9 = 809;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

- (void)didReceiveRemoteNotification:(id)a3 withCompletion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a4;
  v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveRemoteNotification:withCompletion:]";
    __int16 v8 = 1024;
    int v9 = 817;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

- (void)didReceiveLocalNotification:(id)a3 withCompletion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a4;
  v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveLocalNotification:withCompletion:]";
    __int16 v8 = 1024;
    int v9 = 825;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

@end