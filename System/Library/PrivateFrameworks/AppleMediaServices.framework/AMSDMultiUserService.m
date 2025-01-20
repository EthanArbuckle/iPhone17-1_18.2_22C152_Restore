@interface AMSDMultiUserService
+ (AMSDMultiUserService)sharedService;
+ (Class)machService;
+ (id)_sanitizeError:(id)a3;
- (AMSDMultiUserController)multiUserController;
- (AMSDMultiUserService)initWithMultiUserController:(id)a3;
- (void)exportMultiUserTokenForHomeIdentifier:(id)a3 generateIfMissing:(BOOL)a4 generateIfInvalid:(BOOL)a5 completion:(id)a6;
- (void)generateInfoWithCompletion:(id)a3;
- (void)iTunesAccountForHomeWithIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateMultiUserTokenForHomeIdentifier:(id)a3 completion:(id)a4;
- (void)multiUserTokenForAccount:(id)a3 completion:(id)a4;
- (void)refreshAfterTimeInterval:(double)a3 completion:(id)a4;
- (void)setiTunesAccount:(id)a3 forHomeWithIdentifier:(id)a4 completion:(id)a5;
- (void)updateMultiUserTokenForAccount:(id)a3 completion:(id)a4;
@end

@implementation AMSDMultiUserService

+ (Class)machService
{
  return (Class)objc_opt_class();
}

+ (AMSDMultiUserService)sharedService
{
  if (qword_100130350 != -1) {
    dispatch_once(&qword_100130350, &stru_1001133E8);
  }
  v2 = (void *)qword_100130358;
  return (AMSDMultiUserService *)v2;
}

- (AMSDMultiUserService)initWithMultiUserController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDMultiUserService;
  v6 = [(AMSDMultiUserService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_multiUserController, a3);
  }

  return v7;
}

- (void)exportMultiUserTokenForHomeIdentifier:(id)a3 generateIfMissing:(BOOL)a4 generateIfInvalid:(BOOL)a5 completion:(id)a6
{
  id v37 = a6;
  id v8 = a3;
  id v9 = (id)AMSSetLogKey();
  v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  v11 = v10;
  if (!v10)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  BOOL v13 = os_signpost_enabled(v12);

  if (!v10) {
  if (v13)
  }
  {
    v14 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    v15 = v14;
    if (!v14)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    if (!v14) {
    v18 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    }
    v10 = v18;
    if (v18)
    {
      v19 = [v18 OSLogObject];
    }
    else
    {
      v20 = +[AMSLogConfig sharedConfig];
      v19 = [v20 OSLogObject];
    }
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v50 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "exportMultiUserToken", "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v17 = 0;
  }
  v21 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v21)
  {
    v21 = +[AMSLogConfig sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = AMSLogKey();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = v24;
    if (v23)
    {
      v10 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v25, v10];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v24];
    v26 = };
    v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v50 = v26;
    __int16 v51 = 2114;
    v52 = v27;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@", buf, 0x16u);
    if (v23)
    {

      v26 = v10;
    }
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.exportMultiUserToken"];
  v28 = [(AMSDMultiUserService *)self multiUserController];
  v29 = [v28 homeManager];
  id v30 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];

  v31 = [v29 homeWithHomeIdentifier:v30];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100040A18;
  v45[3] = &unk_1001134B0;
  v45[4] = self;
  id v46 = v28;
  BOOL v47 = a4;
  BOOL v48 = a5;
  id v32 = v28;
  v33 = [v31 continueWithBlock:v45];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100041A54;
  v39[3] = &unk_1001134D8;
  BOOL v44 = v13;
  os_signpost_id_t v42 = v17;
  SEL v43 = a2;
  v40 = @"com.apple.amsaccountsd.AMSDMultiUserService.exportMultiUserToken";
  id v41 = v37;
  id v34 = v37;
  [v33 addFinishBlock:v39];
}

