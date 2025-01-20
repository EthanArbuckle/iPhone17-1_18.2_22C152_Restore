@interface UpdatesManager
+ (BOOL)isTVProviderApp:(int64_t)a3;
+ (BOOL)shouldUseModernUpdates;
+ (id)_internalManager;
+ (id)sharedManager;
- (BOOL)_shouldUseModernUpdates;
- (BOOL)shouldUseModernUpdates;
- (UpdatesManager)init;
- (void)_invalidateCachedModernUpdatesValue:(id)a3;
@end

@implementation UpdatesManager

+ (id)sharedManager
{
  v2 = [a1 _internalManager];
  unsigned int v3 = [v2 shouldUseModernUpdates];

  if (v3) {
    +[UpdatesManager_Swift shared];
  }
  else {
  v4 = +[UpdatesManager_ObjC sharedManager];
  }
  return v4;
}

+ (BOOL)shouldUseModernUpdates
{
  v2 = [a1 _internalManager];
  unsigned __int8 v3 = [v2 shouldUseModernUpdates];

  return v3;
}

- (BOOL)shouldUseModernUpdates
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100018268;
  v21 = sub_100017CF0;
  id v22 = 0;
  unfairLock = self->_unfairLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000104D4;
  v16[3] = &unk_100521988;
  v16[4] = self;
  v16[5] = &v17;
  sub_100010468(unfairLock, v16);
  v4 = (void *)v18[5];
  if (v4)
  {
    LOBYTE(v5) = [v4 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(UpdatesManager *)self _shouldUseModernUpdates];
    v6 = self->_unfairLock;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10034ADEC;
    v14[3] = &unk_1005229A8;
    v14[4] = self;
    char v15 = v5;
    sub_100010468(v6, v14);
    v7 = sub_1003F1FD8((uint64_t)AppDefaultsManager, @"CurrentUpdateSource");
    unsigned int v8 = [v7 isEqualToNumber:&off_10054CA20];
    if (v7 && v5 != v8)
    {
      v9 = sub_10001A308();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10034AE3C;
      v12[3] = &unk_100528F88;
      char v13 = v5;
      [v9 modifyUsingTransaction:v12];
    }
    if (v5) {
      v10 = &off_10054CA20;
    }
    else {
      v10 = &off_10054CA38;
    }
    sub_1003F2074((uint64_t)AppDefaultsManager, v10, @"CurrentUpdateSource");
  }
  _Block_object_dispose(&v17, 8);

  return v5;
}

+ (id)_internalManager
{
  if (qword_1005B0FE0 != -1) {
    dispatch_once(&qword_1005B0FE0, &stru_100528F68);
  }
  v2 = (void *)qword_1005B0FE8;
  return v2;
}

- (UpdatesManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)UpdatesManager;
  v2 = [(UpdatesManager *)&v9 init];
  if (v2)
  {
    unsigned __int8 v3 = objc_alloc_init(UnfairLock);
    unfairLock = v2->_unfairLock;
    v2->_unfairLock = v3;

    unsigned int v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_invalidateCachedModernUpdatesValue:" name:AMSBagChangedNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    v7 = +[ActiveAccountObserver sharedInstance];
    [v6 addObserver:v2 selector:"_invalidateCachedModernUpdatesValue:" name:@"AccountStorePrimaryAccountDidChange" object:v7];
  }
  return v2;
}

+ (BOOL)isTVProviderApp:(int64_t)a3
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [a1 sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10034ADD8;
  v9[3] = &unk_100526A10;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  [v6 isTVProviderApp:a3 withReplyHandler:v9];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

- (void)_invalidateCachedModernUpdatesValue:(id)a3
{
  unfairLock = self->_unfairLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10034AEC8;
  v4[3] = &unk_100521388;
  v4[4] = self;
  sub_100010468(unfairLock, v4);
}

- (BOOL)_shouldUseModernUpdates
{
  if (os_variant_has_internal_content()
    && sub_1003F1E7C((uint64_t)AppDefaultsManager, @"UseMAPIUpdates", 0))
  {
    v2 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using modern updates due to default being set", v11, 2u);
    }

    return 1;
  }
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  unsigned __int8 v3 = sub_10030B11C();
  if (!v3) {
    return 0;
  }
  v4 = v3;
  double v5 = sub_10030D1FC(v3, @"media-api-updates-rollout-rate", 1, 1.0);

  if (v5 <= 0.0) {
    return 0;
  }
  if (v5 >= 1.0) {
    return 1;
  }
  v6 = +[ACAccountStore ams_sharedAccountStore];
  v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
  unsigned int v8 = objc_msgSend(v7, "ams_DSID");

  if (v8) {
    BOOL v9 = (uint64_t)[v8 integerValue] % 100 < (uint64_t)(v5 * 100.0);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfairLock, 0);
  objc_storeStrong((id *)&self->_cachedShouldUseModernUpdates, 0);
}

@end