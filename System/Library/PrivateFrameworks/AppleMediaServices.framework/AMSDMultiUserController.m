@interface AMSDMultiUserController
+ (BOOL)deviceCanManageMultiUser;
+ (BOOL)deviceSupportsMultipleUsers;
+ (id)_scheduledRefreshActivityBlock;
+ (id)sharedController;
- (AMSDCloudDataContainer)cloudContainer;
- (AMSDCloudDataManager)cloudDataManager;
- (AMSDHomeManager)homeManager;
- (AMSDMultiUserController)initWithCloudDataManager:(id)a3 homeManager:(id)a4;
- (AMSThreadSafeObject)previousCloudContainerStatus;
- (BOOL)_refreshShouldUseCloudDataWithHomes:(id)a3;
- (BOOL)shouldEnablePushTopic;
- (NSString)pushTopic;
- (id)_isCloudDataAvailable;
- (id)_isRefreshThrottlingDisabledWithOptions:(id)a3;
- (id)_refreshThrottlingDate;
- (id)_scheduleRefreshWithOptions:(id)a3;
- (id)databaseForHome:(id)a3 user:(id)a4;
- (id)refreshWithOptions:(id)a3;
- (id)refreshWithOptions:(id)a3 metrics:(id)a4;
- (void)_setLastSuccessfulRefreshDateWithHomes:(id)a3;
- (void)_setRefreshThrottlingDateWithTimeInterval:(double)a3;
- (void)cloudDataManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4;
- (void)handlePushNotification:(id)a3;
- (void)homeManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4;
- (void)homeManagerDataSource:(id)a3 didReceiveCloudDataRepairRequestForHome:(id)a4;
- (void)homeManagerDataSource:(id)a3 didReceiveCloudShare:(id)a4 completion:(id)a5;
- (void)setHomeManager:(id)a3;
- (void)setPreviousCloudContainerStatus:(id)a3;
- (void)teardownMultiUser;
@end

@implementation AMSDMultiUserController

- (AMSDMultiUserController)initWithCloudDataManager:(id)a3 homeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSDMultiUserController;
  v9 = [(AMSDMultiUserController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudDataManager, a3);
    objc_storeStrong((id *)&v10->_homeManager, a4);
    v11 = (AMSThreadSafeObject *)objc_alloc_init((Class)AMSThreadSafeObject);
    previousCloudContainerStatus = v10->_previousCloudContainerStatus;
    v10->_previousCloudContainerStatus = v11;
  }
  return v10;
}

- (void)teardownMultiUser
{
  v3 = [(AMSDMultiUserController *)self homeManager];
  [v3 teardownMultiUser];

  [(AMSDMultiUserController *)self setHomeManager:0];
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A998;
  block[3] = &unk_1001127A8;
  block[4] = a1;
  if (qword_1001302F8 != -1) {
    dispatch_once(&qword_1001302F8, block);
  }
  v2 = (void *)qword_100130300;
  return v2;
}

- (AMSDCloudDataContainer)cloudContainer
{
  v3 = objc_alloc_init(AMSDCloudDataContainerOptions);
  [(AMSDCloudDataContainerOptions *)v3 setRecordZoneEncryption:1];
  uint64_t v4 = +[AMSDefaults multiUserContainerID];
  v5 = (void *)v4;
  v6 = @"com.apple.applemediaservices.multiuser";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = [(AMSDMultiUserController *)self cloudDataManager];
  v9 = [v8 containerWithContainerIdentifier:v7 options:v3];

  return (AMSDCloudDataContainer *)v9;
}

+ (BOOL)deviceCanManageMultiUser
{
  if ((+[AMSDevice deviceIsiPhone] & 1) != 0
    || (+[AMSDevice deviceIsiPad] & 1) != 0)
  {
    return 1;
  }
  return +[AMSDevice deviceIsiPod];
}

+ (BOOL)deviceSupportsMultipleUsers
{
  if (+[AMSDevice deviceIsAppleTV]) {
    return 1;
  }
  return +[AMSDevice deviceIsAudioAccessory];
}

- (NSString)pushTopic
{
  v2 = [(AMSDMultiUserController *)self cloudDataManager];
  v3 = [v2 pushNotificationTopic];

  return (NSString *)v3;
}

