@interface LocalApproveRequestTask
- (LocalApproveRequestTask)initWithItemIdentifier:(id)a3;
- (NSString)itemIdentifier;
- (id)_parseResult:(id)a3;
- (id)_serverRequestWithUser:(id)a3 requestIdentifier:(id)a4 error:(id *)a5;
- (id)perform;
@end

@implementation LocalApproveRequestTask

- (LocalApproveRequestTask)initWithItemIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LocalApproveRequestTask;
  v6 = [(LocalApproveRequestTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemIdentifier, a3);
  }

  return v7;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000109EC;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(LocalApproveRequestTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (id)_serverRequestWithUser:(id)a3 requestIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = +[AMSBag sharedBag];
  v10 = [v9 updateRequestURL];

  v37[0] = @"requestId";
  v37[1] = @"approvalStatus";
  v38[0] = v8;
  v38[1] = &off_10003AD78;
  v11 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v12 = objc_alloc_init(URLRequestEncoder);
  v13 = [(URLRequestEncoder *)v12 requestWithMethod:4 bagURL:v10 parameters:v11];
  id v34 = 0;
  v14 = [v13 resultWithTimeout:&v34 error:60.0];
  id v15 = v34;
  if (v14)
  {
    id v31 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = self;
      id v16 = v14;
      v17 = [v7 DSID];
      objc_msgSend(v16, "ap_setNullableValue:forHTTPHeaderField:", v17, @"X-IC-DSID");

      v18 = [v7 password];
      objc_msgSend(v16, "ap_setNullableValue:forHTTPHeaderField:", v18, @"X-IC-Password");

      v19 = [v7 username];
      objc_msgSend(v16, "ap_setNullableValue:forHTTPHeaderField:", v19, @"X-IC-Username");

      v20 = +[APLogConfig sharedDaemonConfig];
      if (!v20)
      {
        v20 = +[APLogConfig sharedConfig];
      }
      id v30 = v7;
      v21 = objc_msgSend(v20, "OSLogObject", v29);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
      }
      v24 = +[URLSession sharedSession];
      v25 = [v24 dataTaskPromiseWithRequest:v16];

      id v33 = v15;
      v26 = [v25 resultWithTimeout:&v33 error:60.0];
      id v27 = v33;

      id v7 = v30;
    }
    else
    {
      APError();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      id v16 = v15;
    }

    id v15 = v27;
    id v8 = v31;
  }
  else
  {
    v26 = 0;
  }
  if (a5) {
    *a5 = v15;
  }

  return v26;
}

- (id)_parseResult:(id)a3
{
  v3 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (!v4)
  {
    v18 = APError();
    goto LABEL_40;
  }
  id v5 = [v4 objectForKeyedSubscript:@"status"];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 integerValue];
    uint64_t v7 = +[APLogConfig sharedDaemonConfig];
    id v8 = (void *)v7;
    if (!v6)
    {
      if (!v7)
      {
        id v8 = +[APLogConfig sharedConfig];
      }
      v19 = [v8 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = (id)objc_opt_class();
        id v20 = v26;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Success status code", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_39;
    }
    if (!v7)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    objc_super v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2050;
      id v28 = v6;
      id v10 = v26;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error status code. Status code: %{public}ld", buf, 0x16u);
    }
    v11 = [v4 objectForKeyedSubscript:@"errorNumber"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v18 = APError();
LABEL_38:

      goto LABEL_39;
    }
    id v12 = [v11 integerValue];
    if (v12 == (id)3711)
    {
      v13 = +[APLogConfig sharedDaemonConfig];
      if (!v13)
      {
        v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v26 = v21;
      id v16 = v21;
      v17 = "%{public}@: Previously declined error code";
    }
    else if (v12 == (id)3710)
    {
      v13 = +[APLogConfig sharedDaemonConfig];
      if (!v13)
      {
        v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v26 = v22;
      id v16 = v22;
      v17 = "%{public}@: Previously approved error code";
    }
    else
    {
      if (v12 != (id)3709)
      {
        id v23 = +[NSString stringWithFormat:@"Server response contains error. Error code: %ld", v12];
        v18 = APError();

        goto LABEL_38;
      }
      v13 = +[APLogConfig sharedDaemonConfig];
      if (!v13)
      {
        v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      id v16 = v15;
      v17 = "%{public}@: Request expired error code";
    }
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

LABEL_36:
    v18 = 0;
    goto LABEL_38;
  }
  v18 = APError();
LABEL_39:

LABEL_40:
  return v18;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end