@interface FAFamilyCircleDaemonChangeHandler
+ (BOOL)handleURLResponse:(id)a3 networkService:(id)a4 familyRefreshActivityScheduler:(id)a5 completion:(id)a6;
+ (void)_refetchFamilyWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 context:(id)a5 completion:(id)a6;
+ (void)handleDidReceivePushEventWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 completion:(id)a5;
+ (void)handleDidRemoveMemberWithNetworkService:(id)a3 completion:(id)a4;
+ (void)handleDidUpdateMemberFlagWithNetworkService:(id)a3 completion:(id)a4;
@end

@implementation FAFamilyCircleDaemonChangeHandler

+ (BOOL)handleURLResponse:(id)a3 networkService:(id)a4 familyRefreshActivityScheduler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 allHeaderFields];
  v15 = [v14 objectForKey:@"X-Apple-Family-Changed"];

  if (v15)
  {
    v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleDaemonChangeHandler - Family state has changed", buf, 2u);
    }

    [a1 _refetchFamilyWithNetworkService:v11 familyRefreshActivityScheduler:v12 context:@"family_changed_header" completion:v13];
  }
  v17 = [v10 allHeaderFields];
  v18 = [v17 objectForKey:@"X-Apple-Family-Subscription-Changed"];

  v19 = _FALogSystem();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Family subscription properties changed:", v23, 2u);
    }

    +[FABroadcaster broadcastServicesChangedNotification];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleDaemonChangeHandler - No change header detected... Skipping family refresh update.", v22, 2u);
    }
  }
  return v15 != 0;
}

+ (void)handleDidReceivePushEventWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 completion:(id)a5
{
}

+ (void)handleDidRemoveMemberWithNetworkService:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 familyRefreshActivityScheduler];
  [a1 _refetchFamilyWithNetworkService:v7 familyRefreshActivityScheduler:v8 context:@"removed_family_member" completion:v6];
}

+ (void)handleDidUpdateMemberFlagWithNetworkService:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 familyRefreshActivityScheduler];
  [a1 _refetchFamilyWithNetworkService:v7 familyRefreshActivityScheduler:v8 context:@"update_member_flag" completion:v6];
}

+ (void)_refetchFamilyWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = _FALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412546;
    v33 = v15;
    __int16 v34 = 2080;
    v35 = "+[FAFamilyCircleDaemonChangeHandler _refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ %s: Not clearing family cache upon family changes", buf, 0x16u);
  }
  v16 = [FAFamilyCircleCache alloc];
  v17 = [v12 account];
  v18 = [(FAFamilyCircleCache *)v16 initWithAccount:v17];

  v19 = objc_alloc_init(FAMarqueeUpdateHandler);
  BOOL v20 = [FAFetchFamilyCircleOperation alloc];
  v21 = +[FARequestCoalescer sharedInstance];
  v22 = [(FAFetchFamilyCircleOperation *)v20 initWithNetworkService:v12 cache:v18 marqueeCacheHanlder:v19 requestCoalescer:v21 familyRefreshActivityScheduler:v11];

  [(FAFetchFamilyCircleOperation *)v22 setSignedInAccountShouldBeApprover:0];
  [(FAFetchFamilyCircleOperation *)v22 setCachePolicy:1000];
  v23 = +[NSProcessInfo processInfo];
  v24 = [v23 processName];
  [(FAFetchFamilyCircleOperation *)v22 setClientProcess:v24];

  [(FAFetchFamilyCircleOperation *)v22 setContext:v10];
  [(FAFetchFamilyCircleOperation *)v22 setPromptUserToResolveAuthenticatonFailure:0];
  v25 = [(FAFetchFamilyCircleOperation *)v22 fetchFamilyCircle];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001F970;
  v30[3] = &unk_10004DE30;
  id v31 = v9;
  id v26 = v9;
  [v25 onComplete:v30];

  v27 = _FALogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138412546;
    v33 = v29;
    __int16 v34 = 2080;
    v35 = "+[FAFamilyCircleDaemonChangeHandler _refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ %s done", buf, 0x16u);
  }
}

@end