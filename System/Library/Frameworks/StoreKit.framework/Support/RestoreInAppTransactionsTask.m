@interface RestoreInAppTransactionsTask
- (BOOL)forceAuthentication;
- (DialogProtocol)dialogContext;
- (NSArray)transactions;
- (NSString)applicationUsername;
- (NSString)logKey;
- (NSString)serverCorrelationID;
- (NSURL)receiptInstallURL;
- (RestoreInAppTransactionsTask)initWithClient:(id)a3;
- (_TtC9storekitd6Client)client;
- (id)_authenticateAccount:(id)a3 error:(id *)a4;
- (id)_runRequestWithError:(id *)a3;
- (void)main;
- (void)setApplicationUsername:(id)a3;
- (void)setDialogContext:(id)a3;
- (void)setForceAuthentication:(BOOL)a3;
- (void)setReceiptInstallURL:(id)a3;
@end

@implementation RestoreInAppTransactionsTask

- (RestoreInAppTransactionsTask)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RestoreInAppTransactionsTask;
  v6 = [(Task *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 50), a3);
    uint64_t v8 = +[NSUUID lib_shortLogKey];
    v9 = *(void **)(v7 + 74);
    *(void *)(v7 + 74) = v8;
  }
  return (RestoreInAppTransactionsTask *)v7;
}