- (void)generateInfoWithCompletion:(id)a3
{
  id v28 = a3;
  id v5 = (id)AMSSetLogKey();
  v6 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = objc_msgSend(v6, "OSLogObject", v28);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v8;
    __int16 v39 = 2114;
    v40 = v9;
    __int16 v41 = 2114;
    os_signpost_id_t v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.generateInfo"];
  v11 = [(AMSDMultiUserService *)self multiUserController];
  v12 = [v11 cloudContainer];
  BOOL v13 = [v12 privateDatabase];

  v14 = [(AMSDMultiUserService *)self multiUserController];
  v15 = [v14 cloudContainer];
  v16 = [v15 sharedDatabase];

  os_signpost_id_t v17 = [(AMSDMultiUserService *)self multiUserController];
  v18 = [v17 homeManager];
  v19 = [v18 allHomes];
  v36[0] = v19;
  v20 = [v13 fetchRecordZones];
  v36[1] = v20;
  v21 = [v16 fetchRecordZones];
  v36[2] = v21;
  v22 = +[NSArray arrayWithObjects:v36 count:3];
  v23 = +[AMSPromise promiseWithAll:v22 timeout:60.0];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100041F80;
  v33[3] = &unk_1001135F0;
  id v34 = v13;
  id v35 = v16;
  id v24 = v16;
  id v25 = v13;
  v26 = [v23 thenWithBlock:v33];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100043128;
  v30[3] = &unk_100113618;
  v31 = @"com.apple.amsaccountsd.AMSDMultiUserService.generateInfo";
  id v32 = v29;
  id v27 = v29;
  [v26 addFinishBlock:v30];
}

- (void)iTunesAccountForHomeWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)AMSSetLogKey();
  v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class();
    BOOL v13 = AMSLogKey();
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v43 = v12;
    __int16 v44 = 2114;
    v45 = v13;
    __int16 v46 = 2114;
    BOOL v47 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.iTunesAccountForHomeWithIdentifier"];
  v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = AMSLogKey();
    v19 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v43 = v17;
    __int16 v44 = 2114;
    v45 = v18;
    __int16 v46 = 2114;
    BOOL v47 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching the iTunes account used by a home. homeIdentifier = %{public}@", buf, 0x20u);
  }
  v20 = [(AMSDMultiUserService *)self multiUserController];
  v21 = [v20 cloudContainer];
  v22 = [v21 privateDatabase];

  v23 = objc_alloc_init(AMSDMultiUserMetrics);
  id v24 = [v20 homeManager];
  id v25 = [v24 homeWithHomeIdentifier:v7];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000435D4;
  v39[3] = &unk_100113640;
  id v26 = v22;
  id v40 = v26;
  id v27 = v23;
  __int16 v41 = v27;
  id v28 = [v25 continueWithBlock:v39];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100043B84;
  void v36[3] = &unk_100113550;
  id v37 = v26;
  uint64_t v38 = v27;
  v29 = v27;
  id v30 = v26;
  v31 = [v28 thenWithBlock:v36];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100043F74;
  v33[3] = &unk_100113690;
  id v34 = @"com.apple.amsaccountsd.AMSDMultiUserService.iTunesAccountForHomeWithIdentifier";
  id v35 = v8;
  id v32 = v8;
  [v31 addFinishBlock:v33];
}

- (void)invalidateMultiUserTokenForHomeIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)AMSSetLogKey();
  v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class();
    BOOL v13 = AMSLogKey();
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    __int16 v35 = 2114;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.invalidateMultiUserTokenForHomeIdentifier"];
  v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = AMSLogKey();
    v19 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v17;
    __int16 v33 = 2114;
    id v34 = v18;
    __int16 v35 = 2114;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invalidating a multi-user token. homeIdentifier = %{public}@", buf, 0x20u);
  }
  v20 = [(AMSDMultiUserService *)self multiUserController];
  v21 = [v20 homeManager];
  v22 = [v21 homeWithHomeIdentifier:v7];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100044470;
  v29[3] = &unk_100111F48;
  id v30 = v20;
  id v23 = v20;
  id v24 = [v22 thenWithBlock:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100044760;
  v26[3] = &unk_1001136E0;
  id v27 = @"com.apple.amsaccountsd.AMSDMultiUserService.invalidateMultiUserTokenForHomeIdentifier";
  id v28 = v8;
  id v25 = v8;
  [v24 addFinishBlock:v26];
}

