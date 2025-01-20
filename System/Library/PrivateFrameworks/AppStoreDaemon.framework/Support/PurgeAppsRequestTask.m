@interface PurgeAppsRequestTask
- (void)main;
@end

@implementation PurgeAppsRequestTask

- (void)main
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    if (self)
    {
      v7 = self->super._options;
      client = self->super._client;
      v9 = v7;
    }
    else
    {
      v7 = 0;
      v9 = 0;
      client = 0;
    }
    v10 = client;
    v11 = [(XPCClient *)v10 clientID];
    *(_DWORD *)buf = 138544130;
    v50 = v5;
    __int16 v51 = 2114;
    v52 = v3;
    __int16 v53 = 2114;
    v54 = v7;
    __int16 v55 = 2114;
    v56 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Purge request with options: %{public}@ client: %{public}@", buf, 0x2Au);
  }
  uint64_t v12 = sub_1002C5D90();
  v13 = (void *)v12;
  if (v12) {
    v14 = *(void **)(v12 + 48);
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  objc_opt_class();
  id v16 = v15;
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (v17)
  {
    id v18 = v16;
    if (self)
    {
      v19 = self->super._options;
      v20 = self->super._client;
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    v21 = v20;
    v22 = [(XPCClient *)v21 clientID];
    v23 = sub_10021EF3C(v18, v19, v3, v22);

    v24 = [v23 error];

    v25 = ASDLogHandleForCategory();
    v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_opt_class();
        id v28 = v27;
        v29 = [v23 error];
        *(_DWORD *)buf = 138543874;
        v50 = v27;
        __int16 v51 = 2114;
        v52 = v3;
        __int16 v53 = 2114;
        v54 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] Purge app request resulted in error: %{public}@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_opt_class();
      id v48 = v32;
      if (self) {
        v33 = self->super._client;
      }
      else {
        v33 = 0;
      }
      v47 = v33;
      v46 = [(XPCClient *)v47 clientID];
      if (self) {
        options = self->super._options;
      }
      else {
        options = 0;
      }
      v45 = options;
      v35 = [(ASDRequestOptions *)v45 desiredPurgeAmount];
      v36 = [v23 purgedApps];
      id v37 = [v36 count];
      id v38 = [v23 purgedSize];
      *(_DWORD *)buf = 138544642;
      v50 = v32;
      __int16 v51 = 2114;
      v52 = v3;
      __int16 v53 = 2114;
      v54 = v46;
      __int16 v55 = 2114;
      v56 = v35;
      __int16 v57 = 2048;
      id v58 = v37;
      __int16 v59 = 2048;
      id v60 = v38;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Purged request for client: %{public}@ with desired amount: %{public}@ purged %ld app(s) with a total purge amount: %ld", buf, 0x3Eu);
    }
    sub_1000079C8(self, v23);
    unsigned __int8 v39 = [v23 success];
    if (self) {
      self->super.super._success = v39;
    }
    v40 = [v23 error];
    v42 = ASDErrorWithSafeUserInfo();
    if (self) {
      objc_setProperty_atomic_copy(self, v41, v42, 32);
    }
  }
  else
  {
    v30 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v50 = v43;
      __int16 v51 = 2114;
      v52 = v3;
      id v44 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] Unable to cast appPurgeCoordinator to a AppPurgeCoordinator", buf, 0x16u);
    }
    ASDErrorWithDescription();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v23 = ASDErrorWithSafeUserInfo();
    if (self) {
      objc_setProperty_atomic_copy(self, v31, v23, 32);
    }
  }
}

@end