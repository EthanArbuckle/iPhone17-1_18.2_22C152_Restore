@interface FetchWebImpressionTask
- (FetchWebImpressionTask)initWithWebParams:(id)a3;
- (InstallAttributionParams)webImpression;
- (void)mainWithCompletionHandler:(id)a3;
- (void)setWebImpression:(id)a3;
@end

@implementation FetchWebImpressionTask

- (FetchWebImpressionTask)initWithWebParams:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FetchWebImpressionTask;
  v6 = [(Task *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 50), a3);
    v8 = [InstallAttributionDatabaseStore alloc];
    sub_1001F5660();
    v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v10 = sub_1001F5824(v9);
    v11 = [(SQLiteDatabaseStore *)v8 initWithDatabase:v10];
    v12 = *(void **)(v7 + 58);
    *(void *)(v7 + 58) = v11;

    uint64_t v13 = sub_10030B11C();
    v14 = *(void **)(v7 + 66);
    *(void *)(v7 + 66) = v13;
  }
  return (FetchWebImpressionTask *)v7;
}

- (void)mainWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = +[NSSet setWithObjects:@"Accept-Language", 0];
  if (sub_1002DF9CC((char *)self))
  {
    if (!self) {
      goto LABEL_35;
    }
    uint64_t v6 = *(uint64_t *)((char *)&self->_databaseStore + 2);
    id v68 = 0;
    v7 = sub_10030B9EC(v6, @"install-attribution-postback-proxy-url", &v68);
    id v8 = v68;
    if (v7)
    {
      v9 = [v7 host];
      v10 = [v7 port];
      v69[0] = @"HTTPEnable";
      v69[1] = @"HTTPSEnable";
      *(void *)&long long buf = &off_10054C3C0;
      *((void *)&buf + 1) = &off_10054C3C0;
      v69[2] = (id)kCFStreamPropertyHTTPProxyPort;
      v69[3] = (id)kCFStreamPropertyHTTPSProxyPort;
      v71 = v10;
      v72 = v10;
      v11 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v69 count:4];
      v12 = v11;
      if (v9)
      {
        id v13 = [v11 mutableCopy];
        [v13 setObject:v9 forKeyedSubscript:kCFStreamPropertyHTTPProxyHost];
        [v13 setObject:v9 forKeyedSubscript:kCFStreamPropertyHTTPSProxyHost];
        id v14 = [v13 copy];

        v12 = v14;
      }
      v15 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      [v15 setConnectionProxyDictionary:v12];
      objc_msgSend(v15, "set_preventsSystemHTTPProxyAuthentication:", 1);
      objc_msgSend(v15, "set_requiresSecureHTTPSProxyConnection:", 1);
    }
    else
    {
      v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v73 = 138543362;
        id v74 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get install attribution postback proxy URL from the bag: %{public}@", v73, 0xCu);
      }
      v15 = 0;
    }

    if (!v15)
    {
LABEL_35:
      v15 = ASDErrorWithDescription();
      v35 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to send postback since proxy URL could not be found in the bag %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v4[2](v4, v15);
      goto LABEL_76;
    }
  }
  else
  {
    v15 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    if (!v15)
    {
      v15 = ASDErrorWithDescription();
      objc_super v16 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error in creating URLSessionConfig", (uint8_t *)&buf, 2u);
      }

      v4[2](v4, v15);
      goto LABEL_76;
    }
  }
  objc_msgSend(v15, "set_suppressedAutoAddedHTTPHeaders:", v5);
  v17 = +[NSURLSession sessionWithConfiguration:v15 delegate:self delegateQueue:0];
  if (v17)
  {
    v18 = sub_1002DC1F8(*(uint64_t *)((char *)&self->_webImpression + 2));
    v19 = +[NSURL URLWithString:v18];

    if (os_variant_has_internal_content())
    {
      v20 = sub_1003F3E8C();

      if (v20)
      {
        v21 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SKAdNetwork: Web impression fetch URL override.", (uint8_t *)&buf, 2u);
        }

        v22 = sub_1003F3E8C();
        uint64_t v23 = +[NSURL URLWithString:v22];

        v19 = (void *)v23;
      }
    }
    if (!v19)
    {
      v36 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "SKAdNetwork: Web impression fetch URL is invalid.", (uint8_t *)&buf, 2u);
      }

      v63 = ASDErrorWithDescription();
      v4[2](v4, v63);
      goto LABEL_75;
    }
    v63 = +[NSMutableURLRequest requestWithURL:v19];
    [v63 setHTTPMethod:@"POST"];
    v24 = objc_opt_new();
    [v24 setObject:@"click_to_App_Store" forKeyedSubscript:@"source_engagement_type"];
    v25 = *(InstallAttributionParams **)((char *)&self->_webImpression + 2);
    if (v25) {
      v25 = (void *)v25[4];
    }
    v26 = v25;
    [v24 setObject:v26 forKeyedSubscript:@"source_domain"];

    v27 = *(InstallAttributionParams **)((char *)&self->_webImpression + 2);
    if (v27) {
      v27 = (void *)v27[3];
    }
    v28 = v27;
    [v24 setObject:v28 forKeyedSubscript:@"source_nonce"];

    v29 = *(InstallAttributionParams **)((char *)&self->_webImpression + 2);
    if (v29) {
      v29 = (void *)v29[5];
    }
    v30 = v29;
    [v24 setObject:v30 forKeyedSubscript:@"version"];

    id v67 = 0;
    v62 = +[NSJSONSerialization dataWithJSONObject:v24 options:1 error:&v67];
    id v61 = v67;
    if (v61)
    {
      v31 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v61;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "SKAdNetwork: Web impression fetch serialization failed:%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (v62)
      {
        objc_msgSend(v63, "setHTTPBody:");
        [v63 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        id v60 = v19;
        v57 = ASDErrorWithDescription();
        v37 = [v60 absoluteString];

        v38 = +[NSDate date];
        [v38 timeIntervalSince1970];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;%@;%f",
          @"App Store",
          v37,
        v40 = v39);

        v59 = [v40 stringByRemovingPercentEncoding];

        if (v59)
        {
          v41 = [v59 dataUsingEncoding:4];
          v58 = v41;
          if (v41)
          {
            os_log_t oslog = [v41 base64EncodedStringWithOptions:0];
            if ([oslog length])
            {
              v42 = sub_10030B11C();
              v69[0] = 0;
              v54 = +[AMSMescal signatureFromData:v58 type:1 bag:v42 error:v69];
              log = v69[0];

              if (log)
              {
                v43 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = log;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Problem with generating mescal signature %@", (uint8_t *)&buf, 0xCu);
                }
                v44 = 0;
              }
              else
              {
                v43 = [v54 base64EncodedStringWithOptions:0];
                v53 = +[NSString stringWithFormat:@"%@:%@", oslog, v43];
                v46 = [v53 dataUsingEncoding:4];
                v44 = [v46 base64EncodedStringWithOptions:0];
              }
            }
            else
            {
              log = ASDLogHandleForCategory();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v57;
                _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to generate signature %@", (uint8_t *)&buf, 0xCu);
              }
              v44 = 0;
            }
          }
          else
          {
            ASDLogHandleForCategory();
            os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v57;
              _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to generate signature %@", (uint8_t *)&buf, 0xCu);
            }
            v44 = 0;
          }

          v45 = v58;
        }
        else
        {
          v45 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v57;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to generate signature %@", (uint8_t *)&buf, 0xCu);
          }
          v44 = 0;
        }

        v32 = +[NSString stringWithFormat:@"Basic %@", v44];

        if (v32)
        {
          id v47 = v32;

          [v63 setValue:v47 forHTTPHeaderField:@"Proxy-Authorization"];
        }
        else
        {
          v48 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v52 = [v60 absoluteString];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v52;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to generate proxy header for URL:%{public}@", (uint8_t *)&buf, 0xCu);
          }
          if (sub_1002DF9CC((char *)self))
          {
            v49 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Proxy auth header generation failed. Failing fetch.", (uint8_t *)&buf, 2u);
            }

            v50 = ASDErrorWithDescription();
            v4[2](v4, v50);

            v32 = 0;
            goto LABEL_74;
          }
        }
        objc_initWeak((id *)&buf, self);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_1002DFA74;
        v64[3] = &unk_1005268F8;
        objc_copyWeak(&v66, (id *)&buf);
        v65 = v4;
        v51 = [v17 dataTaskWithRequest:v63 completionHandler:v64];
        [v51 resume];

        objc_destroyWeak(&v66);
        objc_destroyWeak((id *)&buf);
LABEL_74:

LABEL_75:
        v15 = v17;
        goto LABEL_76;
      }
      v31 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "SKAdNetwork: Web impression serialization failed.", (uint8_t *)&buf, 2u);
      }
    }

    v32 = ASDErrorWithDescription();
    v4[2](v4, v32);
    goto LABEL_74;
  }
  v33 = ASDErrorWithDescription();
  v34 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to initialize url session", (uint8_t *)&buf, 2u);
  }

  v4[2](v4, v33);
LABEL_76:
}

- (InstallAttributionParams)webImpression
{
  return *(InstallAttributionParams **)(&self->super._finished + 1);
}

- (void)setWebImpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_databaseStore + 2), 0);
  objc_storeStrong((id *)((char *)&self->_stubWebImpression + 2), 0);
  objc_storeStrong((id *)((char *)&self->_webImpression + 2), 0);
  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end