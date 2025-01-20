@interface GCNotificationManager
+ (id)sharedInstance;
- (GCNotificationManager)init;
- (void)requestNotification:(id)a3 withReply:(id)a4;
- (void)requestNotificationImpl:(id)a3 withReply:(id)a4;
@end

@implementation GCNotificationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sharedManager_0;

  return v2;
}

void __39__GCNotificationManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedManager_0;
  sharedInstance_sharedManager_0 = v0;
}

- (GCNotificationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)GCNotificationManager;
  v2 = [(GCNotificationManager *)&v7 init];
  if (v2)
  {
    int IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
    if (IsGameControllerDaemon)
    {
      uint64_t v4 = [objc_alloc((Class)&off_26D2CC188) initWithBundleIdentifier:@"com.apple.GameControllerNotifications"];
    }
    else
    {
      uint64_t v4 = +[UNUserNotificationCenter currentNotificationCenter];
    }
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v4;

    v2->_isPermissionGranted = IsGameControllerDaemon;
  }
  return v2;
}

- (void)requestNotificationImpl:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  if (self->_isPermissionGranted)
  {
    id v7 = a4;
    id v8 = objc_alloc_init((Class)&off_26D2CD218);
    v9 = [v6 title];
    [v8 setTitle:v9];

    v10 = [v6 body];
    [v8 setBody:v10];

    [v8 setShouldIgnoreDoNotDisturb:1];
    v11 = [v6 threadID];
    [v8 setThreadIdentifier:v11];

    v12 = [v6 categoryID];
    v13 = unk_26D2CD54C(&off_26D2CDF68, "categoryWithIdentifier:actions:intentIdentifiers:options:", v12, &__NSArray0__struct, &__NSArray0__struct, 0);

    v14 = [(UNUserNotificationCenter *)self->_userNotificationCenter notificationCategories];
    v15 = [v14 setByAddingObject:v13];
    [(UNUserNotificationCenter *)self->_userNotificationCenter setNotificationCategories:v15];

    v16 = [v6 categoryID];
    [v8 setCategoryIdentifier:v16];

    v17 = [v6 categoryID];
    v18 = +[UNNotificationRequest requestWithIdentifier:v17 content:v8 trigger:0];

    [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v18 withCompletionHandler:v7];
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    v23 = @"Permission not granted";
    id v19 = a4;
    v20 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v21 = +[NSError errorWithDomain:@"GCNotificationManager" code:0 userInfo:v20];
    (*((void (**)(id, void *))a4 + 2))(v19, v21);
  }
}

- (void)requestNotification:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isPermissionGranted)
  {
    [(GCNotificationManager *)self requestNotificationImpl:v6 withReply:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    userNotificationCenter = self->_userNotificationCenter;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __55__GCNotificationManager_requestNotification_withReply___block_invoke;
    v9[3] = &unk_26D22C3F8;
    id v11 = v7;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    [(UNUserNotificationCenter *)userNotificationCenter requestAuthorizationWithOptions:7 completionHandler:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __55__GCNotificationManager_requestNotification_withReply___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 48));
      v8[16] = a2;
      [v8 requestNotificationImpl:*(void *)(a1 + 32) withReply:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v7();
    }
  }
}

- (void).cxx_destruct
{
}

@end