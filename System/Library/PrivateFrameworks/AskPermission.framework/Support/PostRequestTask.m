@interface PostRequestTask
- (ACAccount)account;
- (AMSBag)bag;
- (BOOL)canSendViaMessages;
- (NSURL)requestURL;
- (NSUUID)uuid;
- (PeopleClient)peopleClient;
- (PostRequestTask)initWithRequestURL:(id)a3 account:(id)a4;
- (id)_requestIdentifierFromResult:(id)a3 withError:(id *)a4;
- (id)_serverRequestWithError:(id *)a3;
- (id)_storeRequestWithResult:(id)a3 error:(id *)a4;
- (id)perform;
- (void)setBag:(id)a3;
- (void)setCanSendViaMessages:(BOOL)a3;
- (void)setPeopleClient:(id)a3;
@end

@implementation PostRequestTask

- (PostRequestTask)initWithRequestURL:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PostRequestTask;
  v9 = [(PostRequestTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    objc_storeStrong((id *)&v10->_account, a4);
    v10->_canSendViaMessages = 0;
    uint64_t v11 = +[AMSBag bagForProfile:@"AskPermission" profileVersion:@"1"];
    bag = v10->_bag;
    v10->_bag = (AMSBag *)v11;
  }
  return v10;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000134DC;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(PostRequestTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (id)_serverRequestWithError:(id *)a3
{
  v4 = [(PostRequestTask *)self account];
  v5 = [v4 accountStore];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[ACAccountStore ams_sharedAccountStore];
  }
  id v8 = v7;

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_100014544;
  v70 = sub_100014554;
  id v71 = 0;
  v58 = v8;
  if (objc_msgSend(v8, "ams_isActiveAccountCombined"))
  {
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v10 = [(PostRequestTask *)self peopleClient];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      v12 = +[APLogConfig sharedDaemonConfig];
      if (!v12)
      {
        v12 = +[APLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v14 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        id v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating PeopleClient to check IDS", (uint8_t *)&buf, 0xCu);
      }
      id location = 0;
      p_id location = &location;
      uint64_t v74 = 0x2050000000;
      id v16 = (id)qword_100042B00;
      uint64_t v75 = qword_100042B00;
      if (!qword_100042B00)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v77 = sub_100014BE0;
        v78 = &unk_100038B60;
        v79 = &location;
        sub_100014BE0((uint64_t)&buf);
        id v16 = p_location[3];
      }
      v17 = (objc_class *)v16;
      _Block_object_dispose(&location, 8);
      id v18 = objc_alloc_init(v17);
      [(PostRequestTask *)self setPeopleClient:v18];
    }
    objc_initWeak(&location, self);
    v19 = [(PostRequestTask *)self peopleClient];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10001455C;
    v62[3] = &unk_100038B38;
    objc_copyWeak(&v65, &location);
    v62[4] = self;
    v64 = &v66;
    v20 = v9;
    v63 = v20;
    [v19 canSendFamilyAskToBuyIMessageWithCompletion:v62];

    v21 = +[APLogConfig sharedDaemonConfig];
    if (!v21)
    {
      v21 = +[APLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v23;
      id v24 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting on PeopleClient with timeout of 75 seconds", (uint8_t *)&buf, 0xCu);
    }
    dispatch_time_t v25 = dispatch_time(0, 75000000000);
    dispatch_group_wait(v20, v25);
    if (!v67[5])
    {
      v26 = +[APLogConfig sharedDaemonConfig];
      if (!v26)
      {
        v26 = +[APLogConfig sharedConfig];
      }
      v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v28;
        id v29 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: PeopleClient timed out. Unable to send via iMessage. Falling back.", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v30 = [(PostRequestTask *)self requestURL];
      v31 = (void *)v67[5];
      v67[5] = v30;
    }
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  else
  {
    v32 = +[APLogConfig sharedDaemonConfig];
    if (!v32)
    {
      v32 = +[APLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v34;
      id v35 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Split Account. Falling back to legacy notifications.", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v36 = [(PostRequestTask *)self requestURL];
    v20 = v67[5];
    v67[5] = v36;
  }

  uint64_t v37 = objc_msgSend((id)v67[5], "ap_secureURL");
  v38 = +[NSURLRequest requestWithURL:v37];
  v57 = (void *)v37;
  v39 = objc_alloc_init(URLRequestEncoder);
  v40 = [(PostRequestTask *)self account];
  [(URLRequestEncoder *)v39 setAccount:v40];

  v41 = [(URLRequestEncoder *)v39 requestByEncodingRequest:v38 parameters:0];
  id v61 = 0;
  v42 = [v41 resultWithTimeout:&v61 error:60.0];
  id v43 = v61;
  if (v42)
  {
    v44 = +[APLogConfig sharedDaemonConfig];
    if (!v44)
    {
      v44 = +[APLogConfig sharedConfig];
    }
    v45 = [v44 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v46;
      id v47 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", (uint8_t *)&buf, 0xCu);
    }
    v48 = +[URLSession sharedSession];
    v49 = [v48 dataTaskPromiseWithRequest:v42];

    id v60 = v43;
    v50 = [v49 resultWithTimeout:&v60 error:60.0];
    id v51 = v60;

    if (v50)
    {
      v52 = +[APLogConfig sharedDaemonConfig];
      if (!v52)
      {
        v52 = +[APLogConfig sharedConfig];
      }
      v53 = [v52 OSLogObject];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v54;
        id v55 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", (uint8_t *)&buf, 0xCu);
      }
    }

    id v43 = v51;
  }
  else
  {
    v50 = 0;
  }
  if (a3) {
    *a3 = v43;
  }

  _Block_object_dispose(&v66, 8);
  return v50;
}

- (id)_storeRequestWithResult:(id)a3 error:(id *)a4
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
    id v7 = [v6 objectForKeyedSubscript:@"salableAdamId"];
    id v8 = [v6 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    BOOL v11 = +[StorageHelper approvalRequestWithRequestIdentifier:v9];
    if ((objc_opt_respondsToSelector() & 1) != 0 && v9)
    {
      v12 = +[RequesterStore sharedStore];
      [v12 storeRequest:v11];

      v10 = 0;
    }
    else
    {
      v10 = APError();
    }

    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v10 = APError();
  BOOL v11 = 0;
  if (a4) {
LABEL_15:
  }
    *a4 = v10;
LABEL_16:

  return v11;
}

- (id)_requestIdentifierFromResult:(id)a3 withError:(id *)a4
{
  v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6
    || (([v6 objectForKeyedSubscript:@"requestId"],
         id v7 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v8 = 0)
      : (id v8 = v7),
        v7,
        !v8))
  {
    id v9 = APError();
    id v8 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v9 = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v9;
LABEL_14:

  return v8;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (void)setCanSendViaMessages:(BOOL)a3
{
  self->_canSendViaMessages = a3;
}

- (PeopleClient)peopleClient
{
  return self->_peopleClient;
}

- (void)setPeopleClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleClient, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end