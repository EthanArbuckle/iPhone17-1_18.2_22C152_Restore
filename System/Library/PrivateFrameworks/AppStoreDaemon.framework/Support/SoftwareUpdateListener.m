@interface SoftwareUpdateListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SoftwareUpdateListener)init;
- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3;
- (void)getManagedUpdatesWithCompletionBlock:(id)a3;
- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesMetricsWithCompletionBlock:(id)a3;
- (void)getUpdatesWithCompletionBlock:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)migrateUpdatesStoreWithCompletionBlock:(id)a3;
- (void)refreshUpdateCountWithCompletionBlock:(id)a3;
- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3;
- (void)removeUpdateBulletins;
- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)showApplicationUpdatesBulletin;
- (void)updateAllWithJobResults:(id)a3;
- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4;
@end

@implementation SoftwareUpdateListener

- (SoftwareUpdateListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)SoftwareUpdateListener;
  return [(SoftwareUpdateListener *)&v3 init];
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  objc_super v3 = (void (**)(id, uint64_t, void))a3;
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[NSXPCConnection currentConnection];
    v6 = +[XPCClient clientIDForConnection:v5];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredUpdateHistoryWithCompletionBlock for client: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if (v3) {
    v3[2](v3, 1, 0);
  }
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v10) = 0;
  v4 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:0 callbackHandler:v3 includeMetrics:1 isVPPLookup:0 userInitiated:v10 targetedItemID:0];

  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(UpdatesContext *)v4 logKey];
    int v7 = +[NSXPCConnection currentConnection];
    v8 = +[XPCClient clientIDForConnection:v7];
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] getUpdatesWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  v9 = +[UpdatesManager sharedManager];
  [v9 getUpdatesWithContext:v4];
}

- (void)getUpdatesMetricsWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  v4 = objc_opt_new();
  [v4 setUsingModernUpdatesCheck:1];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v5 = (void *)qword_1005B1198;
  uint64_t v24 = qword_1005B1198;
  if (!qword_1005B1198)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1003BE5B8;
    v20[3] = &unk_1005243D0;
    v20[4] = &v21;
    sub_1003BE5B8((uint64_t)v20);
    v5 = (void *)v22[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v21, 8);
  v15 = [v6 sharedScheduler];
  [v15 submittedActivities];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 name];
        unsigned int v13 = [v12 hasPrefix:@"com.apple.appstored.AutoUpdates"];

        if (v13)
        {
          id v8 = [v11 predictedOptimalStartDate];
          goto LABEL_13;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [v4 setNextUpdateCheck:v8];
  v14 = sub_1003F418C();
  if (v14) {
    [v4 setLastUpdateCheck:v14];
  }
  if (v3) {
    v3[2](v3, v4, 0);
  }
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v10) = 0;
  v4 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:0 callbackHandler:v3 includeMetrics:0 isVPPLookup:0 userInitiated:v10 targetedItemID:0];

  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UpdatesContext *)v4 logKey];
    id v7 = +[NSXPCConnection currentConnection];
    id v8 = +[XPCClient clientIDForConnection:v7];
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] getUpdatesWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = +[UpdatesManager sharedManager];
  [v9 getUpdatesWithContext:v4];
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v10) = 0;
  v4 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:0 callbackHandler:v3 includeMetrics:0 isVPPLookup:1 userInitiated:v10 targetedItemID:0];

  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UpdatesContext *)v4 logKey];
    id v7 = +[NSXPCConnection currentConnection];
    id v8 = +[XPCClient clientIDForConnection:v7];
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] getManagedUpdatesWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = +[UpdatesManager sharedManager];
  [v9 getUpdatesWithContext:v4];
}

- (void)hideApplicationBadgeForPendingUpdates
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSXPCConnection currentConnection];
    v4 = +[XPCClient clientIDForConnection:v3];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "hideApplicationBadgeForPendingUpdates for client: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v5 = +[UpdatesManager sharedManager];
  [v5 hidePendingUpdatesBadge];
}

- (void)migrateUpdatesStoreWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "migrateUpdatesStoreWithCompletionBlock", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 1, 0);
  }
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  id v3 = a3;
  v4 = sub_100416894((uint64_t)XPCRequestToken, 0);
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[NSXPCConnection currentConnection];
    id v7 = +[XPCClient clientIDForConnection:v6];
    *(_DWORD *)buf = 138543618;
    v15 = v4;
    __int16 v16 = 2114;
    long long v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ refreshUpdateCountWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  id v8 = +[UpdatesManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003BCEF4;
  v11[3] = &unk_10052BC98;
  id v12 = v4;
  id v13 = v3;
  id v9 = v3;
  id v10 = v4;
  [v8 refreshUpdateCountWithRequestToken:v10 replyHandler:v11];
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  v4 = (void (**)(id, uint64_t, void))a4;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[NSXPCConnection currentConnection];
    id v7 = +[XPCClient clientIDForConnection:v6];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "refreshUpdatesWithCompletionBlock for client: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    v4[2](v4, 1, 0);
  }
}

