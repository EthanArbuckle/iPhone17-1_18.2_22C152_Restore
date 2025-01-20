@interface AppReceiptTask
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)main;
@end

@implementation AppReceiptTask

- (void)main
{
  if (!self || !self->_logKey)
  {
    v3 = objc_alloc_init(_TtC9appstored6LogKey);
    logKey = self->_logKey;
    self->_logKey = v3;
  }
  v5 = sub_100357BD8((char *)[FetchReceiptTask alloc], self->_app);
  v6 = v5;
  if (v5) {
    *(void *)(v5 + 138) = self->_receiptFlags;
  }
  v8 = self->_account;
  if (!v8)
  {
    Property = sub_1003F013C((id *)&self->_app->super.isa);
    v11 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v10, 16, 1);
    }
    v8 = Property;

    if (v8)
    {
      v13 = +[ACAccountStore ams_sharedAccountStore];
      if (v11) {
        id v14 = objc_getProperty(v11, v12, 16, 1);
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;
      objc_msgSend(v13, "ams_iTunesAccountWithDSID:", v15);
      v8 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v6)
  {
    objc_setProperty_nonatomic_copy(v6, v7, v8, 50);
    v6[42] = self->_attributeToAppStore;
    p_logKey = &self->_logKey;
    objc_setProperty_nonatomic_copy(v6, v17, self->_logKey, 90);
    objc_storeWeak((id *)(v6 + 66), self);
  }
  else
  {
    p_logKey = &self->_logKey;
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100224A88;
  v31[3] = &unk_100521388;
  v18 = dispatch_semaphore_create(0);
  v32 = v18;
  [v6 setCompletionBlock:v31];
  v19 = objc_alloc_init(TaskQueue);
  v20 = v19;
  if (v19) {
    [(NSOperationQueue *)v19->_operationQueue addOperation:v6];
  }
  dispatch_time_t v21 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v18, v21))
  {
    v23 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v29 = *p_logKey;
      v30 = [(ApplicationProxy *)self->_app bundleID];
      *(_DWORD *)buf = 138412546;
      v34 = v29;
      __int16 v35 = 2114;
      v36 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%@] [%{public}@]  Timed out refreshing receipt", buf, 0x16u);
    }
    ASDErrorWithTitleAndMessage();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6) {
      id v26 = objc_getProperty(v6, v22, 32, 1);
    }
    else {
      id v26 = 0;
    }
    id v24 = v26;
  }
  v27 = v24;
  if (!v24)
  {
    if (v6)
    {
      objc_storeStrong((id *)&self->_receipt, *(id *)(v6 + 146));
      BOOL v28 = v6[43] != 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_receipt, 0);
      BOOL v28 = 0;
    }
    self->_revoked = v28;
  }
  self->super._success = v27 == 0;
  objc_setProperty_atomic_copy(self, v25, v27, 32);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    ASDErrorWithDescription();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    ASDErrorWithDescription();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    ASDErrorWithDescription();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receipt, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end