- (void)main
{
  if (qword_10039FEE8 != -1) {
    dispatch_once(&qword_10039FEE8, &stru_100359768);
  }
  v3 = (void *)qword_10039FEB8;
  if (os_log_type_enabled((os_log_t)qword_10039FEB8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = [(RestoreInAppTransactionsTask *)self logKey];
    *(_DWORD *)buf = 138543362;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Restoring completed purchases", buf, 0xCu);
  }
  v6 = [(RestoreInAppTransactionsTask *)self client];
  v7 = [v6 account];

  if (v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [(RestoreInAppTransactionsTask *)self client];
  unsigned int v9 = objc_msgSend(v8, "objc_clientType");

  if (v9 == 3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  id v31 = 0;
  v7 = [(RestoreInAppTransactionsTask *)self _authenticateAccount:0 error:&v31];
  id v10 = v31;
  if (!v10)
  {
LABEL_10:
    id v30 = 0;
    v12 = [(RestoreInAppTransactionsTask *)self _runRequestWithError:&v30];
    id v11 = v30;
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  id v11 = v10;
  v12 = 0;
LABEL_11:
  v13 = [v11 domain];
  if (([v13 isEqualToString:AMSErrorDomain] & 1) == 0)
  {

    goto LABEL_18;
  }
  id v14 = [v11 code];

  if (v14 != (id)305) {
    goto LABEL_18;
  }
  v15 = [v11 userInfo];
  v16 = [v15 objectForKeyedSubscript:AMSErrorUserInfoKeyServerErrorCode];
  v17 = (char *)[v16 integerValue];

  if ((unint64_t)(v17 - 2002) > 0x35 || ((1 << (v17 + 46)) & 0x20000100000001) == 0) {
    goto LABEL_18;
  }
  id v29 = v11;
  id v18 = [(RestoreInAppTransactionsTask *)self _authenticateAccount:v7 error:&v29];
  id v19 = v29;

  if (v19)
  {
    id v11 = v19;
LABEL_18:
    if (qword_10039FEE8 != -1) {
      dispatch_once(&qword_10039FEE8, &stru_100359768);
    }
    v20 = (void *)qword_10039FEB8;
    if (os_log_type_enabled((os_log_t)qword_10039FEB8, OS_LOG_TYPE_ERROR)) {
      sub_1002C6A94(v20, self, (uint64_t)v11);
    }
    [(AsyncTask *)self completeWithError:v11];

    goto LABEL_27;
  }
  id v28 = 0;
  uint64_t v21 = [(RestoreInAppTransactionsTask *)self _runRequestWithError:&v28];
  id v11 = v28;

  v12 = (void *)v21;
  if (v11) {
    goto LABEL_18;
  }
LABEL_24:
  v22 = [v12 object];
  if (v22)
  {
    v23 = [(RestoreInAppTransactionsTask *)self client];
    v24 = [(RestoreInAppTransactionsTask *)self receiptInstallURL];
    v25 = [(RestoreInAppTransactionsTask *)self logKey];
    sub_100046630(v22, v23, v24, 1, v25, 0, 0);
    v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v27 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
    *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v26;
  }
  [(AsyncTask *)self completeWithSuccess];
LABEL_27:
}

- (id)_runRequestWithError:(id *)a3
{
  v4 = [(RestoreInAppTransactionsTask *)self client];
  id v5 = [v4 bag];

  v6 = [(RestoreInAppTransactionsTask *)self client];
  v7 = [v6 urlSession];

  uint64_t v8 = [(RestoreInAppTransactionsTask *)self client];
  unsigned int v9 = [v8 urlRequestEncoder];

  id v10 = [(RestoreInAppTransactionsTask *)self logKey];
  [v9 setLogUUID:v10];

  id v11 = [(RestoreInAppTransactionsTask *)self client];
  v12 = [(RestoreInAppTransactionsTask *)self receiptInstallURL];
  v13 = [v11 queryWith:1 customReceiptURL:v12];
  id v14 = [v13 mutableCopy];

  v15 = [(RestoreInAppTransactionsTask *)self applicationUsername];
  [v14 setObject:v15 forKeyedSubscript:@"applicationUsername"];

  v16 = +[BagKey restoreTransactionsURL];
  id v29 = v5;
  v17 = [v5 URLForKey:v16];
  id v18 = [v9 requestWithMethod:4 bagURL:v17 parameters:v14];

  id v31 = 0;
  id v19 = [v18 resultWithError:&v31];
  id v20 = v31;
  uint64_t v21 = v7;
  v22 = [v7 dataTaskPromiseWithRequest:v19];
  id v30 = v20;
  v23 = [v22 resultWithError:&v30];
  id v24 = v30;

  v25 = [v23 responseCorrelationId];
  v26 = *(NSArray **)((char *)&self->_transactions + 2);
  *(NSArray **)((char *)&self->_transactions + 2) = v25;

  if (a3) {
    *a3 = v24;
  }

  return v23;
}

- (id)_authenticateAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = sub_10006B600;
  v38[3] = sub_10006B610;
  id v39 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10006B600;
  v35 = sub_10006B610;
  id v36 = 0;
  v7 = [(RestoreInAppTransactionsTask *)self dialogContext];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if (qword_10039FEE8 != -1) {
      dispatch_once(&qword_10039FEE8, &stru_100359768);
    }
    id v19 = (id)qword_10039FEB8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(RestoreInAppTransactionsTask *)self logKey];
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] No client available to handle authentication request", buf, 0xCu);
    }
    uint64_t v21 = ASDErrorWithDescription();
    id v11 = *(id *)(v38[0] + 40);
    *(void *)(v38[0] + 40) = v21;
  }
  else
  {
    if (qword_10039FEE8 != -1) {
      dispatch_once(&qword_10039FEE8, &stru_100359768);
    }
    unsigned int v9 = (id)qword_10039FEB8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(RestoreInAppTransactionsTask *)self logKey];
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending authentication request", buf, 0xCu);
    }
    id v11 = objc_alloc_init((Class)AMSAuthenticateOptions);
    v12 = [(RestoreInAppTransactionsTask *)self client];
    v13 = [v12 processInfo];
    [v11 setClientInfo:v13];

    [v11 setAuthenticationType:0];
    [v11 setDebugReason:@"Restore In App"];
    id v14 = [(RestoreInAppTransactionsTask *)self logKey];
    [v11 setLogKey:v14];

    id v15 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:v6 options:v11];
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = [(RestoreInAppTransactionsTask *)self dialogContext];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006B618;
    v27[3] = &unk_100357E40;
    id v29 = &v31;
    id v30 = &v37;
    id v18 = v16;
    id v28 = v18;
    [v17 handleAuthenticateRequest:v15 completionHandler:v27];

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }

  v22 = [(id)v32[5] account];

  if (v22)
  {
    v23 = [(id)v32[5] account];
    if (!a4) {
      goto LABEL_21;
    }
LABEL_20:
    *a4 = *(id *)(v38[0] + 40);
    goto LABEL_21;
  }
  if (qword_10039FEE8 != -1) {
    dispatch_once(&qword_10039FEE8, &stru_100359768);
  }
  id v24 = (id)qword_10039FEB8;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = [(RestoreInAppTransactionsTask *)self logKey];
    sub_1002C6B54(v25, (uint64_t)v38, buf, v24);
  }

  v23 = 0;
  if (a4) {
    goto LABEL_20;
  }
LABEL_21:
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);

  return v23;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)(&self->_forceAuthentication + 2);
}

- (DialogProtocol)dialogContext
{
  return *(DialogProtocol **)((char *)&self->_client + 2);
}

- (void)setDialogContext:(id)a3
{
}

- (NSString)applicationUsername
{
  return *(NSString **)((char *)&self->_dialogContext + 2);
}

- (void)setApplicationUsername:(id)a3
{
}

- (BOOL)forceAuthentication
{
  return *(&self->super._finished + 1);
}

- (void)setForceAuthentication:(BOOL)a3
{
  *(&self->super._finished + 1) = a3;
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_applicationUsername + 2);
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)((char *)&self->_logKey + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (NSArray)transactions
{
  return *(NSArray **)((char *)&self->_receiptInstallURL + 2);
}

- (NSString)serverCorrelationID
{
  return *(NSString **)((char *)&self->_transactions + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_transactions + 2), 0);
  objc_storeStrong((id *)((char *)&self->_receiptInstallURL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_applicationUsername + 2), 0);
  objc_storeStrong((id *)((char *)&self->_dialogContext + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);

  objc_storeStrong((id *)(&self->_forceAuthentication + 2), 0);
}

@end