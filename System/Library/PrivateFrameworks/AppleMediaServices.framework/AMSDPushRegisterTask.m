@interface AMSDPushRegisterTask
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4;
+ (BOOL)_shouldThrottleForAccount:(id)a3 environment:(id)a4 currentTimestamp:(double)a5;
+ (id)_createCriteriaWithToken:(id)a3;
+ (id)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4;
+ (void)_updateThrottleForAccount:(id)a3 environment:(id)a4 throttleTime:(id)a5;
- (ACAccount)account;
- (AMSBag)bag;
- (AMSDPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6;
- (NSData)token;
- (NSString)environment;
- (id)perform;
- (void)_updateCachedCriteriaWithToken:(id)a3;
@end

@implementation AMSDPushRegisterTask

- (AMSDPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSDPushRegisterTask;
  v15 = [(AMSDPushRegisterTask *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    v17 = (NSData *)[v12 copy];
    token = v16->_token;
    v16->_token = v17;

    v19 = (NSString *)[v13 copy];
    environment = v16->_environment;
    v16->_environment = v19;

    objc_storeStrong((id *)&v16->_bag, a6);
  }

  return v16;
}

- (id)perform
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051AD0;
  v5[3] = &unk_100111EF8;
  v5[4] = self;
  v2 = [(AMSDPushRegisterTask *)self performTaskWithPromiseBlock:v5];
  v3 = [v2 binaryPromiseAdapter];

  return v3;
}

+ (id)shouldPerformForAccount:(id)a3 environment:(id)a4 token:(id)a5
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
      goto LABEL_25;
    }
    v18 = AMSLogKey();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = v19;
    if (v18)
    {
      uint64_t v28 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v20, v28];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v19];
    v21 = };
    v24 = AMSHashIfNeeded();
    v25 = AMSHashIfNeeded();
    v26 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    v35 = v21;
    __int16 v36 = 2114;
    v37 = v24;
    __int16 v38 = 2114;
    v39 = v25;
    __int16 v40 = 2114;
    v41 = v26;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@No account, environment or token to perform registration. Skipping registration. environment: %{public}@ | account: %{public}@ | token: %{public}@)", buf, 0x2Au);
    if (v18)
    {

      v21 = (void *)v28;
    }

    goto LABEL_24;
  }
  if (!objc_msgSend(v8, "ams_isLocalAccount"))
  {
    objc_super v22 = +[AMSPushHandler accountIsEligibleForPushNotifications:v8 accountStore:0];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100052874;
    v29[3] = &unk_100113F20;
    id v33 = a1;
    id v30 = v8;
    id v31 = v9;
    id v32 = v11;
    v23 = [v22 thenWithBlock:v29];

    goto LABEL_26;
  }
  id v12 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = AMSLogKey();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = v15;
    if (v14)
    {
      AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] ", v16, a1];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v15];
    v17 = };
    v24 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v35 = v17;
    __int16 v36 = 2114;
    v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Not posting token for the local account. (env: %{public}@)", buf, 0x16u);
    if (v14)
    {

      v17 = a1;
    }

LABEL_24:
  }
LABEL_25:

  v23 = +[AMSPromise promiseWithResult:&__kCFBooleanFalse];
LABEL_26:

  return v23;
}

+ (id)_createCriteriaWithToken:(id)a3
{
  id v3 = a3;
  v4 = +[AMSDevice deviceName];
  v5 = +[AMSDevice buildVersion];
  v6 = [v3 base64EncodedStringWithOptions:0];

  v7 = +[NSString stringWithFormat:@"<%@; %@; %@>", v4, v5, v6];

  return v7;
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

  id v11 = +[NSString stringWithFormat:@"%@-%@", v10, v7];

  id v12 = [v9 objectForKeyedSubscript:v11];
  [v12 doubleValue];
  BOOL v14 = a5 - v13 < 3600.0;

  return v14;
}

- (void)_updateCachedCriteriaWithToken:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDPushRegisterTask *)self account];
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

  id v11 = [(AMSDPushRegisterTask *)self environment];
  [v16 setObject:v10 forKeyedSubscript:v11];

  id v12 = [(AMSDPushRegisterTask *)self account];
  objc_msgSend(v12, "ams_setRegisterSuccessCriteria:", v16);

  double v13 = +[ACAccountStore ams_sharedAccountStore];
  BOOL v14 = [(AMSDPushRegisterTask *)self account];
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
  id v15 = +[NSString stringWithFormat:@"%@-%@", v14, v8];

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