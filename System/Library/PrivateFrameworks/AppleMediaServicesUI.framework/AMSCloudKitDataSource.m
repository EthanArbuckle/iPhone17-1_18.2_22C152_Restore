@interface AMSCloudKitDataSource
- (AMSCloudDataManagerDataSourceDelegate)delegate;
- (AMSCloudKitDataSource)init;
- (AMSCloudKitDataSource)initWithPushNotificationTopic:(id)a3;
- (BOOL)useSandboxEnvironment;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)_accountChanged:(id)a3;
- (void)_identityUpdated:(id)a3;
- (void)dealloc;
- (void)handlePushNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPushNotificationTopic:(id)a3;
- (void)setUseSandboxEnvironment:(BOOL)a3;
@end

@implementation AMSCloudKitDataSource

- (AMSCloudKitDataSource)initWithPushNotificationTopic:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCloudKitDataSource;
  v5 = [(AMSCloudKitDataSource *)&v9 init];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_accountChanged:" name:CKAccountChangedNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_identityUpdated:" name:CKIdentityUpdateNotification object:0];

    [(AMSCloudKitDataSource *)v5 setPushNotificationTopic:v4];
  }

  return v5;
}

- (AMSCloudKitDataSource)init
{
  v3 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.amsaccountsd"];
  id v4 = [(AMSCloudKitDataSource *)self initWithPushNotificationTopic:v3];

  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSCloudKitDataSource;
  [(AMSCloudKitDataSource *)&v4 dealloc];
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(AMSCloudKitDataSource *)self useSandboxEnvironment]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  if (v6)
  {
    id v9 = objc_alloc_init((Class)CKContainerOptions);
    objc_msgSend(v9, "setUseZoneWidePCS:", objc_msgSend(v6, "recordZoneEncryption"));
    id v10 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v7 environment:v8];

    id v11 = [objc_alloc((Class)CKContainer) initWithContainerID:v10 options:v9];
  }
  else
  {
    id v9 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v7 environment:v8];

    id v11 = [objc_alloc((Class)CKContainer) initWithContainerID:v9];
  }

  return v11;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v28 = 138543618;
    uint64_t v29 = v7;
    __int16 v30 = 2114;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling a CloudKit push notification.", (uint8_t *)&v28, 0x16u);
  }
  id v9 = [v4 userInfo];
  id v10 = +[CKNotification notificationFromRemoteNotificationDictionary:v9];

  if (v10)
  {
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    uint64_t v18 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    v13 = v18;
    if (v12)
    {
      if (!v18)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v13 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = objc_opt_class();
        v21 = AMSLogKey();
        id v22 = [v12 databaseScope];
        int v28 = 138543874;
        uint64_t v29 = v20;
        __int16 v30 = 2114;
        v31 = v21;
        __int16 v32 = 2048;
        id v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] A CloudKit database changed. databaseScope = %ld", (uint8_t *)&v28, 0x20u);
      }
      v13 = [(AMSCloudKitDataSource *)self delegate];
      [v13 dataSourceDidChange:self];
    }
    else
    {
      if (!v18)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v13 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        v25 = AMSLogKey();
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        int v28 = 138543874;
        uint64_t v29 = v24;
        __int16 v30 = 2114;
        v31 = v25;
        __int16 v32 = 2114;
        id v33 = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] We don't know how to handle the notification. notification.class = %{public}@", (uint8_t *)&v28, 0x20u);
      }
    }
  }
  else
  {
    id v12 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = [v4 userInfo];
      v17 = AMSHashIfNeeded();
      int v28 = 138543874;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      v31 = v15;
      __int16 v32 = 2114;
      id v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create a CKNotification from the message's userInfo. userInfo = %{public}@", (uint8_t *)&v28, 0x20u);
    }
  }
}

- (void)_accountChanged:(id)a3
{
  id v4 = (id)AMSSetLogKey();
  v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The CloudKit account changed.", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(AMSCloudKitDataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  id v11 = [(AMSCloudKitDataSource *)self delegate];
  id v12 = v11;
  if (v10) {
    [v11 dataSourceAccountDidChange:self];
  }
  else {
    [v11 dataSourceDidChange:self];
  }
}

- (void)_identityUpdated:(id)a3
{
  id v4 = (id)AMSSetLogKey();
  v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The CloudKit PCS identity updated.", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(AMSCloudKitDataSource *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  id v11 = [(AMSCloudKitDataSource *)self delegate];
  id v12 = v11;
  if (v10) {
    [v11 dataSourceAccountDidChange:self];
  }
  else {
    [v11 dataSourceDidChange:self];
  }
}

- (AMSCloudDataManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSCloudDataManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useSandboxEnvironment
{
  return self->_useSandboxEnvironment;
}

- (void)setUseSandboxEnvironment:(BOOL)a3
{
  self->_useSandboxEnvironment = a3;
}

- (NSString)pushNotificationTopic
{
  return self->_pushNotificationTopic;
}

- (void)setPushNotificationTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushNotificationTopic, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end