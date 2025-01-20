@interface FetchTVProviderAppsTask
- (void)main;
@end

@implementation FetchTVProviderAppsTask

- (void)main
{
  if (self)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = sub_100017E48;
    v20 = sub_100017AE0;
    id v21 = 0;
    objc_initWeak(&location, self);
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v4 = +[VSIdentityProviderInfoCenter sharedCenter];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001FB18C;
    v11[3] = &unk_100521508;
    objc_copyWeak(&v14, &location);
    v11[4] = self;
    v13 = &v16;
    v5 = v3;
    v12 = v5;
    [v4 enqueueIdentityProviderAppsQueryWithCompletion:v11];

    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      v7 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        logKey = self->_logKey;
        *(_DWORD *)buf = 138412290;
        v23 = logKey;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%@] Timed out waiting for identity provider apps", buf, 0xCu);
      }
    }
    v8 = (void *)v17[5];
    if (v8) {
      id v9 = v8;
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);
  }
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_tvProviderApps, 0);
  objc_storeStrong((id *)&self->_headboardApps, 0);
}

@end