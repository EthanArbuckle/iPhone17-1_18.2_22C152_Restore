@interface DelayedFetchPostbackTask
- (DelayedFetchPostbackTask)initWithAppAdamID:(id)a3 usingProxy:(BOOL)a4;
- (NSArray)postbackResults;
- (NSArray)rejectedImpressionResults;
- (NSNumber)appAdamID;
- (NSNumber)responseStatusCode;
- (void)mainWithCompletionHandler:(id)a3;
- (void)setAppAdamID:(id)a3;
- (void)setPostbackResults:(id)a3;
- (void)setRejectedImpressionResults:(id)a3;
- (void)setResponseStatusCode:(id)a3;
@end

@implementation DelayedFetchPostbackTask

- (DelayedFetchPostbackTask)initWithAppAdamID:(id)a3 usingProxy:(BOOL)a4
{
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DelayedFetchPostbackTask;
  v8 = [(Task *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 90), a3);
    v10 = sub_10030B11C();
    v11 = [v10 URLForKey:@"skadnetwork-process-ads-url"];
    id v29 = 0;
    v12 = [v11 valueWithError:&v29];
    id v13 = v29;

    if (v13)
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to load secondary call URL from bag with error:%@", buf, 0xCu);
      }
    }
    if (!v12)
    {
      v12 = +[NSURL URLWithString:@"https://amp-account.apps.apple.com/account/install-validation/ads/process"];
    }
    v15 = *(void **)(v9 + 42);
    *(void *)(v9 + 42) = v12;
    id v16 = v12;

    v17 = [InstallAttributionDatabaseStore alloc];
    sub_1001F5660();
    v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v19 = sub_1001F5824(v18);
    v20 = [(SQLiteDatabaseStore *)v17 initWithDatabase:v19];
    v21 = *(void **)(v9 + 106);
    *(void *)(v9 + 106) = v20;

    uint64_t v22 = objc_opt_new();
    v23 = *(void **)(v9 + 58);
    *(void *)(v9 + 58) = v22;

    uint64_t v24 = objc_opt_new();
    v25 = *(void **)(v9 + 74);
    *(void *)(v9 + 74) = v24;

    uint64_t v26 = objc_opt_new();
    v27 = *(void **)(v9 + 82);
    *(void *)(v9 + 82) = v26;

    v9[66] = a4;
  }

  return (DelayedFetchPostbackTask *)v9;
}

- (void)mainWithCompletionHandler:(id)a3
{
  id v33 = a3;
  if (*(NSArray **)((char *)&self->_rejectedImpressionResults + 2))
  {
    v4 = objc_opt_new();
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_100018018;
    v55 = sub_100017BC8;
    id v56 = 0;
    v5 = *(NSNumber **)((char *)&self->_responseStatusCode + 2);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100287464;
    v50[3] = &unk_100524E00;
    v50[4] = self;
    v50[5] = &v51;
    v34 = self;
    [v5 readUsingSession:v50];
    v35 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v6 = (id)v52[5];
    id v7 = [v6 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v47;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v47 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          v12 = +[NSNumber numberWithInteger:(char *)i + v8];
          id v13 = sub_10026FC20(v11, v12);
          [v4 addObject:v13];

          [v35 setObject:v11 forKeyedSubscript:v12];
        }
        id v7 = [v6 countByEnumeratingWithState:&v46 objects:v58 count:16];
        v8 += (uint64_t)i;
      }
      while (v7);
    }

    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100018018;
    v44 = sub_100017BC8;
    id v45 = 0;
    v14 = *(NSNumber **)((char *)&v34->_responseStatusCode + 2);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1002874C4;
    v39[3] = &unk_100524E00;
    v39[4] = v34;
    v39[5] = &v40;
    [v14 readUsingSession:v39];
    v15 = [(id)v41[5] dictionaryRepresentationForRequest];
    id v16 = v4;
    id v17 = v15;
    [*(id *)((char *)&v34->_requestEncoder + 2) setObject:v16 forKeyedSubscript:@"ad-networks"];
    [*(id *)((char *)&v34->_requestEncoder + 2) setObject:v17 forKeyedSubscript:@"token-info"];
    if (*(void *)(&v34->super._finished + 1))
    {
      id v18 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:*(void *)(&v34->super._finished + 1)];
      [v18 setHTTPMethod:@"POST"];
      if (BYTE2(v34->_paramsDict)) {
        [v18 _setPrivacyProxyFailClosed:1];
      }
      uint64_t v19 = *(uint64_t *)((char *)&v34->_requestEncoder + 2);
      *(void *)buf = 0;
      v20 = +[NSJSONSerialization dataWithJSONObject:v19 options:0 error:buf];
      id v21 = *(id *)buf;
      [v18 setHTTPBody:v20];
      [v18 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      ASDErrorWithSafeUserInfo();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not find URL for fetching postback info", buf, 2u);
      }

      ASDErrorWithDescription();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = 0;
    }

    if (v18)
    {
      +[NSSet setWithObjects:@"Accept-Language", 0];
      v27 = uint64_t v26 = v33;
      if (BYTE2(v34->_paramsDict))
      {
        v28 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
        objc_msgSend(v28, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.appstored.skadnetwork.crowdanonymity");
        id v29 = +[NSSet setWithObjects:@"Accept-Language", 0];
        objc_msgSend(v28, "set_suppressedAutoAddedHTTPHeaders:", v29);

        uint64_t v26 = v33;
      }
      else
      {
        v28 = +[NSURLSessionConfiguration defaultSessionConfiguration];
      }
      objc_msgSend(v28, "set_suppressedAutoAddedHTTPHeaders:", v27);
      v31 = +[NSURLSession sessionWithConfiguration:v28];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100287524;
      v36[3] = &unk_100524E28;
      id v38 = v26;
      v36[4] = v34;
      id v37 = v35;
      id v32 = [v31 dataTaskWithRequest:v18 completionHandler:v36];
      [v32 resume];
    }
    else
    {
      objc_super v30 = (void (**)(id, id))v33;
      if (!v22)
      {
        ASDErrorWithDescription();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_super v30 = (void (**)(id, id))v33;
      }
      v30[2](v30, v22);
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v51, 8);

    uint64_t v24 = v33;
  }
  else
  {
    v23 = ASDErrorWithDescription();
    uint64_t v24 = v33;
    (*((void (**)(id, void *))v33 + 2))(v33, v23);
  }
}

- (NSArray)postbackResults
{
  return *(NSArray **)(&self->_shouldUseProxy + 2);
}

- (void)setPostbackResults:(id)a3
{
}

- (NSArray)rejectedImpressionResults
{
  return *(NSArray **)((char *)&self->_postbackResults + 2);
}

- (void)setRejectedImpressionResults:(id)a3
{
}

- (NSNumber)appAdamID
{
  return *(NSNumber **)((char *)&self->_rejectedImpressionResults + 2);
}

- (void)setAppAdamID:(id)a3
{
}

- (NSNumber)responseStatusCode
{
  return *(NSNumber **)((char *)&self->_appAdamID + 2);
}

- (void)setResponseStatusCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_responseStatusCode + 2), 0);
  objc_storeStrong((id *)((char *)&self->_appAdamID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_rejectedImpressionResults + 2), 0);
  objc_storeStrong((id *)((char *)&self->_postbackResults + 2), 0);
  objc_storeStrong((id *)(&self->_shouldUseProxy + 2), 0);
  objc_storeStrong((id *)((char *)&self->_requestEncoder + 2), 0);
  objc_storeStrong((id *)((char *)&self->_fetchPostbackInfoURL + 2), 0);
  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end