@interface AMSDRefreshMultiUserTask
+ (id)_createGenerateMultiUserTokenTaskForAccount:(id)a3 withController:(id)a4 home:(id)a5 multiUserTokenExists:(BOOL)a6;
- (AMSDMultiUserController)controller;
- (AMSDMultiUserMetrics)metrics;
- (AMSDRefreshMultiUserOptions)options;
- (AMSDRefreshMultiUserTask)initWithMultiUserController:(id)a3 homes:(id)a4 options:(id)a5;
- (BOOL)_createMultiUserTokenForHome:(id)a3 error:(id *)a4;
- (NSArray)homes;
- (id)performTask;
- (void)_createMultiUserTokensWithErrors:(id)a3;
- (void)_reconcileRecordZonesWithErrors:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AMSDRefreshMultiUserTask

- (AMSDRefreshMultiUserTask)initWithMultiUserController:(id)a3 homes:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDRefreshMultiUserTask;
  v12 = [(AMSDRefreshMultiUserTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a3);
    objc_storeStrong((id *)&v13->_homes, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (id)performTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005872C;
  v4[3] = &unk_100112720;
  v4[4] = self;
  v2 = [(AMSDRefreshMultiUserTask *)self performTaskWithBlock:v4];
  return v2;
}

+ (id)_createGenerateMultiUserTokenTaskForAccount:(id)a3 withController:(id)a4 home:(id)a5 multiUserTokenExists:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[AMSDGenerateMultiUserTokenTask alloc] initWithController:v10 account:v11 home:v9];

  [(AMSDGenerateMultiUserTokenTask *)v12 setRunMode:1];
  [(AMSDGenerateMultiUserTokenTask *)v12 setTokenNeedsRegeneration:v6];
  return v12;
}

