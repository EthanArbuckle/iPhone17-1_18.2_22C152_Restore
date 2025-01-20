@interface FetchReceiptTask
- (BOOL)_isUnifiedReceiptValidAndCurrentAtBundleURL:(id)a3;
- (BOOL)_useVPPBagURL;
- (DialogProtocol)dialogContext;
- (FetchReceiptTask)initWithClient:(id)a3;
- (NSString)logKey;
- (NSString)receiptString;
- (_TtC9storekitd6Client)client;
- (id)_URLRequestWithBag:(id)a3 error:(id *)a4;
- (id)_accountWithError:(id *)a3;
- (id)_requestBody;
- (id)_requestReceiptStringError:(id *)a3;
- (int64_t)apiVersion;
- (unint64_t)receiptFlags;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_authenticateAndRequestReceipt;
- (void)main;
- (void)setApiVersion:(int64_t)a3;
- (void)setDialogContext:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setReceiptFlags:(unint64_t)a3;
@end

@implementation FetchReceiptTask

- (FetchReceiptTask)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = [(Task *)self init];
  v7 = v6;
  if (v6)
  {
    *(void *)(&v6->super._finished + 1) = 1;
    objc_storeStrong((id *)((char *)&v6->_apiVersion + 2), a3);
  }

  return v7;
}

- (void)main
{
  if (!*(DialogProtocol **)((char *)&self->_dialogContext + 2))
  {
    v3 = +[NSUUID lib_shortLogKeyWithAPIVersion:[(FetchReceiptTask *)self apiVersion]];
    v4 = *(DialogProtocol **)((char *)&self->_dialogContext + 2);
    *(DialogProtocol **)((char *)&self->_dialogContext + 2) = v3;
  }
  if (qword_10039FA40 != -1) {
    dispatch_once(&qword_10039FA40, &stru_100358748);
  }
  id v5 = (void *)qword_10039FA20;
  if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [(FetchReceiptTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    __int16 v29 = 2114;
    id v30 = (id)objc_opt_class();
    id v8 = v30;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Started task", buf, 0x16u);
  }
  if ((id)[(FetchReceiptTask *)self apiVersion] == (id)1)
  {
    v9 = [(FetchReceiptTask *)self client];
    if (objc_msgSend(v9, "objc_clientType") == 3)
    {
    }
    else
    {
      v10 = [(FetchReceiptTask *)self client];
      v11 = [v10 callerBundleURL];
      unsigned int v12 = [(FetchReceiptTask *)self _isUnifiedReceiptValidAndCurrentAtBundleURL:v11];

      if (v12)
      {
        if (qword_10039FA40 != -1) {
          dispatch_once(&qword_10039FA40, &stru_100358748);
        }
        v13 = (void *)qword_10039FA20;
        if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          v15 = [(FetchReceiptTask *)self logKey];
          v16 = [(FetchReceiptTask *)self client];
          v17 = [v16 requestBundleID];
          v18 = [(FetchReceiptTask *)self client];
          v19 = [v18 callerBundleURL];
          *(_DWORD *)buf = 138543874;
          v28 = v15;
          __int16 v29 = 2114;
          id v30 = v17;
          __int16 v31 = 2114;
          v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Receipt is valid and current at %{public}@. Skipping refresh.", buf, 0x20u);
        }
        uint64_t v20 = ASDErrorWithTitleAndMessage();
        if (v20)
        {
          id v21 = (id)v20;
          v22 = 0;
          goto LABEL_25;
        }
      }
    }
  }
  id v26 = 0;
  v22 = [(FetchReceiptTask *)self _requestReceiptStringError:&v26];
  id v21 = v26;
  if (!ASDErrorIsEqual()) {
    goto LABEL_24;
  }
  v23 = [(FetchReceiptTask *)self dialogContext];
  char v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) == 0)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    v25 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR))
    {
      sub_1002C3114(v25);
      if (v21) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (v21) {
      goto LABEL_25;
    }
LABEL_27:
    objc_storeStrong((id *)((char *)&self->_receiptFlags + 2), v22);
    [(AsyncTask *)self completeWithSuccess];
    goto LABEL_28;
  }
  [(FetchReceiptTask *)self _authenticateAndRequestReceipt];
  if (!v21) {
    goto LABEL_27;
  }
LABEL_25:
  [(AsyncTask *)self completeWithError:v21];
LABEL_28:
}

