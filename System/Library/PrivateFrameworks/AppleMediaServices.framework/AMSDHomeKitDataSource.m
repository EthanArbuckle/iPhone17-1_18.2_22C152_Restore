@interface AMSDHomeKitDataSource
- (AMSDHomeKitDataSource)init;
- (AMSDHomeManagerDataSourceDelegate)delegate;
- (AMSMutableBinaryPromise)homesUpdatedPromise;
- (AMSPromise)allHomes;
- (HMHomeManager)homeManager;
- (id)_allHomeKitHomes;
- (id)_settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (id)_settingForKeyPath:(id)a3 withSettings:(id)a4;
- (id)allUsersInHome:(id)a3;
- (id)currentDeviceIsAccessoryForHome:(id)a3;
- (id)homeWithIdentifier:(id)a3;
- (id)listeningHistoryUpdateEnabledForUser:(id)a3 home:(id)a4;
- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5;
- (id)settingForKeyPath:(id)a3;
- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (unint64_t)mediaProfileEnabledForUser:(id)a3 home:(id)a4;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateMultiUserStatus:(int64_t)a4 reason:(id)a5;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomesUpdatedPromise:(id)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)shareManager:(id)a3 didReceiveRepairInfo:(id)a4 home:(id)a5;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5;
- (void)teardownMultiUser;
- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation AMSDHomeKitDataSource

- (AMSDHomeKitDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)AMSDHomeKitDataSource;
  v2 = [(AMSDHomeKitDataSource *)&v11 init];
  if (v2)
  {
    v3 = (AMSMutableBinaryPromise *)objc_alloc_init((Class)AMSMutableBinaryPromise);
    homesUpdatedPromise = v2->_homesUpdatedPromise;
    v2->_homesUpdatedPromise = v3;

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v5 = (void *)qword_1001302D8;
    uint64_t v16 = qword_1001302D8;
    if (!qword_1001302D8)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003759C;
      v12[3] = &unk_100112770;
      v12[4] = &v13;
      sub_10003759C((uint64_t)v12);
      v5 = (void *)v14[3];
    }
    v6 = v5;
    _Block_object_dispose(&v13, 8);
    id v7 = [v6 alloc];
    uint64_t v8 = ((void (*)(id, const char *, uint64_t))[v7 methodForSelector:"initWithOptions:"])(v7, "initWithOptions:", 56);
    homeManager = v2->_homeManager;
    v2->_homeManager = (HMHomeManager *)v8;

    [(HMHomeManager *)v2->_homeManager setDelegate:v2];
  }
  return v2;
}

- (AMSPromise)allHomes
{
  objc_initWeak(&location, self);
  v3 = [(AMSDHomeKitDataSource *)self _allHomeKitHomes];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100034714;
  v6[3] = &unk_100112D28;
  objc_copyWeak(&v7, &location);
  v4 = [v3 thenWithBlock:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (AMSPromise *)v4;
}

- (id)allUsersInHome:(id)a3
{
  id v4 = a3;
  v5 = [v4 users];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 currentUser];

  objc_msgSend(v6, "ams_addNullableObject:", v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034930;
  v9[3] = &unk_100112D50;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  return v6;
}

- (id)currentDeviceIsAccessoryForHome:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDHomeKitDataSource *)self homeManager];
  id v6 = [v5 currentAccessory];

  if (v6)
  {
    id v7 = [v6 home];
    uint64_t v8 = [v7 uniqueIdentifier];
    v9 = [v4 uniqueIdentifier];
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isEqual:v9]);

    goto LABEL_16;
  }
  if (+[AMSDevice deviceIsAppleTV])
  {
    objc_super v11 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v11)
    {
      objc_super v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v13 = objc_opt_class();
    v14 = AMSLogKey();
    int v19 = 138543618;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    v22 = v14;
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@: [%{public}@] -[HMHomeManager currentAccessory] returned nil.", (uint8_t *)&v19, 0x16u);

LABEL_14:
    goto LABEL_15;
  }
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    objc_super v11 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v11)
    {
      objc_super v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    uint64_t v17 = objc_opt_class();
    v14 = AMSLogKey();
    int v19 = 138543618;
    uint64_t v20 = v17;
    __int16 v21 = 2114;
    v22 = v14;
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }
LABEL_15:
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)homeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDHomeKitDataSource *)self _allHomeKitHomes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034C7C;
  v9[3] = &unk_100112320;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 thenWithBlock:v9];

  return v7;
}

