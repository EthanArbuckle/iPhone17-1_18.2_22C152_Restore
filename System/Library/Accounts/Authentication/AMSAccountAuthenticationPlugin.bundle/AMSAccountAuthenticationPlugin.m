uint64_t sub_3170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_39D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_39EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) logKey];
  id v5 = (id)AMSSetLogKey();

  v6 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verifying credentials.", buf, 0x16u);
  }
  v10 = [AMSVerifyCredentialsTask alloc];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v13 = [*(id *)(a1 + 32) clientInfo];
  v14 = +[AMSBag ams_bagForProcessInfo:v13];
  v15 = [(AMSVerifyCredentialsTask *)v10 initWithAccount:v11 accountStore:v12 bag:v14 options:*(void *)(a1 + 32)];

  v16 = [(AMSVerifyCredentialsTask *)v15 performTask];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_3C0C;
  v18[3] = &unk_14448;
  id v19 = v3;
  id v17 = v3;
  [v16 resultWithCompletion:v18];
}

uint64_t sub_3C0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3C1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3D08;
    block[3] = &unk_144C0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t sub_3D08(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

AMSSyncAccountFlagsResult *sub_48C4(uint64_t a1, void *a2)
{
  v4 = [*(id *)(a1 + 32) account];
  unsigned int v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    AMSError();
    id v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    [*(id *)(a1 + 32) account];
    id v11 = v72 = a2;
    id v12 = AMSHashIfNeeded();
    v13 = [*(id *)(a1 + 32) account];
    v14 = objc_msgSend(v13, "ams_accountFlags");
    v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v77 = v9;
    __int16 v78 = 2114;
    v79 = v10;
    __int16 v80 = 2114;
    v81 = v12;
    __int16 v82 = 2114;
    v83 = v15;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    a2 = v72;
  }

  id v16 = objc_alloc((Class)AMSURLRequestEncoder);
  id v17 = [*(id *)(a1 + 32) bag];
  id v18 = [v16 initWithBag:v17];

  id v19 = [*(id *)(a1 + 32) account];
  [v18 setAccount:v19];

  [v18 setRequestEncoding:3];
  v20 = AMSLogKey();
  [v18 setLogUUID:v20];

  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v22 = [*(id *)(a1 + 32) account];
  uint64_t v23 = objc_msgSend(v22, "ams_accountFlags");
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = &__NSDictionary0__struct;
  }
  [v21 setObject:v25 forKeyedSubscript:@"accountFlags"];

  v26 = +[AMSDevice deviceGUID];
  objc_msgSend(v21, "ams_setNullableObject:forKey:", v26, AMSQueryParameterKeyGUID);

  v27 = [*(id *)(a1 + 32) bag];
  v28 = [v27 URLForKey:@"account-flags"];

  if (_os_feature_enabled_impl())
  {
    v29 = v18;
    uint64_t v30 = 2;
    v31 = v28;
    id v32 = 0;
  }
  else
  {
    v29 = v18;
    uint64_t v30 = 4;
    v31 = v28;
    id v32 = v21;
  }
  v33 = [v29 requestWithMethod:v30 bagURL:v31 parameters:v32];
  id v75 = 0;
  v34 = [v33 resultWithError:&v75];
  id v35 = v75;
  if (v35)
  {
    id v36 = v35;
    v37 = 0;
  }
  else
  {
    v71 = v28;
    v38 = +[AMSURLSession defaultSession];
    v39 = v34;
    v40 = v38;
    v73 = v39;
    v41 = objc_msgSend(v38, "dataTaskPromiseWithRequest:");
    id v74 = 0;
    v37 = [v41 resultWithError:&v74];
    id v36 = v74;

    if (!v36)
    {
      v70 = v37;
      v44 = [v37 object];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v42 = v44;
      }
      else {
        id v42 = 0;
      }
      v34 = v73;

      uint64_t v45 = objc_msgSend(v42, "ams_accountFlags");
      uint64_t v46 = +[AMSLogConfig sharedAccountsConfig];
      v47 = (void *)v46;
      if (v45)
      {
        if (!v46)
        {
          v47 = +[AMSLogConfig sharedConfig];
        }
        v48 = [v47 OSLogObject];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = objc_opt_class();
          v50 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v77 = v49;
          __int16 v78 = 2114;
          v79 = v50;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);
        }
        id v6 = [[AMSSyncAccountFlagsResult alloc] initWithAccountFlags:v45];
        v51 = [*(id *)(a1 + 32) account];
        uint64_t v52 = objc_msgSend(v51, "ams_accountFlags");
        v53 = (void *)v45;
        v54 = (void *)v52;
        v68 = v53;
        unsigned __int8 v55 = [v53 isEqualToDictionary:v52];

        v37 = v70;
        v28 = v71;
        if ((v55 & 1) == 0)
        {
          v56 = +[AMSLogConfig sharedAccountsConfig];
          if (!v56)
          {
            v56 = +[AMSLogConfig sharedConfig];
          }
          v57 = [v56 OSLogObject];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            log = v57;
            uint64_t v58 = objc_opt_class();
            v59 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v77 = v58;
            v57 = log;
            __int16 v78 = 2114;
            v79 = v59;
            _os_log_impl(&dword_0, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v37 = v70;
          }

          v60 = [*(id *)(a1 + 32) account];
          objc_msgSend(v60, "ams_setAccountFlags:", v68);

          v61 = +[ACAccountStore ams_sharedAccountStore];
          v62 = [*(id *)(a1 + 32) account];
          id v63 = objc_msgSend(v61, "ams_saveAccount:verifyCredentials:", v62, 0);
        }
        v34 = v73;
      }
      else
      {
        if (!v46)
        {
          v47 = +[AMSLogConfig sharedConfig];
        }
        v64 = [v47 OSLogObject];
        v37 = v70;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = objc_opt_class();
          v65 = AMSLogKey();
          v66 = [v70 object];
          *(_DWORD *)buf = 138543874;
          uint64_t v77 = v69;
          __int16 v78 = 2114;
          v79 = v65;
          __int16 v80 = 2114;
          v81 = v66;
          _os_log_impl(&dword_0, v64, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          v34 = v73;
        }

        AMSError();
        id v6 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v71;
      }
      goto LABEL_18;
    }
    v34 = v73;
  }
  id v42 = v36;
  id v6 = 0;
  *a2 = v42;
