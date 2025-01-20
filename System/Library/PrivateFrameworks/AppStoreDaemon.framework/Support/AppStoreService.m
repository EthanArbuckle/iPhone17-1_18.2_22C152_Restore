@interface AppStoreService
- (AppStoreService)init;
- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)allBadgeIDsWithReplyHandler:(id)a3;
- (void)allBadgeMetricsWithReplyHandler:(id)a3;
- (void)badgeIDCountWithReplyHandler:(id)a3;
- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4;
- (void)reloadWidgetOnConnectivityToEndpoint:(id)a3 parameters:(id)a4 replyHandler:(id)a5;
- (void)removeAllBadgeIDsWithReplyHandler:(id)a3;
- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)removeBadgeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4;
@end

@implementation AppStoreService

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = sub_1000159BC((uint64_t)self);
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2114;
    v18[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] addHardwareOfferIDs for client: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v11 = sub_100013C18();
  uint64_t v12 = sub_100008E24((uint64_t)v11, v7, v8);

  if (v6) {
    v6[2](v6, v12, 0);
  }
  v13 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = sub_1000159BC((uint64_t)self);
    int v15 = 138412802;
    v16 = v8;
    __int16 v17 = 1024;
    LODWORD(v18[0]) = v12;
    WORD2(v18[0]) = 2114;
    *(void *)((char *)v18 + 6) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] addHardwareOfferIDs complete with result: %d for client: %{public}@ ", (uint8_t *)&v15, 0x1Cu);
  }
}

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = objc_alloc_init(_TtC9appstored6LogKey);
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_1000159BC((uint64_t)self);
    int v15 = 138412546;
    v16 = v5;
    __int16 v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] allHardwareOfferMetricsWithReplyHandler for client: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v8 = sub_100013C18();
  v9 = sub_100013AF8(v8, v5);

  if (v4) {
    v4[2](v4, v9, 0);
  }
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 keyEnumerator];
    uint64_t v12 = [v11 allObjects];
    v13 = [v12 componentsJoinedByString:@", "];
    v14 = sub_1000159BC((uint64_t)self);
    int v15 = 138412802;
    v16 = v5;
    __int16 v17 = 2114;
    v18 = v13;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] allHardwareOfferMetricsWithReplyHandler complete with [%{public}@] for client: %{public}@", (uint8_t *)&v15, 0x20u);
  }
}

