@interface LoadInAppReceiptsTask
- (BOOL)includeFinishedConsumables;
- (BOOL)more;
- (LoadInAppReceiptsTask)initWithLocalRevision:(id)a3 reason:(int64_t)a4 includeFinishedConsumables:(BOOL)a5 client:(id)a6;
- (NSArray)receipts;
- (NSSet)unfinishedTransactionIDs;
- (NSString)localRevision;
- (NSString)logKey;
- (NSString)serverRevision;
- (_TtC9storekitd6Client)client;
- (int64_t)reason;
- (void)main;
- (void)setLogKey:(id)a3;
@end

@implementation LoadInAppReceiptsTask

- (LoadInAppReceiptsTask)initWithLocalRevision:(id)a3 reason:(int64_t)a4 includeFinishedConsumables:(BOOL)a5 client:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LoadInAppReceiptsTask;
  v13 = [(Task *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 50), a6);
    v14[42] = a5;
    objc_storeStrong((id *)(v14 + 58), a3);
    uint64_t v15 = +[NSUUID lib_shortLogKey];
    v16 = *(void **)(v14 + 66);
    *(void *)(v14 + 66) = v15;

    *(void *)(v14 + 74) = a4;
    v14[43] = 0;
  }

  return (LoadInAppReceiptsTask *)v14;
}

