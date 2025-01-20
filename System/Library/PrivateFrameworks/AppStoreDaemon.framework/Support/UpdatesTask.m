@interface UpdatesTask
- (void)main;
@end

@implementation UpdatesTask

- (void)main
{
  v2 = self;
  if (!self) {
    goto LABEL_37;
  }
  v65 = self;
  uint64_t v66 = objc_opt_new();
  v3 = v2->_apps;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v3, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v5 = v3;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v71 objects:buf count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v71 + 1) + 8 * i);
        uint64_t v11 = [v10 storeItemID];
        if (v11
          && (v12 = (void *)v11,
              [v10 storeExternalVersionID],
              v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12,
              v13))
        {
          v79[0] = @"adam-id";
          v14 = [v10 storeItemID];
          v79[1] = @"installed-version-identifier";
          v80[0] = v14;
          v15 = [v10 storeExternalVersionID];
          v80[1] = v15;
          v16 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];

          if (v16) {
            [v4 addObject:v16];
          }
        }
        else
        {

          v16 = 0;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v71 objects:buf count:16];
    }
    while (v7);
  }

  id v17 = [v4 copy];
  if ([v17 count])
  {
    v18 = (void *)v66;
    v19 = (void *)v66;
    v20 = v17;
  }
  else
  {
    sub_10030B11C();
    v21 = (id *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v22 = sub_10030BBA8(v21, @"updates-use-optimized-requests", 0);

    v18 = (void *)v66;
    if (v22)
    {
      id v23 = 0;
      v2 = v65;
      goto LABEL_30;
    }
    v20 = &__NSArray0__struct;
    v19 = (void *)v66;
  }
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, @"local-software", v65);
  v2 = v65;
  v24 = +[NSNumber numberWithBool:sub_100005CF8()];
  [v18 setObject:v24 forKeyedSubscript:@"autoUpdatesEnabled"];

  v25 = +[AMSDevice deviceGUID];
  [v18 setObject:v25 forKeyedSubscript:@"guid"];

  v26 = [(ACAccount *)v65->_account ams_DSID];

  if (v26)
  {
    v27 = +[AMSKeybag sharedInstance];
    v28 = [(ACAccount *)v65->_account ams_DSID];
    id v70 = 0;
    v29 = [v27 keybagSyncDataWithAccountID:v28 transactionType:11 error:&v70];
    id v30 = v70;

    if (v30)
    {
      v31 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        logKey = v65->_logKey;
        v62 = [(ACAccount *)v65->_account ams_DSID];
        *(_DWORD *)buf = 138412546;
        v76 = logKey;
        __int16 v77 = 2114;
        id v78 = v62;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%@] Error generating keybag for account: %{public}@", buf, 0x16u);
      }
    }
    if ([v29 length])
    {
      v32 = [v29 base64EncodedStringWithOptions:0];
      if (v32) {
        [v18 setObject:v32 forKeyedSubscript:@"kbsync"];
      }
    }
  }
  id v23 = v18;
LABEL_30:

  if (!v23)
  {
LABEL_37:
    v41 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", ASDErrorDomain, 901, 0, v65);
    [(Task *)v2 completeWithError:v41];

    id v23 = 0;
    goto LABEL_53;
  }
  BOOL isUserInitiated = v2->_isUserInitiated;
  v34 = sub_10030B11C();
  v35 = v34;
  v36 = off_100529D68;
  if (isUserInitiated) {
    v36 = off_100529D80;
  }
  v37 = objc_msgSend(v34, "URLForKey:", *v36, v65);

  id v69 = 0;
  v38 = [v37 valueWithError:&v69];
  id v39 = v69;

  if (v39)
  {
    v40 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v60 = v2->_logKey;
      *(_DWORD *)buf = 138412546;
      v76 = v60;
      __int16 v77 = 2114;
      id v78 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[%@] Error generating updates URL. Error: %{public}@", buf, 0x16u);
    }

    [(Task *)v2 completeWithError:v39];
  }
  else
  {
    uint64_t v42 = sub_10028908C(v38, &off_10054E248);

    id v43 = objc_alloc((Class)AMSURLRequestEncoder);
    v44 = sub_10030B11C();
    id v45 = [v43 initWithBag:v44];

    [v45 setCompressRequestBody:1];
    account = v2->_account;
    if (account)
    {
      v47 = [(ACAccount *)account ams_DSID];

      if (v47) {
        [v45 setAccount:v2->_account];
      }
    }
    v48 = [v45 requestWithMethod:4 URL:v42 parameters:v23];
    id v68 = 0;
    v49 = [v48 resultWithError:&v68];
    id v39 = v68;

    if (v39)
    {
      v50 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v63 = v2->_logKey;
        *(_DWORD *)buf = 138412546;
        v76 = v63;
        __int16 v77 = 2114;
        id v78 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "[%@] Error encoding request: %{public}@", buf, 0x16u);
      }

      [(Task *)v2 completeWithError:v39];
    }
    else
    {
      v51 = +[AMSURLSession defaultSession];
      v52 = [v51 dataTaskPromiseWithRequest:v49];

      id v67 = 0;
      v53 = [v52 resultWithError:&v67];
      id v39 = v67;
      if (v39)
      {
        v54 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v64 = v2->_logKey;
          *(_DWORD *)buf = 138412546;
          v76 = v64;
          __int16 v77 = 2114;
          id v78 = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "[%@] Error fetching updates: %{public}@", buf, 0x16u);
        }

        [(Task *)v2 completeWithError:v39];
      }
      else
      {
        v55 = [UpdatesResponse alloc];
        [v53 object];
        v57 = v56 = v2;
        v58 = sub_1003D2EE8(v55, v57);
        response = v56->_response;
        v56->_response = (UpdatesResponse *)v58;

        [(Task *)v56 completeWithSuccess];
      }
    }
    v38 = (void *)v42;
  }

LABEL_53:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end