LABEL_18:

LABEL_19:
  return v6;
}

id sub_53CC(uint64_t a1)
{
  id v3 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = AMSLogKey();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v1 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v7, v1];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v6];
    uint64_t v8 = };
    uint64_t v9 = [*(id *)(a1 + 32) account];
    id v10 = AMSHashIfNeeded();
    id v11 = [*(id *)(a1 + 32) options];
    id v12 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting an account credential verification. account = %{public}@ | options = %{public}@", buf, 0x20u);

    if (v5)
    {

      uint64_t v8 = (void *)v1;
    }
  }
  [(id)objc_opt_class() _postAuthenticationBeganNotification];
  v13 = [*(id *)(a1 + 32) options];
  v14 = [v13 metricsIdentifier];

  if (v14)
  {
    id v15 = objc_alloc((Class)AMSAuthenticateMetricsContext);
    id v16 = [*(id *)(a1 + 32) options];
    id v17 = [*(id *)(a1 + 32) account];
    id v18 = [v15 initWithOptions:v16 account:v17];

    id v19 = [*(id *)(a1 + 32) metrics];
    id v20 = [v19 enqueueWithEvent:3 context:v18];
  }
  id v21 = [*(id *)(a1 + 32) _generatePasswordIfNeeded];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_57C0;
  v28[3] = &unk_14560;
  v28[4] = *(void *)(a1 + 32);
  __int16 v22 = [v21 thenWithBlock:v28];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_59A4;
  v27[3] = &unk_14588;
  v27[4] = *(void *)(a1 + 32);
  [v22 addFinishBlock:v27];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_5BB0;
  v26[3] = &unk_14560;
  v26[4] = *(void *)(a1 + 32);
  uint64_t v23 = [v22 thenWithBlock:v26];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_5D78;
  v25[3] = &unk_14588;
  v25[4] = *(void *)(a1 + 32);
  [v23 addFinishBlock:v25];

  return v23;
}

id sub_57C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [(id)objc_opt_class() _postAuthenticationSubmittedNotification];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = +[AMSURLSession defaultSession];
  [v5 setDelegate:v4];

  uint64_t v6 = [*(id *)(a1 + 32) bag];
  uint64_t v7 = [v6 URLForKey:@"authenticateAccount" account:v3];

  uint64_t v8 = [*(id *)(a1 + 32) _createAuthenticateRequestEncoder];
  uint64_t v9 = [*(id *)(a1 + 32) _createAuthenticateRequestForAccount:v3 URL:v7 requestEncoder:v8];

  id v10 = +[AMSURLSession defaultSession];
  id v11 = [v10 dataTaskPromiseWithRequestPromise:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_593C;
  v14[3] = &unk_14538;
  v14[4] = *(void *)(a1 + 32);
  id v12 = [v11 continueWithBlock:v14];

  return v12;
}

