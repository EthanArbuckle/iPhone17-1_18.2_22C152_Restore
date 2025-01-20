@interface RequesterRemoteNotificationTask
- (BOOL)suppressDialog;
- (NSDictionary)payload;
- (NSString)requestIdentifier;
- (RequesterRemoteNotificationTask)initWithPayload:(id)a3 andSuppressDialog:(BOOL)a4;
- (id)_notifyExtensionWithResult:(id)a3;
- (id)_requestFromResult:(id)a3 withError:(id *)a4;
- (id)_requestResultFromResult:(id)a3 withError:(id *)a4;
- (id)_serverRequestWithError:(id *)a3;
- (id)perform;
- (int64_t)requestStatus;
- (void)_presentRequest:(id)a3;
@end

@implementation RequesterRemoteNotificationTask

- (RequesterRemoteNotificationTask)initWithPayload:(id)a3 andSuppressDialog:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RequesterRemoteNotificationTask;
  v8 = [(RequesterRemoteNotificationTask *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_payload, a3);
    v9->_suppressDialog = a4;
  }

  return v9;
}

- (int64_t)requestStatus
{
  v2 = [(RequesterRemoteNotificationTask *)self payload];
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
  v2 = [(RequesterRemoteNotificationTask *)self payload];
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
  v4[2] = sub_100017B40;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(RequesterRemoteNotificationTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (id)_serverRequestWithError:(id *)a3
{
  v5 = +[AMSBag sharedBag];
  v6 = [v5 retrieveRequestURL];

  CFStringRef v32 = @"requestId";
  id v7 = [(RequesterRemoteNotificationTask *)self requestIdentifier];
  v33 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v9 = objc_alloc_init(URLRequestEncoder);
  v10 = [(URLRequestEncoder *)v9 requestWithMethod:4 bagURL:v6 parameters:v8];
  id v29 = 0;
  objc_super v11 = [v10 resultWithTimeout:&v29 error:60.0];
  id v12 = v29;
  if (v11)
  {
    v27 = v6;
    v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[APLogConfig sharedConfig];
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
    v17 = +[URLSession sharedSession];
    v18 = [v17 dataTaskPromiseWithRequest:v11];

    id v28 = v12;
    v19 = [v18 resultWithTimeout:&v28 error:60.0];
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
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v31 = v23;
        id v24 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);
      }
    }

    id v12 = v20;
    a3 = v26;
    v6 = v27;
    if (v26) {
      goto LABEL_13;
    }
  }
  else
  {
    v19 = 0;
    if (a3) {
LABEL_13:
    }
      *a3 = v12;
  }

  return v19;
}