- (id)databaseForHome:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 users];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003ADCC;
  v18[3] = &unk_1001122D0;
  id v9 = v7;
  id v19 = v9;
  unsigned int v10 = objc_msgSend(v8, "ams_anyWithTest:", v18);

  if (!v10) {
    goto LABEL_4;
  }
  v11 = [v6 currentUser];
  v12 = [v11 identifier];
  v13 = [v9 identifier];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15 = [(AMSDMultiUserController *)self cloudContainer];
    v16 = [v15 privateDatabase];
  }
  else
  {
LABEL_4:
    v16 = 0;
  }

  return v16;
}

- (id)refreshWithOptions:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[AMSDevice deviceIsAppleWatch])
  {
    id v8 = AMSError();
    id v9 = +[AMSPromise promiseWithError:v8];
  }
  else
  {
    [v6 schedulingInterval];
    if (v10 == 0.0)
    {
      v11 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v11)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        unsigned int v14 = AMSLogKey();
        v15 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queuing a new Multi-User refresh. options = %{public}@", buf, 0x20u);
      }
      id v16 = objc_alloc_init((Class)AMSMutablePromise);
      if (qword_100130308 != -1) {
        dispatch_once(&qword_100130308, &stru_1001130C8);
      }
      v17 = (id)qword_100130310;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10003B218;
      v24[3] = &unk_100112390;
      v24[4] = self;
      id v25 = v6;
      id v26 = v7;
      id v27 = v16;
      v18 = v24;
      id v19 = v16;
      v20 = AMSLogKey();
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10003E0B0;
      v29 = &unk_100112600;
      id v30 = v20;
      id v31 = v18;
      id v21 = v20;
      dispatch_async(v17, buf);

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10003B994;
      v23[3] = &unk_100113160;
      v23[4] = self;
      id v9 = [v19 continueWithBlock:v23];
    }
    else
    {
      id v9 = [(AMSDMultiUserController *)self _scheduleRefreshWithOptions:v6];
    }
  }

  return v9;
}

- (id)refreshWithOptions:(id)a3
{
  return [(AMSDMultiUserController *)self refreshWithOptions:a3 metrics:0];
}

- (void)cloudDataManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4
{
  id v6 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cloud data manager changed. changeType = %lu", buf, 0x20u);
  }
  if (a4)
  {
    double v10 = objc_alloc_init(AMSDMultiUserMetrics);
    id v11 = [(AMSDMultiUserMetrics *)v10 enqueueCloudKitSaveReceivedEvent];
    v12 = +[NSString stringWithFormat:@"Cloud data manager changed. changeType = %lu", a4];
    uint64_t v13 = [[AMSDRefreshMultiUserOptions alloc] initWithReason:v12];
    [(AMSDRefreshMultiUserOptions *)v13 setShouldUseCloudData:1];
    id v14 = [(AMSDMultiUserController *)self refreshWithOptions:v13 metrics:v10];
  }
  else
  {
    v15 = [(AMSDMultiUserController *)self cloudContainer];
    double v10 = [v15 status];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003C0A8;
    v17[3] = &unk_100111F20;
    v17[4] = self;
    [(AMSDMultiUserMetrics *)v10 addErrorBlock:v17];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003C1DC;
    v16[3] = &unk_1001131B0;
    v16[4] = self;
    v16[5] = 0;
    [(AMSDMultiUserMetrics *)v10 addSuccessBlock:v16];
  }
}

- (void)homeManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4
{
  id v6 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Home manager changed. changeType = %lu", buf, 0x20u);
  }
  double v10 = objc_alloc_init(AMSDMultiUserMetrics);
  id v11 = [(AMSDMultiUserMetrics *)v10 enqueueHomeKitChangedReceivedEvent];
  v12 = +[NSString stringWithFormat:@"Home manager changed (changeType = %lu)", a4];
  uint64_t v13 = [[AMSDRefreshMultiUserOptions alloc] initWithReason:v12];
  [(AMSDRefreshMultiUserOptions *)v13 setShouldUseCloudData:0];
  if (a4 == 2)
  {
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  if (a4 == 3)
  {
    uint64_t v14 = 1;
LABEL_9:
    [(AMSDRefreshMultiUserOptions *)v13 setShouldUseCloudData:1];
    [(AMSDRefreshMultiUserOptions *)v13 setReasonType:v14];
  }
  id v15 = [(AMSDMultiUserController *)self refreshWithOptions:v13 metrics:v10];
}