- (void)showApplicationUpdatesBulletin
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSXPCConnection currentConnection];
    v4 = +[XPCClient clientIDForConnection:v3];
    int v5 = 138543362;
    int v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "showApplicationUpdatesBanner for client: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)showApplicationBadgeForPendingUpdates
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSXPCConnection currentConnection];
    v4 = +[XPCClient clientIDForConnection:v3];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "showApplicationBadgeForPendingUpdates for client: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[UpdatesManager sharedManager];
  [v5 showPendingUpdatesBadge];
}

- (void)removeUpdateBulletins
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSXPCConnection currentConnection];
    v4 = +[XPCClient clientIDForConnection:v3];
    int v5 = 138543362;
    int v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "removeUpdateBulletins for client: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v3 = a3;
  v4 = sub_100416894((uint64_t)XPCRequestToken, 0);
  int v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = Property;
    id v9 = +[NSXPCConnection currentConnection];
    id v10 = +[XPCClient clientIDForConnection:v9];
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] reloadFromServerInBackgroundWithCompletionBlock from client: %{public}@", buf, 0x16u);
  }
  v11 = +[UpdatesManager sharedManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003BD57C;
  v14[3] = &unk_10052BCC0;
  id v15 = v4;
  id v16 = v3;
  id v12 = v3;
  id v13 = v4;
  [v11 reloadFromServerInBackgroundWithToken:v13 completionBlock:v14];
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v10) = 1;
  v4 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:0 callbackHandler:v3 includeMetrics:0 isVPPLookup:0 userInitiated:v10 targetedItemID:0];

  int v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(UpdatesContext *)v4 logKey];
    id v7 = +[NSXPCConnection currentConnection];
    id v8 = +[XPCClient clientIDForConnection:v7];
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] reloadFromServerWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  id v9 = +[UpdatesManager sharedManager];
  [v9 reloadUpdatesWithContext:v4];
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  LOBYTE(v10) = 0;
  v4 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:2 requestToken:0 logKey:0 callbackHandler:v3 includeMetrics:0 isVPPLookup:1 userInitiated:v10 targetedItemID:0];

  int v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(UpdatesContext *)v4 logKey];
    id v7 = +[NSXPCConnection currentConnection];
    id v8 = +[XPCClient clientIDForConnection:v7];
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] reloadManagedWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  id v9 = +[UpdatesManager sharedManager];
  [v9 getUpdatesWithContext:v4];
}

- (void)updateAllWithJobResults:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TtC9appstored6LogKey);
  int v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[NSXPCConnection currentConnection];
    id v7 = +[XPCClient clientIDForConnection:v6];
    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2114;
    long long v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] updateAllWithJobResults for client: %{public}@", buf, 0x16u);
  }
  id v8 = +[UpdatesManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003BDB24;
  v11[3] = &unk_10052BCE8;
  id v12 = v4;
  id v13 = v3;
  id v9 = v3;
  uint64_t v10 = v4;
  [v8 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v11];
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSXPCConnection currentConnection];
    uint64_t v10 = +[XPCClient clientIDForConnection:v9];
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updateAllWithOrder for client: %{public}@", buf, 0x16u);
  }
  v11 = +[UpdatesManager sharedManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003BDDE4;
  v14[3] = &unk_10052BCE8;
  id v15 = v7;
  id v16 = v5;
  id v12 = v5;
  id v13 = v7;
  [v11 updateAllWithOrder:v6 requestToken:v13 replyHandler:v14];
}

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, BOOL))a3;
  v4 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSXPCConnection currentConnection];
    id v7 = +[XPCClient clientIDForConnection:v6];
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ shouldUseModernUpdatesWithCompletionBlock for client: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v3[2](v3, +[UpdatesManager shouldUseModernUpdates]);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.appstored.private")
    || sub_10025A6C0((uint64_t)self, v5, @"com.apple.appstored.install-apps"))
  {
    goto LABEL_6;
  }
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Treating %i as legacy client", buf, 8u);
  }

  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_6:
    id v8 = v5;
    id v9 = v8;
    if (self)
    {
      unsigned int v10 = [v8 processIdentifier];
      v11 = +[XPCClient clientIDForConnection:v9];
      id v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v10;
        LOWORD(v22) = 2114;
        *(void *)((char *)&v22 + 2) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got connection from pid: %i client: %{public}@", buf, 0x12u);
      }

      id v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDSoftwareUpdateProtocol];
      [v9 setExportedInterface:v13];
      [v9 setExportedObject:self];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v9);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1003BE3D0;
      v17[3] = &unk_10052BD08;
      unsigned int v18 = v10;
      [v9 setInterruptionHandler:v17];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&long long v22 = 3221225472;
      *((void *)&v22 + 1) = sub_1003BE480;
      uint64_t v23 = &unk_100521BD0;
      objc_copyWeak(&v24, &location);
      objc_copyWeak(&v25, &from);
      unsigned int v26 = v10;
      [v9 setInvalidationHandler:buf];
      [v9 resume];
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    BOOL v14 = 1;
  }
  else
  {
    id v16 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Connection denied for pid: %i for non entitled client", buf, 8u);
    }

    BOOL v14 = 0;
  }

  return v14;
}

@end