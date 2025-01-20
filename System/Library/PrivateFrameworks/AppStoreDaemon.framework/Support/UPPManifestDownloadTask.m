@interface UPPManifestDownloadTask
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation UPPManifestDownloadTask

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v11, 90, 1);
    }
    else {
      id Property = 0;
    }
    *(_DWORD *)buf = 138412290;
    id v37 = Property;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Received authentication challenge", buf, 0xCu);
  }

  v13 = [v8 protectionSpace];
  v14 = [v13 authenticationMethod];
  if ([v14 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v17 = objc_getProperty(self, v16, 90, 1);
      }
      else {
        id v17 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v37 = v17;
      v18 = "[%@] Using client certificate for authentication challenge";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if ([v14 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v21 = objc_getProperty(self, v20, 90, 1);
      }
      else {
        id v21 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Using server trust for authentication challenge", buf, 0xCu);
    }

    v22 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v13 serverTrust]);
    v9[2](v9, 0, v22);
  }
  else
  {
    int v23 = BYTE2(self->_session);
    v15 = ASDLogHandleForCategory();
    BOOL v24 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        id v26 = objc_getProperty(self, v25, 90, 1);
        *(_DWORD *)buf = 138412290;
        id v37 = v26;
        v18 = "[%@] Using default handling for authentication challenge";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
LABEL_20:

      v9[2](v9, 1, 0);
      goto LABEL_21;
    }
    if (v24)
    {
      id v27 = objc_getProperty(self, v25, 90, 1);
      *(_DWORD *)buf = 138412290;
      id v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] Prompting user for authentication challenge", buf, 0xCu);
    }

    v28 = sub_100361C74([AuthenticationChallenge alloc], v8);
    v29 = sub_1002CC610((uint64_t)AuthenticationChallengeDialogRequest, v28);
    id v30 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v29];
    v31 = [v30 present];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100243D6C;
    v33[3] = &unk_100523558;
    v33[4] = self;
    id v34 = v28;
    v35 = v9;
    v32 = v28;
    [v31 addFinishBlock:v33];
  }
LABEL_21:
}

- (void)mainWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = *(NSOrderedSet **)((char *)&self->_downloadIDs + 2);
  if (v5)
  {
    id v6 = v5;
    BOOL v7 = sub_1003F47D8();
    if (os_variant_has_internal_content() && v7)
    {
    }
    else
    {
      v13 = [v6 scheme];
      id v14 = [v13 caseInsensitiveCompare:@"https"];

      uint64_t v15 = [v6 port];
      v16 = (void *)v15;
      id v17 = &off_10054BBB0;
      if (!v14) {
        id v17 = &off_10054BB98;
      }
      if (v15) {
        id v17 = (_UNKNOWN **)v15;
      }
      v18 = v17;

      v19 = [v6 host];
      v20 = [v18 stringValue];

      id v21 = +[NWHostEndpoint endpointWithHostname:v19 port:v20];

      id v22 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:v21 parameters:0];
      int v23 = [v22 path];
      LODWORD(v20) = [v23 isLocal];

      if (v20)
      {
        id v8 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id Property = objc_getProperty(self, v24, 90, 1);
          uint64_t v50 = *(uint64_t *)((char *)&self->_downloadIDs + 2);
          *(_DWORD *)v51 = 138412546;
          *(void *)&v51[4] = Property;
          *(_WORD *)&v51[12] = 2114;
          *(void *)&v51[14] = v50;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%@] The manifest URL isn't external: %{public}@", v51, 0x16u);
        }
        goto LABEL_24;
      }
    }
    id v25 = *(id *)((char *)&self->_downloadIDs + 2);
    id v26 = [v25 scheme];
    id v27 = [v26 caseInsensitiveCompare:@"https"];

    if (!v27)
    {

      goto LABEL_26;
    }
    if (os_variant_has_internal_content())
    {
      BOOL v28 = sub_1003F4810();

      if (v28) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    id v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v47 = objc_getProperty(self, v29, 90, 1);
      uint64_t v48 = *(uint64_t *)((char *)&self->_downloadIDs + 2);
      *(_DWORD *)v51 = 138412546;
      *(void *)&v51[4] = v47;
      *(_WORD *)&v51[12] = 2114;
      *(void *)&v51[14] = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%@] Cannot load non-https manifest URL: %{public}@", v51, 0x16u);
    }
  }
  else
  {
    id v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_getProperty(self, v9, 90, 1);
      v11 = [*(id *)((char *)&self->_manifestDigest + 2) processInfo];
      v12 = [v11 bundleIdentifier];
      *(_DWORD *)v51 = 138412546;
      *(void *)&v51[4] = v10;
      *(_WORD *)&v51[12] = 2114;
      *(void *)&v51[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] No URL provided for request from client: %{public}@", v51, 0x16u);
    }
  }
LABEL_24:

  id v30 = ASDErrorWithTitleAndMessage();
  if (v30)
  {
    sub_100244610((uint64_t)self, v30);
    v4[2](v4, v30);

    goto LABEL_32;
  }
LABEL_26:
  v31 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = objc_getProperty(self, v32, 90, 1);
    uint64_t v34 = *(uint64_t *)((char *)&self->_downloadIDs + 2);
    *(_DWORD *)v51 = 138412546;
    *(void *)&v51[4] = v33;
    *(_WORD *)&v51[12] = 2114;
    *(void *)&v51[14] = v34;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@] Downloading requested manifest at URL: %{public}@", v51, 0x16u);
  }

  v35 = *(NSOrderedSet **)((char *)&self->_downloadIDs + 2);
  v36 = v4;
  id v37 = v35;
  id v38 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v37];

  [v38 setCachePolicy:1];
  [v38 setTimeoutInterval:120.0];
  v39 = sub_100301DF0();
  [v38 setHTTPUserAgent:v39];

  if (*(_DWORD *)((char *)&self->_session + 6)) {
    int v40 = *(_DWORD *)((char *)&self->_session + 6);
  }
  else {
    int v40 = 21;
  }
  v41 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v42 = +[NSURLSession sessionWithConfiguration:v41 delegate:self delegateQueue:0];
  v43 = *(NSString **)((char *)&self->_receivedDigest + 2);
  *(NSString **)((char *)&self->_receivedDigest + 2) = v42;

  v44 = *(NSString **)((char *)&self->_receivedDigest + 2);
  *(void *)v51 = _NSConcreteStackBlock;
  *(void *)&v51[8] = 3221225472;
  *(void *)&v51[16] = sub_100247D9C;
  v52 = &unk_100523608;
  int v55 = v40;
  v53 = self;
  v45 = v36;
  v54 = v45;
  v46 = [v44 dataTaskWithRequest:v38 completionHandler:v51];
  [v46 resume];

LABEL_32:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_manifestDigest + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_clientID + 2), 0);
  objc_storeStrong((id *)(&self->_shouldHideUserPrompts + 2), 0);
  objc_storeStrong((id *)((char *)&self->_receivedDigest + 2), 0);
  objc_storeStrong((id *)((char *)&self->_manifestURL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_downloadIDs + 2), 0);
  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end