- (void)homeManagerDataSource:(id)a3 didReceiveCloudDataRepairRequestForHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    AMSHashIfNeeded();
    v12 = (id (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Data source received a cloud data repair request, queuing. home = %{public}@", buf, 0x20u);
  }
  uint64_t v13 = objc_alloc_init(AMSDMultiUserMetrics);
  id v14 = [(AMSDMultiUserMetrics *)v13 enqueueHomeKitRepairRequestReceivedEvent];
  if ([v7 isCurrentUserRestrictedGuest])
  {
    id v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      __int16 v18 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Current User is restricted guest in home, not updating multi-user token, task will not be queued.", buf, 0x16u);
    }
  }
  else
  {
    if (qword_100130320 != -1) {
      dispatch_once(&qword_100130320, &stru_1001131D0);
    }
    id v19 = (id)qword_100130328;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v35 = sub_100015ACC;
    v36 = sub_100015A64;
    id v37 = 0;
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_10003CA68;
    v29 = &unk_100113220;
    id v30 = self;
    id v20 = v7;
    id v31 = v20;
    id v15 = v19;
    id v32 = v15;
    v33 = buf;
    unint64_t v21 = objc_retainBlock(&v26);
    __int16 v22 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v21;

    os_unfair_lock_lock_with_options();
    unint64_t v23 = [AMSDUpdateMultiUserTokenTask alloc];
    v24 = -[AMSDUpdateMultiUserTokenTask initWithController:home:](v23, "initWithController:home:", self, v20, v26, v27, v28, v29, v30);
    [(AMSDUpdateMultiUserTokenTask *)v24 setMetrics:v13];
    [v15 addObject:v24];
    id v25 = [v15 count];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100130318);
    if (v25 == (id)1) {
      (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)homeManagerDataSource:(id)a3 didReceiveCloudShare:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    v12 = AMSLogKey();
    uint64_t v13 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v12;
    __int16 v23 = 2114;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Data source received a cloud share. share = %{public}@", buf, 0x20u);
  }
  id v14 = [[AMSDAcceptHomeCloudShareTask alloc] initWithController:self cloudShare:v7];
  id v15 = [(AMSDAcceptHomeCloudShareTask *)v14 performTask];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003D01C;
  v17[3] = &unk_100112F00;
  id v18 = v8;
  id v16 = v8;
  [v15 addFinishBlock:v17];
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDMultiUserController *)self cloudDataManager];
  [v5 handlePushNotification:v4];
}

- (BOOL)shouldEnablePushTopic
{
  v2 = objc_opt_class();
  return [v2 deviceSupportsMultipleUsers];
}

- (id)_isCloudDataAvailable
{
  v3 = [(AMSDMultiUserController *)self cloudContainer];
  id v4 = [v3 status];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D180;
  v8[3] = &unk_100113270;
  v8[4] = self;
  id v5 = [v4 continueWithBlock:v8];
  id v6 = [v5 binaryPromiseAdapter];

  return v6;
}

- (id)_isRefreshThrottlingDisabledWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDMultiUserController *)self _refreshThrottlingDate];
  id v6 = +[NSDate date];
  id v7 = [v6 compare:v5];

  if (v7 != (id)-1)
  {
LABEL_8:
    v12 = +[AMSBinaryPromise promiseWithSuccess];
    goto LABEL_9;
  }
  if ([v4 ignoreThrottling])
  {
    id v8 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring active refresh throttling.", buf, 0x16u);
    }
    goto LABEL_8;
  }
  id v14 = +[NSString stringWithFormat:@"Refresh throttling is active. nextRefresh = %@", v5];
  id v15 = AMSError();
  v12 = +[AMSBinaryPromise promiseWithError:v15];

LABEL_9:
  return v12;
}

