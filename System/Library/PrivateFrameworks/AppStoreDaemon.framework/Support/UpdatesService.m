@interface UpdatesService
- (UpdatesService)init;
- (void)autoUpdateEnabled:(id)a3;
- (void)compatibilityUpdateForBundleIDs:(id)a3 userInitiated:(BOOL)a4 withReplyHandler:(id)a5;
- (void)getManagedUpdatesWithReplyHandler:(id)a3;
- (void)getMetricsWithReplyHandler:(id)a3;
- (void)getUpdateMetadataForBundleID:(id)a3 withReplyHandler:(id)a4;
- (void)getUpdateMetricsEventsWithReplyHandler:(id)a3;
- (void)getUpdatesIncludingMetricsWithReplyHandler:(id)a3;
- (void)getUpdatesWithReplyHandler:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)refreshUpdateCountWithReplyHandler:(id)a3;
- (void)refreshUpdateForApp:(int64_t)a3 reply:(id)a4;
- (void)reloadForSettingsFromServerWithReplyHandler:(id)a3;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithReplyHandler:(id)a3;
- (void)reloadManagedUpdatesWithReplyHandler:(id)a3;
- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)shouldUseModernUpdatesWithReplyHandler:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)updateAllGettingJobResultsWithReplyHandler:(id)a3;
- (void)updateAllWithOrder:(id)a3 replyHandler:(id)a4;
- (void)updateAllWithReplyHandler:(id)a3;
@end

@implementation UpdatesService

- (void)shouldUseModernUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000100E4;
  v9[3] = &unk_100521698;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (UpdatesService)init
{
  v9.receiver = self;
  v9.super_class = (Class)UpdatesService;
  v2 = [(UpdatesService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.UpdatesService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[UpdatesManager sharedManager];
    updatesInterface = v2->_updatesInterface;
    v2->_updatesInterface = (UpdatesControllerInterface *)v6;
  }
  return v2;
}

- (void)autoUpdateEnabled:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C0324;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100010948(dispatchQueue, v7);
}

- (void)compatibilityUpdateForBundleIDs:(id)a3 userInitiated:(BOOL)a4 withReplyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_super v9 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003C04B4;
  v14[3] = &unk_1005221F0;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  sub_100010948(dispatchQueue, v14);
}

- (void)getManagedUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C06A0;
  v9[3] = &unk_1005221F0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)getUpdateMetadataForBundleID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003C0A08;
  v13[3] = &unk_100522420;
  id v14 = v8;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void)getUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C0D24;
  v9[3] = &unk_1005221F0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)refreshUpdateCountWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C1038;
  v9[3] = &unk_1005221F0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)refreshUpdateForApp:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C13D0;
  v11[3] = &unk_1005280D8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  int64_t v15 = a3;
  id v9 = v6;
  id v10 = v7;
  sub_100010948(dispatchQueue, v11);
}

- (void)reloadFromServerWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C1790;
  v9[3] = &unk_1005221F0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)reloadManagedUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C1B28;
  v9[3] = &unk_1005221F0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  id v9 = [[_TtC9appstored6LogKey alloc] initWithCode:@"AUAT"];
  id v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 processInfo];
    id v12 = [v11 bundleIdentifier];
    *(_DWORD *)buf = 138412802;
    v22 = v9;
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle: %{public}@ for client: %{public}@", buf, 0x20u);
  }
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C1F70;
  v17[3] = &unk_100521DE0;
  v19 = v9;
  id v20 = v7;
  id v18 = v6;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  sub_100010948(dispatchQueue, v17);
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C2128;
  v11[3] = &unk_10052A320;
  BOOL v14 = a3;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_100010948(dispatchQueue, v11);
}

- (void)updateAllWithOrder:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003C23EC;
  v13[3] = &unk_100522420;
  id v14 = v8;
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C2798;
  v9[3] = &unk_100521698;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)getUpdateMetricsEventsWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C2B44;
  v9[3] = &unk_100521DE0;
  id v11 = self;
  id v12 = v4;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)getMetricsWithReplyHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v17 = sub_1003C3164((uint64_t)self);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Get metrics with reply handler", (uint8_t *)&buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)ASDSoftwareUpdateMetrics);
  [v6 setUsingModernUpdatesCheck:1];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v7 = (void *)qword_1005B11B8;
  uint64_t v25 = qword_1005B11B8;
  if (!qword_1005B11B8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v28 = sub_1003C3960;
    v29 = &unk_1005243D0;
    v30 = &v22;
    sub_1003C3960((uint64_t)&buf);
    id v7 = (void *)v23[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v22, 8);
  id v9 = [v8 sharedScheduler];
  [v9 submittedActivities];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "name", (void)v18);
        if ([v15 hasPrefix:@"com.apple.appstored.AutoUpdates"])
        {
          id v11 = [v14 predictedOptimalStartDate];

          goto LABEL_15;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  [v6 setNextUpdateCheck:v11];
  id v16 = sub_1003F418C();
  if (v16) {
    [v6 setLastUpdateCheck:v16];
  }
  if (v4) {
    v4[2](v4, v6, 0);
  }
}

- (void)getUpdatesIncludingMetricsWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v10 = sub_1003C3164((uint64_t)self);
    *(_DWORD *)long long buf = 138543362;
    id v13 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Get updates including metrics with reply handler", buf, 0xCu);
  }
  LOBYTE(v11) = 0;
  id v6 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:0 callbackHandler:v4 includeMetrics:1 isVPPLookup:0 userInitiated:v11 targetedItemID:0];

  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(UpdatesContext *)v6 logKey];
    *(_DWORD *)long long buf = 138412290;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Get updates including metrics with reply handler", buf, 0xCu);
  }
  id v9 = +[UpdatesManager sharedManager];
  [v9 getUpdatesWithContext:v6];
}

- (void)hideApplicationBadgeForPendingUpdates
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = sub_1003C3164((uint64_t)self);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Hide application badge for pending updates", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[UpdatesManager sharedManager];
  [v4 hidePendingUpdatesBadge];
}

- (void)reloadForSettingsFromServerWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = sub_1003C3164((uint64_t)self);
    int v13 = 138543362;
    id v14 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Reload for settings from server with reply handler", (uint8_t *)&v13, 0xCu);
  }
  int v6 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id Property = objc_getProperty(v6, v8, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v10 = Property;
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Reload for settings from server with reply handler", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v11 = +[UpdatesManager sharedManager];
  [v11 reloadFromServerInBackgroundWithToken:v6 completionBlock:v4];
}

- (void)showApplicationBadgeForPendingUpdates
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = sub_1003C3164((uint64_t)self);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Show application badge for pending updates", (uint8_t *)&v6, 0xCu);
  }
  id v4 = +[UpdatesManager sharedManager];
  [v4 showPendingUpdatesBadge];
}

- (void)updateAllWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = sub_1003C3164((uint64_t)self);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v12 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Update all with reply handler", buf, 0xCu);
  }
  int v6 = +[UpdatesManager sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C3808;
  v9[3] = &unk_10052BE30;
  id v10 = v4;
  id v7 = v4;
  [v6 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v9];
}

- (void)updateAllGettingJobResultsWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_1003C3164((uint64_t)self);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Update all getting job results with reply handler", (uint8_t *)&v8, 0xCu);
  }
  int v6 = +[UpdatesManager sharedManager];
  [v6 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatesInterface, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end