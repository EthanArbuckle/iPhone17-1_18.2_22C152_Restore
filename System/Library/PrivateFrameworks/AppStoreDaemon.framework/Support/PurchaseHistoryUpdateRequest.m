@interface PurchaseHistoryUpdateRequest
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation PurchaseHistoryUpdateRequest

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_token);
  }
  else {
    id WeakRetained = 0;
  }
  v15 = [WeakRetained notificationClient];

  if (!v15)
  {
    v16 = ASDLogHandleForCategory();
    id v36 = v10;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      context = self->_context;
      if (context) {
        context = objc_getProperty(context, v17, 16, 1);
      }
      id v30 = context;
      v31 = [v30 hashedDescription];
      *(_DWORD *)buf = 138543362;
      v41 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Update request received auth challenge for:%{public}@ but found no notification client to pass on to. Attempting internal auth", buf, 0xCu);

      id v32 = v13;
    }
    else
    {

      id v18 = v13;
      if (!self)
      {
LABEL_11:

        id v10 = v36;
        goto LABEL_12;
      }
    }
    id v19 = v12;
    id v20 = objc_alloc_init((Class)AMSAuthenticateOptions);
    [v20 setDebugReason:@"Purchase History Update"];
    [v20 setAuthenticationType:1];
    id v21 = objc_alloc((Class)AMSAuthenticateTask);
    v22 = [v19 account];

    id v23 = [v21 initWithAccount:v22 options:v20 bag:self->_bag];
    [v23 setDelegate:self];
    v24 = [v23 performAuthentication];
    id v39 = 0;
    v25 = [v24 resultWithError:&v39];
    id v26 = v39;

    if (v26)
    {
      v27 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        Property = self->_context;
        if (Property) {
          Property = objc_getProperty(Property, v28, 16, 1);
        }
        id v35 = Property;
        v34 = [v35 hashedDescription];
        *(_DWORD *)buf = 138543618;
        v41 = v34;
        __int16 v42 = 2112;
        id v43 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Internal auth failed for %{public}@ with error:%@", buf, 0x16u);
      }
    }
    (*((void (**)(id, void *, id))v13 + 2))(v13, v25, v26);

    goto LABEL_11;
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100265EE4;
  v37[3] = &unk_100524148;
  v37[4] = self;
  id v38 = v13;
  [v15 deliverAuthenticateRequest:v12 withResultHandler:v37];

LABEL_12:
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  id v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100266204;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_token);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end