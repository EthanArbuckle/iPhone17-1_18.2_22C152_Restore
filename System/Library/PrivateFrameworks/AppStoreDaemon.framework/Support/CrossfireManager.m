@interface CrossfireManager
- (CrossfireManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
- (void)_handleAnalyticsUsageSwitchChange:(id)a3;
- (void)decorateMetricsEvent:(id)a3 context:(id)a4;
@end

@implementation CrossfireManager

- (CrossfireManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)CrossfireManager;
  v2 = [(AppUsageBaseManager *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.CrossfireManager.callout", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.CrossfireManager.dispatch", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v2->_BOOL collectingMetrics = sub_1003363D8();
    uint64_t v9 = +[AMSDevice buildVersion];
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v9;

    uint64_t v11 = sub_1002D78A8((__CFString *)v2);
    platform = v2->_platform;
    v2->_platform = (NSString *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    v14 = sub_1003DA6D4();
    unsigned __int8 v15 = [v14 isHRNMode];

    if ((v15 & 1) == 0) {
      [v13 addObserver:v2 selector:"_handleAnalyticsUsageSwitchChange:" name:MCEffectiveSettingsChangedNotification object:0];
    }
    v16 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL collectingMetrics = v2->_collectingMetrics;
      *(_DWORD *)buf = 67109120;
      BOOL v21 = collectingMetrics;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Crossfire] Initialized with initial analytics switch: %d", buf, 8u);
    }
  }
  return v2;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = objc_opt_new();
  v8 = sub_1002D73A8(self, v4, v6);
  if ([v8 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = sub_1002D61A0(self, *(void **)(*((void *)&v17 + 1) + 8 * i), v4, v6);
          objc_msgSend(v7, "addObject:", v14, (void)v17);
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  id v15 = objc_msgSend(v7, "copy", (void)v17);

  return v15;
}

- (void)decorateMetricsEvent:(id)a3 context:(id)a4
{
  BOOL v21 = (id *)a3;
  id v6 = a4;
  osBuild = self->_osBuild;
  if (osBuild) {
    sub_1003F6380(v21, osBuild);
  }
  platform = self->_platform;
  if (platform) {
    sub_1003F63F8(v21, platform);
  }
  [v21 setAnonymous:1];
  if (v6)
  {
    sub_1003F6640(v21, v6[15]);
    uint64_t v9 = v6[11];
  }
  else
  {
    sub_1003F6640(v21, 0);
    uint64_t v9 = 0;
  }
  sub_1003F65D0(v21, v9);
  sub_1003F66B0(v21, 1);
  if (v21 && *((unsigned char *)v21 + 25) && (*((unsigned __int8 *)v21 + 24) | 4) != 5)
  {
    id v10 = v21[9];
    id v11 = v6;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_100017EA8;
    v29 = sub_100017B10;
    id v30 = 0;
    uint64_t v12 = sub_10038F000();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100226CC8;
    v22[3] = &unk_100522858;
    id v13 = v10;
    id v23 = v13;
    v24 = &v25;
    [v12 readUsingSession:v22];

    id v14 = (id)v26[5];
    _Block_object_dispose(&v25, 8);

    if (v14)
    {
      id v15 = sub_1003D1960(v14);
      if (v15) {
        sub_1003F58E8(v21, v15);
      }
      v16 = sub_1003D1928(v14);
      if (v16) {
        sub_1003F5870(v21, v16);
      }
      long long v17 = sub_1003D1998(v14);
      if (v17) {
        sub_1003F5AC8(v21, v17);
      }
      long long v18 = [v14 valueForProperty:@"clip_affiliate_token"];
      if (v18) {
        sub_1003F56F0(v21, v18);
      }
      long long v19 = [v14 valueForProperty:@"clip_campaign_token"];
      if (v19) {
        sub_1003F5770(v21, v19);
      }
      long long v20 = [v14 valueForProperty:@"clip_provider_token"];
      if (v20) {
        sub_1003F57F0(v21, v20);
      }
    }
  }
}

- (void)_handleAnalyticsUsageSwitchChange:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100226E98;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end