- (void)refreshAfterTimeInterval:(double)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = (id)AMSSetLogKey();
  id v9 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    BOOL v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.refresh"];
  v14 = [[AMSDRefreshMultiUserOptions alloc] initWithReason:@"amstool"];
  [(AMSDRefreshMultiUserOptions *)v14 setSchedulingInterval:a3];
  [(AMSDRefreshMultiUserOptions *)v14 setThrottlingInterval:a3];
  [(AMSDRefreshMultiUserOptions *)v14 setShouldUseCloudData:0];
  v15 = [(AMSDMultiUserService *)self multiUserController];
  v16 = [v15 refreshWithOptions:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100044BEC;
  v18[3] = &unk_100113708;
  v19 = @"com.apple.amsaccountsd.AMSDMultiUserService.refresh";
  id v20 = v7;
  id v17 = v7;
  [v16 addFinishBlock:v18];
}

- (void)setiTunesAccount:(id)a3 forHomeWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (id)AMSSetLogKey();
  BOOL v13 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v13)
  {
    BOOL v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class();
    v16 = AMSLogKey();
    id v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v15;
    __int16 v39 = 2114;
    id v40 = v16;
    __int16 v41 = 2114;
    os_signpost_id_t v42 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.setiTunesAccountForHomeWithIdentifier"];
  v18 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v18)
  {
    v18 = +[AMSLogConfig sharedConfig];
  }
  v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    v21 = AMSLogKey();
    uint64_t v22 = AMSHashIfNeeded();
    __int16 v23 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v38 = v20;
    __int16 v39 = 2114;
    id v40 = v21;
    __int16 v41 = 2114;
    os_signpost_id_t v42 = v22;
    __int16 v43 = 2114;
    __int16 v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting the iTunes account used by a home. account = %{public}@ | homeIdentifier = %{public}@", buf, 0x2Au);
  }
  id v24 = [(AMSDMultiUserService *)self multiUserController];
  __int16 v25 = [v24 homeManager];
  id v26 = [v25 homeWithHomeIdentifier:v10];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100045018;
  v34[3] = &unk_100113640;
  id v35 = v24;
  id v36 = v9;
  id v27 = v9;
  id v28 = v24;
  v29 = [v26 continueWithBlock:v34];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000451B8;
  v31[3] = &unk_100113618;
  uint64_t v32 = @"com.apple.amsaccountsd.AMSDMultiUserService.setiTunesAccountForHomeWithIdentifier";
  id v33 = v11;
  id v30 = v11;
  [v29 addFinishBlock:v31];
}

- (void)updateMultiUserTokenForAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)AMSSetLogKey();
  id v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = objc_opt_class();
    BOOL v13 = AMSLogKey();
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v12;
    __int16 v38 = 2114;
    __int16 v39 = v13;
    __int16 v40 = 2114;
    __int16 v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDMultiUserService.updateMultiUserTokenForAccount"];
  uint64_t v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v15)
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = AMSLogKey();
    v19 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v17;
    __int16 v38 = 2114;
    __int16 v39 = v18;
    __int16 v40 = 2114;
    __int16 v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Generating new multi-user tokens. account = %{public}@", buf, 0x20u);
  }
  uint64_t v20 = [(AMSDMultiUserService *)self multiUserController];
  v21 = [v20 cloudContainer];
  uint64_t v22 = [v21 privateDatabase];

  __int16 v23 = [v22 fetchRecordZones];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000455D0;
  v32[3] = &unk_100113850;
  id v33 = v22;
  id v34 = v7;
  id v35 = v20;
  id v24 = v20;
  id v25 = v7;
  id v26 = v22;
  id v27 = [v23 continueWithBlock:v32];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100046420;
  v29[3] = &unk_100113878;
  id v30 = @"com.apple.amsaccountsd.AMSDMultiUserService.updateMultiUserTokenForAccount";
  id v31 = v8;
  id v28 = v8;
  [v27 addFinishBlock:v29];
}

+ (id)_sanitizeError:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "ams_underlyingError");
  if (v5)
  {
    v6 = objc_msgSend(v4, "ams_underlyingError");
    id v7 = [a1 _sanitizeError:v6];
  }
  else
  {
    id v7 = 0;
  }

  if (v4)
  {
    id v8 = [v4 domain];
    [v4 code];
    id v9 = objc_msgSend(v4, "ams_title");
    id v10 = objc_msgSend(v4, "ams_message");
    id v11 = AMSCustomError();
  }
  else
  {
    id v11 = AMSError();
  }

  return v11;
}

- (void)multiUserTokenForAccount:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, id))a4;
  id v5 = (id)AMSSetLogKey();
  AMSError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);
}

- (AMSDMultiUserController)multiUserController
{
  return self->_multiUserController;
}

- (void).cxx_destruct
{
}

@end