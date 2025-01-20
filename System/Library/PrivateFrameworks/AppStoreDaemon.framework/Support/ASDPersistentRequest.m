@interface ASDPersistentRequest
- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4;
@end

@implementation ASDPersistentRequest

- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)a3 + 1);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v9 = (void *)*((void *)WeakRetained + 1);
      goto LABEL_4;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
LABEL_4:
  id v10 = v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = self;
    id v12 = objc_alloc((Class)ASDSystemAppMetadata);
    v13 = [(ASDPersistentRequest *)v11 bundleID];
    id v14 = [v12 initWithBundleID:v13];

    v15 = [v10 clientID];
    unsigned __int8 v16 = [v15 isEqualToString:@"com.apple.AppStore"];

    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = (uint64_t)[(ASDPersistentRequest *)v11 isUserInitiated];
    }
    [v14 setUserInitiated:v17];
    v18 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(ASDPersistentRequest *)v11 bundleID];
      *(_DWORD *)buf = 138543618;
      id v29 = v10;
      __int16 v30 = 2114;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Starting legacy request from: %{public}@ for system application: %{public}@", buf, 0x16u);
    }
    v20 = sub_10022889C();
    id v27 = v14;
    v21 = +[NSArray arrayWithObjects:&v27 count:1];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002FE420;
    v23[3] = &unk_1005275A0;
    id v24 = v10;
    v25 = v11;
    id v26 = v6;
    v22 = v11;
    [v20 installSystemApps:v21 onPairedDevice:0 withReplyHandler:v23];
  }
  else
  {
    ASDErrorWithTitleAndMessage();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v14);
  }
}

@end