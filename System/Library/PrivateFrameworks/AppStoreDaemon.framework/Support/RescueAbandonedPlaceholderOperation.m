@interface RescueAbandonedPlaceholderOperation
- (void)main;
@end

@implementation RescueAbandonedPlaceholderOperation

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    bundleID = self->_bundleID;
    *(_DWORD *)buf = 138543618;
    v48 = v4;
    __int16 v49 = 2114;
    v50 = bundleID;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Attempting hydrate bundleID: %{public}@", buf, 0x16u);
  }
  v7 = self->_bundleID;
  if (!v7)
  {
    ASDErrorWithTitleAndMessage();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = 0;
    BOOL v17 = 0;
    goto LABEL_32;
  }
  v8 = v7;
  id v46 = 0;
  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v46];
  id v10 = v46;
  if (!v9)
  {
    v18 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v48 = v40;
      __int16 v49 = 2112;
      v50 = v8;
      id v41 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Cannot find application with bundleID: %@", buf, 0x16u);
    }
    uint64_t v14 = ASDErrorWithTitleAndMessage();
    id v9 = v10;
    goto LABEL_13;
  }
  if (([v9 isPlaceholder] & 1) == 0)
  {
    v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v48 = v12;
      __int16 v49 = 2112;
      v50 = v8;
      id v13 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Application does not need rescue, bundleID: %@ is already installed!", buf, 0x16u);
    }
    uint64_t v14 = ASDErrorWithTitleAndMessage();

LABEL_13:
    id v9 = 0;
    id v10 = (id)v14;
  }
  id v19 = v10;

  id v16 = v19;
  BOOL v17 = 0;
  if (!v16 && v9)
  {
    v20 = self->_bundleID;
    id v9 = v9;
    id v21 = [v9 installType];
    v22 = [v9 iTunesMetadata];
    id v23 = [v22 storeItemIdentifier];

    v24 = ASDLogHandleForCategory();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        id v27 = v26;
        v28 = [v9 iTunesMetadata];
        id v29 = [v28 storeItemIdentifier];
        *(_DWORD *)buf = 138544130;
        v48 = v26;
        __int16 v49 = 2114;
        v50 = v20;
        __int16 v51 = 2048;
        id v52 = v29;
        __int16 v53 = 2048;
        id v54 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Hydrating placeholder for bundleID: %{public}@ itemID: %llu installType: %ld", buf, 0x2Au);
      }
      v30 = 0;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v42 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v48 = v42;
        __int16 v49 = 2114;
        v50 = v20;
        __int16 v51 = 2048;
        id v52 = v21;
        id v43 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to hydrate placeholder for bundleID: %{public}@ installType: %ld due to lack of store itemID", buf, 0x20u);
      }
      v30 = ASDErrorWithTitleAndMessage();
    }
    id v31 = v30;

    id v16 = v31;
    BOOL v17 = 0;
    if (!v16 && v23)
    {
      v32 = self->_bundleID;
      id v33 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v32, 0);
      id v34 = sub_1002AD490([ImportJobsForDemotedAppsTask alloc], v33);
      id v46 = 0;
      BOOL v17 = [(Task *)self runSubTask:v34 returningError:&v46];
      if (!v17)
      {
        v35 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v48 = v44;
          __int16 v49 = 2114;
          v50 = v32;
          __int16 v51 = 2114;
          id v52 = v46;
          id v45 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to hydrate bundleID: %{public}@ error: %{public}@", buf, 0x20u);
        }
      }
      id v36 = v46;
      if (v46) {
        id v37 = v46;
      }

      id v16 = v36;
    }
  }
LABEL_32:
  objc_setProperty_atomic_copy(self, v15, v16, 32);
  self->super._success = v17;
  [(Task *)self lock];
  id v38 = [self->_outputBlock copy];
  [(Task *)self unlock];
  v39 = (void (**)(id, BOOL, id))objc_retainBlock(v38);

  if (v39)
  {
    v39[2](v39, v17, v16);
    sub_1002DB15C(self, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end