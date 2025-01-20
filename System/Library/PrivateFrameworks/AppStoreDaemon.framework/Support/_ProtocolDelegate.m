@interface _ProtocolDelegate
- (_ProtocolDelegate)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
@end

@implementation _ProtocolDelegate

- (_ProtocolDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ProtocolDelegate;
  v2 = [(_ProtocolDelegate *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ThreadSafeDictionary);
    tagEnvironment = v2->_tagEnvironment;
    v2->_tagEnvironment = v3;
  }
  return v2;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 logKey];
  v13 = sub_10033E210(self, v9);
  v15 = v13;
  if (v13)
  {
    v16 = (SilentRequestPresenter *)objc_getProperty(v13, v14, 32, 1);
    if (v16) {
      goto LABEL_10;
    }
  }
  else
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Environment not found for task: %{public}@", buf, 0x16u);
    }
  }
  v18 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Using silent presenter for authentication as no other presenter was specified", buf, 0xCu);
  }

  v16 = objc_alloc_init(SilentRequestPresenter);
LABEL_10:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10033E4C0;
  v21[3] = &unk_100524148;
  id v22 = v12;
  id v23 = v11;
  id v19 = v11;
  id v20 = v12;
  [(SilentRequestPresenter *)v16 presentAuthenticateRequest:v10 resultHandler:v21];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 logKey];
  v13 = sub_10033E210(self, v9);
  v15 = v13;
  if (v13)
  {
    v16 = (SilentRequestPresenter *)objc_getProperty(v13, v14, 32, 1);
    if (v16) {
      goto LABEL_10;
    }
  }
  else
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Environment not found for task: %{public}@", buf, 0x16u);
    }
  }
  v18 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Using silent presenter for dialog as no other presenter was specified", buf, 0xCu);
  }

  v16 = objc_alloc_init(SilentRequestPresenter);
LABEL_10:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10033E838;
  v21[3] = &unk_100524170;
  id v22 = v12;
  id v23 = v11;
  id v19 = v11;
  id v20 = v12;
  [(SilentRequestPresenter *)v16 presentDialogRequest:v10 resultHandler:v21];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = [v11 logKey];
  v13 = sub_10033E210(self, v9);
  v15 = v13;
  if (v13)
  {
    v17 = (SilentRequestPresenter *)objc_getProperty(v13, v14, 32, 1);
    if (v17) {
      goto LABEL_10;
    }
  }
  else
  {
    v18 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2114;
      id v30 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Environment not found for task: %{public}@", buf, 0x16u);
    }
  }
  id v19 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Using silent presenter for engagement as no other presenter was specified", buf, 0xCu);
  }

  v17 = objc_alloc_init(SilentRequestPresenter);
  if (!v15)
  {
    id Property = 0;
    goto LABEL_11;
  }
LABEL_10:
  id Property = objc_getProperty(v15, v16, 8, 1);
LABEL_11:
  id v21 = Property;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10033EBE0;
  v24[3] = &unk_100527D70;
  id v25 = v12;
  id v26 = v10;
  id v22 = v10;
  id v23 = v12;
  [(SilentRequestPresenter *)v17 presentEngagementRequest:v11 withClientInfo:v21 resultHandler:v24];
}

- (void).cxx_destruct
{
}

@end