id sub_593C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 32) _promiseOfAccountFromResult:a2 orError:a3];
  uint64_t v4 = +[AMSPromise promiseWithPromiseResult:v3];

  return v4;
}

void sub_59A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (char *)objc_msgSend(v3, "ams_lastAuthenticationCredentialSource");
  uint64_t v5 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  uint64_t v6 = (void *)v5;
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      id v10 = AMSHashIfNeeded();
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loud auth completed, will sync data for authenticatedAccount = %{public}@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) _startDataSyncForAccount:v3];
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v6 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      v14 = AMSHashIfNeeded();
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Auth completed without prompt, no data sync for authenticatedAccount = %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

id sub_5BB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && +[AMSDevice deviceIsBundle])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [*(id *)(a1 + 32) accountStore];
    uint64_t v6 = [*(id *)(a1 + 32) bag];
    uint64_t v7 = [v4 _processAccountDeviceRequirementsForAutheniticatedAccount:v3 accountStore:v5 bag:v6];
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      uint64_t v12 = AMSHashIfNeeded();
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      __int16 v18 = 2114;
      __int16 v19 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Device doesn't meet requirments for device account info gdpr evaluation authenticatedAccount = %{public}@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v7 = +[AMSPromise promiseWithResult:v3];
  }

  return v7;
}

void sub_5D78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) options];
  uint64_t v6 = [v5 metricsIdentifier];

  if (v6)
  {
    id v7 = objc_alloc((Class)AMSAuthenticateMetricsContext);
    uint64_t v8 = [*(id *)(a1 + 32) options];
    uint64_t v9 = [*(id *)(a1 + 32) account];
    id v10 = [v7 initWithOptions:v8 account:v9];

    [v10 setError:v4];
    id v11 = [*(id *)(a1 + 32) metrics];
    uint64_t v12 = [v11 enqueueWithEvent:4 context:v10];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_5EC0;
    v13[3] = &unk_145B0;
    v13[4] = *(void *)(a1 + 32);
    [v12 resultWithCompletion:v13];
  }
}

void sub_5EC0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) metrics];
  [v1 flushEvents];
}

id sub_6678(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) options];
  unsigned int v5 = [v4 ignoreAccountConversion];

  if (v5) {
    [v3 setValue:@"true" forHTTPHeaderField:AMSHTTPHeaderIgnoreAccountConversion];
  }
  uint64_t v6 = [*(id *)(a1 + 32) options];
  id v7 = [v6 userAgent];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) options];
    uint64_t v9 = [v8 userAgent];
    [v3 setValue:v9 forHTTPHeaderField:AMSHTTPHeaderUserAgent];
  }
  id v10 = [*(id *)(a1 + 32) options];
  id v11 = [v10 userAgentSuffix];

  if (v11)
  {
    uint64_t v12 = AMSHTTPHeaderUserAgent;
    v13 = [v3 valueForHTTPHeaderField:AMSHTTPHeaderUserAgent];
    int v14 = [*(id *)(a1 + 32) options];
    uint64_t v15 = [v14 userAgentSuffix];
    __int16 v16 = +[NSString stringWithFormat:@"%@ %@", v13, v15];

    [v3 setValue:v16 forHTTPHeaderField:v12];
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_6944;
  __int16 v31 = sub_6954;
  id v32 = 0;
  __int16 v17 = [*(id *)(a1 + 32) options];
  __int16 v18 = [v17 HTTPHeaders];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_695C;
  v23[3] = &unk_14600;
  id v19 = v3;
  uint64_t v20 = *(void *)(a1 + 32);
  id v24 = v19;
  uint64_t v25 = v20;
  v26 = &v27;
  [v18 enumerateKeysAndObjectsUsingBlock:v23];

  if (v28[5]) {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
  }
  else {
  id v21 = +[AMSPromise promiseWithResult:v19];
  }

  _Block_object_dispose(&v27, 8);
  return v21;
}