- (BOOL)_refreshShouldUseCloudDataWithHomes:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSStorage _valueForKey:@"AMSDLastMultiUserRefresh"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  [v5 doubleValue];
  double v7 = v6;

  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
  id v9 = +[NSDate date];
  uint64_t v10 = [v8 dateByAddingTimeInterval:86400.0];
  id v11 = [v9 compare:v10];

  if (v11 == (id)-1)
  {
    uint64_t v13 = +[AMSStorage _valueForKey:@"AMSDLastMultiUserRefreshHomes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    uint64_t v15 = objc_msgSend(v3, "ams_mapWithTransform:", &stru_1001132B0);
    id v16 = (void *)v15;
    LOBYTE(v12) = 1;
    if (v14 && v15)
    {
      id v17 = [objc_alloc((Class)NSSet) initWithArray:v14];
      id v18 = [objc_alloc((Class)NSSet) initWithArray:v16];
      unsigned int v12 = [v17 isEqualToSet:v18] ^ 1;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (id)_refreshThrottlingDate
{
  v2 = +[AMSStorage _valueForKey:@"AMSDNextRefresh"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  [v3 doubleValue];
  double v5 = v4;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v5];
}

- (void)_setLastSuccessfulRefreshDateWithHomes:(id)a3
{
  id v3 = a3;
  double v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  +[AMSStorage _setValue:v5 forKey:@"AMSDLastMultiUserRefresh"];

  objc_msgSend(v3, "ams_mapWithTransform:", &stru_1001132D0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  +[AMSStorage _setValue:v6 forKey:@"AMSDLastMultiUserRefreshHomes"];
}

- (void)_setRefreshThrottlingDateWithTimeInterval:(double)a3
{
  double v4 = +[NSDate date];
  id v6 = [v4 dateByAddingTimeInterval:a3];

  [v6 timeIntervalSinceReferenceDate];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  +[AMSStorage _setValue:v5 forKey:@"AMSDNextRefresh"];
}

+ (id)_scheduledRefreshActivityBlock
{
  return &stru_100113310;
}

- (id)_scheduleRefreshWithOptions:(id)a3
{
  id v4 = a3;
  double v5 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v5)
  {
    double v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    id v9 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    __int16 v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling a refresh. options = %{public}@", buf, 0x20u);
  }
  [v4 schedulingInterval];
  uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  id v11 = [(AMSDMultiUserController *)self _refreshThrottlingDate];
  if ([v10 compare:v11] == (id)1)
  {
    [v4 throttlingInterval];
    double v13 = v12;
    if (v12 != 0.0)
    {
      [v4 throttlingInterval];
      -[AMSDMultiUserController _setRefreshThrottlingDateWithTimeInterval:](self, "_setRefreshThrottlingDateWithTimeInterval:");
    }
    id v14 = [[AMSDBackgroundActivityScheduler alloc] initWithIdentifier:@"com.apple.amsaccountsd.refresh"];
    uint64_t v15 = [(id)objc_opt_class() _scheduledRefreshActivityBlock];
    [(AMSDBackgroundActivityScheduler *)v14 setActivityBlock:v15];

    [(AMSDBackgroundActivityScheduler *)v14 setAllowBattery:1];
    [v4 schedulingInterval];
    -[AMSDBackgroundActivityScheduler setInterval:](v14, "setInterval:");
    [(AMSDBackgroundActivityScheduler *)v14 setQualityOfService:17];
    [(AMSDBackgroundActivityScheduler *)v14 setRequireNetworkConnection:1];
    [(AMSDBackgroundActivityScheduler *)v14 schedule];
    id v16 = [[AMSDRefreshMultiUserResult alloc] initWithHomes:0 options:v4];
    [(AMSDRefreshMultiUserResult *)v16 setEnabledThrottling:v13 != 0.0];
    [(AMSDRefreshMultiUserResult *)v16 setScheduled:1];
    uint64_t v17 = +[AMSPromise promiseWithResult:v16];
  }
  else
  {
    +[NSString stringWithFormat:@"Refresh throttling is active. nextRefresh = %@", v11];
    id v14 = (AMSDBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue();
    AMSError();
    id v16 = (AMSDRefreshMultiUserResult *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = +[AMSPromise promiseWithError:v16];
  }
  id v18 = (void *)v17;

  return v18;
}

- (AMSDCloudDataManager)cloudDataManager
{
  return self->_cloudDataManager;
}

- (AMSDHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (AMSThreadSafeObject)previousCloudContainerStatus
{
  return self->_previousCloudContainerStatus;
}

- (void)setPreviousCloudContainerStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCloudContainerStatus, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_cloudDataManager, 0);
}

@end