- (id)_requestFromResult:(id)a3 withError:(id *)a4
{
  v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:@"requestInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    id v12 = [v9 objectForKeyedSubscript:@"approverFirstName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v9 objectForKeyedSubscript:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    id v16 = [v9 objectForKeyedSubscript:@"salables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v17 objectForKeyedSubscript:@"lockupData"];
    objc_opt_class();
    v37 = v17;
    if (objc_opt_isKindOfClass()) {
      id v43 = v18;
    }
    else {
      id v43 = 0;
    }

    uint64_t v35 = +[NSDate date];
    v19 = [(RequesterRemoteNotificationTask *)self requestIdentifier];
    v38 = v15;
    id v20 = [v15 stringValue];
    int64_t v21 = [(RequesterRemoteNotificationTask *)self requestStatus];
    v42 = +[Localizations stringWithKey:@"ACTION_APPROVE"];
    v41 = +[Localizations stringWithKey:@"ACTION_DECLINE"];
    v39 = v13;
    v40 = a4;
    if (v21 == 1)
    {
      v22 = [v9 objectForKeyedSubscript:@"approvalString"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }

      CFStringRef v25 = @"NOTIFICATION_TITLE_REQUESTER_APPROVED";
    }
    else
    {
      id v24 = [v9 objectForKeyedSubscript:@"declinedString"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v24;
      }
      else {
        id v23 = 0;
      }

      CFStringRef v25 = @"NOTIFICATION_TITLE_REQUESTER_DECLINED";
    }
    v26 = +[Localizations stringWithKey:v25];
    if (v26)
    {
      v27 = +[NSString stringWithValidatedFormat:v26, @"%@", 0, v13 validFormatSpecifiers error];
    }
    else
    {
      v27 = 0;
    }

    id v28 = [[RequestLocalizations alloc] initWithApprove:v42 body:v23 decline:v41 title:v27];
    id v29 = [v43 objectForKeyedSubscript:@"offerName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    id v36 = v7;
    if (v23 && v20)
    {
      if (_os_feature_enabled_impl())
      {
        v31 = (void *)v35;
        CFStringRef v32 = [[RequesterRequest alloc] initWithDate:v35 requestIdentifier:v19 uniqueIdentifier:@"xxxxxxxxx" itemIdentifier:v20 localizations:v28 offerName:v30 status:v21];
      }
      else
      {
        LOBYTE(v34) = 0;
        v31 = (void *)v35;
        CFStringRef v32 = [[Request alloc] initWithDate:v35 requestIdentifier:v19 uniqueIdentifier:@"xxxxxxxxx" itemBundleIdentifier:0 itemIdentifier:v20 localizations:v28 mocked:v34 offerName:0 previewURL:0 productType:0 productTypeName:0 productURL:0 requestInfo:v9 status:v21];
      }
      objc_super v11 = v32;
      v10 = 0;
    }
    else
    {
      v10 = APError();
      objc_super v11 = 0;
      v31 = (void *)v35;
    }

    a4 = v40;
    id v7 = v36;
    if (!v40) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  v10 = APError();
  objc_super v11 = 0;
  if (a4) {
LABEL_45:
  }
    *a4 = v10;
LABEL_46:

  return v11;
}

- (void)_presentRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[LocalNotificationHandler sharedHandler];
  [v4 presentNotificationWithRequest:v3 silently:0];
}

- (id)_requestResultFromResult:(id)a3 withError:(id *)a4
{
  v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:@"requestInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    objc_super v11 = [v8 objectForKeyedSubscript:@"salables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v13 = [v12 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    id v15 = [v8 objectForKeyedSubscript:@"buyParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    id v17 = [v12 objectForKeyedSubscript:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    v19 = [v8 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    if (v16 && v18 && v20)
    {
      id v10 = [objc_alloc((Class)APResult) initWithBundleIdentifier:v14 buyParams:v16 itemIdentifier:v18 productType:v20];
      id v9 = 0;
    }
    else
    {
      id v9 = APError();
      id v10 = 0;
    }

    if (!a4) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  id v9 = APError();
  id v10 = 0;
  if (a4) {
LABEL_31:
  }
    *a4 = v9;
LABEL_32:

  return v10;
}

- (id)_notifyExtensionWithResult:(id)a3
{
  id v3 = a3;
  id v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    id v4 = +[APLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = (id)objc_opt_class();
    id v6 = v23;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Notifying extension.", buf, 0xCu);
  }
  id v7 = +[ExtensionManager sharedExtensionManager];
  id v21 = 0;
  unsigned int v8 = [v7 notifyWithResult:v3 error:&v21];

  id v9 = v21;
  uint64_t v10 = +[APLogConfig sharedDaemonConfig];
  objc_super v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      objc_super v11 = +[APLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v23 = v13;
      id v14 = v13;
      id v15 = "%{public}@: Notified extension succesfully.";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
    }
  }
  else
  {
    if (!v10)
    {
      objc_super v11 = +[APLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v23 = v19;
      __int16 v24 = 2114;
      id v25 = v9;
      id v14 = v19;
      id v15 = "%{public}@: Failed to notify extension. Error: %{public}@.";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 22;
      goto LABEL_14;
    }
  }

  return v9;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (BOOL)suppressDialog
{
  return self->_suppressDialog;
}

- (void).cxx_destruct
{
}

@end