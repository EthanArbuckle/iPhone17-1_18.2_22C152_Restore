@interface LoadSubscriptionStatusTask
- (LoadSubscriptionStatusTask)initWithSubscriptionGroupID:(id)a3 reason:(int64_t)a4 client:(id)a5;
- (NSArray)statuses;
- (NSString)logKey;
- (NSString)subscriptionGroupID;
- (_TtC9storekitd6Client)client;
- (int64_t)reason;
- (void)_parseResponse:(id)a3;
- (void)_replaceDate:(id *)a3 ifBeforeDate:(id)a4;
- (void)main;
- (void)setLogKey:(id)a3;
@end

@implementation LoadSubscriptionStatusTask

- (LoadSubscriptionStatusTask)initWithSubscriptionGroupID:(id)a3 reason:(int64_t)a4 client:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LoadSubscriptionStatusTask;
  v11 = [(Task *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 42), a5);
    uint64_t v13 = +[NSUUID lib_shortLogKey];
    v14 = *(void **)(v12 + 50);
    *(void *)(v12 + 50) = v13;

    *(void *)(v12 + 58) = a4;
    objc_storeStrong((id *)(v12 + 66), a3);
  }

  return (LoadSubscriptionStatusTask *)v12;
}

- (void)main
{
  v3 = [(LoadSubscriptionStatusTask *)self client];
  v4 = [v3 bag];

  v5 = [(LoadSubscriptionStatusTask *)self client];
  v6 = [v5 urlSession];

  v7 = [(LoadSubscriptionStatusTask *)self client];
  v8 = [v7 urlRequestEncoder];

  v63 = v8;
  [v8 setRequestEncoding:3];
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(LoadSubscriptionStatusTask *)self client];
  v11 = [v10 account];

  v12 = [(LoadSubscriptionStatusTask *)self client];
  LODWORD(v8) = objc_msgSend(v12, "objc_clientType");

  if (v8 == 3)
  {
LABEL_4:
    v60 = v11;
    v62 = v6;
    v15 = [(LoadSubscriptionStatusTask *)self client];
    objc_super v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v15 storeItemID]);
    [v9 setObject:v16 forKeyedSubscript:@"appAdamId"];

    v17 = [(LoadSubscriptionStatusTask *)self client];
    v18 = [v17 requestBundleID];
    [v9 setObject:v18 forKeyedSubscript:@"bundleId"];

    v19 = [(LoadSubscriptionStatusTask *)self client];
    v20 = [v19 deviceVendorID];
    v21 = [v20 UUIDString];
    v22 = [v21 lowercaseString];
    [v9 setObject:v22 forKeyedSubscript:@"deviceVerification"];

    v23 = +[AMSDevice deviceGUID];
    [v9 setObject:v23 forKeyedSubscript:@"guid"];

    v24 = sub_100047644([(LoadSubscriptionStatusTask *)self reason]);
    [v9 setObject:v24 forKeyedSubscript:@"reason"];

    if (qword_1003A00F8 != -1) {
      dispatch_once(&qword_1003A00F8, &stru_100359B68);
    }
    v25 = (void *)qword_1003A00D8;
    if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = [(LoadSubscriptionStatusTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      v69 = v27;
      __int16 v70 = 2114;
      id v71 = (id)objc_opt_class();
      id v28 = v71;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Starting subscription status request", buf, 0x16u);
    }
    v29 = +[BagKey subscriptionStatusURL];
    v61 = v4;
    v30 = [v4 URLForKey:v29];

    id v66 = 0;
    v31 = [v30 valueWithError:&v66];
    id v32 = v66;
    v33 = [(LoadSubscriptionStatusTask *)self subscriptionGroupID];
    id v34 = [v33 length];

    if (v34)
    {
      v35 = [(LoadSubscriptionStatusTask *)self subscriptionGroupID];
      uint64_t v36 = [v31 URLByAppendingPathComponent:v35];

      v31 = (void *)v36;
    }
    if (v31)
    {
      v37 = objc_opt_new();
      v38 = +[AMSDevice deviceGUID];
      [v37 setObject:v38 forKeyedSubscript:@"guid"];

      v39 = sub_100047644([(LoadSubscriptionStatusTask *)self reason]);
      [v37 setObject:v39 forKeyedSubscript:@"reason"];

      v40 = objc_msgSend(v31, "lib_URLByAppendingQueryDictionary:", v37);

      v41 = [v63 requestWithMethod:4 URL:v40 headers:&off_100373A60 parameters:v9];

      if (v41)
      {
        id v65 = v32;
        v42 = [v41 resultWithError:&v65];
        id v43 = v65;

        v44 = &qword_1003A0000;
        if (v43)
        {
          v45 = 0;
          id v32 = v43;
        }
        else
        {
          v47 = [v62 dataTaskPromiseWithRequest:v42];
          id v64 = 0;
          v45 = [v47 resultWithError:&v64];
          id v32 = v64;
          if (v45) {
            +[SecureClock synchronizeWithURLResult:v45];
          }
        }
LABEL_25:
        uint64_t v48 = v44[31];
        if (v32)
        {
          if (v48 != -1) {
            dispatch_once(&qword_1003A00F8, &stru_100359B68);
          }
          v49 = (void *)qword_1003A00D8;
          if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR)) {
            sub_1002C8A7C(v49, self);
          }
          [(AsyncTask *)self completeWithError:v32];
          goto LABEL_56;
        }
        if (v48 != -1) {
          dispatch_once(&qword_1003A00F8, &stru_100359B68);
        }
        v50 = (void *)qword_1003A00D8;
        if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          v52 = [(LoadSubscriptionStatusTask *)self logKey];
          v53 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v69 = v52;
          __int16 v70 = 2114;
          id v71 = v53;
          id v54 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Finished subscription status request", buf, 0x16u);
        }
        v55 = [v45 object];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v44[31] != -1) {
            dispatch_once(&qword_1003A00F8, &stru_100359B68);
          }
          v57 = (void *)qword_1003A00D8;
          if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR)) {
            sub_1002C89CC(v57, self);
          }
          ASDErrorWithTitleAndMessage();
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_52;
        }
        v56 = [v55 objectForKeyedSubscript:@"data"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(LoadSubscriptionStatusTask *)self _parseResponse:v56];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_1003A00F8 != -1) {
              dispatch_once(&qword_1003A00F8, &stru_100359B68);
            }
            v59 = (void *)qword_1003A00D8;
            if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR)) {
              sub_1002C891C(v59, self);
            }
            ASDErrorWithTitleAndMessage();
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_51;
          }
          v67 = v56;
          v58 = +[NSArray arrayWithObjects:&v67 count:1];
          [(LoadSubscriptionStatusTask *)self _parseResponse:v58];
        }
        id v32 = 0;
