@interface ApproverRemoteNotificationTask
- (AMSBag)bag;
- (ApproverRemoteNotificationTask)initWithPayload:(id)a3;
- (NSDictionary)payload;
- (NSString)requestIdentifier;
- (id)_approvalRequestFromResult:(id)a3 withError:(id *)a4;
- (id)_approvalRequestWithError:(id *)a3;
- (id)_requestFromResult:(id)a3 withError:(id *)a4;
- (id)_requestWithError:(id *)a3;
- (id)_serverRequestWithError:(id *)a3;
- (id)perform;
- (int64_t)requestStatus;
- (void)_presentRequest:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation ApproverRemoteNotificationTask

- (ApproverRemoteNotificationTask)initWithPayload:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ApproverRemoteNotificationTask;
  v6 = [(ApproverRemoteNotificationTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payload, a3);
    uint64_t v8 = +[AMSBag bagForProfile:@"AskPermission" profileVersion:@"1"];
    bag = v7->_bag;
    v7->_bag = (AMSBag *)v8;
  }
  return v7;
}

- (int64_t)requestStatus
{
  v2 = [(ApproverRemoteNotificationTask *)self payload];
  v3 = [v2 objectForKeyedSubscript:@"9"];

  if (objc_opt_respondsToSelector()) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = -2;
  }

  return v4;
}

