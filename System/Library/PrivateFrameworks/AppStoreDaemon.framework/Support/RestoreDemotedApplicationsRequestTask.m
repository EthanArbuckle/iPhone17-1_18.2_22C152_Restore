@interface RestoreDemotedApplicationsRequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
- (void)main;
@end

@implementation RestoreDemotedApplicationsRequestTask

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RestoreDemotedApplicationsRequestTask;
  v7 = [(RequestTask *)&v18 initForClient:a3 withOptions:v6];
  if (v7)
  {
    v8 = [v6 accountID];
    id v9 = [v8 copy];
    v10 = (void *)v7[8];
    v7[8] = v9;

    v11 = [v6 appleID];
    id v12 = [v11 copy];
    v13 = (void *)v7[9];
    v7[9] = v12;

    v14 = [v6 bundleIDs];
    id v15 = [v14 copy];
    v16 = (void *)v7[10];
    v7[10] = v15;
  }
  return v7;
}

- (void)main
{
  appleID = self->_appleID;
  v4 = ASDLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (appleID)
  {
    if (v5)
    {
      accountID = self->_accountID;
      v7 = self->_appleID;
      *(_DWORD *)buf = 138543618;
      v28 = accountID;
      __int16 v29 = 2114;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Looking for demoted applications for accountID: %{public}@ appleID: %{public}@", buf, 0x16u);
    }

    v8 = sub_1002B3410();
    id v9 = self->_appleID;
    id v26 = 0;
    v10 = sub_1002B4648(v8, v9, &v26);
    v11 = (NSNumber *)v26;

    if (v11)
    {
      id v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to log into account due to error: %{public}@", buf, 0xCu);
      }
    }
    if (v10)
    {
      v13 = sub_1002B3410();
      sub_1002B7108((uint64_t)v13, v10, 0);

      v14 = sub_1002B3410();
      id v15 = objc_msgSend(v10, "ams_DSID");
      sub_1002B4EB0((uint64_t)v14, v15);

      BOOL v16 = 1;
    }
    else
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_accountID;
        v23 = self->_appleID;
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        __int16 v29 = 2114;
        v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not find account for accountID: %{public}@] appleID: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      BOOL v16 = 0;
    }
  }
  else
  {
    if (v5)
    {
      v17 = [(NSArray *)self->_bundleIDs componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating jobs for demoted apps: [%{public}@]", buf, 0xCu);
    }
    v10 = sub_1002AD490([ImportJobsForDemotedAppsTask alloc], self->_bundleIDs);
    id v25 = 0;
    BOOL v16 = [(Task *)self runSubTask:v10 returningError:&v25];
    v11 = (NSNumber *)v25;
    objc_super v18 = ASDLogHandleForCategory();
    v14 = v18;
    if (v11)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        if (v10) {
          id Property = objc_getProperty(v10, v19, 32, 1);
        }
        else {
          id Property = 0;
        }
        v21 = (NSNumber *)Property;
        *(_DWORD *)buf = 138543362;
        v28 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Completed request with error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Completed Restore Demoted request successfully", buf, 2u);
      }
      v11 = 0;
    }
  }

  self->super.super._success = v16;
  objc_setProperty_atomic_copy(self, v24, v11, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end