- (void)main
{
  v3 = [(LoadInAppReceiptsTask *)self client];
  v4 = [v3 bag];

  v5 = [(LoadInAppReceiptsTask *)self client];
  v6 = [v5 urlSession];

  v7 = [(LoadInAppReceiptsTask *)self client];
  v8 = [v7 urlRequestEncoder];

  [v8 setRequestEncoding:3];
  if ([(LoadInAppReceiptsTask *)self includeFinishedConsumables]) {
    +[BagKey transactionReceiptsURLv2];
  }
  else {
  v9 = +[BagKey transactionReceiptsURL];
  }
  v10 = [v4 URLForKey:v9];
  id v92 = 0;
  id v11 = [v10 valueWithError:&v92];
  id v12 = v92;
  if (!v12)
  {
    v86 = v9;
    v87 = v10;
    v88 = v6;
    v14 = objc_opt_new();
    uint64_t v15 = +[AMSDevice deviceGUID];
    [v14 setObject:v15 forKeyedSubscript:@"guid"];

    v16 = sub_100047644([(LoadInAppReceiptsTask *)self reason]);
    [v14 setObject:v16 forKeyedSubscript:@"reason"];

    v84 = v14;
    uint64_t v85 = objc_msgSend(v11, "lib_URLByAppendingQueryDictionary:", v14);

    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    objc_super v18 = [(LoadInAppReceiptsTask *)self client];
    v19 = [v18 account];

    v20 = [(LoadInAppReceiptsTask *)self client];
    LODWORD(v14) = objc_msgSend(v20, "objc_clientType");

    v83 = v19;
    if (v14 != 3)
    {
      if (!v19)
      {
        if (qword_10039F548 != -1) {
          dispatch_once(&qword_10039F548, &stru_100357240);
        }
        v10 = v87;
        v6 = v88;
        v38 = (void *)v85;
        v9 = v86;
        v49 = (void *)qword_10039F528;
        if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_ERROR)) {
          sub_1002C0C5C(v49, self);
        }
        ASDErrorWithTitleAndMessage();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        [(AsyncTask *)self completeWithError:v13];
        goto LABEL_29;
      }
      v21 = objc_msgSend(v19, "ams_DSID");
      v22 = [v21 stringValue];
      [v17 setObject:v22 forKeyedSubscript:@"dsid"];
    }
    v23 = [(LoadInAppReceiptsTask *)self client];
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v23 storeItemID]);
    [v17 setObject:v24 forKeyedSubscript:@"appAdamId"];

    v25 = [(LoadInAppReceiptsTask *)self client];
    v26 = [v25 requestBundleID];
    [v17 setObject:v26 forKeyedSubscript:@"bundleId"];

    v27 = [(LoadInAppReceiptsTask *)self client];
    v28 = [v27 deviceVendorID];
    v29 = [v28 UUIDString];
    [v29 lowercaseString];
    v30 = v89 = v4;
    [v17 setObject:v30 forKeyedSubscript:@"deviceVerification"];

    v4 = v89;
    v31 = +[AMSDevice deviceGUID];
    [v17 setObject:v31 forKeyedSubscript:@"guid"];

    v32 = sub_100047644([(LoadInAppReceiptsTask *)self reason]);
    [v17 setObject:v32 forKeyedSubscript:@"reason"];

    v33 = [(LoadInAppReceiptsTask *)self localRevision];
    [v17 setObject:v33 forKeyedSubscript:@"revision"];

    v34 = +[BagKey transactionReceiptsMaxCount];
    v35 = [v89 integerForKey:v34];

    v36 = [v35 valueWithError:0];
    v37 = [v36 stringValue];
    [v17 setObject:v37 forKeyedSubscript:@"limit"];

    v81 = v35;
    if (qword_10039F548 != -1) {
      dispatch_once(&qword_10039F548, &stru_100357240);
    }
    v38 = (void *)v85;
    v39 = (void *)qword_10039F528;
    if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      v41 = [(LoadInAppReceiptsTask *)self logKey];
      v42 = objc_opt_class();
      id v43 = v42;
      v44 = [(LoadInAppReceiptsTask *)self localRevision];
      *(_DWORD *)buf = 138543874;
      v94 = v41;
      __int16 v95 = 2114;
      v96 = v42;
      __int16 v97 = 2114;
      id v98 = v44;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Starting receipt request from revision %{public}@", buf, 0x20u);

      v4 = v89;
    }
    [v8 requestWithMethod:4 URL:v85 headers:&off_100373A38 parameters:v17];
    v80 = id v91 = 0;
    uint64_t v45 = [v80 resultWithError:&v91];
    id v46 = v91;
    v10 = v87;
    v6 = v88;
    v79 = (void *)v45;
    if (v46)
    {
      id v13 = v46;
      v82 = 0;
    }
    else
    {
      v47 = [v88 dataTaskPromiseWithRequest:v45];
      id v90 = 0;
      v48 = [v47 resultWithError:&v90];
      id v13 = v90;
      if (v48) {
        +[SecureClock synchronizeWithURLResult:v48];
      }
      v82 = v48;

      if (!v13)
      {
        v9 = v86;
        if (qword_10039F548 != -1) {
          dispatch_once(&qword_10039F548, &stru_100357240);
        }
        v38 = (void *)v85;
        v50 = (void *)qword_10039F528;
        if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          v52 = [(LoadInAppReceiptsTask *)self logKey];
          v53 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v94 = v52;
          __int16 v95 = 2114;
          v96 = v53;
          id v54 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Finished receipt request", buf, 0x16u);

          v10 = v87;
          v4 = v89;

          v6 = v88;
        }
        v55 = [v48 object];
        objc_opt_class();
        v78 = v55;
        if (objc_opt_isKindOfClass())
        {
          id v56 = v55;
          v57 = [v56 objectForKeyedSubscript:@"signedTransactions"];
          v58 = [v56 objectForKeyedSubscript:@"revision"];
          objc_opt_class();
          id obj = v57;
          v74 = v58;
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            objc_storeStrong((id *)((char *)&self->_serverRevision + 2), v57);
            objc_storeStrong((id *)((char *)&self->_reason + 2), v58);
            id v13 = 0;
            v59 = &off_10039F000;
          }
          else
          {
            if (qword_10039F548 != -1) {
              dispatch_once(&qword_10039F548, &stru_100357240);
            }
            v59 = &off_10039F000;
            if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_ERROR)) {
              sub_1002C0A7C();
            }
            ASDErrorWithTitleAndMessage();
            id v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v60 = [v56 objectForKeyedSubscript:@"unfinishedTxnIds"];
          objc_opt_class();
          v76 = (void *)v60;
          v77 = v56;
          if (objc_opt_isKindOfClass())
          {
            v38 = (void *)v85;
            if (qword_10039F548 != -1) {
              dispatch_once(&qword_10039F548, &stru_100357240);
            }
            v61 = v59[165];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = v61;
              v63 = [(LoadInAppReceiptsTask *)self logKey];
              v64 = objc_opt_class();
              id v65 = v64;
              id v66 = [v76 count];
              *(_DWORD *)buf = 138543874;
              v94 = v63;
              __int16 v95 = 2114;
              v96 = v64;
              v10 = v87;
              __int16 v97 = 2048;
              id v98 = v66;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Setting %lu unfinished transactions", buf, 0x20u);

              v6 = v88;
              v4 = v89;
            }
            v67 = +[NSSet setWithArray:v76];
            v68 = *(NSArray **)((char *)&self->_receipts + 2);
            *(NSArray **)((char *)&self->_receipts + 2) = v67;

            v69 = v74;
          }
          else
          {
            v38 = (void *)v85;
            if (qword_10039F548 != -1) {
              dispatch_once(&qword_10039F548, &stru_100357240);
            }
            v70 = v59[165];
            v69 = v74;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              sub_1002C09D0(v70, self);
            }
          }
          v71 = [v77 objectForKeyedSubscript:@"hasMore"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unsigned __int8 v72 = [v71 BOOLValue];
          }
          else {
            unsigned __int8 v72 = 0;
          }
          v73 = v71;
          v9 = v86;
          *(&self->super._finished + 2) = v72;
        }
        else
        {
          if (qword_10039F548 != -1) {
            dispatch_once(&qword_10039F548, &stru_100357240);
          }
          if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_ERROR)) {
            sub_1002C0B1C();
          }
          ASDErrorWithTitleAndMessage();
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v13) {
          [(AsyncTask *)self completeWithError:v13];
        }
        else {
          [(AsyncTask *)self completeWithSuccess];
        }

        goto LABEL_28;
      }
      v38 = (void *)v85;
    }
    if (qword_10039F548 != -1) {
      dispatch_once(&qword_10039F548, &stru_100357240);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_ERROR)) {
      sub_1002C0BBC();
    }
    [(AsyncTask *)self completeWithError:v13];
    v9 = v86;