LABEL_51:

LABEL_52:
        if (v32) {
          [(AsyncTask *)self completeWithError:v32];
        }
        else {
          [(AsyncTask *)self completeWithSuccess];
        }

LABEL_56:
        v4 = v61;
        v6 = v62;
        v11 = v60;
        goto LABEL_57;
      }
    }
    else
    {
      v41 = 0;
      v40 = 0;
    }
    v45 = 0;
    v44 = &qword_1003A0000;
    goto LABEL_25;
  }
  if (v11)
  {
    uint64_t v13 = objc_msgSend(v11, "ams_DSID");
    v14 = [v13 stringValue];
    [v9 setObject:v14 forKeyedSubscript:@"dsid"];

    goto LABEL_4;
  }
  if (qword_1003A00F8 != -1) {
    dispatch_once(&qword_1003A00F8, &stru_100359B68);
  }
  v46 = (void *)qword_1003A00D8;
  if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR)) {
    sub_1002C8B2C(v46, self);
  }
  ASDErrorWithTitleAndMessage();
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  [(AsyncTask *)self completeWithError:v32];
LABEL_57:
}

- (void)_parseResponse:(id)a3
{
  id v3 = a3;
  v4 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
  id v71 = objc_opt_new();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v92 objects:v110 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v93;
    CFStringRef v9 = @"signedRenewalInfo";
    id v69 = v5;
    uint64_t v72 = *(void *)v93;
    do
    {
      uint64_t v10 = 0;
      id v70 = v7;
      do
      {
        if (*(void *)v93 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v76 = v10;
        v11 = *(void **)(*((void *)&v92 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"subscriptionGroupIdentifier", v69);
        objc_opt_class();
        v77 = (void *)v12;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [(id)v4[101] array];
          uint64_t v14 = [v11 objectForKeyedSubscript:v9];
          objc_opt_class();
          v73 = (void *)v14;
          if (objc_opt_isKindOfClass())
          {
            v15 = [v11 objectForKeyedSubscript:@"status"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v80 = (void *)v13;
              long long v91 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              long long v88 = 0u;
              id v16 = v73;
              id v17 = [v16 countByEnumeratingWithState:&v88 objects:v101 count:16];
              if (v17)
              {
                id v18 = v17;
                id v19 = 0;
                uint64_t v20 = *(void *)v89;
                do
                {
                  v21 = 0;
                  v22 = v19;
                  do
                  {
                    if (*(void *)v89 != v20) {
                      objc_enumerationMutation(v16);
                    }
                    v23 = *(void **)(*((void *)&v88 + 1) + 8 * (void)v21);
                    v99[0] = @"status";
                    v99[1] = v9;
                    v100[0] = v15;
                    v100[1] = v23;
                    v24 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];
                    [v80 addObject:v24];

                    v25 = sub_1000461FC(v23);
                    id v87 = v22;
                    [(LoadSubscriptionStatusTask *)self _replaceDate:&v87 ifBeforeDate:v25];
                    id v19 = v87;

                    v21 = (char *)v21 + 1;
                    v22 = v19;
                  }
                  while (v18 != v21);
                  id v18 = [v16 countByEnumeratingWithState:&v88 objects:v101 count:16];
                }
                while (v18);
                v4 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
                id v5 = v69;
                id v7 = v70;
              }
              else
              {
                id v19 = 0;
              }
LABEL_60:

              v15 = +[NSMutableDictionary dictionaryWithCapacity:3];
              [v15 setObject:v77 forKeyedSubscript:@"subscriptionGroupIdentifier"];
              id v65 = v80;
              [v15 setObject:v80 forKeyedSubscript:@"lastTransactions"];
              [v15 setObject:v19 forKeyedSubscript:@"gracePeriodExpiresDate"];
              [v71 addObject:v15];
LABEL_61:

              uint64_t v8 = v72;
              goto LABEL_62;
            }
            if (qword_1003A00F8 != -1) {
              dispatch_once(&qword_1003A00F8, &stru_100359B68);
            }
            v55 = (void *)v13;
            v56 = (void *)qword_1003A00D8;
            if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
            {
              v57 = v56;
              v58 = [(LoadSubscriptionStatusTask *)self logKey];
              v59 = objc_opt_class();
              *(_DWORD *)buf = 138544130;
              v103 = v58;
              __int16 v104 = 2114;
              v105 = v59;
              __int16 v106 = 2114;
              uint64_t v107 = (uint64_t)v15;
              __int16 v108 = 2114;
              uint64_t v109 = v12;
              id v60 = v59;
              v61 = v57;
              v62 = "[%{public}@] [%{public}@]: Invalid status %{public}@ for subscription group ID %{public}@";
              uint32_t v63 = 42;
              goto LABEL_65;
            }
            goto LABEL_57;
          }
          v15 = [v11 objectForKeyedSubscript:@"lastTransactions"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_1003A00F8 != -1) {
              dispatch_once(&qword_1003A00F8, &stru_100359B68);
            }
            v55 = (void *)v13;
            id v64 = (void *)qword_1003A00D8;
            if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
            {
              v57 = v64;
              v58 = [(LoadSubscriptionStatusTask *)self logKey];
              id v66 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v103 = v58;
              __int16 v104 = 2114;
              v105 = v66;
              __int16 v106 = 2114;
              uint64_t v107 = v12;
              id v60 = v66;
              v61 = v57;
              v62 = "[%{public}@] [%{public}@]: Invalid lastTransactions for subscription group ID %{public}@";
              uint32_t v63 = 32;
LABEL_65:
              _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, v62, buf, v63);

              id v7 = v70;
            }
LABEL_57:
            id v19 = 0;
            id v65 = v55;
            goto LABEL_61;
          }
          v80 = (void *)v13;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v16 = v15;
          id v79 = [v16 countByEnumeratingWithState:&v83 objects:v98 count:16];
          id v19 = 0;
          if (!v79)
          {
            v15 = v16;
            goto LABEL_60;
          }
          uint64_t v78 = *(void *)v84;
          while (2)
          {
            uint64_t v31 = 0;
LABEL_25:
            if (*(void *)v84 != v78) {
              objc_enumerationMutation(v16);
            }
            id v32 = v16;
            v33 = *(void **)(*((void *)&v83 + 1) + 8 * v31);
            id v34 = [v33 objectForKeyedSubscript:@"status"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = [v33 objectForKeyedSubscript:v9];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CFStringRef v36 = v9;
                v37 = sub_1000461FC(v35);
                id v82 = v19;
                [(LoadSubscriptionStatusTask *)self _replaceDate:&v82 ifBeforeDate:v37];
                id v38 = v82;

                v39 = [v33 objectForKeyedSubscript:@"signedTransactionInfo"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v96[0] = @"status";
                  v96[1] = v36;
                  v97[0] = v34;
                  v97[1] = v35;
                  v96[2] = @"signedTransactionInfo";
                  v97[2] = v39;
                  v40 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:3];
                  [v80 addObject:v40];
                  goto LABEL_31;
                }
                if (qword_1003A00F8 != -1) {
                  dispatch_once(&qword_1003A00F8, &stru_100359B68);
                }
                v51 = (void *)qword_1003A00D8;
                if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
                {
                  log = v51;
                  v52 = [(LoadSubscriptionStatusTask *)self logKey];
                  v53 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  v103 = v52;
                  __int16 v104 = 2114;
                  v105 = v53;
                  __int16 v106 = 2114;
                  uint64_t v107 = (uint64_t)v77;
                  id v74 = v53;
                  v40 = log;
                  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@]: Invalid transaction for subscription group ID %{public}@", buf, 0x20u);

LABEL_31:
                }

                id v19 = v38;
                CFStringRef v9 = v36;
                id v16 = v32;
              }
              else
              {
                if (qword_1003A00F8 != -1) {
                  dispatch_once(&qword_1003A00F8, &stru_100359B68);
                }
                id v16 = v32;
                v46 = (void *)qword_1003A00D8;
                if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
                {
                  v47 = v46;
                  uint64_t v48 = [(LoadSubscriptionStatusTask *)self logKey];
                  v49 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  v103 = v48;
                  __int16 v104 = 2114;
                  v105 = v49;
                  __int16 v106 = 2114;
                  uint64_t v107 = (uint64_t)v77;
                  id v50 = v49;
                  _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@]: Invalid renewal info for subscription group ID %{public}@", buf, 0x20u);

                  id v16 = v32;
                }
              }
            }
            else
            {
              if (qword_1003A00F8 != -1) {
                dispatch_once(&qword_1003A00F8, &stru_100359B68);
              }
              id v16 = v32;
              v41 = (void *)qword_1003A00D8;
              if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
              {
                v42 = v41;
                id v43 = [(LoadSubscriptionStatusTask *)self logKey];
                v44 = objc_opt_class();
                *(_DWORD *)buf = 138544130;
                v103 = v43;
                __int16 v104 = 2114;
                v105 = v44;
                __int16 v106 = 2114;
                uint64_t v107 = (uint64_t)v34;
                __int16 v108 = 2114;
                uint64_t v109 = (uint64_t)v77;
                id v45 = v44;
                _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@]: Invalid status %{public}@ for subscription group ID %{public}@", buf, 0x2Au);
              }
            }

            if (v79 == (id)++v31)
            {
              id v54 = [v16 countByEnumeratingWithState:&v83 objects:v98 count:16];
              id v79 = v54;
              if (!v54)
              {
                v15 = v16;
                v4 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
                id v5 = v69;
                id v7 = v70;
                goto LABEL_60;
              }
              continue;
            }
            goto LABEL_25;
          }
        }
        if (qword_1003A00F8 != -1) {
          dispatch_once(&qword_1003A00F8, &stru_100359B68);
        }
        v26 = (void *)qword_1003A00D8;
        if (os_log_type_enabled((os_log_t)qword_1003A00D8, OS_LOG_TYPE_ERROR))
        {
          v27 = v26;
          id v28 = [(LoadSubscriptionStatusTask *)self logKey];
          v29 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v103 = v28;
          __int16 v104 = 2114;
          v105 = v29;
          __int16 v106 = 2114;
          uint64_t v107 = v12;
          id v30 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@]: Invalid subscription group ID for status request: %{public}@", buf, 0x20u);

          id v7 = v70;
        }
LABEL_62:

        uint64_t v10 = v76 + 1;
      }
      while ((id)(v76 + 1) != v7);
      id v67 = [v5 countByEnumeratingWithState:&v92 objects:v110 count:16];
      id v7 = v67;
    }
    while (v67);
  }

  v68 = *(NSString **)((char *)&self->_subscriptionGroupID + 2);
  *(NSString **)((char *)&self->_subscriptionGroupID + 2) = (NSString *)v71;
}

- (void)_replaceDate:(id *)a3 ifBeforeDate:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v7 = v5;
    if (!*a3 || (v6 = [*a3 compare:v5], id v5 = v7, v6 == (id)-1)) {
      *a3 = v5;
    }
  }

  _objc_release_x1();
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)(&self->super._finished + 1);
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (void)setLogKey:(id)a3
{
}

- (int64_t)reason
{
  return *(int64_t *)((char *)&self->_logKey + 2);
}

- (NSString)subscriptionGroupID
{
  return *(NSString **)((char *)&self->_reason + 2);
}

- (NSArray)statuses
{
  return *(NSArray **)((char *)&self->_subscriptionGroupID + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_subscriptionGroupID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_reason + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end