void sub_692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6944(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6954(uint64_t a1)
{
}

void sub_695C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) setValue:v6 forHTTPHeaderField:v5];
  }
  else
  {
    unsigned int v7 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    uint64_t v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v11 = v18;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}@: _createAuthenticateRequestForAccount: AMSAuthenticateOptions.HTTPHeaders a contains non-string value", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v9 = +[NSNotificationCenter defaultCenter];
      uint64_t v12 = +[AMSLogConfig sharedConfig];
      [v9 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v12 userInfo:0];
    }
    else
    {
      if (!v8)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v9 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v13 = v18;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "%{public}@: _createAuthenticateRequestForAccount: AMSAuthenticateOptions.HTTPHeaders a contains non-string value", (uint8_t *)&v17, 0xCu);
      }
    }

    uint64_t v14 = AMSCustomError();
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

AMSPromise *__cdecl sub_7BF8(id a1, AMSAuthKitUpdateResult *a2)
{
  v2 = [(AMSAuthKitUpdateResult *)a2 account];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return (AMSPromise *)v3;
}

void sub_7C58(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    unsigned int v7 = AMSHashIfNeeded();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate a password for the account. error = %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_7D8C()
{
  v0 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v0)
  {
    v0 = +[AMSLogConfig sharedConfig];
  }
  id v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = objc_opt_class();
    id v3 = AMSLogKey();
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    unsigned int v7 = v3;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully generated a password for the account.", (uint8_t *)&v4, 0x16u);
  }
}

AMSPromise *__cdecl sub_7E90(id a1, NSError *a2)
{
  return +[AMSPromise promiseWithError:a2];
}

void sub_83E0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  int v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    __int16 v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Device offer registration failed. error = %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void sub_8500(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &stru_14738);
  int v4 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v4)
  {
    int v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = AMSLogKey();
    int v8 = 138544130;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    id v13 = [v2 count];
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}@:[%{public}@] Did receive %ld offers: %@", (uint8_t *)&v8, 0x2Au);
  }
  +[AMSDefaults setDidRetrieveDeviceOffers:1];
}

id sub_8660(id a1, AMSDeviceOffer *a2)
{
  return [(AMSDeviceOffer *)a2 offerIdentifier];
}

id sub_8EFC(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

void sub_8F40(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  uint64_t v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    int v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] Successfully provisioned biometrics.", (uint8_t *)&v12, 0x16u);
LABEL_10:
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    int v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      __int16 v11 = AMSHashIfNeeded();
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      int v17 = v11;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%@] Failed to provision biometrics. error = %{public}@", (uint8_t *)&v12, 0x20u);

      goto LABEL_10;
    }
  }
}

id sub_A2C4()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_19B20;
  uint64_t v7 = qword_19B20;
  if (!qword_19B20)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_B8D4;
    v3[3] = &unk_14890;
    v3[4] = &v4;
    sub_B8D4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_A390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A688(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_opt_class();
      if (v9) {
        +[NSString stringWithFormat:@"%@: [%@] ", v10, *(void *)(a1 + 32)];
      }
      else {
      uint64_t v13 = +[NSString stringWithFormat:@"%@: ", v10, v16];
      }
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed duplicate account", buf, 0xCu);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = objc_opt_class();
      if (v11) {
        +[NSString stringWithFormat:@"%@: [%@] ", v12, *(void *)(a1 + 32)];
      }
      else {
      __int16 v14 = +[NSString stringWithFormat:@"%@: ", v12, v16];
      }
      uint64_t v15 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      id v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove duplicate account. error = %{public}@", buf, 0x16u);
    }
  }
}

void sub_AF44(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (v7)
  {
    +[AMSDefaults setDidFetchBundleOwnerStatus:1];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 account];
    [v5 finishWithResult:v6];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
}

id sub_AFD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)AMSPromise);
  if ([v3 isDirty]) {
    objc_msgSend(*(id *)(a1 + 32), "ams_saveAccount:withOptions:", *(void *)(a1 + 40), 1);
  }
  else {
  id v5 = +[AMSBinaryPromise promiseWithSuccess];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_B118;
  v11[3] = &unk_14840;
  uint64_t v16 = *(void *)(a1 + 56);
  id v6 = v4;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v7 = v3;
  [v5 addFinishBlock:v11];
  uint64_t v8 = v15;
  id v9 = v6;

  return v9;
}

