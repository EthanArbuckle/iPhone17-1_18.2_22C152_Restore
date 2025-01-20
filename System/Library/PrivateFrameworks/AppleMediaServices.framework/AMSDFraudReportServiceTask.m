@interface AMSDFraudReportServiceTask
+ (id)determineAccountForAccount:(id)a3;
+ (id)grandSlamTokenIdentifierForAuthenticationTokenType:(unint64_t)a3;
+ (id)performSilentAuthAndFetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4;
+ (id)requestBodyParametersForRequest:(id)a3 odiAssessmentProvider:(id)a4;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4 initialAuthTokenProvider:(id)a5 authTokenRefreshProvider:(id)a6 odiAssessmentProvider:(id)a7 deviceIdentitySigningProvider:(id)a8;
- (id)appendTokenIfNeededToRequest:(id)a3 forAccount:(id)a4 tokenIdentifier:(id)a5;
- (id)fetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4;
- (id)handleExpiredAuthenticationTokenErrorWithResult:(id)a3 error:(id)a4 forRequest:(id)a5 account:(id)a6 tokenIdentifier:(id)a7;
- (id)performReceiveFraudReportForServiceRequest:(id)a3;
- (id)requestEncoderWithAccount:(id)a3;
@end

@implementation AMSDFraudReportServiceTask

- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4 initialAuthTokenProvider:(id)a5 authTokenRefreshProvider:(id)a6 odiAssessmentProvider:(id)a7 deviceIdentitySigningProvider:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v16 || !v17 || !v18 || !v19 || (v21 = v20) == 0)
  {
    id v33 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"bag, authenticationTokenRefreshProvider, odiAssessmentProvider and deviceIdentitySigningProvider must all be non-nil" userInfo:0];
    objc_exception_throw(v33);
  }
  v34.receiver = self;
  v34.super_class = (Class)AMSDFraudReportServiceTask;
  v22 = [(AMSDFraudReportServiceTask *)&v34 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_account, a3);
    objc_storeStrong((id *)&v23->_bag, a4);
    id v24 = objc_retainBlock(v17);
    id initialAuthTokenProvider = v23->_initialAuthTokenProvider;
    v23->_id initialAuthTokenProvider = v24;

    id v26 = objc_retainBlock(v18);
    id authTokenRefreshProvider = v23->_authTokenRefreshProvider;
    v23->_id authTokenRefreshProvider = v26;

    id v28 = objc_retainBlock(v19);
    id odiAssessmentProvider = v23->_odiAssessmentProvider;
    v23->_id odiAssessmentProvider = v28;

    id v30 = objc_retainBlock(v21);
    id deviceIdentitySigningProvider = v23->_deviceIdentitySigningProvider;
    v23->_id deviceIdentitySigningProvider = v30;
  }
  return v23;
}

- (AMSDFraudReportServiceTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F46C;
  v10[3] = &unk_100112960;
  objc_copyWeak(&v11, &location);
  v8 = [(AMSDFraudReportServiceTask *)self initWithAccount:v6 bag:v7 initialAuthTokenProvider:&stru_1001128D8 authTokenRefreshProvider:&stru_1001128F8 odiAssessmentProvider:&stru_100112938 deviceIdentitySigningProvider:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (id)performReceiveFraudReportForServiceRequest:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F5F4;
  v6[3] = &unk_100112AA0;
  id v7 = self;
  id v8 = a3;
  id v3 = v8;
  v4 = [(AMSDFraudReportServiceTask *)v7 performTaskWithPromiseBlock:v6];

  return v4;
}

- (id)handleExpiredAuthenticationTokenErrorWithResult:(id)a3 error:(id)a4 forRequest:(id)a5 account:(id)a6 tokenIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    id v17 = [v12 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    id v23 = [v18 statusCode];
    if (v23 == (id)401) {
      goto LABEL_9;
    }
    uint64_t v22 = +[AMSPromise promiseWithResult:v12];
LABEL_15:
    id v30 = (void *)v22;
    goto LABEL_16;
  }
  if (!AMSErrorIsEqual()
    || ([v13 userInfo],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v19 objectForKeyedSubscript:AMSErrorUserInfoKeyStatusCode],
        id v20 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v21 = [v20 isEqual:&off_10011BE78],
        v20,
        v19,
        (v21 & 1) == 0))
  {
    uint64_t v22 = +[AMSPromise promiseWithError:v13];
    goto LABEL_15;
  }
LABEL_9:
  id v24 = AMSSetLogKeyIfNeeded();
  v25 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v25)
  {
    v25 = +[AMSLogConfig sharedConfig];
  }
  id v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v37 = (id)objc_opt_class();
    __int16 v38 = 2114;
    v39 = v24;
    id v27 = v37;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fraud report request failed, server reports authentication token as expired. Attempting silent auth.", buf, 0x16u);
  }
  id v28 = (*((void (**)(void))self->_authTokenRefreshProvider + 2))();
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100030828;
  v32[3] = &unk_100112AC8;
  v32[4] = self;
  id v33 = v24;
  id v34 = v13;
  id v35 = v14;
  id v29 = v24;
  id v30 = [v28 continueWithBlock:v32];

LABEL_16:
  return v30;
}