- (id)_accountWithError:(id *)a3
{
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_100048F30;
  v53 = sub_100048F40;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100048F30;
  v47 = sub_100048F40;
  id v48 = 0;
  if (qword_10039FA40 != -1) {
    dispatch_once(&qword_10039FA40, &stru_100358748);
  }
  id v5 = (id)qword_10039FA20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FetchReceiptTask *)self logKey];
    v7 = [(FetchReceiptTask *)self client];
    id v8 = [v7 requestBundleID];
    *(_DWORD *)buf = 138543618;
    v56 = v6;
    __int16 v57 = 2114;
    v58 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Sending authentication request for receipt renewal", buf, 0x16u);
  }
  id v9 = objc_alloc_init((Class)AMSAuthenticateOptions);
  v10 = [(FetchReceiptTask *)self client];
  v11 = [v10 processInfo];
  [v9 setClientInfo:v11];

  [v9 setDebugReason:@"Receipt renewal"];
  id v12 = [objc_alloc((Class)AMSAuthenticateRequest) initWithDSID:0 altDSID:0 username:0 options:v9];
  v13 = [(FetchReceiptTask *)self dialogContext];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    v15 = (id)qword_10039FA20;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(FetchReceiptTask *)self logKey];
      v17 = [(FetchReceiptTask *)self client];
      v18 = [v17 requestBundleID];
      *(_DWORD *)buf = 138543618;
      v56 = v16;
      __int16 v57 = 2114;
      v58 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Handling authentication request", buf, 0x16u);
    }
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    uint64_t v20 = [(FetchReceiptTask *)self dialogContext];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100048F48;
    v39[3] = &unk_100357E40;
    v41 = &v43;
    v42 = &v49;
    id v21 = v19;
    v40 = v21;
    [v20 handleAuthenticateRequest:v12 completionHandler:v39];

    int64_t v22 = dispatch_time(0, 300000000000);
    dispatch_time_t v23 = dispatch_time(0, v22);
    if (dispatch_semaphore_wait(v21, v23))
    {
      uint64_t v24 = ASDErrorWithDescription();
      v25 = (void *)v50[5];
      v50[5] = v24;
    }
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    id v26 = (id)qword_10039FA20;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = [(FetchReceiptTask *)self logKey];
      v33 = [(FetchReceiptTask *)self client];
      v34 = [v33 requestBundleID];
      *(_DWORD *)buf = 138543618;
      v56 = v32;
      __int16 v57 = 2114;
      v58 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] No delegate to handle authentication request", buf, 0x16u);
    }
    uint64_t v27 = ASDErrorWithDescription();
    id v21 = v50[5];
    v50[5] = v27;
  }

  v28 = [(id)v44[5] account];

  if (v28)
  {
    __int16 v29 = [(id)v44[5] account];
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    id v30 = (id)qword_10039FA20;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v35 = [(FetchReceiptTask *)self logKey];
      v36 = [(FetchReceiptTask *)self client];
      v37 = [v36 requestBundleID];
      uint64_t v38 = v50[5];
      *(_DWORD *)buf = 138543874;
      v56 = v35;
      __int16 v57 = 2114;
      v58 = v37;
      __int16 v59 = 2114;
      uint64_t v60 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] No account for receipt renewal: %{public}@", buf, 0x20u);
    }
    __int16 v29 = 0;
    if (a3) {
      *a3 = (id) v50[5];
    }
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v29;
}

- (void)_authenticateAndRequestReceipt
{
  v3 = [(FetchReceiptTask *)self dialogContext];

  if (v3)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    v4 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      v6 = [(FetchReceiptTask *)self logKey];
      v7 = [(FetchReceiptTask *)self client];
      id v8 = [v7 requestBundleID];
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      dispatch_time_t v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Handling authentication request", buf, 0x16u);
    }
    id v9 = objc_alloc_init((Class)AMSAuthenticateOptions);
    v10 = [(FetchReceiptTask *)self client];
    v11 = [v10 processInfo];
    [v9 setClientInfo:v11];

    [v9 setDebugReason:@"Receipt"];
    id v12 = [(FetchReceiptTask *)self client];
    v13 = [v12 account];

    id v14 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:v13 options:v9];
    v15 = [(FetchReceiptTask *)self dialogContext];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000492DC;
    v19[3] = &unk_100358728;
    v19[4] = self;
    [v15 handleAuthenticateRequest:v14 completionHandler:v19];
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    v16 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [(FetchReceiptTask *)self logKey];
      *(_DWORD *)buf = 138543362;
      id v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] No client available to handle authentication request", buf, 0xCu);
    }
    ASDErrorWithDescription();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(AsyncTask *)self completeWithError:v9];
  }
}

