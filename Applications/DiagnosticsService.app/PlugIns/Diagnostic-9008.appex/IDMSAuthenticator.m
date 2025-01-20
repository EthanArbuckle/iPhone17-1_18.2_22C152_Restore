@interface IDMSAuthenticator
- (id)authKitSession;
- (int64_t)_constructAlbertRequest:(id *)a3 objectModel:(id)a4 username:(id)a5 altDSID:(id)a6 gsToken:(id)a7;
- (int64_t)_fetchGSTokenWithPassword:(id)a3 username:(id)a4 altDSID:(id *)a5 gsToken:(id *)a6;
- (int64_t)authenticateFromObjectModel:(id)a3 outRequest:(id *)a4;
- (void)_appendAdditionalHeaders:(id)a3 altDSID:(id)a4 gsToken:(id)a5;
@end

@implementation IDMSAuthenticator

- (int64_t)authenticateFromObjectModel:(id)a3 outRequest:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10001084C();
    }
    v12 = 0;
    v8 = 0;
    v15 = 0;
    v21 = 0;
    id v20 = 0;
    id v17 = 0;
    int64_t v16 = -107;
    goto LABEL_26;
  }
  v8 = [v6 subElementWithID:@"login"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000109EC();
    }
    v12 = 0;
    v15 = 0;
    v21 = 0;
    goto LABEL_20;
  }
  v9 = [v8 tableCell];
  v10 = [v9 editableTextField];
  v11 = [v10 text];

  v12 = [v7 subElementWithID:@"password"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = v11;
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000109B8();
    }
    v15 = 0;
LABEL_20:
    id v20 = 0;
    id v17 = 0;
    int64_t v16 = -104;
    goto LABEL_26;
  }
  v13 = [v12 tableCell];
  v14 = [v13 editableTextField];
  v15 = [v14 text];

  if (!v11 || ![v11 length])
  {
    v21 = v11;
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100010880();
    }
    goto LABEL_25;
  }
  if (!v15 || ![v15 length])
  {
    v21 = v11;
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000108B4();
    }
LABEL_25:
    id v20 = 0;
    id v17 = 0;
    int64_t v16 = -201;
    goto LABEL_26;
  }
  id v26 = 0;
  id v27 = 0;
  int64_t v16 = [(IDMSAuthenticator *)self _fetchGSTokenWithPassword:v15 username:v11 altDSID:&v27 gsToken:&v26];
  id v17 = v27;
  id v18 = v26;
  v19 = v11;
  id v20 = v18;
  if (v16)
  {
    v21 = v19;
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100010950();
    }
  }
  else
  {
    v21 = v19;
    int64_t v16 = -[IDMSAuthenticator _constructAlbertRequest:objectModel:username:altDSID:gsToken:](self, "_constructAlbertRequest:objectModel:username:altDSID:gsToken:", a4, v7);
    if (!v16) {
      goto LABEL_28;
    }
    v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000108E8();
    }
  }
LABEL_26:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [v12 tableCell];
    v24 = [v23 editableTextField];
    [v24 setText:&stru_100018BD0];
  }
LABEL_28:

  return v16;
}