+ (id)determineAccountForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = AMSAccountMediaTypeProduction;
    id v6 = +[ACAccountStore ams_sharedAccountStore];
    id v7 = objc_msgSend(v6, "ams_iTunesAccountForAccount:forMediaType:createIfNeeded:", v4, v5, 1);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100030BCC;
    v11[3] = &unk_100112AF0;
    id v13 = a1;
    id v12 = v4;
    id v8 = [v7 continueWithBlock:v11];
  }
  else
  {
    v9 = +[ACAccountStore ams_sharedAccountStore];
    id v8 = objc_msgSend(v9, "ams_fetchLocaliTunesAccount");
  }
  return v8;
}

+ (id)grandSlamTokenIdentifierForAuthenticationTokenType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"com.apple.gs.tdmv2.auth";
  }
  if (a3)
  {
    unsigned int v5 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v6 = +[AMSLogConfig sharedFraudReportConfig];
    id v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = AMSSetLogKeyIfNeeded();
        int v13 = 138543874;
        id v14 = a1;
        __int16 v15 = 2114;
        id v16 = v9;
        __int16 v17 = 2050;
        unint64_t v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown authentication token type (%{public}lu) passed, using non-JWT token identifier", (uint8_t *)&v13, 0x20u);
      }
      id v7 = +[NSNotificationCenter defaultCenter];
      v10 = +[AMSLogConfig sharedFraudReportConfig];
      [v7 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v10 userInfo:0];
    }
    else
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      v10 = [v7 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        id v12 = AMSSetLogKeyIfNeeded();
        int v13 = 138543874;
        id v14 = a1;
        __int16 v15 = 2114;
        id v16 = v12;
        __int16 v17 = 2050;
        unint64_t v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Unknown authentication token type (%{public}lu) passed, using non-JWT token identifier", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  return @"com.apple.gs.tdm.auth";
}

- (id)appendTokenIfNeededToRequest:(id)a3 forAccount:(id)a4 tokenIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AMSSetLogKeyIfNeeded();
  if (v9 && !objc_msgSend(v9, "ams_isLocalAccount"))
  {
    id v16 = [(AMSDFraudReportServiceTask *)self fetchTokenForAccount:v9 tokenIdentifier:v10];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000311C4;
    v18[3] = &unk_100112B18;
    id v19 = v8;
    id v20 = v10;
    __int16 v15 = [v16 continueWithBlock:v18];
  }
  else
  {
    id v12 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to look up token for no or local account", buf, 0x16u);
    }
    __int16 v15 = +[AMSPromise promiseWithResult:v8];
  }

  return v15;
}

- (id)fetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AMSSetLogKeyIfNeeded();
  id v9 = (*((void (**)(void))self->_initialAuthTokenProvider + 2))();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100031360;
  v15[3] = &unk_100112AC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  int v13 = [v9 continueWithBlock:v15];

  return v13;
}

+ (id)performSilentAuthAndFetchTokenForAccount:(id)a3 tokenIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AMSSetLogKeyIfNeeded();
  id v9 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = a1;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Token with identifier '%{public}@' not found. Attempting to perform silent auth.", buf, 0x20u);
  }

  id v11 = objc_alloc_init((Class)AMSAuthenticateOptions);
  [v11 setDebugReason:@"fraud score report"];
  [v11 setAuthenticationType:1];
  [v11 setCanMakeAccountActive:0];
  [v11 setServiceIdentifier:v7];
  id v12 = [objc_alloc((Class)AMSAuthenticateTask) initWithAccount:v6 options:v11];
  int v13 = [v12 performAuthentication];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100031700;
  v19[3] = &unk_100112B90;
  id v20 = v6;
  id v21 = v7;
  id v22 = v11;
  id v14 = v11;
  id v15 = v7;
  id v16 = v6;
  id v17 = [v13 continueWithBlock:v19];

  return v17;
}

- (id)requestEncoderWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AMSURLRequestEncoder);
  id v6 = [(AMSDFraudReportServiceTask *)self bag];
  id v7 = [v5 initWithBag:v6];

  [v7 setDialogOptions:1];
  [v7 setRequestEncoding:3];
  [v7 setUrlKnownToBeTrusted:1];
  id v8 = AMSLogKey();
  [v7 setLogUUID:v8];

  [v7 setAccount:v4];
  return v7;
}

+ (id)requestBodyParametersForRequest:(id)a3 odiAssessmentProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = AMSSetLogKeyIfNeeded();
  v31[0] = @"namespace";
  id v9 = [v7 nameSpace];
  v32[0] = v9;
  v31[1] = @"t1";
  id v10 = [v7 blindedMessage];
  v32[1] = v10;
  v31[2] = @"rs";
  id v11 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v7 reportedScore]);
  v32[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  id v13 = [v12 mutableCopy];

  id v14 = [v7 keyID];

  [v13 setObject:v14 forKeyedSubscript:@"kid"];
  if (v6)
  {
    id v15 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = a1;
      __int16 v29 = 2114;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requesting ODI assessment.", buf, 0x16u);
    }

    id v17 = objc_opt_new();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100031E1C;
    v22[3] = &unk_100112BB8;
    id v26 = a1;
    id v23 = v8;
    id v24 = v13;
    id v18 = v17;
    id v25 = v18;
    [v6 assessmentWithCompletion:v22];
    id v19 = v25;
    id v20 = v18;
  }
  else
  {
    id v20 = +[AMSPromise promiseWithResult:v13];
  }

  return v20;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_odiAssessmentProvider, 0);
  objc_storeStrong(&self->_deviceIdentitySigningProvider, 0);
  objc_storeStrong(&self->_authTokenRefreshProvider, 0);
  objc_storeStrong(&self->_initialAuthTokenProvider, 0);
}

@end