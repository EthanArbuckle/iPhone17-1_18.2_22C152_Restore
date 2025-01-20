@interface HDFHIRAccessTokenTask
- (HDFHIRAccessTokenTask)initWithTokenSession:(id)a3 FHIRSession:(id)a4 completion:(id)a5;
- (HKOAuth2TokenSession)tokenSession;
- (id)completionHandler;
- (id)errorForRequest:(id)a3 response:(id)a4 data:(id)a5;
- (id)resourceType;
- (int64_t)interactionType;
- (void)createURLRequestWithCompletion:(id)a3;
- (void)handleError:(id)a3 endState:(id)a4;
- (void)handleResponse:(id)a3 JSONData:(id)a4 endState:(id)a5;
@end

@implementation HDFHIRAccessTokenTask

- (HDFHIRAccessTokenTask)initWithTokenSession:(id)a3 FHIRSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDFHIRAccessTokenTask;
  v10 = [(HDFHIRRequestTask *)&v16 initWithSession:a4];
  if (v10)
  {
    v11 = (HKOAuth2TokenSession *)[v8 copy];
    tokenSession = v10->_tokenSession;
    v10->_tokenSession = v11;

    id v13 = [v9 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v13;
  }
  return v10;
}

- (id)resourceType
{
  return 0;
}

- (int64_t)interactionType
{
  return 2;
}

- (void)createURLRequestWithCompletion:(id)a3
{
  v4 = (void (**)(void, void *, id))a3;
  v5 = [(HDFHIRRequestTask *)self session];
  v6 = [v5 specification];

  v7 = [v6 authorizationSchemaForType:1];
  if (v7)
  {
    v30[0] = @"code";
    v27 = v4;
    v26 = [(HKOAuth2TokenSession *)self->_tokenSession code];
    v31[0] = v26;
    v30[1] = @"state";
    v25 = [(HKOAuth2TokenSession *)self->_tokenSession state];
    v24 = [v25 UUIDString];
    v31[1] = v24;
    v30[2] = @"PKCEVerifier";
    uint64_t v8 = [(HKOAuth2TokenSession *)self->_tokenSession pkceVerifier];
    id v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_100014AE8;
    }
    v31[2] = v10;
    v30[3] = @"clientID";
    v23 = [v6 connection];
    v11 = [v23 authentication];
    uint64_t v12 = [v11 clientID];
    id v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_100014AE8;
    }
    v31[3] = v14;
    v30[4] = @"clientSecret";
    v15 = [v6 connection];
    objc_super v16 = [v15 authentication];
    uint64_t v17 = [v16 clientSecret];
    v18 = (void *)v17;
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    else {
      CFStringRef v19 = &stru_100014AE8;
    }
    v31[4] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:5];
    id v29 = 0;
    v21 = [v7 createRequestWithBindings:v20 queryMode:0 error:&v29];
    v28 = v7;
    id v22 = v29;

    v4 = v27;
    v27[2](v27, v21, v22);

    v7 = v28;
  }
  else
  {
    v21 = +[NSError hk_error:100, @"Unable to fetch access token schema from specification %@", v6 format];
    v4[2](v4, 0, v21);
  }
}

- (void)handleResponse:(id)a3 JSONData:(id)a4 endState:(id)a5
{
  if (a4)
  {
    id v22 = 0;
    id v8 = a5;
    id v9 = +[NSJSONSerialization JSONObjectWithData:a4 options:0 error:&v22];
    id v10 = v22;
    if (v9)
    {
      objc_opt_class();
      v21[1] = v10;
      v11 = HKSafeObject();
      id v12 = v10;

      if (v11)
      {
        id v13 = [(HDFHIRRequestTask *)self session];
        CFStringRef v14 = [v13 specification];
        v15 = [v14 connection];
        objc_super v16 = [v15 gateway];
        uint64_t v17 = [v16 baseURL];

        v21[0] = v12;
        v18 = +[HDFHIRAuthResponse authResponseFromServerResponseDictionary:v11 baseURL:v17 previousCredential:0 error:v21];
        id v10 = v21[0];
      }
      else
      {
        v18 = 0;
        id v10 = v12;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    id v19 = a5;
    id v10 = +[NSError hk_error:3 description:@"nil JSON data"];
    v18 = 0;
  }
  v20 = [(HDFHIRAccessTokenTask *)self completionHandler];
  ((void (**)(void, void *, id, id))v20)[2](v20, v18, a5, v10);
}

- (void)handleError:(id)a3 endState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDFHIRAccessTokenTask.m", 90, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v13 = v7;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = +[NSError hrs_accumulatedErrorWithAuthorizationFailures:v9 resourceFetchFailures:0 otherErrors:0];

  v11 = [(HDFHIRAccessTokenTask *)self completionHandler];
  ((void (**)(void, void, id, void *))v11)[2](v11, 0, v8, v10);
}

- (id)errorForRequest:(id)a3 response:(id)a4 data:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(HDFHIRRequestTask *)self session];
  id v12 = [v11 specification];
  id v13 = [v12 errorForAuthorizationRequest:v10 response:v9 data:v8];

  return v13;
}

- (HKOAuth2TokenSession)tokenSession
{
  return self->_tokenSession;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_tokenSession, 0);
}

@end