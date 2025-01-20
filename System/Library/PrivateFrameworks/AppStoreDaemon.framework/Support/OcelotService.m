@interface OcelotService
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppPayoutEventsWithCompletionBlock:(id)a3;
- (void)getAppSummaryEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)resetPayoutWithCompletionBlock:(id)a3;
- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4;
- (void)sbsyncWithCompletionBlock:(id)a3;
- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4;
- (void)sendPayoutMetricsWithCompletionBlock:(id)a3;
- (void)sendSummaryMetricsWithCompletionBlock:(id)a3;
- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4;
- (void)subscriptionDetailsWithCompletionBlock:(id)a3;
- (void)subscriptionStateWithCompletionBlock:(id)a3;
- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4;
@end

@implementation OcelotService

- (void)flushMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] flushMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037BBA4((uint64_t)v9, @"User Request", v4);
}

- (void)getAppPayoutEventsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] getAppPayoutEventsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037BE84((uint64_t)v9, v4);
}

- (void)getAppSummaryEventsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] getAppSummaryEventsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037C38C((uint64_t)v9, v4);
}

- (void)recordLaunchesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] recordLaunchesWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037D7E8((uint64_t)v9, v4);
}

- (void)recordMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] recordMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037E0DC((uint64_t)v9, v4);
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = sub_1000159BC((uint64_t)self);
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] reportAppEvent for client: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  __int16 v12 = sub_10037B958();
  sub_10037D510((uint64_t)v12, v7, v6);
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] resetMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037E300((uint64_t)v9, v4);
}

- (void)resetPayoutWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] recordLaunchesWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037E870((uint64_t)v9, v4);
}

- (void)sendPayoutMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] sendPayoutMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037FC4C((uint64_t)v9, v4);
}

- (void)sendSummaryMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] sendSummaryMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037FE74((uint64_t)v9, v4);
}

- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = sub_1000159BC((uint64_t)self);
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@]: sbsyncIfSubscribedWithAccount:completionBlock for client: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  __int16 v12 = sub_10037B958();
  sub_10037EAC4((uint64_t)v12, v7, v6);
}

- (void)sbsyncWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] sbsyncWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_10037B958();
  sub_10037F148((uint64_t)v9, @"Manual", 0, v4);
}

- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = sub_1000159BC((uint64_t)self);
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] sbsyncWithDuration:completionBlock for client: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  __int16 v12 = sub_10037B958();
  sub_10037F148((uint64_t)v12, @"Manual", v7, v6);
}

- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = sub_1000159BC((uint64_t)self);
  id v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    v14 = v8;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] showUpsellForItemID: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  v11 = sub_10037B958();
  sub_1003817EC((uint64_t)v11, v6, (uint64_t)&__NSDictionary0__struct, v8);

  __int16 v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] showUpsellForItemID complete for client: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)subscriptionDetailsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = sub_1000159BC((uint64_t)self);
    *(_DWORD *)buf = 138412546;
    v35 = v7;
    __int16 v36 = 2114;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] subscriptionDetailsWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  id v10 = +[ACAccountStore ams_sharedAccountStore];
  v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

  __int16 v12 = objc_msgSend(v11, "ams_DSID");
  id v31 = 0;
  BOOL v13 = sub_1002CEAE8((uint64_t)SbsyncTask, v12, &v31);
  id v14 = v31;

  if (v11)
  {
    __int16 v15 = [v11 username];
    id v16 = objc_msgSend(v11, "ams_DSID");
    __int16 v17 = +[NSString stringWithFormat:@"%@/%@", v15, v16];
  }
  else
  {
    __int16 v17 = @"N/A";
  }
  v18 = sub_10037B958();
  uint64_t v19 = sub_10037BA34((uint64_t)v18);

  id v20 = objc_alloc((Class)NSMutableDictionary);
  v21 = &__kCFBooleanFalse;
  if (v13) {
    v21 = &__kCFBooleanTrue;
  }
  v32[0] = @"isSubscriptionBagSubscribed";
  v32[1] = @"subscribedAccount";
  v33[0] = v21;
  v33[1] = v17;
  v32[2] = @"arcadeAppCount";
  v22 = +[NSNumber numberWithInteger:v19];
  v33[2] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  id v24 = [v20 initWithDictionary:v23];

  v25 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002DAD34;
  v28[3] = &unk_1005267E0;
  id v29 = v24;
  id v30 = v4;
  id v26 = v24;
  id v27 = v4;
  sub_100321A50(v25, 1uLL, v5, 0, 0, 0, v28);
}

- (void)subscriptionStateWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = sub_1000159BC((uint64_t)self);
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] subscriptionStateWithCompletionBlock for client: %{public}@", buf, 0x16u);
  }
  v9 = +[ACAccountStore ams_sharedAccountStore];
  id v10 = objc_msgSend(v9, "ams_activeiTunesAccount");

  v11 = objc_msgSend(v10, "ams_DSID");
  id v14 = 0;
  BOOL v12 = sub_1002CEAE8((uint64_t)SbsyncTask, v11, &v14);
  id v13 = v14;

  if (v4) {
    v4[2](v4, v12, v13);
  }
}

- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_1000159BC((uint64_t)self);
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "topAppForAccount for client: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = sub_10037B958();
  sub_100382348((uint64_t)v10, v7, v6);
}

@end