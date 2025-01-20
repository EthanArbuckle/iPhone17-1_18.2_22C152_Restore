@interface StorageHelper
+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4;
+ (id)approvalRequestWithRequestIdentifier:(id)a3;
@end

@implementation StorageHelper

+ (id)approvalRequestWithRequestIdentifier:(id)a3
{
  id v14 = 0;
  v3 = [a1 _requestInfoForIndentifier:a3 withError:&v14];
  id v4 = v14;
  v5 = [v3 object];
  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }

  v7 = +[APLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[APLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = [v3 object];
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Request Info: %@.", buf, 0x16u);
  }
  v12 = [[ApprovalRequest alloc] initWithCloudPushDictionary:v6];

  return v12;
}

+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = +[AMSBag sharedBag];
  v7 = [v6 retrieveRequestURL];

  CFStringRef v33 = @"requestId";
  id v34 = v5;
  v8 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v9 = objc_alloc_init(URLRequestEncoder);
  id v10 = [(URLRequestEncoder *)v9 requestWithMethod:4 bagURL:v7 parameters:v8];
  id v30 = 0;
  v11 = [v10 resultWithTimeout:&v30 error:60.0];
  id v12 = v30;
  if (v11)
  {
    v26 = v7;
    v27 = a4;
    id v28 = v5;
    v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[APLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
    }
    __int16 v17 = +[URLSession sharedSession];
    v18 = [v17 dataTaskPromiseWithRequest:v11];

    id v29 = v12;
    v19 = [v18 resultWithTimeout:&v29 error:60.0];
    id v20 = v29;

    if (v19)
    {
      v21 = +[APLogConfig sharedDaemonConfig];
      if (!v21)
      {
        v21 = +[APLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v32 = v23;
        id v24 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);
      }
    }

    id v12 = v20;
    a4 = v27;
    id v5 = v28;
    v7 = v26;
    if (v27) {
      goto LABEL_13;
    }
  }
  else
  {
    v19 = 0;
    if (a4) {
LABEL_13:
    }
      *a4 = v12;
  }

  return v19;
}

@end