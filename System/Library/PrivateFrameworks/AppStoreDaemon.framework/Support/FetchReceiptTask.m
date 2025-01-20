@interface FetchReceiptTask
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation FetchReceiptTask

- (void)mainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!*(NSURL **)((char *)&self->_customReceiptURL + 2))
  {
    v5 = objc_alloc_init(_TtC9appstored6LogKey);
    v6 = *(NSURL **)((char *)&self->_customReceiptURL + 2);
    *(NSURL **)((char *)&self->_customReceiptURL + 2) = (NSURL *)v5;
  }
  v7 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
  id v32 = 0;
  id v8 = v7;
  v9 = sub_100358040((uint64_t)self, v8, &v32);
  id v10 = v32;

  if (ASDErrorIsEqual())
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_accountMediaType + 2));
    char v12 = objc_opt_respondsToSelector();

    v13 = ASDLogHandleForCategory();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(NSURL **)((char *)&self->_customReceiptURL + 2);
        id v16 = *(id *)((char *)&self->_delegate + 2);
        id v17 = v15;
        v18 = [v16 bundleID];
        *(_DWORD *)buf = 138412546;
        v34 = v15;
        __int16 v35 = 2114;
        v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Handling authentication request", buf, 0x16u);
      }
      v19 = +[AMSProcessInfo currentProcess];
      [v19 setAccountMediaType:*(ACAccount **)((char *)&self->_account + 2)];
      id v20 = objc_alloc_init((Class)AMSAuthenticateOptions);
      [v20 setClientInfo:v19];
      [v20 setDebugReason:@"Receipt"];
      v21 = *(void **)(&self->_revoked + 1);
      if (v21)
      {
        id v22 = v21;
      }
      else
      {
        v23 = [v19 accountMediaType];
        sub_100359578((uint64_t)self, v23);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v24 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:v22 options:v20];
      id v25 = objc_loadWeakRetained((id *)((char *)&self->_accountMediaType + 2));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100359620;
      v30[3] = &unk_100524148;
      v30[4] = self;
      id v31 = v4;
      [v25 handleAuthenticateRequest:v24 resultHandler:v30];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v26 = *(NSURL **)((char *)&self->_customReceiptURL + 2);
        id v27 = *(id *)((char *)&self->_delegate + 2);
        id v28 = v26;
        v29 = [v27 bundleID];
        *(_DWORD *)buf = 138412546;
        v34 = v26;
        __int16 v35 = 2114;
        v36 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] No delegate to handle authentication request", buf, 0x16u);
      }
      (*((void (**)(id, id))v4 + 2))(v4, v10);
    }
  }
  else
  {
    sub_1003596F0((uint64_t)self, v9, v10, v4);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  id v10 = sub_100359540((char *)self);
  char v11 = objc_opt_respondsToSelector();

  char v12 = ASDLogHandleForCategory();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v14 = *(id *)((char *)&self->_customReceiptURL + 2);
        v15 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v14 = 0;
        v15 = 0;
      }
      id v16 = v15;
      id v17 = [v16 bundleID];
      int v23 = 138412546;
      id v24 = v14;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Handling dialog request", (uint8_t *)&v23, 0x16u);
    }
    v18 = sub_100359540((char *)self);
    [v18 handleDialogRequest:v8 resultHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v19 = *(id *)((char *)&self->_customReceiptURL + 2);
        id v20 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v19 = 0;
        id v20 = 0;
      }
      id v21 = v20;
      id v22 = [v21 bundleID];
      int v23 = 138412546;
      id v24 = v19;
      __int16 v25 = 2114;
      v26 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] No delegate to handle dialog request", (uint8_t *)&v23, 0x16u);
    }
    v18 = ASDErrorWithDescription();
    v9[2](v9, 0, v18);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  id v10 = sub_100359540((char *)self);
  char v11 = objc_opt_respondsToSelector();

  char v12 = ASDLogHandleForCategory();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v14 = *(id *)((char *)&self->_customReceiptURL + 2);
        v15 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v14 = 0;
        v15 = 0;
      }
      id v16 = v15;
      id v17 = [v16 bundleID];
      int v23 = 138412546;
      id v24 = v14;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Handling authentication request", (uint8_t *)&v23, 0x16u);
    }
    v18 = sub_100359540((char *)self);
    [v18 handleAuthenticateRequest:v8 resultHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v19 = *(id *)((char *)&self->_customReceiptURL + 2);
        id v20 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v19 = 0;
        id v20 = 0;
      }
      id v21 = v20;
      id v22 = [v21 bundleID];
      int v23 = 138412546;
      id v24 = v19;
      __int16 v25 = 2114;
      v26 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] No delegate to handle authentication request", (uint8_t *)&v23, 0x16u);
    }
    v18 = ASDErrorWithDescription();
    v9[2](v9, 0, v18);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  id v10 = sub_100359540((char *)self);
  char v11 = objc_opt_respondsToSelector();

  char v12 = ASDLogHandleForCategory();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v14 = *(id *)((char *)&self->_customReceiptURL + 2);
        v15 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v14 = 0;
        v15 = 0;
      }
      id v16 = v15;
      id v17 = [v16 bundleID];
      int v23 = 138412546;
      id v24 = v14;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Handling engagement request", (uint8_t *)&v23, 0x16u);
    }
    v18 = sub_100359540((char *)self);
    [v18 handleEngagementRequest:v8 resultHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v19 = *(id *)((char *)&self->_customReceiptURL + 2);
        id v20 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
      }
      else
      {
        id v19 = 0;
        id v20 = 0;
      }
      id v21 = v20;
      id v22 = [v21 bundleID];
      int v23 = 138412546;
      id v24 = v19;
      __int16 v25 = 2114;
      v26 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] No delegate to handle engagement request", (uint8_t *)&v23, 0x16u);
    }
    v18 = ASDErrorWithDescription();
    v9[2](v9, 0, v18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_receiptFlags + 2), 0);
  objc_storeStrong((id *)((char *)&self->_proxyBundleVersion + 2), 0);
  objc_storeStrong((id *)((char *)&self->_proxyBundeID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_customReceiptURL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_app + 2), 0);
  objc_storeStrong((id *)((char *)&self->_delegate + 2), 0);
  objc_destroyWeak((id *)((char *)&self->_accountMediaType + 2));
  objc_storeStrong((id *)((char *)&self->_account + 2), 0);
  objc_storeStrong((id *)(&self->_revoked + 1), 0);
}

@end