@interface PushTypesTask
- (void)main;
@end

@implementation PushTypesTask

- (void)main
{
  if (self && self->_account) {
    goto LABEL_79;
  }
  self;
  uint64_t v3 = ASDErrorWithDescription();
  if (v3) {
    goto LABEL_14;
  }
  if (self)
  {
LABEL_79:
    if (self->_requestType) {
      goto LABEL_4;
    }
    account = self->_account;
  }
  else
  {
    account = 0;
  }
  if (([(ACAccount *)account isActive] & 1) == 0)
  {
    self;
    uint64_t v3 = ASDErrorWithDescription();
    if (v3) {
      goto LABEL_14;
    }
  }
  if (self && (self->_requestType || self->_token)) {
    goto LABEL_4;
  }
  uint64_t v3 = ASDErrorWithDescription();
  if (v3)
  {
LABEL_14:
    v5 = (void *)v3;
    v6 = 0;
    goto LABEL_58;
  }
  if (self)
  {
LABEL_4:
    if ([(ACAccount *)self->_account ams_isSandboxAccount]) {
      sub_10030B1B0();
    }
    else {
    v7 = sub_10030B11C();
    }
    id v8 = objc_alloc_init((Class)AMSURLRequestEncoder);
    [v8 setBag:v7];
    [v8 setAccount:self->_account];
    [v8 setRequestEncoding:2];
    v9 = +[NSMutableDictionary dictionary];
    CFStringRef v69 = @"media-kinds";
    v70 = &off_10054DEA8;
    v10 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    [v9 setObject:v10 forKeyedSubscript:@"parameters"];

    [v9 setObject:@"purchase" forKeyedSubscript:@"notification-type"];
    v11 = +[AMSDevice deviceGUID];
    [v9 setObject:v11 forKeyedSubscript:@"guid"];

    if (self->_requestType)
    {
      CFStringRef v12 = @"push-notification-types/remove-push-notification-type-url";
      uint64_t v61 = 0;
      v13 = (id *)&v61;
      v14 = &v61;
    }
    else
    {
      CFStringRef v12 = @"push-notification-types/add-push-notification-type-url";
      uint64_t v62 = 0;
      v13 = (id *)&v62;
      v14 = &v62;
    }
    v15 = sub_10030B9EC((uint64_t)v7, (uint64_t)v12, v14);
    v16 = (LogKey *)*v13;
    if (v16)
    {
      v17 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        logKey = self->_logKey;
        *(_DWORD *)buf = 138412546;
        v64 = logKey;
        __int16 v65 = 2114;
        v66 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%@] Error while registering for push: %{public}@", buf, 0x16u);
      }

      ASDErrorWithSafeUserInfo();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v15) {
        goto LABEL_23;
      }
    }
    else
    {
      id v18 = 0;
      if (v15)
      {
LABEL_23:
        v19 = [v8 requestWithMethod:4 URL:v15 parameters:v9];
        id v60 = 0;
        v6 = [v19 resultWithError:&v60];
        v20 = (__CFString *)v60;

        ASDErrorWithSafeUserInfo();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

        goto LABEL_32;
      }
    }
    if (self->_requestType) {
      v21 = @"Remove";
    }
    else {
      v21 = @"Add";
    }
    v20 = v21;
    v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v36 = self->_logKey;
      *(_DWORD *)buf = 138412546;
      v64 = v36;
      __int16 v65 = 2112;
      v66 = (LogKey *)v20;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%@] Could not find URL to %@ push type", buf, 0x16u);
    }

    v6 = 0;
    goto LABEL_31;
  }
  id v18 = 0;
  v6 = 0;
LABEL_32:
  id v23 = v18;
  v5 = v23;
  if (!v6)
  {
    self;
    uint64_t v24 = ASDErrorWithDescription();

    v5 = (void *)v24;
    if (!v24) {
      goto LABEL_36;
    }
LABEL_58:
    self->_responseType = 1;
    [(Task *)self completeWithError:v5];

    goto LABEL_59;
  }
  if (v23) {
    goto LABEL_58;
  }
LABEL_36:
  v25 = sub_10027AA90();
  v26 = [v25 dataTaskPromiseWithRequest:v6];
  id v59 = 0;
  v27 = [v26 resultWithError:&v59];
  id v28 = v59;
  if (v28)
  {
    uint64_t v29 = ASDErrorWithSafeUserInfo();
LABEL_38:
    v5 = (void *)v29;
    goto LABEL_57;
  }
  v30 = [v27 object];

  if (!v30)
  {
    self;
    uint64_t v29 = ASDErrorWithDescription();
    goto LABEL_38;
  }
  v31 = [v27 object];
  id v32 = sub_1002687B0(v31, @"status", (id)0x7FFFFFFFFFFFFFFFLL);
  if (v32)
  {
    if (v32 == (id)-2)
    {
      if (!self || (int64_t requestType = self->_requestType) == 0)
      {
        v38 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = objc_opt_class();
          token = self->_token;
          v53 = self->_logKey;
          id v55 = v39;
          uint64_t v40 = sub_10025C1EC(token);
          *(_DWORD *)buf = 138543874;
          v64 = (LogKey *)v39;
          __int16 v65 = 2112;
          v66 = v53;
          __int16 v67 = 2114;
          uint64_t v68 = v40;
          v41 = (void *)v40;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@][%@] Registering push token: %{public}@", buf, 0x20u);
        }
        v56 = [PushRegisterTask alloc];
        if (self) {
          v42 = self->_account;
        }
        else {
          v42 = 0;
        }
        v43 = self->_token;
        environment = self->_environment;
        v44 = self->_logKey;
        v45 = v42;
        v46 = sub_100306804((id *)&v56->super.super.super.isa, v45, v43, environment, v44);

        v47 = v46;
        id v58 = 0;
        LOBYTE(v46) = [(Task *)self runSubTask:v46 returningError:&v58];
        id v37 = v58;
        if (v46)
        {
          v5 = 0;
          self->_responseType = 3;
        }
        else
        {
          v48 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = (LogKey *)objc_opt_class();
            v50 = self->_logKey;
            *(_DWORD *)buf = 138543874;
            v64 = v49;
            __int16 v65 = 2112;
            v66 = v50;
            __int16 v67 = 2114;
            uint64_t v68 = (uint64_t)v37;
            v57 = v47;
            v51 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@][%@] Registration failed with error: %{public}@", buf, 0x20u);

            v47 = v57;
          }

          v5 = ASDErrorWithUnderlyingErrorAndDescription();
        }

        goto LABEL_55;
      }
    }
    else
    {
      if (!self) {
        goto LABEL_53;
      }
      int64_t requestType = self->_requestType;
    }
    if (requestType)
    {
      CFStringRef v35 = @"remove";
LABEL_54:
      id v37 = +[NSString stringWithFormat:@"Failed to %@ push types. Server status: %ld", v35, v32];
      v5 = ASDErrorWithDescription();
LABEL_55:

      goto LABEL_56;
    }
LABEL_53:
    CFStringRef v35 = @"add";
    goto LABEL_54;
  }
  v5 = 0;
LABEL_56:

LABEL_57:
  if (v5) {
    goto LABEL_58;
  }
  if (!self->_responseType) {
    self->_responseType = 2;
  }
  [(Task *)self completeWithSuccess];
LABEL_59:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end