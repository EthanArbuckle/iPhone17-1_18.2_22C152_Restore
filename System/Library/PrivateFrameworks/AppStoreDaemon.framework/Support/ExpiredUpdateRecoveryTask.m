@interface ExpiredUpdateRecoveryTask
- (void)main;
@end

@implementation ExpiredUpdateRecoveryTask

- (void)main
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100017F78;
  v30 = sub_100017B78;
  id v31 = 0;
  v3 = sub_10001A308();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100261440;
  v25[3] = &unk_100524060;
  v25[4] = self;
  v25[5] = &v26;
  [v3 readUsingSession:v25];

  v4 = (void *)v27[5];
  if (v4)
  {
    v5 = [v4 purchaseInfoForUpdateUserInitiated:self->_userInitiated];
    v6 = +[NSNumber numberWithLongLong:self->_installID];
    [v5 setRefreshInstallID:v6];

    [v5 setBundleID:self->_bundleID];
    [v5 setExternalID:self->_externalID];
    [v5 setItemID:self->_itemID];
    [v5 setLogCode:self->_logCode];
    [v5 setMetricsType:&off_10054BD78];
    [v5 updateGeneratedProperties];
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 logKey];
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Initiating re-purchase for expired update", buf, 0xCu);
    }
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v10 = sub_100213454();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002614A0;
    v19[3] = &unk_100524088;
    id v11 = v5;
    id v20 = v11;
    v21 = self;
    objc_copyWeak(&v23, &location);
    v12 = v9;
    v22 = v12;
    sub_100213A9C((uint64_t)v10, v11, v19);

    dispatch_time_t v13 = dispatch_time(0, 120000000000);
    if (dispatch_semaphore_wait(v12, v13))
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = [v11 logKey];
        *(_DWORD *)buf = 138412290;
        v33 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%@] Timeout while waiting to re-purchase expired update", buf, 0xCu);
      }
      v15 = ASDErrorWithDescription();
      [(Task *)self completeWithError:v15];
    }
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  else
  {
    if (self->_bundleID)
    {
      v16 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138543362;
        v33 = bundleID;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not find non-installed update for bundle ID %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v16 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "_bundleID == nil", buf, 2u);
      }
    }

    ASDErrorWithDescription();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(Task *)self completeWithError:v11];
  }

  _Block_object_dispose(&v26, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCode, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end