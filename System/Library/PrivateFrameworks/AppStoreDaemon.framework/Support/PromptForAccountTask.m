@interface PromptForAccountTask
- (void)main;
@end

@implementation PromptForAccountTask

- (void)main
{
  v3 = objc_opt_new();
  [v3 setDebugReason:@"Prompt For Account"];
  v4 = ASDLocalizedString();
  [v3 setPromptTitle:v4];

  if (self->_username)
  {
    v5 = ASDLocalizedString();
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, self->_username);
    [v3 setReason:v6];
  }
  v7 = ASDLocalizedString();
  [v3 setDefaultButtonString:v7];

  v9 = objc_msgSend(objc_getProperty(self, v8, 64, 1), "description");
  [v3 setLogKey:v9];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100018128;
  v47 = sub_100017C50;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100018128;
  v41 = sub_100017C50;
  id v42 = 0;
  v10 = [(XPCRequestToken *)self->_requestToken notificationClient];

  if (v10)
  {
    v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_getProperty(self, v12, 64, 1);
      v14 = [(XPCRequestToken *)self->_requestToken notificationClient];
      *(_DWORD *)buf = 138412546;
      id v50 = v13;
      __int16 v51 = 2114;
      v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Sending authentication request to client %{public}@", buf, 0x16u);
    }
    id v15 = [objc_alloc((Class)AMSAuthenticateRequest) initWithDSID:0 altDSID:0 username:self->_username options:v3];
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = [(XPCRequestToken *)self->_requestToken notificationClient];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1002ECDA8;
    v33[3] = &unk_100526FD0;
    v35 = &v37;
    v36 = &v43;
    v18 = v16;
    v34 = v18;
    sub_10033C2B0((uint64_t)CallerRequestPresenter, v15, v17, v33);

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id Property = objc_getProperty(self, v20, 64, 1);
      *(_DWORD *)buf = 138412290;
      id v50 = Property;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] No client available to handle authentication request", buf, 0xCu);
    }

    uint64_t v22 = ASDErrorWithDescription();
    id v15 = (id)v44[5];
    v44[5] = v22;
  }

  if (v38[5])
  {
    v23 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = objc_getProperty(self, v24, 64, 1);
      *(_DWORD *)buf = 138412290;
      id v50 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@] Authenticated successfully", buf, 0xCu);
    }

    v26 = (AMSAuthenticateResult *)(id)v38[5];
    authenticateResult = self->_authenticateResult;
    self->_authenticateResult = v26;
  }
  else
  {
    if (v44[5]) {
      goto LABEL_17;
    }
    uint64_t v30 = ASDErrorWithDescription();
    authenticateResult = (AMSAuthenticateResult *)v44[5];
    v44[5] = v30;
  }

  if (!v44[5])
  {
    [(Task *)self completeWithSuccess];
    goto LABEL_20;
  }
LABEL_17:
  v28 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v31 = objc_getProperty(self, v29, 64, 1);
    v32 = (void *)v44[5];
    *(_DWORD *)buf = 138412546;
    id v50 = v31;
    __int16 v51 = 2114;
    v52 = v32;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[%@] Error prompting for account: %{public}@", buf, 0x16u);
  }

  [(Task *)self completeWithError:v44[5]];
LABEL_20:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_authenticateResult, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end