- (id)listeningHistoryUpdateEnabledForUser:(id)a3 home:(id)a4
{
  return 0;
}

- (unint64_t)mediaProfileEnabledForUser:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[AMSDevice deviceIsAppleTV])
  {
    uint64_t v8 = [v6 mediaContentProfileAccessControlForHome:v7];
    if (!v8)
    {
      v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v9)
      {
        v9 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        v12 = AMSLogKey();
        int v23 = 138543618;
        uint64_t v24 = v11;
        __int16 v25 = 2114;
        v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] -[HMUser mediaContentProfileAccessControlForHome:] returned nil.", (uint8_t *)&v23, 0x16u);
      }
    }
    uint64_t v13 = [v8 accessories];

    if (v13)
    {
      v14 = [v8 accessories];
      uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v14, "ams_anyWithTest:", &stru_100112DB8));
    }
  }
  else
  {
    if (!+[AMSDevice deviceIsAudioAccessory])
    {
LABEL_26:
      unint64_t v21 = 0;
      goto LABEL_27;
    }
    if (_os_feature_enabled_impl()) {
      CFStringRef v15 = @"root.music.allowiTunesAccount";
    }
    else {
      CFStringRef v15 = @"root.siri.identifyVoice";
    }
    os_log_type_t v16 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v16)
    {
      os_log_type_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      int v19 = AMSLogKey();
      int v23 = 138543874;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      v26 = v19;
      __int16 v27 = 2114;
      CFStringRef v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using %{public}@ to determine if a user's media profile is enabled.", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v20 = [(AMSDHomeKitDataSource *)self _settingForKeyPath:v15 user:v6 home:v7];
    uint64_t v8 = v20;
    if (v20)
    {
      uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 BOOLValue]);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }

  if (!v13) {
    goto LABEL_26;
  }
  if ([v13 BOOLValue]) {
    unint64_t v21 = 2;
  }
  else {
    unint64_t v21 = 1;
  }

LABEL_27:
  return v21;
}