- (id)_requestReceiptStringError:(id *)a3
{
  id v5 = [(FetchReceiptTask *)self client];
  v6 = [v5 bag];

  id v26 = 0;
  v7 = [(FetchReceiptTask *)self _URLRequestWithBag:v6 error:&v26];
  id v8 = v26;
  if (v8)
  {
    id v9 = v8;
    v10 = 0;
    v11 = 0;
    goto LABEL_29;
  }
  id v12 = [(FetchReceiptTask *)self client];
  v13 = [v12 urlSession];

  [v13 setDelegate:self];
  id v14 = [v13 dataTaskPromiseWithRequest:v7];
  id v25 = 0;
  v15 = [v14 resultWithError:&v25];
  id v9 = v25;
  v10 = [v15 object];

  v11 = 0;
  if (!v9 && v10)
  {
    int64_t v16 = [(FetchReceiptTask *)self apiVersion];
    if (v16 == 1) {
      CFStringRef v17 = @"status";
    }
    else {
      CFStringRef v17 = @"errorCode";
    }
    if (v16 == 1) {
      CFStringRef v18 = @"receipt";
    }
    else {
      CFStringRef v18 = @"signedReceipt";
    }
    dispatch_semaphore_t v19 = [v10 objectForKeyedSubscript:v17];
    uint64_t v20 = [v10 objectForKeyedSubscript:v18];
    if (v19 && [v19 integerValue])
    {
      if (qword_10039FA40 != -1) {
        dispatch_once(&qword_10039FA40, &stru_100358748);
      }
      id v21 = (void *)qword_10039FA20;
      if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR)) {
        sub_1002C3284(v21, self, (uint64_t)v19);
      }
      [v19 integerValue];
LABEL_27:
      ASDErrorWithTitleAndMessage();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_28;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = [v20 base64EncodedStringWithOptions:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_10039FA40 != -1) {
          dispatch_once(&qword_10039FA40, &stru_100358748);
        }
        dispatch_time_t v23 = (void *)qword_10039FA20;
        if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR)) {
          sub_1002C31CC(v23);
        }
        goto LABEL_27;
      }
      id v22 = v20;
    }
    v11 = v22;
    id v9 = 0;
LABEL_28:
  }
LABEL_29:
  if (a3) {
    *a3 = v9;
  }

  return v11;
}