void sub_B118(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v18 = 138543874;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Account save failed with error %{public}@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithError:v4];
  }
  if (+[AMSProcessInfo isBuddyRunning])
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = +[AMSPromise promiseWithResult:*(void *)(a1 + 56)];
    [v9 finishWithPromise:v10];
  }
  else
  {
    uint64_t v11 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogKey();
      id v15 = AMSHashIfNeeded();
      int v18 = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      id v21 = v14;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluating device account gdpr requirements for authenticatedAccount = %{public}@", (uint8_t *)&v18, 0x20u);
    }
    id v10 = [objc_alloc((Class)AMSDeviceAccountPrivacyAcknowledgementTask) initWithAccount:*(void *)(a1 + 40) bag:*(void *)(a1 + 48)];
    uint64_t v16 = *(void **)(a1 + 32);
    int v17 = [(id)objc_opt_class() _handleBundleGDPRRequirementsForAuthenticatedAccount:*(void *)(a1 + 40) task:v10 gdprFailureAction:&stru_14818];
    [v16 finishWithPromise:v17];
  }
}

AMSBinaryPromise *__cdecl sub_B3A0(id a1, ACAccount *a2)
{
  id v2 = a2;
  id v3 = objc_alloc((Class)AMSSignOutTask);
  uint64_t v8 = v2;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];

  id v5 = [v3 initWithAccounts:v4];
  id v6 = [v5 performTask];

  return (AMSBinaryPromise *)v6;
}

Class sub_B8D4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_19B28)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_BA18;
    v3[4] = &unk_148C8;
    void v3[5] = v3;
    long long v4 = off_148B0;
    uint64_t v5 = 0;
    qword_19B28 = _sl_dlopen();
    if (!qword_19B28)
    {
      abort_report_np();
LABEL_8:
      sub_C458();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SSVSubscriptionStatusCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_19B20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BA18()
{
  uint64_t result = _sl_dlopen();
  qword_19B28 = result;
  return result;
}

uint64_t sub_C0F4()
{
  return sub_C480();
}

id sub_C1B8()
{
  uint64_t v1 = OBJC_IVAR___AMSAccountAuthenticationPluginQueue_promiseSerialQueue;
  id v2 = objc_allocWithZone((Class)sub_C490());
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AccountAuthenticationPluginQueue();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t sub_C238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_C2F4;
  v7[3] = &unk_149B8;
  long long v4 = _Block_copy(v7);
  objc_super v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_C2F4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return _swift_unknownObjectRelease(a2);
}

id sub_C398()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountAuthenticationPluginQueue();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountAuthenticationPluginQueue()
{
  return self;
}

uint64_t sub_C400()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_C438(uint64_t a1, uint64_t a2)
{
  return sub_C238(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_C440(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_C450()
{
  return swift_release();
}

void sub_C458()
{
}

uint64_t sub_C480()
{
  return dispatch thunk of PromiseSerialQueue.runPromiseBlock(_:)();
}

uint64_t sub_C490()
{
  return type metadata accessor for PromiseSerialQueue();
}

uint64_t AMSCustomError()
{
  return _AMSCustomError();
}

uint64_t AMSError()
{
  return _AMSError();
}

uint64_t AMSHashIfNeeded()
{
  return _AMSHashIfNeeded();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t AMSSetLogKey()
{
  return _AMSSetLogKey();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return _AMSSetLogKeyIfNeeded();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_HTTPHeaders(void *a1, const char *a2, ...)
{
  return _[a1 HTTPHeaders];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLForKey_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:account:");
}

id objc_msgSend__createAuthenticateRequestEncoder(void *a1, const char *a2, ...)
{
  return _[a1 _createAuthenticateRequestEncoder];
}

id objc_msgSend__createAuthenticateRequestForAccount_URL_requestEncoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAuthenticateRequestForAccount:URL:requestEncoder:");
}

id objc_msgSend__createAuthenticateRequestParametersForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAuthenticateRequestParametersForAccount:");
}

id objc_msgSend__createUpdatedAccountWithAuthenticationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createUpdatedAccountWithAuthenticationResult:");
}

id objc_msgSend__generatePasswordIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _generatePasswordIfNeeded];
}

id objc_msgSend__handleBiometricsForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBiometricsForAuthenticatedAccount:");
}

id objc_msgSend__handleBundleGDPRRequirementsForAuthenticatedAccount_task_gdprFailureAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBundleGDPRRequirementsForAuthenticatedAccount:task:gdprFailureAction:");
}

