@interface AMSDClientCertificateTask
- (AMSDClientCertificateTask)initWithOptions:(id)a3;
- (AMSKeychainOptions)options;
- (id)_baaOptionsWithOptions:(id)a3 error:(id *)a4;
- (id)performClientCertChainRequest;
- (void)setOptions:(id)a3;
@end

@implementation AMSDClientCertificateTask

- (AMSDClientCertificateTask)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDClientCertificateTask;
  v6 = [(AMSDClientCertificateTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (id)performClientCertChainRequest
{
  if (DeviceIdentityIsSupported())
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc((Class)AMSMutableLazyPromise);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000203D0;
    v7[3] = &unk_1001121E8;
    objc_copyWeak(&v8, &location);
    id v4 = [v3 initWithBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = AMSError();
    id v4 = +[AMSPromise promiseWithError:v5];
  }
  return v4;
}

- (id)_baaOptionsWithOptions:(id)a3 error:(id *)a4
{
  v6 = AMSSetLogKeyIfNeeded();
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [(AMSDClientCertificateTask *)self options];
  id v20 = 0;
  id v9 = +[AMSKeychain createAccessControlRefWithOptions:v8 error:&v20];
  id v10 = v20;

  if (v9)
  {
    if (!v10) {
      goto LABEL_14;
    }
    v11 = +[AMSLogConfig sharedAttestationConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      v25 = v6;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Create Cert Chain: ACL creation failed with error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14 = +[AMSLogConfig sharedAttestationConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Create Cert Chain: ACL creation failed", buf, 0x16u);
    }

    AMSError();
    v11 = v10;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kMAOptionsBAAIgnoreExistingKeychainItems];
  [v7 setObject:v9 forKeyedSubscript:kMAOptionsBAAAccessControls];

  [v7 setObject:&off_10011BE60 forKeyedSubscript:kMAOptionsBAANetworkTimeoutInterval];
  v21[0] = kMAOptionsBAAOIDAccessControls;
  v21[1] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v17 = +[NSArray arrayWithObjects:v21 count:2];
  [v7 setObject:v17 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];

  if (a4) {
    *a4 = v10;
  }
  id v18 = [v7 copy];

  return v18;
}

- (AMSKeychainOptions)options
{
  return (AMSKeychainOptions *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end