- (void)teardownMultiUser
{
  v3 = [(AMSDHomeKitDataSource *)self homeManager];
  id v4 = [v3 userCloudShareManager];
  [v4 setDelegate:0];

  v5 = [(AMSDHomeKitDataSource *)self homeManager];
  [v5 setDelegate:0];

  [(AMSDHomeKitDataSource *)self setHomeManager:0];
  [(AMSDHomeKitDataSource *)self setDelegate:0];
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDHomeKitDataSource *)self homeManager];
  id v6 = [v5 userCloudShareManager];
  [v6 setDelegate:self];

  id v7 = objc_msgSend(v4, "ams_mapWithTransform:", &stru_100112DF8);
  uint64_t v8 = AMSLogKey();
  objc_initWeak(&location, self);
  v9 = [(AMSDHomeKitDataSource *)self homeManager];
  id v10 = [v9 userCloudShareManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000352FC;
  v12[3] = &unk_100112E20;
  id v11 = v8;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [v10 registerForContainerIDs:v7 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v28 = v11;
  }
  else {
    id v28 = 0;
  }

  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v14 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v14)
  {
    id v14 = +[AMSLogConfig sharedConfig];
  }
  CFStringRef v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = self;
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = AMSLogKey();
    uint64_t v18 = AMSHashIfNeeded();
    int v19 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v16;
    self = v27;
    __int16 v34 = 2114;
    v35 = v17;
    __int16 v36 = 2114;
    v37 = v18;
    __int16 v38 = 2114;
    v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending a cloud share to a home owner. share = %{public}@ | home = %{public}@", buf, 0x2Au);
  }
  uint64_t v20 = [v10 identifier];
  unint64_t v21 = [(AMSDHomeKitDataSource *)self homeWithIdentifier:v20];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000358B8;
  v29[3] = &unk_100112E70;
  id v30 = v11;
  id v31 = v12;
  id v22 = v12;
  id v23 = v11;
  uint64_t v24 = [v21 thenWithBlock:v29];

  __int16 v25 = [v24 thenWithBlock:&stru_100112EB0];

  return v25;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDHomeKitDataSource *)self homeManager];
  id v6 = [v5 currentAccessory];

  if (v6)
  {
    id v7 = [v6 settings];
    if (v7)
    {
      id v8 = [(AMSDHomeKitDataSource *)self _settingForKeyPath:v4 withSettings:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] -[HMHomeManager currentAccessory] returned nil.", (uint8_t *)&v14, 0x16u);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 identifier];
  id v12 = [(AMSDHomeKitDataSource *)self homeWithIdentifier:v11];
  id v13 = [v12 resultWithError:0];

  int v14 = [(AMSDHomeKitDataSource *)self allUsersInHome:v13];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100035F84;
  v26[3] = &unk_100112ED8;
  id v15 = v9;
  id v27 = v15;
  __int16 v16 = objc_msgSend(v14, "ams_firstObjectPassingTest:", v26);

  if (v13 && v16)
  {
    uint64_t v17 = [(AMSDHomeKitDataSource *)self _settingForKeyPath:v8 user:v16 home:v13];
  }
  else
  {
    uint64_t v18 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v18)
    {
      uint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    int v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      AMSLogKey();
      unint64_t v21 = v25 = v8;
      id v22 = AMSHashIfNeeded();
      id v23 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v20;
      __int16 v30 = 2114;
      id v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch a HMHome/HMHomeUser. home = %{public}@ | homeUser = %{public}@", buf, 0x2Au);

      id v8 = v25;
    }

    uint64_t v17 = 0;
  }

  return v17;
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v4 = a3;
  id v5 = (id)AMSSetLogKey();
  id v6 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = AMSHashIfNeeded();
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preferred media user for current accessory updated. Accessory = %{public}@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v11 = [(AMSDHomeKitDataSource *)self delegate];
  [v11 homeManagerDataSource:self didChangeWithType:7];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:0];
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v4 = (id)AMSSetLogKey();
  id v5 = [(AMSDHomeKitDataSource *)self delegate];
  [v5 homeManagerDataSource:self didChangeWithType:6];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:10];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:1];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:11];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:2];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = (id)AMSSetLogKey();
  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:3];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = (id)AMSSetLogKey();
  id v5 = [(AMSDHomeKitDataSource *)self homesUpdatedPromise];
  [v5 finishWithSuccess];

  id v6 = [(AMSDHomeKitDataSource *)self delegate];
  [v6 homeManagerDataSource:self didChangeWithType:4];
}

- (void)homeManager:(id)a3 didUpdateMultiUserStatus:(int64_t)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = (id)AMSSetLogKey();
  id v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    int v12 = AMSLogKey();
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] HomeKit's multi-user status changed. status = %ld | reason = %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  uint64_t v13 = [(AMSDHomeKitDataSource *)self delegate];
  [v13 homeManagerDataSource:self didChangeWithType:9];
}

- (void)settingsDidUpdate:(id)a3
{
  id v4 = (id)AMSSetLogKey();
  id v5 = [(AMSDHomeKitDataSource *)self delegate];
  [v5 homeManagerDataSource:self didChangeWithType:8];
}

- (void)shareManager:(id)a3 didReceiveRepairInfo:(id)a4 home:(id)a5
{
  id v6 = a5;
  id v7 = (id)AMSSetLogKey();
  id v9 = [(AMSDHomeKitDataSource *)self delegate];
  id v8 = [[AMSDHomeKitHome alloc] initWithHome:v6 dataSource:self];

  [v9 homeManagerDataSource:self didReceiveCloudDataRepairRequestForHome:v8];
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)AMSSetLogKey();
  id v10 = [(AMSDHomeKitDataSource *)self delegate];
  uint64_t v11 = [[AMSDHomeKitHomeCloudShare alloc] initWithShareInvitation:v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003681C;
  v13[3] = &unk_100112F00;
  id v14 = v7;
  id v12 = v7;
  [v10 homeManagerDataSource:self didReceiveCloudShare:v11 completion:v13];
}

- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5
{
  id v6 = (id)AMSSetLogKey();
  id v7 = [(AMSDHomeKitDataSource *)self delegate];
  [v7 homeManagerDataSource:self didChangeWithType:5];
}

- (id)_allHomeKitHomes
{
  v3 = [(AMSDHomeKitDataSource *)self homeManager];
  id v4 = [v3 multiUserStatus];

  id v5 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v7;
    __int16 v30 = 2114;
    id v31 = v8;
    __int16 v32 = 2048;
    id v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] HMHomeManagerMultiUserStatus = %ld", buf, 0x20u);
  }
  if (v4 == (id)1)
  {
    id v9 = objc_alloc_init((Class)AMSMutablePromise);
    objc_initWeak((id *)buf, self);
    id v10 = [(AMSDHomeKitDataSource *)self homesUpdatedPromise];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100036DDC;
    v25[3] = &unk_100112F28;
    objc_copyWeak(&v27, (id *)buf);
    id v11 = v9;
    id v26 = v11;
    [v10 addErrorBlock:v25];

    id v12 = [(AMSDHomeKitDataSource *)self homesUpdatedPromise];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100036F30;
    v22[3] = &unk_100112F78;
    objc_copyWeak(&v24, (id *)buf);
    id v13 = v11;
    id v23 = v13;
    [v12 addSuccessBlock:v22];

    id v14 = v23;
    id v15 = v13;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v16 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v16)
    {
      __int16 v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      int64_t v19 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      id v31 = v19;
      __int16 v32 = 2048;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Failed to fetch the device's homes. HomeKit isn't ready. status = %ld", buf, 0x20u);
    }
    __int16 v20 = AMSError();
    id v15 = +[AMSPromise promiseWithError:v20];
  }
  return v15;
}

- (id)_settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = [a4 userSettingsForHome:a5];
  id v10 = [v9 settings];
  if (v10)
  {
    id v11 = [(AMSDHomeKitDataSource *)self _settingForKeyPath:v8 withSettings:v10];
  }
  else
  {
    id v12 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = AMSLogKey();
      int v17 = 138544130;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the necessary HomeKit settings objects. settingsContainer = %@ | settings = %@", (uint8_t *)&v17, 0x2Au);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)_settingForKeyPath:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setDelegate:self];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [v7 rootGroup];
  objc_msgSend(v8, "ams_addNullableObject:", v9);

  id v10 = [v7 rootGroup];
  id v11 = [v10 groups];
  objc_msgSend(v8, "ams_addObjectsFromNullableArray:", v11);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v8;
  id v13 = (AMSDHomeKitHomeSetting *)[v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v13; i = (AMSDHomeKitHomeSetting *)((char *)i + 1))
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        __int16 v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) settings];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000374AC;
        v24[3] = &unk_100112FA0;
        id v25 = v6;
        int v17 = objc_msgSend(v16, "ams_firstObjectPassingTest:", v24);

        if (v17)
        {
          id v13 = [[AMSDHomeKitHomeSetting alloc] initWithSetting:v17];

          goto LABEL_11;
        }
      }
      id v13 = (AMSDHomeKitHomeSetting *)[v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v18 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v18)
  {
    uint64_t v18 = +[AMSLogConfig sharedConfig];
  }
  __int16 v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    __int16 v21 = AMSLogKey();
    id v22 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = v20;
    __int16 v32 = 2114;
    id v33 = v21;
    __int16 v34 = 2114;
    id v35 = v6;
    __int16 v36 = 2114;
    v37 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetched a HomeKit setting. keyPath = %{public}@ | setting = %{public}@", buf, 0x2Au);
  }
  return v13;
}

- (AMSDHomeManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSDHomeManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (AMSMutableBinaryPromise)homesUpdatedPromise
{
  return self->_homesUpdatedPromise;
}

- (void)setHomesUpdatedPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homesUpdatedPromise, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end