id objc_msgSend__handleDeviceOffersForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDeviceOffersForAuthenticatedAccount:");
}

id objc_msgSend__handleIDMSRetentionForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIDMSRetentionForAuthenticatedAccount:");
}

id objc_msgSend__postAuthenticationBeganNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationBeganNotification];
}

id objc_msgSend__postAuthenticationFailedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationFailedNotification];
}

id objc_msgSend__postAuthenticationSubmittedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAuthenticationSubmittedNotification];
}

id objc_msgSend__processAccountDeviceRequirementsForAutheniticatedAccount_accountStore_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAccountDeviceRequirementsForAutheniticatedAccount:accountStore:bag:");
}

id objc_msgSend__processAuthenticationFailureWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAuthenticationFailureWithResult:");
}

id objc_msgSend__processAuthenticationSuccessWithResult_authenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAuthenticationSuccessWithResult:authenticatedAccount:");
}

id objc_msgSend__promiseOfAccountFromResult_orError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promiseOfAccountFromResult:orError:");
}

id objc_msgSend__removeInactiveDuplicatesForAuthenticatedAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeInactiveDuplicatesForAuthenticatedAccount:");
}

id objc_msgSend__removeRenewCredentialsFollowUp(void *a1, const char *a2, ...)
{
  return _[a1 _removeRenewCredentialsFollowUp];
}

id objc_msgSend__retainIDMS_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retainIDMS:forAccount:");
}

id objc_msgSend__shouldUpdateBundleOwnerStatusForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUpdateBundleOwnerStatusForAccount:");
}

id objc_msgSend__startDataSyncForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDataSyncForAccount:");
}

id objc_msgSend__updateAccount_withLegacyOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAccount:withLegacyOptions:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAuthSyncForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAuthSyncForAccountID:");
}

id objc_msgSend_accountMediaType(void *a1, const char *a2, ...)
{
  return _[a1 accountMediaType];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountWasOriginallyActive(void *a1, const char *a2, ...)
{
  return _[a1 accountWasOriginallyActive];
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allowPasswordGeneration(void *a1, const char *a2, ...)
{
  return _[a1 allowPasswordGeneration];
}

id objc_msgSend_allowServerDialogs(void *a1, const char *a2, ...)
{
  return _[a1 allowServerDialogs];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_accountFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountFlags");
}

id objc_msgSend_ams_accountID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountID");
}

id objc_msgSend_ams_addCookiesForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addCookiesForResult:");
}

id objc_msgSend_ams_addCookiesForResult_account_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_addCookiesForResult:account:error:");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_anyWithTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_anyWithTest:");
}

id objc_msgSend_ams_bagForProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_bagForProcessInfo:");
}

id objc_msgSend_ams_cookies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_cookies");
}

id objc_msgSend_ams_creditsString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_creditsString");
}

id objc_msgSend_ams_errorByAddingUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_errorByAddingUserInfo:");
}

id objc_msgSend_ams_errorCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_errorCode");
}

id objc_msgSend_ams_firstName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_firstName");
}

id objc_msgSend_ams_freePasswordPromptSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_freePasswordPromptSetting");
}

id objc_msgSend_ams_iTunesAccountWithAltDSID_DSID_username_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:");
}

id objc_msgSend_ams_isActiveForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isActiveForMediaType:");
}

id objc_msgSend_ams_isBundleOwner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isBundleOwner");
}

id objc_msgSend_ams_isDuplicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isDuplicate:");
}

id objc_msgSend_ams_isLocalAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isLocalAccount");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_isSandboxAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isSandboxAccount");
}

id objc_msgSend_ams_lastAuthenticationCredentialSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_lastAuthenticationCredentialSource");
}

id objc_msgSend_ams_lastName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_lastName");
}

id objc_msgSend_ams_localiTunesAccountForAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:");
}

id objc_msgSend_ams_mapWithTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mapWithTransform:");
}

id objc_msgSend_ams_mergePrivacyAcknowledgement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mergePrivacyAcknowledgement:");
}

id objc_msgSend_ams_nonEmptyComponentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_nonEmptyComponentsJoinedByString:");
}

id objc_msgSend_ams_objectForCaseInsensitiveKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_objectForCaseInsensitiveKey:");
}

id objc_msgSend_ams_paidPasswordPromptSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_paidPasswordPromptSetting");
}

id objc_msgSend_ams_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_password");
}

