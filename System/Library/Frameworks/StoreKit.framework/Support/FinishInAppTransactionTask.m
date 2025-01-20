@interface FinishInAppTransactionTask
- (FinishInAppTransactionTask)initWithTransactionID:(id)a3 client:(id)a4;
- (NSString)serverCorrelationID;
- (NSString)transactionID;
- (_TtC9storekitd6Client)client;
- (void)main;
@end

@implementation FinishInAppTransactionTask

- (FinishInAppTransactionTask)initWithTransactionID:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FinishInAppTransactionTask;
  v9 = [(Task *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 50), a4);
    uint64_t v11 = +[NSUUID lib_shortLogKey];
    v12 = *(void **)(v10 + 42);
    *(void *)(v10 + 42) = v11;

    objc_storeStrong((id *)(v10 + 58), a3);
  }

  return (FinishInAppTransactionTask *)v10;
}

- (void)main
{
  v3 = [(FinishInAppTransactionTask *)self transactionID];
  id v4 = [v3 length];

  if (!v4)
  {
    if (qword_1003A0260 != -1) {
      dispatch_once(&qword_1003A0260, &stru_100359D48);
    }
    objc_super v14 = (void *)qword_1003A0230;
    if (os_log_type_enabled((os_log_t)qword_1003A0230, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(&self->super._finished + 1);
      v16 = v14;
      v17 = [(FinishInAppTransactionTask *)self client];
      v18 = [v17 requestBundleID];
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v15;
      __int16 v52 = 2114;
      id v53 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing transaction with no identifier for %{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  v5 = [(FinishInAppTransactionTask *)self client];
  v6 = +[ReceiptManager managerForClient:v5];

  id v7 = [(FinishInAppTransactionTask *)self transactionID];
  unsigned int v8 = [v6 isTransactionFinishedForID:v7];

  if (v8)
  {
    if (qword_1003A0260 != -1) {
      dispatch_once(&qword_1003A0260, &stru_100359D48);
    }
    v9 = (void *)qword_1003A0230;
    if (os_log_type_enabled((os_log_t)qword_1003A0230, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(&self->super._finished + 1);
      uint64_t v11 = v9;
      v12 = [(FinishInAppTransactionTask *)self client];
      v13 = [v12 requestBundleID];
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v10;
      __int16 v52 = 2114;
      id v53 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction is already finished for %{public}@", buf, 0x16u);
    }
LABEL_25:
    [(AsyncTask *)self completeWithSuccess];
    return;
  }
  if (qword_1003A0260 != -1) {
    dispatch_once(&qword_1003A0260, &stru_100359D48);
  }
  v19 = (void *)qword_1003A0230;
  if (os_log_type_enabled((os_log_t)qword_1003A0230, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(&self->super._finished + 1);
    v21 = v19;
    v22 = [(FinishInAppTransactionTask *)self transactionID];
    id v23 = [v22 hash];
    v24 = [(FinishInAppTransactionTask *)self client];
    v25 = [v24 requestBundleID];
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v20;
    __int16 v52 = 2048;
    id v53 = v23;
    __int16 v54 = 2114;
    v55 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing transaction %lu for %{public}@", buf, 0x20u);
  }
  v26 = [(FinishInAppTransactionTask *)self client];
  v27 = [v26 bag];

  v28 = [(FinishInAppTransactionTask *)self client];
  v29 = [v28 urlSession];

  v30 = [(FinishInAppTransactionTask *)self client];
  v31 = [v30 urlRequestEncoder];

  CFStringRef v48 = @"transactionId";
  v32 = [(FinishInAppTransactionTask *)self transactionID];
  v49 = v32;
  v33 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];

  v34 = +[BagKey finishTransactionURL];
  v35 = [v27 URLForKey:v34];
  v36 = [v31 requestWithMethod:2 bagURL:v35 parameters:v33];

  id v47 = 0;
  v37 = [v36 resultWithError:&v47];
  id v38 = v47;
  if (!v38)
  {
    v39 = [v29 dataTaskPromiseWithRequest:v37];
    id v46 = 0;
    [v39 resultWithError:&v46];
    v40 = v45 = v29;
    id v38 = v46;

    v41 = [v40 responseCorrelationId];
    v42 = *(NSString **)((char *)&self->_transactionID + 2);
    *(NSString **)((char *)&self->_transactionID + 2) = v41;

    v29 = v45;
    if (!v38)
    {
      v43 = [(FinishInAppTransactionTask *)self transactionID];
      [v6 setFinishedForTransactionID:v43];

      v29 = v45;
    }
  }

  if (!v38) {
    goto LABEL_25;
  }
  if (qword_1003A0260 != -1) {
    dispatch_once(&qword_1003A0260, &stru_100359D48);
  }
  v44 = (void *)qword_1003A0230;
  if (os_log_type_enabled((os_log_t)qword_1003A0230, OS_LOG_TYPE_ERROR)) {
    sub_1002C93BC((uint64_t)self, v44, (uint64_t)v38);
  }
  [(AsyncTask *)self completeWithError:v38];
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_logKey + 2);
}

- (NSString)transactionID
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (NSString)serverCorrelationID
{
  return *(NSString **)((char *)&self->_transactionID + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_transactionID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end