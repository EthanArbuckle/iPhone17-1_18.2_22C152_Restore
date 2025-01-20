@interface FANetworkService
- (AAURLSession)urlSession;
- (ACAccount)account;
- (FADeviceInfoProtocol)deviceInfo;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6;
- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6 familyRefreshActivityScheduler:(id)a7;
- (FAURLProvider)urlProvider;
- (id)_convertServerResponse:(id)a3 toFormat:(int64_t)a4;
- (id)dataWithRequest:(id)a3;
- (id)ensureAccount;
- (id)ensureDeviceUnlockedSinceBoot;
- (id)plistWithRequest:(id)a3;
- (id)plistWithResponse:(id)a3;
- (id)serverRequest:(id)a3 toFormat:(int64_t)a4;
- (id)serverResponse:(id)a3 toFormat:(int64_t)a4;
- (id)signedRequestWithEndpoint:(id)a3;
- (id)signedRequestWithEndpoint:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6;
- (id)signedRequestWithURL:(id)a3;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7;
- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7 responseFormat:(int64_t)a8;
- (id)standardPlistRequestWithEndpoint:(id)a3;
- (id)standardPlistRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5;
- (id)standardPlistRequestWithUrl:(id)a3 method:(id)a4 plistBody:(id)a5;
- (id)standardRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7;
- (id)standardRequestWithURL:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 method:(id)a6 body:(id)a7 requestFormat:(int64_t)a8 responseFormat:(int64_t)a9;
- (id)standardRequestWithURL:(id)a3 method:(id)a4 body:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7;
- (void)setAcceptHeaderForRequest:(id)a3 format:(int64_t)a4;
- (void)setContentTypeHeaderForRequest:(id)a3 format:(int64_t)a4;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
@end

@implementation FANetworkService

- (id)ensureAccount
{
  if (self->_account)
  {
    id v2 = [objc_alloc((Class)AAFPromise) initWithValue:self->_account];
  }
  else
  {
    v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100006E00(v3);
    }

    v4 = +[NSError fa_familyErrorWithCode:-1004];
    id v2 = [objc_alloc((Class)AAFPromise) initWithError:v4];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyRefreshActivityScheduler, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

- (id)ensureDeviceUnlockedSinceBoot
{
  uint64_t v3 = [(FANetworkService *)self deviceInfo];
  if (v3
    && (v4 = (void *)v3,
        [(FANetworkService *)self deviceInfo],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 unlockedSinceBoot],
        v5,
        v4,
        v6))
  {
    id v7 = [objc_alloc((Class)AAFPromise) initWithValue:&__kCFBooleanTrue];
  }
  else
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100036038(v8);
    }

    v9 = +[NSError fa_familyErrorWithCode:-1010];
    id v7 = [objc_alloc((Class)AAFPromise) initWithError:v9];
  }
  return v7;
}

- (FADeviceInfoProtocol)deviceInfo
{
  return self->_deviceInfo;
}

- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6 familyRefreshActivityScheduler:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FANetworkService;
  v17 = [(FANetworkService *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_urlProvider, a5);
    objc_storeStrong((id *)&v18->_urlSession, a6);
    objc_storeStrong((id *)&v18->_deviceInfo, a4);
    objc_storeStrong((id *)&v18->_familyRefreshActivityScheduler, a7);
  }

  return v18;
}

- (FANetworkService)initWithAccount:(id)a3 deviceInfo:(id)a4 urlProvider:(id)a5 urlSession:(id)a6
{
  return [(FANetworkService *)self initWithAccount:a3 deviceInfo:a4 urlProvider:a5 urlSession:a6 familyRefreshActivityScheduler:0];
}

- (id)signedRequestWithEndpoint:(id)a3
{
  return [(FANetworkService *)self signedRequestWithEndpoint:a3 method:@"GET" headers:0 plistBody:0];
}

- (id)signedRequestWithEndpoint:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(FANetworkService *)self urlProvider];
  id v15 = [v14 URLForEndpoint:v13];

  id v16 = [v15 then];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001CE5C;
  v23[3] = &unk_10004E400;
  v23[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  v17 = (void (*)(void *, void *))v16[2];
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  objc_super v21 = v17(v16, v23);

  return v21;
}

- (id)signedRequestWithURL:(id)a3
{
  return [(FANetworkService *)self signedRequestWithURL:a3 method:@"GET" headers:0 plistBody:0];
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6
{
  return [(FANetworkService *)self signedRequestWithURL:a3 method:a4 headers:a5 plistBody:a6 requestFormat:1];
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7
{
  return [(FANetworkService *)self signedRequestWithURL:a3 method:a4 headers:a5 plistBody:a6 requestFormat:a7 responseFormat:1];
}

- (void)setAcceptHeaderForRequest:(id)a3 format:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 2)
  {
    CFStringRef v6 = @"application/json";
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    CFStringRef v6 = @"application/x-plist";
  }
  id v7 = v5;
  [v5 setValue:v6 forHTTPHeaderField:@"Accept"];
  id v5 = v7;
LABEL_6:
}