- (BOOL)_isUnifiedReceiptValidAndCurrentAtBundleURL:(id)a3
{
  v4 = +[ASFReceipt receiptFromBundleAtURL:a3];
  if (v4)
  {
    id v5 = [(FetchReceiptTask *)self client];
    v6 = [v5 requestBundleID];
    v7 = [v4 bundleID];
    unsigned int v53 = [v6 isEqualToString:v7];

    id v8 = [(FetchReceiptTask *)self client];
    id v9 = [v8 requestBundleVersion];
    v10 = [v4 bundleVersion];
    LODWORD(v11) = [v9 isEqualToString:v10];

    id v12 = [v4 expirationDate];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    v15 = objc_opt_new();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    int64_t v16 = [(FetchReceiptTask *)self client];
    CFStringRef v17 = [v16 deviceVendorID];
    [v17 getUUIDBytes:buf];

    CFStringRef v18 = +[NSData dataWithBytes:buf length:16];
    [v15 appendData:v18];

    dispatch_semaphore_t v19 = [v4 opaqueDSIDData];
    [v15 appendData:v19];

    uint64_t v20 = [v4 bundleIDData];
    [v15 appendData:v20];

    *(void *)md = 0;
    uint64_t v67 = 0;
    int v68 = 0;
    id v21 = v15;
    CC_SHA1([v21 bytes], (CC_LONG)objc_msgSend(v21, "length"), md);
    id v22 = [v4 sha1];
    dispatch_time_t v23 = +[NSData dataWithBytes:md length:20];
    LODWORD(v24) = [v22 isEqualToData:v23];

    id v25 = [(FetchReceiptTask *)self client];
    id v26 = [v25 bag];

    uint64_t v27 = +[BagKey receiptRefreshMinAge];
    v52 = v26;
    v28 = [v26 integerForKey:v27];

    id v54 = 0;
    uint64_t v51 = v28;
    __int16 v29 = [v28 valueWithError:&v54];
    id v30 = v54;
    if (!v29)
    {
      if (ASDErrorIsEqual()) {
        __int16 v29 = &off_100373AB8;
      }
      else {
        __int16 v29 = 0;
      }
    }
    v50 = v30;
    [v29 doubleValue];
    v32 = +[NSDate dateWithTimeIntervalSinceNow:-v31];
    v33 = [v4 creationDate];
    id v34 = [v32 compare:v33];

    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    v35 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      log = v35;
      v36 = [(FetchReceiptTask *)self logKey];
      v47 = [(FetchReceiptTask *)self client];
      [v47 requestBundleID];
      v37 = int v49 = (int)v24;
      id v48 = v21;
      if (v53) {
        CFStringRef v38 = @"PASS";
      }
      else {
        CFStringRef v38 = @"FAIL";
      }
      id v24 = v34;
      if (v11) {
        CFStringRef v39 = @"PASS";
      }
      else {
        CFStringRef v39 = @"FAIL";
      }
      char v45 = (char)v11;
      if (v49) {
        CFStringRef v11 = @"PASS";
      }
      else {
        CFStringRef v11 = @"FAIL";
      }
      if (v14 < 0.0) {
        CFStringRef v40 = @"FAIL";
      }
      else {
        CFStringRef v40 = @"PASS";
      }
      v41 = [v4 creationDate];
      *(_DWORD *)buf = 138544898;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v37;
      __int16 v56 = 2114;
      CFStringRef v57 = v38;
      id v21 = v48;
      __int16 v58 = 2114;
      CFStringRef v59 = v39;
      id v34 = v24;
      __int16 v60 = 2114;
      CFStringRef v61 = v11;
      LOBYTE(v11) = v45;
      __int16 v62 = 2114;
      CFStringRef v63 = v40;
      __int16 v64 = 2114;
      v65 = v41;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Receipt Validation \n\tBundle ID Check: %{public}@\n\tBundle Version Check: %{public}@\n\tGUID Check: %{public}@\n\tExpiration Check: %{public}@\n\tCreation Date: %{public}@", buf, 0x48u);

      LOBYTE(v24) = v49;
    }
    char v42 = v53 & v11 & v24;
    if (v14 < 0.0) {
      char v42 = 0;
    }
    if (v34 == (id)-1) {
      BOOL v43 = v42;
    }
    else {
      BOOL v43 = 0;
    }
  }
  else
  {
    BOOL v43 = 0;
  }

  return v43;
}

- (id)_URLRequestWithBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(FetchReceiptTask *)self client];
  uint64_t v8 = [v7 account];

  id v9 = [(FetchReceiptTask *)self client];
  unsigned int v10 = objc_msgSend(v9, "objc_clientType");

  unsigned int v11 = [(FetchReceiptTask *)self _useVPPBagURL];
  unsigned int v12 = v11;
  id v13 = 0;
  if (v8) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v10 == 3;
  }
  if (v14) {
    v15 = (void *)v8;
  }
  else {
    v15 = 0;
  }
  if (!v14 && (v11 & 1) == 0)
  {
    id v45 = 0;
    v15 = [(FetchReceiptTask *)self _accountWithError:&v45];
    id v13 = v45;
  }
  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v10 == 3;
  }
  if (v16) {
    int v17 = 1;
  }
  else {
    int v17 = v12;
  }
  if (v17 == 1)
  {
    BOOL v43 = a4;
    if (v12)
    {
      if (qword_10039FA40 != -1) {
        dispatch_once(&qword_10039FA40, &stru_100358748);
      }
      CFStringRef v18 = (void *)qword_10039FA20;
      if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_semaphore_t v19 = v18;
        uint64_t v20 = [(FetchReceiptTask *)self logKey];
        id v21 = [(FetchReceiptTask *)self client];
        id v22 = [v21 requestBundleID];
        *(_DWORD *)buf = 138543618;
        v47 = v20;
        __int16 v48 = 2114;
        int v49 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Fetching vpp app receipt", buf, 0x16u);
      }
      uint64_t v23 = +[BagKey createVPPReceiptURL];
    }
    else
    {
      if (qword_10039FA40 != -1) {
        dispatch_once(&qword_10039FA40, &stru_100358748);
      }
      id v25 = (void *)qword_10039FA20;
      if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = v25;
        uint64_t v27 = [(FetchReceiptTask *)self logKey];
        v28 = [(FetchReceiptTask *)self client];
        __int16 v29 = [v28 requestBundleID];
        *(_DWORD *)buf = 138543618;
        v47 = v27;
        __int16 v48 = 2114;
        int v49 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Fetching app receipt", buf, 0x16u);
      }
      uint64_t v23 = +[BagKey createAppReceiptURL];
    }
    id v30 = (void *)v23;
    id v31 = v6;
    v32 = [v6 URLForKey:v23];

    v33 = [(FetchReceiptTask *)self client];
    id v34 = [v33 urlRequestEncoder];

    v35 = [(FetchReceiptTask *)self _requestBody];
    v36 = [v34 requestWithMethod:4 bagURL:v32 parameters:v35];

    id v44 = v13;
    id v24 = [v36 resultWithError:&v44];
    id v37 = v44;

    if ((id)[(FetchReceiptTask *)self apiVersion] != (id)1)
    {
      CFStringRef v38 = sub_100047628(*(void *)(&self->super._finished + 1));
      [v24 setValue:v38 forHTTPHeaderField:@"X-Apple-Client-StoreKit-Version"];
    }
    CFStringRef v39 = [(FetchReceiptTask *)self client];
    CFStringRef v40 = [v39 callerBundleID];
    unsigned int v41 = [v40 isEqualToString:@"com.apple.news"];

    if (v41) {
      [v24 setValue:@"News" forHTTPHeaderField:AMSHTTPHeaderClientApplication];
    }

    id v13 = v37;
    id v6 = v31;
    a4 = v43;
    if (v43) {
      goto LABEL_35;
    }
  }
  else
  {
    id v24 = 0;
    if (a4) {
LABEL_35:
    }
      *a4 = v13;
  }

  return v24;
}