LABEL_28:

LABEL_29:
    id v11 = v38;
    goto LABEL_30;
  }
  id v13 = v12;
  if (qword_10039F548 != -1) {
    dispatch_once(&qword_10039F548, &stru_100357240);
  }
  if (os_log_type_enabled((os_log_t)qword_10039F528, OS_LOG_TYPE_ERROR)) {
    sub_1002C0D08();
  }
  [(AsyncTask *)self completeWithError:v13];
LABEL_30:
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)(&self->_more + 1);
}

- (BOOL)includeFinishedConsumables
{
  return *(&self->super._finished + 1);
}

- (NSString)localRevision
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_localRevision + 2);
}

- (void)setLogKey:(id)a3
{
}

- (int64_t)reason
{
  return *(int64_t *)((char *)&self->_logKey + 2);
}

- (BOOL)more
{
  return *(&self->super._finished + 2);
}

- (NSString)serverRevision
{
  return *(NSString **)((char *)&self->_reason + 2);
}

- (NSArray)receipts
{
  return *(NSArray **)((char *)&self->_serverRevision + 2);
}

- (NSSet)unfinishedTransactionIDs
{
  return *(NSSet **)((char *)&self->_receipts + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_receipts + 2), 0);
  objc_storeStrong((id *)((char *)&self->_serverRevision + 2), 0);
  objc_storeStrong((id *)((char *)&self->_reason + 2), 0);
  objc_storeStrong((id *)((char *)&self->_localRevision + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);

  objc_storeStrong((id *)(&self->_more + 1), 0);
}

@end