- (void)setContentTypeHeaderForRequest:(id)a3 format:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 2)
  {
    CFStringRef v6 = @"application/json";
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    CFStringRef v6 = @"application/x-plist";
  }
  id v7 = v5;
  [v5 setValue:v6 forHTTPHeaderField:@"Content-Type"];
  id v5 = v7;
LABEL_6:
}

- (id)signedRequestWithURL:(id)a3 method:(id)a4 headers:(id)a5 plistBody:(id)a6 requestFormat:(int64_t)a7 responseFormat:(int64_t)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  v17 = +[NSMutableURLRequest requestWithURL:a3];
  id v18 = [(FANetworkService *)self account];

  if (v18)
  {
    id v19 = [(FANetworkService *)self account];
    objc_msgSend(v17, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v19, 0);

    objc_msgSend(v17, "ak_addAnisetteHeaders");
  }
  objc_msgSend(v17, "ak_addClientInfoHeader");
  if (_os_feature_enabled_impl()) {
    [v17 setValue:@"true" forHTTPHeaderField:@"X-iCloud-Experiment-Mode"];
  }
  [(FANetworkService *)self setContentTypeHeaderForRequest:v17 format:a7];
  [(FANetworkService *)self setAcceptHeaderForRequest:v17 format:a8];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001D208;
  v30[3] = &unk_10004E428;
  id v20 = v17;
  id v31 = v20;
  [v16 enumerateKeysAndObjectsUsingBlock:v30];

  if (v14) {
    [v20 setHTTPMethod:v14];
  }
  if (v15)
  {
    if (a7 == 2)
    {
      v29 = 0;
      objc_super v21 = +[NSJSONSerialization dataWithJSONObject:v15 options:0 error:&v29];
      v22 = v29;
    }
    else
    {
      v28 = 0;
      objc_super v21 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:100 options:0 error:&v28];
      v22 = v28;
    }
    id v23 = v22;
    if (v23)
    {
      id v24 = v23;
      id v25 = [objc_alloc((Class)AAFPromise) initWithError:v23];

      goto LABEL_15;
    }
    [v20 setHTTPBody:v21];
  }
  id v26 = objc_alloc((Class)AAFPromise);
  id v24 = [v20 copy];
  id v25 = [v26 initWithValue:v24];
LABEL_15:

  return v25;
}

- (id)dataWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D2DC;
  v9[3] = &unk_10004D2A0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (id)plistWithRequest:(id)a3
{
  id v4 = [(FANetworkService *)self dataWithRequest:a3];
  id v5 = [v4 then];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D550;
  v8[3] = &unk_10004E478;
  v8[4] = self;
  id v6 = ((void (**)(void, void *))v5)[2](v5, v8);

  return v6;
}

- (id)plistWithResponse:(id)a3
{
  return [(FANetworkService *)self _convertServerResponse:a3 toFormat:1];
}

- (id)serverRequest:(id)a3 toFormat:(int64_t)a4
{
  id v6 = [(FANetworkService *)self dataWithRequest:a3];
  id v7 = [v6 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D798;
  v10[3] = &unk_10004E4A0;
  v10[4] = self;
  v10[5] = a4;
  v8 = ((void (**)(void, void *))v7)[2](v7, v10);

  return v8;
}

- (id)serverResponse:(id)a3 toFormat:(int64_t)a4
{
  return [(FANetworkService *)self _convertServerResponse:a3 toFormat:1];
}

- (id)_convertServerResponse:(id)a3 toFormat:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 body];

  if (v6)
  {
    id v7 = [v5 body];
    if (a4 == 2)
    {
      v22 = 0;
      v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v22];
      v9 = v22;
    }
    else
    {
      objc_super v21 = 0;
      v8 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&v21];
      v9 = v21;
    }
    id v11 = v9;

    if (v11)
    {
      id v12 = objc_alloc((Class)NSString);
      id v13 = [v5 body];
      id v14 = [v12 initWithData:v13 encoding:4];

      id v15 = _FALogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_opt_class();
        id v17 = v16;
        id v18 = [v5 HTTPResponse];
        id v19 = [v18 allHeaderFields];
        *(_DWORD *)buf = 138413058;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v14;
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Failed to parse server response with error %@ - %@ - %@", buf, 0x2Au);
      }
      id v10 = [objc_alloc((Class)AAFPromise) initWithError:v11];
    }
    else
    {
      id v10 = [objc_alloc((Class)AAFPromise) initWithValue:v8];
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)AAFPromise) initWithValue:&__NSDictionary0__struct];
  }

  return v10;
}

- (id)standardPlistRequestWithEndpoint:(id)a3
{
  return [(FANetworkService *)self standardPlistRequestWithEndpoint:a3 method:@"GET" plistBody:0];
}

- (id)standardPlistRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5
{
  return [(FANetworkService *)self standardRequestWithEndpoint:a3 method:a4 plistBody:a5 requestFormat:1 responseFormat:1];
}