id objc_msgSend_ams_privacyAcknowledgement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_privacyAcknowledgement");
}

id objc_msgSend_ams_sanitizedForSecureCoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sanitizedForSecureCoding");
}

id objc_msgSend_ams_saveAccount_verifyCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_saveAccount:verifyCredentials:");
}

id objc_msgSend_ams_saveAccount_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_saveAccount:withOptions:");
}

id objc_msgSend_ams_secureToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_secureToken");
}

id objc_msgSend_ams_setAccountFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAccountFlags:");
}

id objc_msgSend_ams_setActive_forMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setActive:forMediaType:");
}

id objc_msgSend_ams_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAltDSID:");
}

id objc_msgSend_ams_setCreditsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setCreditsString:");
}

id objc_msgSend_ams_setDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setDSID:");
}

id objc_msgSend_ams_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setFirstName:");
}

id objc_msgSend_ams_setLastAuthenticated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastAuthenticated:");
}

id objc_msgSend_ams_setLastAuthenticationCredentialSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastAuthenticationCredentialSource:");
}

id objc_msgSend_ams_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setLastName:");
}

id objc_msgSend_ams_setManagedAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setManagedAppleID:");
}

id objc_msgSend_ams_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setNullableObject:forKey:");
}

id objc_msgSend_ams_setSecureToken_forAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setSecureToken:forAccount:error:");
}

id objc_msgSend_ams_setServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setServerResponse:");
}

id objc_msgSend_ams_setStorefront_forMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setStorefront:forMediaType:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_ams_storefrontForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefrontForMediaType:");
}

id objc_msgSend_ams_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_username");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationQueue(void *a1, const char *a2, ...)
{
  return _[a1 authenticationQueue];
}

id objc_msgSend_authenticationType(void *a1, const char *a2, ...)
{
  return _[a1 authenticationType];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_beginSuspendingSubscriptionStatusChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginSuspendingSubscriptionStatusChangeNotifications];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_catchWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catchWithBlock:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_continueWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueWithBlock:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAccessControlRefWithAccount_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyAccessControlRefWithAccount:options:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _[a1 credential];
}

id objc_msgSend_credentialSource(void *a1, const char *a2, ...)
{
  return _[a1 credentialSource];
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataTaskPromiseWithRequestPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequestPromise:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultMediaTypeForCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 defaultMediaTypeForCurrentProcess];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return _[a1 defaultSession];
}

id objc_msgSend_deviceGUID(void *a1, const char *a2, ...)
{
  return _[a1 deviceGUID];
}

id objc_msgSend_deviceIsBundle(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsBundle];
}

id objc_msgSend_dialogRequest(void *a1, const char *a2, ...)
{
  return _[a1 dialogRequest];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didFetchBundleOwnerStatus(void *a1, const char *a2, ...)
{
  return _[a1 didFetchBundleOwnerStatus];
}

id objc_msgSend_didRetrieveDeviceOffers(void *a1, const char *a2, ...)
{
  return _[a1 didRetrieveDeviceOffers];
}

id objc_msgSend_endSuspendingSubscriptionStatusChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 endSuspendingSubscriptionStatusChangeNotifications];
}

id objc_msgSend_enqueuePromiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueuePromiseBlock:");
}

id objc_msgSend_enqueueWithEvent_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueWithEvent:context:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fetchMetricsIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 fetchMetricsIdentifiers];
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithPromise:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_flushEvents(void *a1, const char *a2, ...)
{
  return _[a1 flushEvents];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hashedDescription];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreAccountConversion(void *a1, const char *a2, ...)
{
  return _[a1 ignoreAccountConversion];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_accountStore_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:accountStore:bag:");
}

id objc_msgSend_initWithAccount_accountStore_bag_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:accountStore:bag:options:");
}

id objc_msgSend_initWithAccount_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bag:");
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithAccountFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountFlags:");
}

id objc_msgSend_initWithAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccounts:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithLegacyOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLegacyOptionsDictionary:");
}

id objc_msgSend_initWithOptions_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:account:");
}

id objc_msgSend_initWithOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsDictionary:");
}

id objc_msgSend_initWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResult:error:");
}

id objc_msgSend_initWithoutBag(void *a1, const char *a2, ...)
{
  return _[a1 initWithoutBag];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isActionSupported_withAccessControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActionSupported:withAccessControl:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAvailableForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAvailableForAccount:");
}

