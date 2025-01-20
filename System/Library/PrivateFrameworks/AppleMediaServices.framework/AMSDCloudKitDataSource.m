@interface AMSDCloudKitDataSource
- (AMSDCloudDataManagerDataSourceDelegate)delegate;
- (AMSDCloudKitDataSource)init;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)_accountChanged:(id)a3;
- (void)dealloc;
- (void)handlePushNotification:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMSDCloudKitDataSource

- (AMSDCloudKitDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)AMSDCloudKitDataSource;
  v2 = [(AMSDCloudKitDataSource *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_accountChanged:" name:CKAccountChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSDCloudKitDataSource;
  [(AMSDCloudKitDataSource *)&v4 dealloc];
}

- (NSString)pushNotificationTopic
{
  return (NSString *)[@"com.apple.icloud-container." stringByAppendingString:@"com.apple.amsaccountsd"];
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init((Class)CKContainerOptions);
    objc_msgSend(v7, "setUseZoneWidePCS:", objc_msgSend(v5, "recordZoneEncryption"));
    id v8 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v6 environment:1];

    id v9 = [objc_alloc((Class)CKContainer) initWithContainerID:v8 options:v7];
  }
  else
  {
    id v7 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v6 environment:1];

    id v9 = [objc_alloc((Class)CKContainer) initWithContainerID:v7];
  }

  return v9;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    int v28 = 138543618;
    uint64_t v29 = v7;
    __int16 v30 = 2114;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling a CloudKit push notification.", (uint8_t *)&v28, 0x16u);
  }
  id v9 = [v4 userInfo];
  v10 = +[CKNotification notificationFromRemoteNotificationDictionary:v9];

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
      v13 = [(AMSDCloudKitDataSource *)self delegate];
      [v13 cloudDataManagerDataSource:self didChangeWithType:1];
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
  id v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The CloudKit account changed.", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(AMSDCloudKitDataSource *)self delegate];
  [v9 cloudDataManagerDataSource:self didChangeWithType:0];
}

- (AMSDCloudDataManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSDCloudDataManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end