- (int64_t)_constructAlbertRequest:(id *)a3 objectModel:(id)a4 username:(id)a5 altDSID:(id)a6 gsToken:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int64_t v16 = +[NSMutableDictionary dictionary];
  id v17 = 0;
  if (v13)
  {
    int64_t v18 = -202;
    if (v14)
    {
      v37 = self;
      v19 = 0;
      id v20 = 0;
      if (v15)
      {
        v21 = [v12 subElementWithID:@"next"];
        id v20 = v21;
        if (v21
          && ([v21 attributes],
              v22 = objc_claimAutoreleasedReturnValue(),
              [v22 objectForKeyedSubscript:@"url"],
              v23 = objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              v23))
        {
          v24 = [v20 attributes];
          v19 = [v24 objectForKeyedSubscript:@"url"];

          v25 = [v12 sourceURL];

          if (v25)
          {
            v36 = a3;
            id v26 = [v12 sourceURL];
            id v27 = [v26 URLByAppendingPathComponent:v19];
            id v17 = +[NSMutableURLRequest requestWithURL:v27];

            [v17 setHTTPMethod:@"POST"];
            [v17 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
            [v16 setObject:v13 forKey:@"login"];
            v28 = [v12 serverInfo];

            if (v28)
            {
              v29 = [v12 serverInfo];
              [v16 setObject:v29 forKey:@"serverInfo"];
            }
            id v38 = 0;
            v30 = +[NSPropertyListSerialization dataWithPropertyList:v16 format:100 options:0 error:&v38];
            id v31 = v38;
            [v17 setHTTPBody:v30];

            if (v31)
            {
              v32 = handleForCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                sub_100010A88();
              }

              int64_t v18 = -108;
            }
            else
            {
              [(IDMSAuthenticator *)v37 _appendAdditionalHeaders:v17 altDSID:v14 gsToken:v15];
              if (v36)
              {
                id v17 = v17;
                int64_t v18 = 0;
                id *v36 = v17;
              }
              else
              {
                int64_t v18 = 0;
              }
            }
          }
          else
          {
            v34 = handleForCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_100010A54();
            }

            id v17 = 0;
            int64_t v18 = -106;
          }
        }
        else
        {
          v33 = handleForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_100010A20();
          }

          id v17 = 0;
          v19 = 0;
          int64_t v18 = -105;
        }
      }
    }
    else
    {
      v19 = 0;
      id v20 = 0;
    }
  }
  else
  {
    v19 = 0;
    id v20 = 0;
    int64_t v18 = -201;
  }

  return v18;
}

- (int64_t)_fetchGSTokenWithPassword:(id)a3 username:(id)a4 altDSID:(id *)a5 gsToken:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = objc_opt_new();
  id v12 = objc_opt_new();
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_10000D214;
  v41 = sub_10000D224;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10000D214;
  v35 = sub_10000D224;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = -1;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  [v11 setUsername:v10];
  [v11 _setPassword:v9];
  [v11 setShouldUpdatePersistentServiceTokens:0];
  [v11 setShouldPromptForPasswordOnly:1];
  [v11 setIsUsernameEditable:0];
  [v11 setIsEphemeral:1];
  [v11 setAuthenticationType:0];
  [v11 setServiceType:1];
  [v11 setServiceIdentifier:@"com.apple.gs.corerepair.auth"];
  id v14 = handleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Authenticating user credentials...", buf, 2u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D22C;
  v21[3] = &unk_100018940;
  v23 = &v27;
  v24 = &v37;
  v25 = &v31;
  id v15 = v13;
  v22 = v15;
  [v12 authenticateWithContext:v11 completion:v21];
  int64_t v16 = handleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Waiting for IDMS", buf, 2u);
  }

  dispatch_time_t v17 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v15, v17))
  {
    int64_t v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100010AF0();
    }

    v28[3] = -200;
  }
  if (a5) {
    *a5 = (id) v38[5];
  }
  if (a6) {
    *a6 = (id) v32[5];
  }
  int64_t v19 = v28[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v19;
}

- (void)_appendAdditionalHeaders:(id)a3 altDSID:(id)a4 gsToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 ak_addDeviceUDIDHeader];
  [v9 ak_addClientInfoHeader];
  [v9 ak_addAuthorizationHeaderWithServiceToken:v7 forAltDSID:v8];
}

- (id)authKitSession
{
  v2 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v2 setURLCache:0];
  [v2 setRequestCachePolicy:1];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];

  id v5 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v4];
  [v2 set_appleIDContext:v5];
  id v6 = +[NSURLSession sessionWithConfiguration:v2];

  return v6;
}

@end