@interface WatchSettingsManager
- (WatchSettingsManager)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation WatchSettingsManager

- (WatchSettingsManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)WatchSettingsManager;
  v2 = [(WatchSettingsManager *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.WatchSettingsManager.callout", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.WatchSettingsManager.dispatch", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.appstored"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v9;

    uint64_t v11 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v11;

    objc_initWeak(&location, v2);
    v13 = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10026B0E4;
    handler[3] = &unk_100523F28;
    objc_copyWeak(&v27, &location);
    notify_register_dispatch("com.apple.appstored.NanoSettingsStateChanged", &v2->_token, v13, handler);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v14 = sub_10026AFCC();
    id v15 = [v14 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v17);
          v19 = +[NSUserDefaults standardUserDefaults];
          [v19 addObserver:v2 forKeyPath:v18 options:1 context:0];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v15);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WatchSettingsManager;
  [(WatchSettingsManager *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Preference value for %{public}@ changed", (uint8_t *)&v9, 0x16u);
  }

  sub_10026AED8((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end