- (BOOL)_createMultiUserTokenForHome:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 isCurrentUserRestrictedGuest];
  uint64_t v8 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  id v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v91 = v11;
      __int16 v92 = 2114;
      v93 = v12;
      __int16 v94 = 2114;
      id v95 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping multi-user token generation restricted guest in home = %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  if (!v8)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v9 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    v16 = AMSLogKey();
    v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v91 = v15;
    __int16 v92 = 2114;
    v93 = v16;
    __int16 v94 = 2114;
    id v95 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating a Multi-User token if necessary. home = %{public}@", buf, 0x20u);
  }
  v18 = +[ACAccountStore ams_sharedAccountStore];
  id v9 = objc_msgSend(v18, "ams_activeiTunesAccount");

  if (v9)
  {
    v85 = a4;
    v19 = [AMSDFetchMultiUserRecordZoneTask alloc];
    v20 = [v6 currentUser];
    v21 = [(AMSDRefreshMultiUserTask *)self controller];
    v22 = [v21 cloudContainer];
    v23 = [v22 privateDatabase];
    v24 = [(AMSDRefreshMultiUserTask *)self metrics];
    v25 = [(AMSDFetchMultiUserRecordZoneTask *)v19 initWithHome:v6 homeUser:v20 database:v23 metrics:v24];

    [(AMSDFetchMultiUserRecordZoneTask *)v25 setRunMode:1];
    v86 = v25;
    v26 = [(AMSDFetchMultiUserRecordZoneTask *)v25 performTask];
    id v89 = 0;
    v27 = [v26 resultWithError:&v89];
    id v28 = v89;
    if (!v27)
    {
      v47 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v47)
      {
        v47 = +[AMSLogConfig sharedConfig];
      }
      v48 = [v47 OSLogObject];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = objc_opt_class();
        v50 = AMSLogKey();
        v51 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        uint64_t v91 = v49;
        __int16 v92 = 2114;
        v93 = v50;
        __int16 v94 = 2114;
        id v95 = v51;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to fetch a home's record zone. error = %{public}@", buf, 0x20u);

        v27 = 0;
      }

      if (v85)
      {
        id v28 = v28;
        BOOL v13 = 0;
        id *v85 = v28;
      }
      else
      {
        BOOL v13 = 0;
      }
      v62 = v86;
      goto LABEL_68;
    }
    v82 = v26;
    v29 = [(AMSDRefreshMultiUserTask *)self controller];
    [v29 cloudContainer];
    v31 = v30 = v27;
    v32 = [v31 privateDatabase];
    v81 = v30;
    v33 = [v30 identifier];
    v34 = [v32 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v33];
    id v88 = v28;
    v35 = [v34 resultWithError:&v88];
    id v83 = v88;

    v36 = v35;
    if (!v35
      && (objc_msgSend(v83, "ams_hasDomain:code:", @"AMSDCloudDataErrorDomain", 7) & 1) == 0)
    {
      v68 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      v69 = v85;
      if (!v68)
      {
        v68 = +[AMSLogConfig sharedConfig];
      }
      v70 = [v68 OSLogObject];
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v71 = objc_opt_class();
        v72 = AMSLogKey();
        v73 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        uint64_t v91 = v71;
        __int16 v92 = 2114;
        v93 = v72;
        __int16 v94 = 2114;
        id v95 = v73;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to fetch a HomeParticipant record. error = %{public}@", buf, 0x20u);

        v36 = 0;
        v69 = v85;
      }
      v62 = v86;
      id v28 = v83;
      if (v69) {
        id *v69 = v83;
      }
      v54 = [(AMSDRefreshMultiUserTask *)self metrics];
      id v74 = [v54 enqueueCloudKitFetchFailedEventWithError:v83];
      BOOL v13 = 0;
      goto LABEL_67;
    }
    v37 = [(AMSDRefreshMultiUserTask *)self metrics];
    id v38 = [v37 enqueueCloudKitFetchSuccessEvent];

    v39 = [v35 fieldForKey:@"AMSHomeParticipant_MultiUserToken"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v41 = [v35 fieldForKey:@"AMSHomeParticipant_MultiUserTokenInvalid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v42 = v41;
    }
    else {
      id v42 = 0;
    }

    unsigned __int8 v52 = [v42 BOOLValue];
    uint64_t v53 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    v54 = (void *)v53;
    if ((isKindOfClass & 1) != 0 && (v52 & 1) == 0)
    {
      if (!v53)
      {
        v54 = +[AMSLogConfig sharedConfig];
      }
      v55 = [v54 OSLogObject];
      id v28 = v83;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v56 = objc_opt_class();
        v57 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v91 = v56;
        __int16 v92 = 2114;
        v93 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] A Multi-User token already exists.", buf, 0x16u);
      }
      BOOL v13 = 1;
      goto LABEL_51;
    }
    if (isKindOfClass)
    {
      if (!v53)
      {
        v54 = +[AMSLogConfig sharedConfig];
      }
      v58 = [v54 OSLogObject];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v59 = objc_opt_class();
        v60 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v91 = v59;
        __int16 v92 = 2114;
        v93 = v60;
        v61 = "%{public}@: [%{public}@] A Multi-User token exists but is invalid.";
LABEL_49:
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v61, buf, 0x16u);
      }
    }
    else
    {
      if (!v53)
      {
        v54 = +[AMSLogConfig sharedConfig];
      }
      v58 = [v54 OSLogObject];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v63 = objc_opt_class();
        v60 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v91 = v63;
        __int16 v92 = 2114;
        v93 = v60;
        v61 = "%{public}@: [%{public}@] No Multi-User token exists.";
        goto LABEL_49;
      }
    }

    v64 = objc_opt_class();
    v65 = [(AMSDRefreshMultiUserTask *)self controller];
    v54 = [v64 _createGenerateMultiUserTokenTaskForAccount:v9 withController:v65 home:v6 multiUserTokenExists:isKindOfClass & 1];

    v66 = [v54 performTask];
    id v87 = v83;
    v67 = [v66 resultWithError:&v87];
    id v28 = v87;

    BOOL v13 = v67 != 0;
    if (!v67)
    {
      id v84 = v35;
      v75 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v75)
      {
        v75 = +[AMSLogConfig sharedConfig];
      }
      v76 = [v75 OSLogObject];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        uint64_t v77 = objc_opt_class();
        v78 = AMSLogKey();
        v79 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        uint64_t v91 = v77;
        __int16 v92 = 2114;
        v93 = v78;
        __int16 v94 = 2114;
        id v95 = v79;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating multi-user token: %{public}@", buf, 0x20u);
      }
      if (v85)
      {
        id v28 = v28;
        BOOL v13 = 0;
        id *v85 = v28;
      }
      else
      {
        BOOL v13 = 0;
      }
      v62 = v86;
      v36 = v84;
      goto LABEL_67;
    }