- (id)_requestBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(FetchReceiptTask *)self client];
  id v5 = [v4 account];

  id v6 = objc_msgSend(v5, "ams_DSID");
  v7 = [(FetchReceiptTask *)self client];
  objc_msgSend(v7, "objc_clientType");

  uint64_t v8 = +[ACAccountStore ams_sharedAccountStore];
  id v9 = objc_msgSend(v8, "ams_secureTokenForAccount:", v5);

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"xToken"];
  }
  unsigned int v10 = +[AMSDevice deviceGUID];
  [v3 setObject:v10 forKeyedSubscript:@"guid"];

  unsigned int v11 = +[AMSDevice serialNumber];
  [v3 setObject:v11 forKeyedSubscript:@"serialNumber"];

  unsigned int v12 = [(FetchReceiptTask *)self client];
  id v13 = [v12 deviceVendorID];
  BOOL v14 = [v13 UUIDString];
  [v3 setObject:v14 forKeyedSubscript:@"vid"];

  if ((id)[(FetchReceiptTask *)self apiVersion] != (id)1)
  {
    v15 = [(FetchReceiptTask *)self client];
    BOOL v16 = [v15 deviceVendorID];
    int v17 = [v16 UUIDString];
    CFStringRef v18 = [v17 lowercaseString];
    [v3 setObject:v18 forKeyedSubscript:@"deviceVerification"];
  }
  dispatch_semaphore_t v19 = [(FetchReceiptTask *)self client];
  unsigned int v20 = [v19 isBeta];

  if (v20) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:off_100399398[0]];
  }
  unsigned int v21 = [(FetchReceiptTask *)self receiptFlags] & 1;
  if (v21) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"want-expired"];
  }
  if (([(FetchReceiptTask *)self receiptFlags] & 2) != 0)
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"want-revoked"];
    unsigned int v21 = 1;
  }
  int v22 = v21 | ([(FetchReceiptTask *)self receiptFlags] >> 3) & 1;
  if (v22 == 1) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"want-vpp"];
  }
  uint64_t v23 = [(FetchReceiptTask *)self client];
  id v24 = [v23 callerBundleURL];
  id v25 = +[ASFReceipt receiptFromBundleAtURL:v24];

  if ([v25 isVPPLicensed] && objc_msgSend(v25, "isRevoked")) {
    [v3 setObject:&__kCFBooleanTrue forKey:@"revoked"];
  }
  id v26 = [(FetchReceiptTask *)self client];
  unsigned int v27 = objc_msgSend(v26, "objc_clientType");

  if (v27 == 1)
  {
    v28 = @"adam-id";
    if (v22) {
      v28 = @"appAdamId";
    }
    __int16 v29 = v9;
    id v30 = v6;
    if (v22) {
      id v31 = @"appExtVrsId";
    }
    else {
      id v31 = @"software-version-external-identifier";
    }
    v32 = v28;
    v33 = [(FetchReceiptTask *)self client];
    id v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v33 storeItemID]);
    [v3 setObject:v34 forKeyedSubscript:v32];

    v35 = v31;
    id v6 = v30;
    id v9 = v29;
    v36 = v35;
    id v37 = [(FetchReceiptTask *)self client];
    CFStringRef v38 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v37 storeExternalVersionID]);
    [v3 setObject:v38 forKeyedSubscript:v36];
  }
  else
  {
    CFStringRef v39 = [(FetchReceiptTask *)self client];
    CFStringRef v40 = [v39 requestBundleID];
    [v3 setObject:v40 forKeyedSubscript:@"bundle-id"];

    id v37 = [(FetchReceiptTask *)self client];
    CFStringRef v38 = [v37 requestBundleVersion];
    [v3 setObject:v38 forKeyedSubscript:@"version-id"];
  }

  return v3;
}

