@interface UpdateRequestTask
- (NSString)requestIdentifier;
- (UpdateRequestTask)initWithRequestIdentifier:(id)a3 action:(int64_t)a4;
- (id)_parseResult:(id)a3;
- (id)_serverRequestWithUser:(id)a3 error:(id *)a4;
- (id)perform;
- (int64_t)action;
- (void)_enqueueMetricsWithKeychainError:(id)a3 usedBiometrics:(BOOL)a4 request:(id)a5 error:(id)a6;
- (void)_storeBiometricsToken:(id)a3;
@end

@implementation UpdateRequestTask

- (UpdateRequestTask)initWithRequestIdentifier:(id)a3 action:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UpdateRequestTask;
  v8 = [(UpdateRequestTask *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestIdentifier, a3);
    v9->_action = a4;
  }

  return v9;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E1E4;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(UpdateRequestTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (void)_enqueueMetricsWithKeychainError:(id)a3 usedBiometrics:(BOOL)a4 request:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v48 = a6;
  objc_super v11 = +[AMSBag sharedBag];
  uint64_t v12 = +[AMSMetrics internalInstanceUsingBag:v11];

  v47 = (void *)v12;
  if (!v8 && (!v9 || [v9 code] == (id)6))
  {
    id v13 = 0;
LABEL_17:
    id v21 = objc_alloc_init((Class)APRemoteApprovalPasswordEntryMetricsEvent);
    [v21 setEventType:@"dialog"];
    uint64_t v22 = +[Localizations stringWithKey:@"AUTHENTICATION_PROMPT_BODY_REMOTE"];
    v23 = (void *)v22;
    v24 = &stru_100039F08;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    v25 = v24;

    [v21 setProperty:v25 forBodyKey:@"message"];
    unsigned int v26 = objc_msgSend(v48, "ams_recursiveHasDomain:code:", AKAppleIDAuthenticationErrorDomain, -7003);
    v27 = @"ok";
    if (v26)
    {
      v27 = @"cancel";
      CFStringRef v28 = @"Cancel";
    }
    else
    {
      CFStringRef v28 = @"Ok";
    }
    v29 = v27;
    [v21 setProperty:v29 forBodyKey:@"actionType"];
    if ([(UpdateRequestTask *)self action]) {
      CFStringRef v30 = @"ConfirmFamilySharingPurchase.PasswordAuth.Decline";
    }
    else {
      CFStringRef v30 = @"ConfirmFamilySharingPurchase.PasswordAuth.Approve";
    }
    [v21 setProperty:v30 forBodyKey:@"dialogId"];
    [v21 setProperty:v28 forBodyKey:@"targetId"];
    v55[0] = @"targetId";
    v55[1] = @"actionType";
    v56[0] = v28;
    v56[1] = v29;
    v55[2] = @"result";
    CFStringRef v31 = @"success";
    if (v48) {
      CFStringRef v31 = @"failure";
    }
    v56[2] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
    v57 = v32;
    v33 = +[NSArray arrayWithObjects:&v57 count:1];

    [v21 setProperty:v33 forBodyKey:@"userActions"];
    id v13 = v21;
    goto LABEL_28;
  }
  id v13 = objc_alloc_init((Class)APRemoteApprovalBiometricsMetricsEvent);
  [v13 setEventType:@"dialog"];
  if ([(UpdateRequestTask *)self action]) {
    CFStringRef v14 = @"ConfirmFamilySharingPurchase.BioAuth.Decline";
  }
  else {
    CFStringRef v14 = @"ConfirmFamilySharingPurchase.BioAuth.Approve";
  }
  [v13 setProperty:v14 forBodyKey:@"dialogId"];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  if (v9)
  {
    v58[0] = @"result";
    v58[1] = @"actionType";
    v59[0] = @"failure";
    v59[1] = @"authenticate";
    v59[2] = @"Biometric";
    v58[2] = @"targetId";
    v58[3] = @"reason";
    uint64_t v16 = objc_msgSend(v9, "ams_message");
    v17 = (void *)v16;
    CFStringRef v18 = @"(null)";
    if (v16) {
      CFStringRef v18 = (const __CFString *)v16;
    }
    v59[3] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
    [v15 addObject:v19];
  }
  if (v8) {
    [v15 addObject:&off_10003AE18];
  }
  if ([v15 count])
  {
    id v20 = [v15 copy];
    [v13 setProperty:v20 forBodyKey:@"userActions"];
  }
  if (!v8) {
    goto LABEL_17;
  }
LABEL_28:
  if (v10)
  {
    v34 = +[ApproverStore sharedStore];
    v35 = [v10 uniqueIdentifier];
    v36 = [v34 approvalRequestWithRequestIdentifier:v35];

    if (v36)
    {
      if ([v36 lineOfBusiness] == (id)1)
      {
        v37 = +[ACAccountStore ams_sharedAccountStore];
        v38 = objc_msgSend(v37, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10001EE84;
        v50[3] = &unk_100038CB0;
        v39 = v47;
        id v51 = v47;
        id v52 = v13;
        [v38 addFinishBlock:v50];

LABEL_47:
        goto LABEL_48;
      }
      v43 = +[APLogConfig sharedFrameworkConfig];
      if (!v43)
      {
        v43 = +[APLogConfig sharedConfig];
      }
      v44 = [v43 OSLogObject];
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
LABEL_46:

        v39 = v47;
        [v47 enqueueEvent:v13];
        goto LABEL_47;
      }
      *(_DWORD *)buf = 138543362;
      id v54 = (id)objc_opt_class();
      id v45 = v54;
      v46 = "%{public}@: LOB is not App Store. Enqueueing standard metrics.";
    }
    else
    {
      v43 = +[APLogConfig sharedFrameworkConfig];
      if (!v43)
      {
        v43 = +[APLogConfig sharedConfig];
      }
      v44 = [v43 OSLogObject];
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 138543362;
      id v54 = (id)objc_opt_class();
      id v45 = v54;
      v46 = "%{public}@: Error - Unable to load stored Request object. Enqueueing standard metrics.";
    }
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

    goto LABEL_46;
  }
  v40 = +[APLogConfig sharedFrameworkConfig];
  if (!v40)
  {
    v40 = +[APLogConfig sharedConfig];
  }
  v41 = [v40 OSLogObject];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = (id)objc_opt_class();
    id v42 = v54;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@: Error - No request object supplied. Enqueueing standard metrics.", buf, 0xCu);
  }
  v39 = v47;
  [v47 enqueueEvent:v13];