- (id)standardRequestWithEndpoint:(id)a3 method:(id)a4 plistBody:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v31 = [(FANetworkService *)self ensureDeviceUnlockedSinceBoot];
  id v15 = [v31 then];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10001DE9C;
  v40[3] = &unk_10004D0F8;
  v40[4] = self;
  v30 = ((void (**)(void, void *))v15)[2](v15, v40);
  id v16 = [v30 then];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001DEA4;
  v38[3] = &unk_10004E4C8;
  v38[4] = self;
  id v39 = v12;
  id v17 = (void (*)(void *, void *))v16[2];
  id v29 = v12;
  id v18 = v17(v16, v38);
  id v19 = [v18 then];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001DEFC;
  v33[3] = &unk_10004E4F0;
  v33[4] = self;
  id v34 = v13;
  id v35 = v14;
  int64_t v36 = a6;
  int64_t v37 = a7;
  id v20 = (void (*)(void *, void *))v19[2];
  id v28 = v14;
  id v27 = v13;
  objc_super v21 = v20(v19, v33);
  v22 = [v21 then];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001DF1C;
  v32[3] = &unk_10004E518;
  v32[4] = self;
  v32[5] = a7;
  id v23 = ((void (**)(void, void *))v22)[2](v22, v32);
  id v24 = [v23 then];
  __int16 v25 = ((void (**)(void, Block_layout *))v24)[2](v24, &stru_10004E538);

  return v25;
}

- (id)standardRequestWithURL:(id)a3 method:(id)a4 body:(id)a5 requestFormat:(int64_t)a6 responseFormat:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v28 = [(FANetworkService *)self ensureDeviceUnlockedSinceBoot];
  id v15 = [v28 then];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001E19C;
  v36[3] = &unk_10004D0F8;
  v36[4] = self;
  id v16 = ((void (**)(void, void *))v15)[2](v15, v36);
  id v17 = [v16 then];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001E1A4;
  v30[3] = &unk_10004E560;
  void v30[4] = self;
  id v31 = v12;
  id v32 = v13;
  id v33 = v14;
  int64_t v34 = a6;
  int64_t v35 = a7;
  id v18 = (void (*)(void *, void *))v17[2];
  id v27 = v14;
  id v19 = v13;
  id v20 = v12;
  objc_super v21 = v18(v17, v30);
  v22 = [v21 then];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001E1C0;
  v29[3] = &unk_10004E518;
  v29[4] = self;
  v29[5] = a7;
  id v23 = ((void (**)(void, void *))v22)[2](v22, v29);
  id v24 = [v23 then];
  __int16 v25 = ((void (**)(void, Block_layout *))v24)[2](v24, &stru_10004E580);

  return v25;
}

- (id)standardRequestWithURL:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 method:(id)a6 body:(id)a7 requestFormat:(int64_t)a8 responseFormat:(int64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int64_t v36 = [(FANetworkService *)self ensureDeviceUnlockedSinceBoot];
  v30 = [v36 then];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10001E4A0;
  v48[3] = &unk_10004D0F8;
  v48[4] = self;
  int64_t v35 = ((void (**)(void, void *))v30)[2](v30, v48);
  id v19 = [v35 then];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10001E4A8;
  v42[3] = &unk_10004E560;
  v42[4] = self;
  id v43 = v14;
  id v44 = v17;
  id v45 = v18;
  int64_t v46 = a8;
  int64_t v47 = a9;
  id v20 = (void (*)(void *, void *))v19[2];
  id v34 = v18;
  id v32 = v17;
  id v31 = v14;
  objc_super v21 = v20(v19, v42);
  v22 = [v21 then];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001E4C4;
  v37[3] = &unk_10004E5A8;
  id v38 = v16;
  id v39 = v15;
  v40 = self;
  int64_t v41 = a9;
  id v23 = (void (*)(void *, void *))v22[2];
  id v24 = v15;
  id v25 = v16;
  id v26 = v23(v22, v37);
  id v27 = [v26 then];
  id v28 = ((void (**)(void, Block_layout *))v27)[2](v27, &stru_10004E5C8);

  return v28;
}

- (id)standardPlistRequestWithUrl:(id)a3 method:(id)a4 plistBody:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v24 = [(FANetworkService *)self ensureDeviceUnlockedSinceBoot];
  id v11 = [v24 then];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001E798;
  v30[3] = &unk_10004D0F8;
  void v30[4] = self;
  id v12 = ((void (**)(void, void *))v11)[2](v11, v30);
  id v13 = [v12 then];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001E7A0;
  v26[3] = &unk_10004E5F0;
  v26[4] = self;
  id v27 = v8;
  id v28 = v9;
  id v29 = v10;
  id v14 = (void (*)(void *, void *))v13[2];
  id v23 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v14(v13, v26);
  id v18 = [v17 then];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001E7B4;
  v25[3] = &unk_10004E618;
  v25[4] = self;
  id v19 = ((void (**)(void, void *))v18)[2](v18, v25);
  id v20 = [v19 then];
  objc_super v21 = ((void (**)(void, Block_layout *))v20)[2](v20, &stru_10004E638);

  return v21;
}

- (ACAccount)account
{
  return self->_account;
}

- (FAURLProvider)urlProvider
{
  return self->_urlProvider;
}

- (AAURLSession)urlSession
{
  return self->_urlSession;
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

@end