- (BOOL)_useVPPBagURL
{
  return (BYTE2(self->_logKey) & 0xB) != 0;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void, void *))a6;
  unsigned int v10 = [(FetchReceiptTask *)self dialogContext];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    unsigned int v12 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = [(FetchReceiptTask *)self logKey];
      v15 = [(FetchReceiptTask *)self client];
      BOOL v16 = [v15 requestBundleID];
      int v19 = 138543618;
      unsigned int v20 = v14;
      __int16 v21 = 2114;
      int v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Handling dialog request", (uint8_t *)&v19, 0x16u);
    }
    int v17 = [(FetchReceiptTask *)self dialogContext];
    [v17 handleDialogRequest:v8 completionHandler:v9];
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    CFStringRef v18 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3378(v18);
    }
    int v17 = ASDErrorWithDescription();
    v9[2](v9, 0, v17);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void, void *))a6;
  unsigned int v10 = [(FetchReceiptTask *)self dialogContext];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    unsigned int v12 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = [(FetchReceiptTask *)self logKey];
      v15 = [(FetchReceiptTask *)self client];
      BOOL v16 = [v15 requestBundleID];
      int v19 = 138543618;
      unsigned int v20 = v14;
      __int16 v21 = 2114;
      int v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Handling authentication request", (uint8_t *)&v19, 0x16u);
    }
    int v17 = [(FetchReceiptTask *)self dialogContext];
    [v17 handleAuthenticateRequest:v8 completionHandler:v9];
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    CFStringRef v18 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3114(v18);
    }
    int v17 = ASDErrorWithDescription();
    v9[2](v9, 0, v17);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  unsigned int v10 = [(FetchReceiptTask *)self dialogContext];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    unsigned int v12 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      BOOL v14 = [(FetchReceiptTask *)self logKey];
      v15 = [(FetchReceiptTask *)self client];
      BOOL v16 = [v15 requestBundleID];
      int v21 = 138543618;
      int v22 = v14;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Handling engagement request", (uint8_t *)&v21, 0x16u);
    }
    int v17 = [(FetchReceiptTask *)self dialogContext];
    CFStringRef v18 = [(FetchReceiptTask *)self client];
    int v19 = [v18 bag];
    [v17 handleEngagementRequest:v8 bag:v19 completionHandler:v9];

    id v9 = v18;
  }
  else
  {
    if (qword_10039FA40 != -1) {
      dispatch_once(&qword_10039FA40, &stru_100358748);
    }
    unsigned int v20 = (void *)qword_10039FA20;
    if (os_log_type_enabled((os_log_t)qword_10039FA20, OS_LOG_TYPE_ERROR)) {
      sub_1002C3430(v20);
    }
    int v17 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v17);
  }
}

- (int64_t)apiVersion
{
  return *(void *)(&self->super._finished + 1);
}

- (void)setApiVersion:(int64_t)a3
{
  *(void *)(&self->super._finished + 1) = a3;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_apiVersion + 2);
}

- (DialogProtocol)dialogContext
{
  return *(DialogProtocol **)((char *)&self->_client + 2);
}

- (void)setDialogContext:(id)a3
{
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_dialogContext + 2);
}

- (void)setLogKey:(id)a3
{
}

- (unint64_t)receiptFlags
{
  return *(unint64_t *)((char *)&self->_logKey + 2);
}

- (void)setReceiptFlags:(unint64_t)a3
{
  *(NSString **)((char *)&self->_logKey + 2) = (NSString *)a3;
}

- (NSString)receiptString
{
  return *(NSString **)((char *)&self->_receiptFlags + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_receiptFlags + 2), 0);
  objc_storeStrong((id *)((char *)&self->_dialogContext + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);

  objc_storeStrong((id *)((char *)&self->_apiVersion + 2), 0);
}

@end