id objc_msgSend_isBuddyRunning(void *a1, const char *a2, ...)
{
  return _[a1 isBuddyRunning];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _[a1 isDirty];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdentityMapValid(void *a1, const char *a2, ...)
{
  return _[a1 isIdentityMapValid];
}

id objc_msgSend_isRunningUnitTests(void *a1, const char *a2, ...)
{
  return _[a1 isRunningUnitTests];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metricsIdentifier];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performAuthKitUpdate(void *a1, const char *a2, ...)
{
  return _[a1 performAuthKitUpdate];
}

id objc_msgSend_performPrivacyAcknowledgement(void *a1, const char *a2, ...)
{
  return _[a1 performPrivacyAcknowledgement];
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return _[a1 performTask];
}

id objc_msgSend_performTaskWithPromiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithPromiseBlock:");
}

id objc_msgSend_performUpdate(void *a1, const char *a2, ...)
{
  return _[a1 performUpdate];
}

id objc_msgSend_postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredAttestationStyle(void *a1, const char *a2, ...)
{
  return _[a1 preferredAttestationStyle];
}

id objc_msgSend_promiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithError:");
}

id objc_msgSend_promiseWithPromiseResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithPromiseResult:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_promiseWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 promiseWithSuccess];
}

id objc_msgSend_removeAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:withCompletionHandler:");
}

id objc_msgSend_requestWithMethod_bagURL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:bagURL:parameters:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_resultWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithCompletion:");
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_saveDeviceOffersForAccount_response_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDeviceOffersForAccount:response:logKey:");
}

id objc_msgSend_saveIdentityMap(void *a1, const char *a2, ...)
{
  return _[a1 saveIdentityMap];
}

id objc_msgSend_serverValueForFreePasswordSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverValueForFreePasswordSetting:");
}

id objc_msgSend_serverValueForPaidPasswordSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverValueForPaidPasswordSetting:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountMediaType:");
}

id objc_msgSend_setAccountProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountProperty:forKey:");
}

id objc_msgSend_setAllowSecondaryCredentialSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowSecondaryCredentialSource:");
}

id objc_msgSend_setAllowServerDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerDialogs:");
}

id objc_msgSend_setAuthenticationStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationStarted:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setCanMakeAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMakeAccountActive:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setCreateAccountQueryParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateAccountQueryParams:");
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:");
}

id objc_msgSend_setDefaultButtonString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonString:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceOffersCheckEncodingForRequestParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceOffersCheckEncodingForRequestParameters:");
}

id objc_msgSend_setDialogOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogOptions:");
}

id objc_msgSend_setDialogRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogRequest:");
}

id objc_msgSend_setDidFetchBundleOwnerStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidFetchBundleOwnerStatus:");
}

id objc_msgSend_setDidRetrieveDeviceOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidRetrieveDeviceOffers:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFlushTimerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlushTimerEnabled:");
}

id objc_msgSend_setHTTPHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPHeaders:");
}

id objc_msgSend_setIgnoreAccountConversion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreAccountConversion:");
}

id objc_msgSend_setIncludeClientVersions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeClientVersions:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setLogUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogUUID:");
}

id objc_msgSend_setMescalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMescalType:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPromptTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptTitle:");
}

id objc_msgSend_setProxyAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppBundleID:");
}

id objc_msgSend_setProxyAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppName:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRequestEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestEncoding:");
}

id objc_msgSend_setShouldSetCookiesFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSetCookiesFromResponse:");
}

id objc_msgSend_setShouldSetStorefrontFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSetStorefrontFromResponse:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAgent:");
}

id objc_msgSend_setUserAgentSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAgentSuffix:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_sharedAccountsAuthenticationPluginConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsAuthenticationPluginConfig];
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsConfig];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedDeviceOffersConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedDeviceOffersConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stateForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateForAccount:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tearDownAllDeviceOfferFollowUpsForAccount_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tearDownAllDeviceOfferFollowUpsForAccount:logKey:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateWithResponseDictionary_accountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithResponseDictionary:accountIdentifier:");
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return _[a1 userAgent];
}

id objc_msgSend_userAgentSuffix(void *a1, const char *a2, ...)
{
  return _[a1 userAgentSuffix];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_verifyCredentialsForAccount_accountStore_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCredentialsForAccount:accountStore:options:completion:");
}