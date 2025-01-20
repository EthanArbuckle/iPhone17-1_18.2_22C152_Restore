@interface FetchPostbackTask
- (void)main;
@end

@implementation FetchPostbackTask

- (void)main
{
  if (self->_appAdamID)
  {
    v2 = self;
    v3 = self->_params;
    if (!v2->_requestEncoder)
    {
      v4 = (AMSURLRequestEncoder *)objc_alloc_init((Class)AMSURLRequestEncoder);
      requestEncoder = v2->_requestEncoder;
      v2->_requestEncoder = v4;

      v6 = v2->_requestEncoder;
      v7 = sub_10030B11C();
      [(AMSURLRequestEncoder *)v6 setBag:v7];

      v2 = self;
      [(AMSURLRequestEncoder *)self->_requestEncoder setAccount:self->_account];
      [(AMSURLRequestEncoder *)self->_requestEncoder setRequestEncoding:3];
    }
    [(NSMutableDictionary *)v2->_paramsDict setObject:v3 forKeyedSubscript:@"ad-networks"];
    fetchPostbackInfoURL = v2->_fetchPostbackInfoURL;
    if (fetchPostbackInfoURL)
    {
      v9 = [(AMSURLRequestEncoder *)v2->_requestEncoder requestWithMethod:4 URL:fetchPostbackInfoURL parameters:v2->_paramsDict];
      *(void *)v40 = 0;
      v36 = [v9 resultWithError:v40];
      v10 = *(id *)v40;

      ASDErrorWithSafeUserInfo();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not find URL for fetching postback info", v40, 2u);
      }
      id v11 = 0;
      v36 = 0;
    }

    id v35 = v11;
    if (v36 || !v35)
    {
      v33 = sub_10027AA90();
      v32 = [v33 dataTaskPromiseWithRequest:v36];
      id v54 = 0;
      v34 = [v32 resultWithError:&v54];
      id v30 = v54;
      +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v34 responseStatusCode]);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      responseStatusCode = self->_responseStatusCode;
      self->_responseStatusCode = v13;

      v31 = [v34 object];
      v15 = [v31 objectForKeyedSubscript:@"ad-networks"];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = v15;
      id v16 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v51;
        do
        {
          v18 = 0;
          do
          {
            if (*(void *)v51 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v18);
            v20 = [v19 objectForKeyedSubscript:@"status"];
            id v21 = [v19 objectForKeyedSubscript:@"error"];
            v22 = [v20 lowercaseString];
            if (([v22 isEqualToString:@"ok"] & 1) != 0
              || ![v22 isEqualToString:@"error"])
            {
              v24 = 0;
            }
            else if (v21)
            {
              v23 = +[NSString stringWithFormat:@"SKAdNetwork Multi Error:%@", v21];
              v24 = ASDErrorWithDescription();
            }
            else
            {
              v24 = ASDErrorWithDescription();
            }

            if (v24)
            {
              [(NSMutableArray *)self->_results addObject:v24];
            }
            else
            {
              v25 = sub_10027B634((uint64_t)InstallAttributionPingback, v19);
              if (v25) {
                [(NSMutableArray *)self->_results addObject:v25];
              }
            }
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v26 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
          id v16 = v26;
        }
        while (v26);
      }

      if ([v34 responseStatusCode] == (id)200)
      {
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x2020000000;
        char v49 = 0;
        *(void *)v40 = 0;
        v41 = v40;
        uint64_t v42 = 0x3032000000;
        v43 = sub_100018158;
        databaseStore = self->_databaseStore;
        v44 = sub_100017C68;
        id v45 = 0;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1002F9FEC;
        v39[3] = &unk_100524E50;
        v39[4] = self;
        v39[5] = &v46;
        v39[6] = v40;
        [(SQLiteDatabaseStore *)databaseStore modifyUsingTransaction:v39];
        if (*((unsigned char *)v47 + 24))
        {
          v28 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removed parameters after fetching postbacks", buf, 2u);
          }
        }
        else
        {
          v28 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *((void *)v41 + 5);
            *(_DWORD *)buf = 138543362;
            uint64_t v56 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not remove parameters %{public}@", buf, 0xCu);
          }
        }

        _Block_object_dispose(v40, 8);
        _Block_object_dispose(&v46, 8);
      }
      [(Task *)self completeWithSuccess];
    }
    else
    {
      [(Task *)self completeWithError:v35];
    }

    v12 = v35;
  }
  else
  {
    v12 = ASDErrorWithDescription();
    [(Task *)self completeWithError:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_responseStatusCode, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_paramsDict, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_fetchPostbackInfoURL, 0);
}

@end