- (NSString)requestIdentifier
{
  v2 = [(ApproverRemoteNotificationTask *)self payload];
  v3 = [v2 objectForKeyedSubscript:@"8"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003AB8;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(ApproverRemoteNotificationTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (id)_approvalRequestWithError:(id *)a3
{
  id v20 = 0;
  id v5 = [(ApproverRemoteNotificationTask *)self _serverRequestWithError:&v20];
  id v6 = v20;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = +[APLogConfig sharedDaemonConfig];
    if (!v8)
    {
      uint64_t v8 = +[APLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v5;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result: %{public}@", buf, 0x16u);
    }
    id v19 = v7;
    v12 = [(ApproverRemoteNotificationTask *)self _approvalRequestFromResult:v5 withError:&v19];
    id v13 = v19;

    if (v12)
    {
      v14 = +[APLogConfig sharedDaemonConfig];
      if (!v14)
      {
        v14 = +[APLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        __int16 v23 = 2114;
        v24 = v12;
        id v17 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Decoded server result. Request: %{public}@", buf, 0x16u);
      }
    }
    if (a3) {
      goto LABEL_13;
    }
  }
  else
  {
    v12 = 0;
    id v13 = v6;
    if (a3) {
LABEL_13:
    }
      *a3 = v13;
  }

  return v12;
}

- (id)_requestWithError:(id *)a3
{
  id v20 = 0;
  id v5 = [(ApproverRemoteNotificationTask *)self _serverRequestWithError:&v20];
  id v6 = v20;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = +[APLogConfig sharedDaemonConfig];
    if (!v8)
    {
      uint64_t v8 = +[APLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v5;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result: %{public}@", buf, 0x16u);
    }
    id v19 = v7;
    v12 = [(ApproverRemoteNotificationTask *)self _requestFromResult:v5 withError:&v19];
    id v13 = v19;

    if (v12)
    {
      v14 = +[APLogConfig sharedDaemonConfig];
      if (!v14)
      {
        v14 = +[APLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        __int16 v23 = 2114;
        v24 = v12;
        id v17 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Decoded server result. Request: %{public}@", buf, 0x16u);
      }
    }
    if (a3) {
      goto LABEL_13;
    }
  }
  else
  {
    v12 = 0;
    id v13 = v6;
    if (a3) {
LABEL_13:
    }
      *a3 = v13;
  }

  return v12;
}

- (id)_serverRequestWithError:(id *)a3
{
  id v5 = +[AMSBag sharedBag];
  id v6 = [v5 retrieveRequestURL];

  CFStringRef v32 = @"requestId";
  v7 = [(ApproverRemoteNotificationTask *)self requestIdentifier];
  v33 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v9 = objc_alloc_init(URLRequestEncoder);
  v10 = [(URLRequestEncoder *)v9 requestWithMethod:4 bagURL:v6 parameters:v8];
  id v29 = 0;
  id v11 = [v10 resultWithTimeout:&v29 error:60.0];
  id v12 = v29;
  if (v11)
  {
    v27 = v6;
    id v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[APLogConfig sharedConfig];
    }
    v14 = objc_msgSend(v13, "OSLogObject", a3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
    }
    id v17 = +[URLSession sharedSession];
    v18 = [v17 dataTaskPromiseWithRequest:v11];

    id v28 = v12;
    id v19 = [v18 resultWithTimeout:&v28 error:60.0];
    id v20 = v28;

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
        __int16 v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v31 = v23;
        id v24 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);
      }
    }

    id v12 = v20;
    a3 = v26;
    id v6 = v27;
    if (v26) {
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = 0;
    if (a3) {
LABEL_13:
    }
      *a3 = v12;
  }

  return v19;
}

- (id)_approvalRequestFromResult:(id)a3 withError:(id *)a4
{
  id v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6
    || (v7 = [[ApprovalRequest alloc] initWithCloudPushDictionary:v6]) == 0)
  {
    v9 = APError();
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v8 = v7;
  v9 = 0;
  if (a4) {
LABEL_9:
  }
    *a4 = v9;
LABEL_10:

  return v8;
}

- (id)_requestFromResult:(id)a3 withError:(id *)a4
{
  id v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    v75 = a4;
    uint64_t v8 = [v7 objectForKeyedSubscript:@"requestInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    id v12 = [v9 objectForKeyedSubscript:@"salables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v13 objectForKeyedSubscript:@"lockupData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    id v16 = [v13 objectForKeyedSubscript:@"parentSalables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v17 firstObject];
    objc_opt_class();
    v72 = v17;
    if (objc_opt_isKindOfClass()) {
      id v84 = v18;
    }
    else {
      id v84 = 0;
    }

    id v19 = [v9 objectForKeyedSubscript:@"approveButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    v21 = [v9 objectForKeyedSubscript:@"requestString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v82 = v21;
    }
    else {
      id v82 = 0;
    }

    v22 = [v9 objectForKeyedSubscript:@"declineButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    id v24 = [v13 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    v76 = v15;
    if (v25)
    {
      v64 = (__CFString *)v25;
      uint64_t v26 = (uint64_t)v23;
    }
    else
    {
      id v27 = v20;
      id v28 = [v84 objectForKeyedSubscript:@"bundleIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }

      v30 = @"Unknown";
      if (v29) {
        v30 = v29;
      }
      v64 = v30;

      id v20 = v27;
      uint64_t v26 = (uint64_t)v23;
      id v15 = v76;
    }

    v31 = [v9 objectForKeyedSubscript:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v81 = v31;
    }
    else {
      id v81 = 0;
    }

    CFStringRef v32 = [v15 objectForKeyedSubscript:@"offerName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v71 = v32;
    }
    else {
      id v71 = 0;
    }

    v33 = [v84 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v78 = v33;
    }
    else {
      id v78 = 0;
    }

    v34 = [v9 objectForKeyedSubscript:@"previewURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v80 = v34;
    }
    else {
      id v80 = 0;
    }
    v35 = self;

    v36 = [v9 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    uint64_t v85 = v26;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }
    uint64_t v38 = (uint64_t)v20;

    v39 = [v13 objectForKeyedSubscript:@"productTypeName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v40 = v39;
    }
    else {
      id v40 = 0;
    }

    v41 = [v13 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v79 = v41;
    }
    else {
      id v79 = 0;
    }

    v42 = [v9 objectForKeyedSubscript:@"requesterFirstName"];
    objc_opt_class();
    v73 = v13;
    id v74 = v7;
    v77 = v9;
    if (objc_opt_isKindOfClass()) {
      id v43 = v42;
    }
    else {
      id v43 = 0;
    }

    v44 = +[NSDate date];
    uint64_t v45 = [(ApproverRemoteNotificationTask *)v35 requestIdentifier];
    uint64_t v46 = [v81 stringValue];
    uint64_t v47 = +[NSURL URLWithString:v80];
    v83 = +[NSURL URLWithString:v79];
    v68 = (void *)v47;
    v48 = (void *)v45;
    if ([v37 isEqualToString:@"A"] && v78)
    {
      uint64_t v49 = +[NSURL URLWithString:](NSURL, "URLWithString:");

      v83 = (void *)v49;
    }
    v50 = v40;
    uint64_t v51 = v38;
    uint64_t v52 = v85;
    if (v51)
    {
      if (v85) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v51 = +[Localizations stringWithKey:@"ACTION_APPROVE"];
      if (v85) {
        goto LABEL_71;
      }
    }
    uint64_t v52 = +[Localizations stringWithKey:@"ACTION_DECLINE"];
LABEL_71:
    v53 = +[Localizations stringWithKey:@"NOTIFICATION_TITLE_APPROVER"];
    if (v53)
    {
      uint64_t v54 = +[NSString stringWithValidatedFormat:v53, @"%@", 0, v43 validFormatSpecifiers error];
    }
    else
    {
      uint64_t v54 = 0;
    }
    v69 = v43;

    v70 = (void *)v51;
    v86 = (void *)v52;
    v66 = (void *)v54;
    v55 = [[RequestLocalizations alloc] initWithApprove:v51 body:v82 decline:v52 title:v54];
    v56 = (void *)v46;
    v65 = v37;
    if (v82 && v46)
    {
      v57 = v83;
      v58 = v68;
      id v63 = v37;
      v59 = v71;
      LOBYTE(v62) = 0;
      v60 = v64;
      v67 = [[Request alloc] initWithDate:v44 requestIdentifier:v48 uniqueIdentifier:@"N/A" itemBundleIdentifier:v64 itemIdentifier:v56 localizations:v55 mocked:v62 offerName:v71 previewURL:v68 productType:v63 productTypeName:v50 productURL:v83 requestInfo:v77 status:-1];
      v10 = 0;
    }
    else
    {
      v10 = APError();
      v67 = 0;
      v60 = v64;
      v59 = v71;
      v58 = v68;
      v57 = v83;
    }

    id v7 = v74;
    a4 = v75;
    id v11 = v67;
    if (!v75) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
  v10 = APError();
  id v11 = 0;
  if (a4) {
LABEL_81:
  }
    *a4 = v10;
LABEL_82:

  return v11;
}

- (void)_presentRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[LocalNotificationHandler sharedHandler];
  [v4 presentNotificationWithRequest:v3 silently:0];
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end