LABEL_51:
    v62 = v86;
LABEL_67:

    v27 = v81;
    v26 = v82;
LABEL_68:

    goto LABEL_69;
  }
  v43 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v43)
  {
    v43 = +[AMSLogConfig sharedConfig];
  }
  v44 = [v43 OSLogObject];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = objc_opt_class();
    v46 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v91 = v45;
    __int16 v92 = 2114;
    v93 = v46;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to generate a multi-user token for the home. There's no active iTunes account.", buf, 0x16u);
  }
  if (a4)
  {
    AMSError();
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
LABEL_7:
  BOOL v13 = 0;
LABEL_69:

  return v13;
}

- (void)_createMultiUserTokensWithErrors:(id)a3
{
  id v4 = a3;
  if (+[AMSDMultiUserController deviceCanManageMultiUser])
  {
    if (([(AMSDRefreshMultiUserTask *)self isCancelled] & 1) == 0
      && (sub_1000219BC(v4, v5) & 1) == 0)
    {
      id v6 = [(AMSDRefreshMultiUserTask *)self options];
      unsigned int v7 = [v6 shouldUseCloudData];

      if (v7)
      {
        uint64_t v8 = [(AMSDRefreshMultiUserTask *)self homes];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1000597B0;
        v9[3] = &unk_100114230;
        v9[4] = self;
        id v10 = v4;
        [v8 enumerateObjectsUsingBlock:v9];
      }
    }
  }
}

- (void)_reconcileRecordZonesWithErrors:(id)a3
{
  id v4 = a3;
  if (+[AMSDMultiUserController deviceCanManageMultiUser])
  {
    if (([(AMSDRefreshMultiUserTask *)self isCancelled] & 1) == 0
      && (sub_1000219BC(v4, v5) & 1) == 0)
    {
      id v6 = [(AMSDRefreshMultiUserTask *)self options];
      unsigned int v7 = [v6 shouldUseCloudData];

      if (v7)
      {
        uint64_t v8 = [(AMSDRefreshMultiUserTask *)self controller];
        id v9 = [v8 cloudContainer];
        id v10 = [v9 privateDatabase];

        uint64_t v11 = [v10 fetchRecordZones];
        id v24 = 0;
        v12 = [v11 resultWithError:&v24];
        id v13 = v24;

        if (v12)
        {
          v14 = [v12 results];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100059AC4;
          v20[3] = &unk_100114258;
          id v21 = v10;
          v22 = self;
          id v23 = v4;
          [v14 enumerateKeysAndObjectsUsingBlock:v20];
        }
        else
        {
          uint64_t v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
          if (!v15)
          {
            uint64_t v15 = +[AMSLogConfig sharedConfig];
          }
          v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = objc_opt_class();
            v18 = AMSLogKey();
            v19 = AMSLogableError();
            *(_DWORD *)buf = 138543874;
            uint64_t v26 = v17;
            __int16 v27 = 2114;
            id v28 = v18;
            __int16 v29 = 2114;
            v30 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch all record zones. error = %{public}@", buf, 0x20u);
          }
          [v4 addObject:v13];
        }
      }
    }
  }
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (NSArray)homes
{
  return self->_homes;
}

- (AMSDRefreshMultiUserOptions)options
{
  return self->_options;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end