LABEL_48:
}

- (id)_serverRequestWithUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[AMSBag sharedBag];
  BOOL v8 = [v7 updateRequestURL];

  v37[0] = @"requestId";
  id v9 = [(UpdateRequestTask *)self requestIdentifier];
  v37[1] = @"approvalStatus";
  v38[0] = v9;
  int64_t v10 = [(UpdateRequestTask *)self action];
  objc_super v11 = &off_10003ADA8;
  if (!v10) {
    objc_super v11 = &off_10003AD90;
  }
  v38[1] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  id v13 = objc_alloc_init(URLRequestEncoder);
  CFStringRef v14 = [(URLRequestEncoder *)v13 requestWithMethod:4 bagURL:v8 parameters:v12];
  id v34 = 0;
  id v15 = [v14 resultWithTimeout:&v34 error:60.0];
  id v16 = v34;
  if (v15)
  {
    v32 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v15;
      CFStringRef v18 = [v6 biometricsToken];
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v18, @"X-IC-TouchToken");

      v19 = [v6 DSID];
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v19, @"X-IC-DSID");

      id v20 = [v6 password];
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v20, @"X-IC-Password");

      id v21 = [v6 username];
      objc_msgSend(v17, "ap_setNullableValue:forHTTPHeaderField:", v21, @"X-IC-Username");

      uint64_t v22 = +[APLogConfig sharedDaemonConfig];
      if (!v22)
      {
        uint64_t v22 = +[APLogConfig sharedConfig];
      }
      v23 = objc_msgSend(v22, "OSLogObject", a4);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        id v25 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
      }
      unsigned int v26 = +[URLSession sharedSession];
      v27 = [v26 dataTaskPromiseWithRequest:v17];

      id v33 = v16;
      CFStringRef v28 = [v27 resultWithTimeout:&v33 error:60.0];
      id v29 = v33;

      a4 = v31;
    }
    else
    {
      APError();
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v28 = 0;
      id v17 = v16;
    }

    id v16 = v29;
    BOOL v8 = v32;
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
    CFStringRef v28 = 0;
    if (a4) {
LABEL_14:
    }
      *a4 = v16;
  }

  return v28;
}

- (id)_parseResult:(id)a3
{
  v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (!v5)
  {
    v19 = APError();
    goto LABEL_43;
  }
  id v6 = [v5 objectForKeyedSubscript:@"status"];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 integerValue];
    uint64_t v8 = +[APLogConfig sharedDaemonConfig];
    id v9 = (void *)v8;
    if (!v7)
    {
      if (!v8)
      {
        id v9 = +[APLogConfig sharedConfig];
      }
      id v20 = [v9 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = (id)objc_opt_class();
        id v21 = v29;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Success status code", buf, 0xCu);
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:@"touchToken"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }

      [(UpdateRequestTask *)self _storeBiometricsToken:v23];
      v19 = 0;
      goto LABEL_42;
    }
    if (!v8)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    int64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2050;
      id v31 = v7;
      id v11 = v29;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Error status code. Status code: %{public}ld", buf, 0x16u);
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:@"errorNumber"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v19 = APError();
LABEL_41:

      goto LABEL_42;
    }
    id v13 = [v12 integerValue];
    if (v13 == (id)3711)
    {
      CFStringRef v14 = +[APLogConfig sharedDaemonConfig];
      if (!v14)
      {
        CFStringRef v14 = +[APLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v29 = v24;
      id v17 = v24;
      CFStringRef v18 = "%{public}@: Previously declined error code";
    }
    else if (v13 == (id)3710)
    {
      CFStringRef v14 = +[APLogConfig sharedDaemonConfig];
      if (!v14)
      {
        CFStringRef v14 = +[APLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      id v25 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v29 = v25;
      id v17 = v25;
      CFStringRef v18 = "%{public}@: Previously approved error code";
    }
    else
    {
      if (v13 != (id)3709)
      {
        unsigned int v26 = +[NSString stringWithFormat:@"Server response contains error. Error code: %ld", v13];
        v19 = APError();

        goto LABEL_41;
      }
      CFStringRef v14 = +[APLogConfig sharedDaemonConfig];
      if (!v14)
      {
        CFStringRef v14 = +[APLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v29 = v16;
      id v17 = v16;
      CFStringRef v18 = "%{public}@: Request expired error code";
    }
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

LABEL_39:
    v19 = 0;
    goto LABEL_41;
  }
  v19 = APError();
LABEL_42:

LABEL_43:
  return v19;
}

- (void)_storeBiometricsToken:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[APLogConfig sharedDaemonConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v7 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometrics token available", (uint8_t *)&v10, 0xCu);
    }
    +[BiometricsHandler storeToken:v3];
  }
  else
  {
    if (!v4)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometrics token not available", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
}

@end