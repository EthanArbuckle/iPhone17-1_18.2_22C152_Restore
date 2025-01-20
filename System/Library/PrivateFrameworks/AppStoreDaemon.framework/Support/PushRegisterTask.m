@interface PushRegisterTask
- (void)main;
@end

@implementation PushRegisterTask

- (void)main
{
  account = self->_account;
  if (account)
  {
    if ([(ACAccount *)account ams_isSandboxAccount]) {
      sub_10030B1B0();
    }
    else {
    v6 = sub_10030B11C();
    }
    id v7 = objc_alloc_init((Class)AMSURLRequestEncoder);
    [v7 setBag:v6];
    [v7 setAccount:self->_account];
    [v7 setRequestEncoding:2];
    v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:self->_environment forKeyedSubscript:@"environment"];
    [v8 setObject:self->_token forKeyedSubscript:@"token"];
    v9 = +[AMSDevice deviceName];
    v10 = [v9 dataUsingEncoding:4 allowLossyConversion:1];
    [v8 setObject:v10 forKeyedSubscript:@"device-name-data"];

    v11 = +[AMSDevice serialNumber];
    [v8 setObject:v11 forKeyedSubscript:@"serial-number"];

    v12 = +[AMSDevice deviceGUID];
    [v8 setObject:v12 forKeyedSubscript:@"guid"];

    id v41 = 0;
    v13 = sub_10030B9EC((uint64_t)v6, @"push-notifications/register-success", &v41);
    id v14 = v41;
    if (v14)
    {
      v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        logKey = self->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = logKey;
        __int16 v43 = 2114;
        id v44 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%@] Encountered error while registering push token: %{public}@", buf, 0x16u);
      }

      ASDErrorWithSafeUserInfo();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {
      id v16 = 0;
      if (v13)
      {
LABEL_12:
        v17 = [v7 requestWithMethod:4 URL:v13 parameters:v8];
        *(void *)buf = 0;
        v18 = [v17 resultWithError:buf];
        v19 = *(id *)buf;

        ASDErrorWithSafeUserInfo();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v35 = self->_logKey;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%@] Could not find URL for registering push token", buf, 0xCu);
    }
    v18 = 0;
LABEL_17:

    id v5 = v16;
    if (!v18)
    {
      v25 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v36 = self->_logKey;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%@] Failed to create push register request.", buf, 0xCu);
      }

      if (!v5)
      {
        self;
        ASDErrorWithDescription();
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      [(Task *)self completeWithError:v5];
      goto LABEL_39;
    }
    v20 = sub_10027AA90();
    v21 = [v20 dataTaskPromiseWithRequest:v18];
    id v40 = 0;
    v22 = [v21 resultWithError:&v40];
    id v23 = v40;
    if (v23)
    {
      v24 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v34 = self->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v34;
        __int16 v43 = 2114;
        id v44 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%@] Failed register push token call with error: %{public}@", buf, 0x16u);
      }

      [(Task *)self completeWithError:v23];
    }
    else
    {
      v26 = [v22 object];

      if (v26)
      {
        id v27 = [v22 responseStatusCode];
        v28 = ASDLogHandleForCategory();
        v29 = v28;
        if (v27 == (id)200)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v30 = self->_logKey;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%@] Successfully registered push token", buf, 0xCu);
          }

          [(Task *)self completeWithSuccess];
          goto LABEL_38;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v38 = self->_logKey;
          id v39 = [v22 responseStatusCode];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v38;
          __int16 v43 = 2050;
          id v44 = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%@] Failed register push token call with unknown error and status code: %{public}ld", buf, 0x16u);
        }
      }
      else
      {
        v29 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v37 = self->_logKey;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v37;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%@] Did not receive response from register push call", buf, 0xCu);
        }
      }

      self;
      v31 = ASDErrorWithDescription();
      [(Task *)self completeWithError:v31];
    }
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v33 = self->_logKey;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v33;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%@] Skipping push register since there is no account.", buf, 0xCu);
  }

  self;
  ASDErrorWithDescription();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(Task *)self completeWithError:v5];
LABEL_40:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end