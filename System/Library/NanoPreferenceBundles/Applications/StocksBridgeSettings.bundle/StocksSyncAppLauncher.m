@interface StocksSyncAppLauncher
+ (BOOL)_acquire:(id)a3;
+ (id)_createAssertionForTargetWithPid:(int)a3;
+ (void)_invalidateAfterDelay:(id)a3;
+ (void)_launchAppWithBundleID:(id)a3 withAction:(id)a4 completion:(id)a5;
+ (void)_postNotification:(__CFString *)a3;
+ (void)launchPhoneApp;
@end

@implementation StocksSyncAppLauncher

+ (void)launchPhoneApp
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = [v3 getActivePairedDevice];

  if (v4)
  {
    v5 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2A2C;
    block[3] = &unk_8308;
    block[4] = a1;
    dispatch_async(v5, block);
  }
  else
  {
    v5 = stocks_sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Asked to launch phone app but there isn't a paired watch to ping; ignore.",
        buf,
        2u);
    }
  }
}

+ (BOOL)_acquire:(id)a3
{
  uint64_t v13 = 0;
  [a3 acquireWithError:&v13];
  uint64_t v3 = v13;
  v4 = stocks_sync_log();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = 0;
      v6 = "Unable to acquire assertion.";
      v7 = (uint8_t *)&v12;
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_0, v8, v9, v6, v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = 0;
    v6 = "Acquired assertion.";
    v7 = (uint8_t *)&v11;
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  return v3 == 0;
}

+ (id)_createAssertionForTargetWithPid:(int)a3
{
  uint64_t v3 = +[RBSTarget targetWithPid:*(void *)&a3];
  v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.stocks" name:@"TalkToWatch"];
  id v5 = objc_alloc((Class)RBSAssertion);
  os_log_type_t v9 = v4;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = [v5 initWithExplanation:@"Stocks Sync Assertion" target:v3 attributes:v6];

  return v7;
}

+ (void)_invalidateAfterDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2E80;
  v7[3] = &unk_8330;
  id v8 = v3;
  id v5 = v3;
  v6 = objc_retainBlock(v7);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
}

+ (void)_postNotification:(__CFString *)a3
{
  dispatch_time_t v4 = stocks_sync_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Posting %@.", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

+ (void)_launchAppWithBundleID:(id)a3 withAction:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = stocks_sync_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Attempting to launch %@.", buf, 0xCu);
  }

  v23[0] = &__kCFBooleanTrue;
  v22[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v22[1] = FBSOpenApplicationOptionKeyActions;
  id v21 = v9;
  __int16 v11 = +[NSArray arrayWithObjects:&v21 count:1];
  v23[1] = v11;
  __int16 v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  uint64_t v13 = +[FBSOpenApplicationOptions optionsWithDictionary:v12];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_31E8;
  v18[3] = &unk_8410;
  id v19 = v7;
  id v20 = v8;
  id v14 = v8;
  id v15 = v7;
  v16 = objc_retainBlock(v18);
  v17 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  [v17 openApplication:v15 withOptions:v13 completion:v16];
}

@end