- (AppStoreService)init
{
  v7.receiver = self;
  v7.super_class = (Class)AppStoreService;
  v2 = [(AppStoreService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppStoreService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = sub_1000159BC((uint64_t)self);
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] launchAppStoreWithURL for client: %{public}@", buf, 0x16u);
  }
  v11 = +[NSMutableDictionary dictionary];
  uint64_t v12 = v11;
  if (v6
    && ([v11 setObject:v6 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadURL],
        +[ApplicationProxy proxyForBundleID:@"com.apple.AppStore"], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    int v15 = (void *)sub_10024302C([ApplicationContext alloc], v13);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100264924;
    v17[3] = &unk_100521898;
    id v18 = v7;
    [v15 launchApplicationWithOptions:v12 completionHandler:v17];
  }
  else
  {
    v16 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] could not find App Store", buf, 0xCu);
    }

    v14 = ASDErrorWithDescription();
    (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2, v14);
  }
}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, void *, void))a3;
  v5 = objc_alloc_init(_TtC9appstored6LogKey);
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_1000159BC((uint64_t)self);
    int v13 = 138412546;
    v14 = v5;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] allHardwareOffersIDsWithReplyHandler for client: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v8 = sub_100013C18();
  v9 = sub_10023C524(v8, v5);

  if (v4) {
    v4[2](v4, v9, 0);
  }
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 componentsJoinedByString:@", "];
    uint64_t v12 = sub_1000159BC((uint64_t)self);
    int v13 = 138412802;
    v14 = v5;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] allHardwareOffersIDsWithReplyHandler complete with [%{public}@] for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)badgeIDCountWithReplyHandler:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, uint64_t, void))a3;
  v5 = objc_alloc_init(_TtC9appstored6LogKey);
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_1000159BC((uint64_t)self);
    int v12 = 138412546;
    int v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] badgeIDCountWithReplyHandler for client: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v8 = sub_100013C18();
  uint64_t v9 = sub_10023C804((uint64_t)v8, v5);

  if (v4) {
    v4[2](v4, v9, 0);
  }
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_1000159BC((uint64_t)self);
    int v12 = 138412802;
    int v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] badgeIDCountWithReplyHandler complete with count: %ld for client: %{public}@ ", (uint8_t *)&v12, 0x20u);
  }
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
  dispatch_queue_t v4 = (void (**)(id, uint64_t, void))a3;
  v5 = objc_alloc_init(_TtC9appstored6LogKey);
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_1000159BC((uint64_t)self);
    int v12 = 138412546;
    int v13 = v5;
    __int16 v14 = 2114;
    v15[0] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] removeAllBadgeIDsWithReplyHandler for client: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v8 = sub_100013C18();
  uint64_t v9 = sub_10023CB74((uint64_t)v8, v5);

  if (v4) {
    v4[2](v4, v9, 0);
  }
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_1000159BC((uint64_t)self);
    int v12 = 138412802;
    int v13 = v5;
    __int16 v14 = 1024;
    LODWORD(v15[0]) = v9;
    WORD2(v15[0]) = 2114;
    *(void *)((char *)v15 + 6) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] removeAllBadgeIDsWithReplyHandler complete with result: %d for client: %{public}@ ", (uint8_t *)&v12, 0x1Cu);
  }
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 componentsJoinedByString:@", "];
    v11 = sub_1000159BC((uint64_t)self);
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2114;
    *(void *)v20 = v10;
    *(_WORD *)&v20[8] = 2114;
    *(void *)&v20[10] = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] removeBadgeIDs: [%{public}@] for client: %{public}@", (uint8_t *)&v17, 0x20u);
  }
  int v12 = sub_100013C18();
  int v13 = sub_1000159BC((uint64_t)self);
  uint64_t v14 = sub_10023CD8C((uint64_t)v12, v6, v13, v8);

  if (v7) {
    v7[2](v7, v14, 0);
  }
  uint64_t v15 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = sub_1000159BC((uint64_t)self);
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 1024;
    *(_DWORD *)v20 = v14;
    *(_WORD *)&v20[4] = 2114;
    *(void *)&v20[6] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] removeBadgeIDs complete with result: %d for client: %{public}@ ", (uint8_t *)&v17, 0x1Cu);
  }
}

- (void)removeBadgeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 componentsJoinedByString:@", "];
    v11 = sub_1000159BC((uint64_t)self);
    int v16 = 138412802;
    int v17 = v8;
    __int16 v18 = 2114;
    *(void *)__int16 v19 = v10;
    *(_WORD *)&v19[8] = 2114;
    *(void *)&v19[10] = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] removeBadgeMetricsForBadgeIDs: [%{public}@] for client: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  int v12 = sub_100013C18();
  uint64_t v13 = sub_10023CA18((uint64_t)v12, v6, v8);

  if (v7) {
    v7[2](v7, v13, 0);
  }
  uint64_t v14 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = sub_1000159BC((uint64_t)self);
    int v16 = 138412802;
    int v17 = v8;
    __int16 v18 = 1024;
    *(_DWORD *)__int16 v19 = v13;
    *(_WORD *)&v19[4] = 2114;
    *(void *)&v19[6] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] removeBadgeMetricsForOfferIDs complete with result: %d for client: %{public}@ ", (uint8_t *)&v16, 0x1Cu);
  }
}

- (void)reloadWidgetOnConnectivityToEndpoint:(id)a3 parameters:(id)a4 replyHandler:(id)a5
{
  v10 = (void (**)(id, uint64_t, void))a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[WidgetReloadOnNetworkReachableActivity sharedActivity];
  [v9 scheduleWithEndpoint:v8 parameters:v7];

  v10[2](v10, 1, 0);
}

- (void).cxx_destruct
{
}

@end