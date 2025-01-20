@interface AMSDBundlePushRegisterTask
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4;
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5;
+ (BOOL)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5;
+ (id)_createCriteriaWithToken:(id)a3;
+ (id)_sharedTokenLock;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5;
- (ACAccount)account;
- (AMSBag)bag;
- (AMSDBundlePushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6;
- (NSData)token;
- (NSString)environment;
- (id)perform;
- (void)_updateCachedCriteriaWithToken:(id)a3;
@end

@implementation AMSDBundlePushRegisterTask

- (AMSDBundlePushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSDBundlePushRegisterTask;
  v15 = [(AMSDBundlePushRegisterTask *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a6);
    objc_storeStrong((id *)&v16->_environment, a5);
    objc_storeStrong((id *)&v16->_token, a4);
  }

  return v16;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E7C4;
  v4[3] = &unk_100112020;
  v4[4] = self;
  v2 = [(AMSDBundlePushRegisterTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

+ (BOOL)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    id v12 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v19 = objc_opt_class();
    v15 = AMSLogKey();
    v16 = [v8 username];
    v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v19;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v17;
    objc_super v18 = "%{public}@: [%{public}@] No account, environment or token to perform registration. (env: %{public}@, dsid: %@)";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);

LABEL_19:
LABEL_20:
    char v22 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v8, "ams_isLocalAccount") & 1) == 0)
  {
    id v12 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v20 = objc_opt_class();
    v15 = AMSLogKey();
    v21 = objc_msgSend(v8, "ams_DSID");
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v20;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Account is not a local account. (env: %{public}@, dsid: %@)", buf, 0x2Au);

    goto LABEL_19;
  }
  if ([a1 _shouldThrottleForAccount:v8 environment:v9])
  {
    id v12 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    v16 = [v8 username];
    v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v14;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    id v37 = v17;
    __int16 v38 = 2114;
    id v39 = v9;
    objc_super v18 = "%{public}@: [%{public}@] Throttling registration for account: %{public}@ environment: %{public}@";
    goto LABEL_14;
  }
  id v12 = [a1 _createCriteriaWithToken:v11];
  v24 = objc_msgSend(v8, "ams_registerSuccessCriteria");
  id v13 = [v24 objectForKeyedSubscript:v9];

  unsigned int v25 = [v13 isEqualToString:v12];
  if (v25)
  {
    v26 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v26)
    {
      v26 = +[AMSLogConfig sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      v28 = AMSLogKey();
      v31 = [v8 username];
      v29 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v30;
      __int16 v34 = 2114;
      v35 = v28;
      __int16 v36 = 2114;
      id v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Already posted registration for %{public}@", buf, 0x20u);
    }
  }
  char v22 = v25 ^ 1;
LABEL_21:

  return v22;
}

+ (id)_createCriteriaWithToken:(id)a3
{
  id v3 = a3;
  v4 = +[AMSDevice deviceName];
  v5 = +[AMSDevice buildVersion];
  v6 = [v3 base64EncodedStringWithOptions:0];

  v7 = +[NSString stringWithFormat:@"<bundle; %@; %@; %@>", v4, v5, v6];

  return v7;
}

+ (id)_sharedTokenLock
{
  if (qword_100130270 != -1) {
    dispatch_once(&qword_100130270, &stru_100112148);
  }
  v2 = (void *)qword_100130278;
  return v2;
}

+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  LOBYTE(a1) = objc_msgSend(a1, "_shouldThrottleForAccount:environment:currentTimestamp:", v7, v6);

  return (char)a1;
}

+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v8, "ams_pushRegistrationThrottleMap");
  id v10 = objc_msgSend(v8, "ams_DSID");

  id v11 = +[NSString stringWithFormat:@"bundle-%@-%@", v10, v7];

  id v12 = [v9 objectForKeyedSubscript:v11];
  [v12 doubleValue];
  BOOL v14 = a5 - v13 < 3600.0;

  return v14;
}

- (void)_updateCachedCriteriaWithToken:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDBundlePushRegisterTask *)self account];
  id v6 = objc_msgSend(v5, "ams_registerSuccessCriteria");
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v16 = v9;

  id v10 = [(id)objc_opt_class() _createCriteriaWithToken:v4];

  id v11 = [(AMSDBundlePushRegisterTask *)self environment];
  [v16 setObject:v10 forKeyedSubscript:v11];

  id v12 = [(AMSDBundlePushRegisterTask *)self account];
  objc_msgSend(v12, "ams_setRegisterSuccessCriteria:", v16);

  double v13 = +[ACAccountStore ams_sharedAccountStore];
  BOOL v14 = [(AMSDBundlePushRegisterTask *)self account];
  id v15 = objc_msgSend(v13, "ams_saveAccount:", v14);
}

+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _updateThrottleForAccount:v7 environment:v6 throttleTime:v8];
}

+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5
{
  id v19 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_msgSend(v19, "ams_pushRegistrationThrottleMap");
  id v10 = [v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  double v13 = v12;

  BOOL v14 = objc_msgSend(v19, "ams_DSID");
  id v15 = +[NSString stringWithFormat:@"bundle-%@-%@", v14, v8];

  [v13 setObject:v7 forKeyedSubscript:v15];
  id v16 = [v13 copy];
  objc_msgSend(v19, "ams_setPushRegistrationThrottleMap:", v16);

  v17 = +[ACAccountStore ams_sharedAccountStore];
  id v18 = objc_msgSend(v17, "ams_saveAccount:", v19);

  +[AMSStorage amsd_setPushRegistrationThrottleMap:0];
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end