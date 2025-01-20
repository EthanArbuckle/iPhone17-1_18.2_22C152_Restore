@interface FamilyRequestTask
- (FamilyRequestTask)initWithDSID:(id)a3;
- (NSNumber)DSID;
- (id)_performWithFamilyRequest:(id)a3;
- (id)perform;
- (int64_t)_familyMemberType:(id)a3;
- (void)setDSID:(id)a3;
@end

@implementation FamilyRequestTask

- (FamilyRequestTask)initWithDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FamilyRequestTask;
  v6 = [(FamilyRequestTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_DSID, a3);
  }

  return v7;
}

- (id)perform
{
  id v3 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
  v4 = [(FamilyRequestTask *)self _performWithFamilyRequest:v3];

  return v4;
}

- (id)_performWithFamilyRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSMutablePromise);
  v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[APLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v8 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching FamilyCircle", buf, 0xCu);
  }
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_10000FD48;
  v20 = &unk_100038A78;
  v21 = self;
  id v9 = v5;
  id v22 = v9;
  [v4 startRequestWithCompletionHandler:&v17];

  v10 = +[APLogConfig sharedDaemonConfig];
  if (!v10)
  {
    v10 = +[APLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v24 = v12;
    id v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting on FamilyCircle", buf, 0xCu);
  }
  v14 = v22;
  id v15 = v9;

  return v15;
}

- (int64_t)_familyMemberType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v9 = v16;
    v10 = "%{public}@: Family Member == nil. Unable to determine if Guardian or Requester.";
    v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  if (([v3 isGuardian] & 1) != 0
    || ([v4 isParent] & 1) != 0
    || [v4 isOrganizer])
  {
    id v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      id v7 = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: I am a Guardian/Parent/Organizer: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    int64_t v8 = 0;
    goto LABEL_16;
  }
  if (([v4 isChildAccount] & 1) == 0 && !objc_msgSend(v4, "isTeenAccount"))
  {
    id v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v9 = v16;
    v10 = "%{public}@: Unable to determine if Guardian or Requester.";
    v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v15, 0xCu);

LABEL_15:
    int64_t v8 = 2;
    goto LABEL_16;
  }
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    id v14 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: I am a Child/Teen: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  int64_t v8 = 1;
LABEL_16:

  return v8;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end