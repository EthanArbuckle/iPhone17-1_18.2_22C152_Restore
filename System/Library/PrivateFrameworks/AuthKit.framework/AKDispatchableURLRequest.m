@interface AKDispatchableURLRequest
- (AKAuthHandler)authenticationHandler;
- (AKDispatchableURLRequest)initWithURLRequestProvider:(id)a3 authenticationHandler:(id)a4 completionHandler:(id)a5;
- (AKURLRequestProvider)urlRequestProvider;
- (NSDictionary)additionalHeaders;
- (NSDictionary)dispatchingInfo;
- (id)_addingAdditionalHeaders:(id)a3 forURLRequest:(id)a4;
- (id)_urlSession;
- (int64_t)responseCode;
- (void)_executeAllowingReauthentication:(BOOL)a3 completion:(id)a4;
- (void)_executeURLRequest:(id)a3 withSession:(id)a4 completion:(id)a5;
- (void)_reauthenticateAndExecuteWithCompletion:(id)a3;
- (void)_reauthenticateWithCompletion:(id)a3;
- (void)executeWithResponseHandler:(id)a3;
- (void)handleResponseCode;
- (void)invalidateWithError:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation AKDispatchableURLRequest

- (AKDispatchableURLRequest)initWithURLRequestProvider:(id)a3 authenticationHandler:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AKDispatchableURLRequest;
  v12 = [(AKDispatchableURLRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_urlRequestProvider, a3);
    objc_storeStrong((id *)&v13->_authenticationHandler, a4);
    id v14 = objc_retainBlock(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;
  }
  return v13;
}

- (NSDictionary)dispatchingInfo
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v4 = [(AKDispatchableURLRequest *)self urlRequestProvider];
  v5 = [v4 client];
  v6 = [v5 name];
  [v3 setObject:v6 forKeyedSubscript:@"capp"];

  v7 = [(AKDispatchableURLRequest *)self urlRequestProvider];
  v8 = [v7 concreteAuthenticationContext];

  if (v8)
  {
    id v9 = [(AKDispatchableURLRequest *)self urlRequestProvider];
    id v10 = [v9 concreteAuthenticationContext];
    id v11 = [v10 _proxiedAppName];
    [v3 setObject:v11 forKeyedSubscript:@"papp"];

    v12 = [(AKDispatchableURLRequest *)self urlRequestProvider];
    v13 = [v12 concreteAuthenticationContext];
    id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 serviceType]);
    [v3 setObject:v14 forKeyedSubscript:@"svct"];
  }
  id v15 = [v3 copy];

  return (NSDictionary *)v15;
}

- (void)executeWithResponseHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047ED8;
  v4[3] = &unk_100228500;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AKDispatchableURLRequest *)v5 _executeAllowingReauthentication:1 completion:v4];
}

- (void)handleResponseCode
{
  int64_t v3 = [(AKDispatchableURLRequest *)self responseCode];
  id v6 = [(AKDispatchableURLRequest *)self urlRequestProvider];
  v4 = [v6 context];
  v5 = [v4 altDSID];
  +[AKCommonResponseCodeHandler handleResponseCode:v3 altDSID:v5];
}

- (void)invalidateWithError:(id)a3
{
}

- (id)_urlSession
{
  int64_t v3 = [(AKDispatchableURLRequest *)self urlRequestProvider];
  unsigned int v4 = [v3 _denyVirtualInterfaces];

  if (v4)
  {
    v5 = +[AKURLSession sharedURLSessionWithDenyVirtualInterfaces];
  }
  else
  {
    id v6 = [(AKDispatchableURLRequest *)self urlRequestProvider];
    unsigned int v7 = [v6 shouldCacheResource];

    if (v7) {
      +[AKURLSession sharedCacheEnabledURLSession];
    }
    else {
    v5 = +[AKURLSession sharedURLSession];
    }
  }

  return v5;
}

- (void)_executeAllowingReauthentication:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(AKDispatchableURLRequest *)self urlRequestProvider];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000481BC;
  v9[3] = &unk_100228550;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [v7 buildRequestWithCompletion:v9];
}

- (void)_executeURLRequest:(id)a3 withSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100182BD8(self, (uint64_t)v8, v11);
  }

  v12 = [(AKDispatchableURLRequest *)self additionalHeaders];
  v13 = [(AKDispatchableURLRequest *)self _addingAdditionalHeaders:v12 forURLRequest:v8];

  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100182B50((uint64_t)self, (uint64_t)v13, v14);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048628;
  v17[3] = &unk_100227DD8;
  v17[4] = self;
  id v18 = v10;
  id v15 = v10;
  id v16 = [v9 beginAuthenticationDataTaskWithRequest:v13 completionHandler:v17];
}

- (void)_reauthenticateAndExecuteWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048844;
  v4[3] = &unk_100227BD0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AKDispatchableURLRequest *)v5 _reauthenticateWithCompletion:v4];
}

- (void)_reauthenticateWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, void, id))a3;
  v5 = [(AKDispatchableURLRequest *)self authenticationHandler];

  if (v5)
  {
    id v6 = [(AKDispatchableURLRequest *)self authenticationHandler];
    unsigned int v7 = [(AKDispatchableURLRequest *)self urlRequestProvider];
    id v8 = [v7 concreteAuthenticationContext];
    id v13 = 0;
    id v9 = [v6 buildReauthenticationContextFromContext:v8 error:&v13];
    id v10 = v13;

    if (v10)
    {
      v4[2](v4, 0, v10);
    }
    else
    {
      v12 = [(AKDispatchableURLRequest *)self authenticationHandler];

      [v12 reauthenticateWithContext:v9 completion:v4];
      id v10 = v12;
    }
  }
  else
  {
    BOOL v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100182A50((uint64_t)self, v11);
    }

    v4[2](v4, 0, 0);
  }
}

- (id)_addingAdditionalHeaders:(id)a3 forURLRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100048B4C;
    v10[3] = &unk_100227D88;
    id v11 = [v6 mutableCopy];
    id v7 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (AKURLRequestProvider)urlRequestProvider
{
  return self->_urlRequestProvider;
}

- (AKAuthHandler)authenticationHandler
{
  return self->_authenticationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationHandler, 0);
  objc_storeStrong((id *)&self->_urlRequestProvider, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end