@interface AMSDCloudDataManager
+ (unint64_t)multiUserStatusForRecord:(id)a3 withHomeManager:(id)a4;
+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5;
- (AMSDCloudDataManager)initWithDataSource:(id)a3;
- (AMSDCloudDataManagerDataSource)dataSource;
- (AMSThreadSafeDictionary)containers;
- (NSString)pushNotificationTopic;
- (id)containerWithContainerIdentifier:(id)a3;
- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4;
- (void)handlePushNotification:(id)a3;
- (void)setContainers:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation AMSDCloudDataManager

+ (unint64_t)multiUserStatusForRecord:(id)a3 withHomeManager:(id)a4
{
  id v5 = a4;
  v6 = +[AMSDHomeManager identifiersForRecord:a3];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 first];
    v9 = [v5 homeWithHomeIdentifier:v8];
    v10 = [v9 resultWithError:0];

    if (v10)
    {
      v11 = [v10 users];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100022694;
      v15[3] = &unk_1001122D0;
      id v16 = v7;
      v12 = objc_msgSend(v11, "ams_firstObjectPassingTest:", v15);

      if (v12) {
        unint64_t v13 = +[AMSDHomeManager multiUserStatusForHomeUser:v12 inHome:v10];
      }
      else {
        unint64_t v13 = 0;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (AMSDCloudDataManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSDCloudDataManager;
  v6 = [(AMSDCloudDataManager *)&v10 init];
  if (v6)
  {
    v7 = (AMSThreadSafeDictionary *)objc_alloc_init((Class)AMSThreadSafeDictionary);
    containers = v6->_containers;
    v6->_containers = v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (NSString)pushNotificationTopic
{
  v2 = [(AMSDCloudDataManager *)self dataSource];
  v3 = [v2 pushNotificationTopic];

  return (NSString *)v3;
}

- (id)containerWithContainerIdentifier:(id)a3
{
  return [(AMSDCloudDataManager *)self containerWithContainerIdentifier:a3 options:0];
}

- (id)containerWithContainerIdentifier:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = &swift_willThrow_ptr;
  objc_super v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v10)
  {
    objc_super v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = AMSLogKey();
    uint64_t v13 = objc_opt_class();
    v29 = self;
    if (v12)
    {
      v14 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] %@ ", v13, v14, a2];
    }
    else
    {
      v14 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: %@ ", v13, v14];
    v15 = };
    id v16 = AMSHashIfNeeded();
    v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    v34 = v15;
    __int16 v35 = 2114;
    v36 = v16;
    __int16 v37 = 2114;
    v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@identifier: %{public}@ | options = %{public}@", buf, 0x20u);
    if (v12)
    {

      v15 = (void *)a2;
    }

    self = v29;
    v9 = &swift_willThrow_ptr;
  }

  if (v7)
  {
    v18 = [(AMSDCloudDataManager *)self containers];
    id v19 = [v18 objectForKeyedSubscript:v7];

    if (v19) {
      goto LABEL_25;
    }
  }
  else
  {
    v20 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = AMSLogKey();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = v23;
      if (v22)
      {
        AMSLogKey();
        v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithFormat:@"%@: [%@] ", v24, v9];
      }
      else
      {
        +[NSString stringWithFormat:@"%@: ", v23];
      v25 = };
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Attempting to create a cloud container with no identifier", buf, 0xCu);
      if (v22)
      {

        v25 = v9;
      }
    }
  }
  v26 = [(AMSDCloudDataManager *)self dataSource];
  id v19 = [v26 containerWithContainerIdentifier:v7 options:v8];

  if (v7)
  {
    v27 = [(AMSDCloudDataManager *)self containers];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100022BD0;
    v30[3] = &unk_1001122F8;
    id v19 = v19;
    id v31 = v19;
    id v32 = v7;
    [v27 readWrite:v30];
  }
LABEL_25:

  return v19;
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDCloudDataManager *)self dataSource];
  [v5 handlePushNotification:v4];
}

+ (void)handleRecordZoneFetchFailed:(id)a3 inDatabase:(id)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(v9, "ams_hasDomain:code:", @"AMSDCloudDataErrorDomain", 1))
  {
    objc_super v10 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v10)
    {
      objc_super v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      AMSHashIfNeeded();
      v14 = id v31 = v7;
      v15 = AMSHashIfNeeded();
      id v16 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138544386;
      uint64_t v36 = v12;
      __int16 v37 = 2114;
      v38 = v13;
      __int16 v39 = 2114;
      v40 = v14;
      __int16 v41 = 2114;
      v42 = v15;
      __int16 v43 = 2114;
      v44 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encryption keys are missing for a record zone. zoneIdentifier = %{public}@ | database = %{public}@ | error = %{public}@", buf, 0x34u);
    }
    if ([v8 isPrivateDatabase])
    {
      id v34 = v7;
      v17 = +[NSArray arrayWithObjects:&v34 count:1];
      v18 = [v8 deleteRecordZonesWithRecordZoneIdentifiers:v17];
      id v33 = 0;
      id v19 = [v18 resultWithError:&v33];
      id v20 = v33;

      if (!v19) {
        goto LABEL_11;
      }
    }
    else if ([v8 isSharedDatabase])
    {
      v21 = [v8 shareForRecordZoneIdentifier:v7];
      v22 = [v21 identifier];
      uint64_t v23 = [v8 deleteRecordWithRecordIdentifier:v22 missingEncryptionIdentity:1];
      id v32 = 0;
      uint64_t v24 = [v23 resultWithError:&v32];
      id v20 = v32;

      if (!v24)
      {
LABEL_11:
        v25 = +[AMSLogConfig sharedAccountsMultiUserConfig];
        if (!v25)
        {
          v25 = +[AMSLogConfig sharedConfig];
        }
        v26 = [(AMSDRefreshMultiUserOptions *)v25 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = objc_opt_class();
          v28 = AMSLogKey();
          v29 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v27;
          __int16 v37 = 2114;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v29;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cleanup a record zone with missing encryption keys. error = %{public}@", buf, 0x20u);
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v20 = 0;
    }
    v25 = [[AMSDRefreshMultiUserOptions alloc] initWithReason:@"Missing encryption keys."];
    [(AMSDRefreshMultiUserOptions *)v25 setSchedulingInterval:60.0];
    [(AMSDRefreshMultiUserOptions *)v25 setShouldUseCloudData:1];
    v26 = +[AMSDMultiUserController sharedController];
    id v30 = [v26 refreshWithOptions:v25];
LABEL_17:
  }
}

- (AMSThreadSafeDictionary)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (AMSDCloudDataManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_containers, 0);
}

@end