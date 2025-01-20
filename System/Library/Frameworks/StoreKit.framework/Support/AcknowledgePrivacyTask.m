@interface AcknowledgePrivacyTask
- (AcknowledgePrivacyTask)initWithAccount:(id)a3;
- (void)main;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation AcknowledgePrivacyTask

- (AcknowledgePrivacyTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AcknowledgePrivacyTask;
  v6 = [(Task *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)main
{
  if (self->_account)
  {
    if (!+[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:account:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:account:", @"com.apple.onboarding.appstore"))
    {
LABEL_34:
      [(Task *)self completeWithSuccess];
      return;
    }
    v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    privacyPromptSemaphore = self->_privacyPromptSemaphore;
    self->_privacyPromptSemaphore = v3;

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    id v5 = +[AMSBag bagForProfile:@"AppStore" profileVersion:@"1"];
    [v5 stringForKey:@"privacyAcknowledgementUrl"];
    v24 = id v29 = 0;
    v6 = [v24 valueWithError:&v29];
    id v7 = v29;
    if (!v6)
    {
      if (qword_10039F6B8 != -1) {
        dispatch_once(&qword_10039F6B8, &stru_1003575E0);
      }
      v26 = (id)qword_10039F670;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        sub_1002C0F2C(v17, (uint64_t)v7, (uint64_t)buf, v26);
      }
      BOOL v25 = 0;
LABEL_27:

      _Block_object_dispose(&v30, 8);
      if (v7) {
        char v20 = 1;
      }
      else {
        char v20 = v25;
      }
      if ((v20 & 1) == 0)
      {
        ASDErrorWithDescription();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v7)
      {
        [(Task *)self completeWithError:v7];

        return;
      }
      goto LABEL_34;
    }
    v26 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePrivacyPromptViewController"];
    id v8 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    id v23 = objc_alloc_init((Class)BSMutableSettings);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002C5D8;
    v28[3] = &unk_1003575C0;
    v28[4] = self;
    v28[5] = &v30;
    v22 = +[BSActionResponder responderWithHandler:v28];
    id v21 = [objc_alloc((Class)BSAction) initWithInfo:v23 responder:v22];
    objc_super v9 = +[NSSet setWithObject:v21];
    [v8 setActions:v9];

    v34[0] = @"privacyIdentifier";
    v34[1] = @"privacyAcknowledgementUrlString";
    v35[0] = @"com.apple.onboarding.appstore";
    v35[1] = v6;
    v10 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v8 setUserInfo:v10];

    id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:v26 configurationContext:v8];
    BOOL v25 = v11 != 0;
    if (v11)
    {
      if (qword_10039F6B8 != -1) {
        dispatch_once(&qword_10039F6B8, &stru_1003575E0);
      }
      v12 = (id)qword_10039F670;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v37 = v13;
        id v14 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote handle created for privacy prompt operation", buf, 0xCu);
      }
      [v11 registerObserver:self];
      [v11 activateWithContext:0];
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_privacyPromptSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      if (!*((unsigned char *)v31 + 24))
      {
        BOOL v25 = 0;
        goto LABEL_26;
      }
      id v15 = [objc_alloc((Class)AMSAcknowledgePrivacyTask) initWithPrivacyIdentifier:@"com.apple.onboarding.appstore" account:self->_account];
      id v16 = [v15 acknowledgePrivacy];
    }
    else
    {
      if (qword_10039F6B8 != -1) {
        dispatch_once(&qword_10039F6B8, &stru_1003575E0);
      }
      v18 = (id)qword_10039F670;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        sub_1002C0FA4(v19, (uint64_t)buf, v18);
      }

      ASDErrorWithDescription();
      id v15 = v7;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    goto LABEL_27;
  }
  ASDErrorWithDescription();
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  [(Task *)self completeWithError:v27];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  if (qword_10039F6B8 != -1) {
    dispatch_once(&qword_10039F6B8, &stru_1003575E0);
  }
  id v5 = (void *)qword_10039F670;
  if (os_log_type_enabled((os_log_t)qword_10039F670, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote privacy handle did deactivate", (uint8_t *)&v8, 0xCu);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039F6B8 != -1) {
    dispatch_once(&qword_10039F6B8, &stru_1003575E0);
  }
  int v8 = (void *)qword_10039F670;
  if (os_log_type_enabled((os_log_t)qword_10039F670, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v7;
    id v10 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote privacy handle did invalidate with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_privacyPromptSemaphore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPromptSemaphore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end