@interface HDFHIRResourceRequestTask
- (HDFHIRResourceRequestTask)initWithCredentialedSession:(id)a3 resourceSchema:(id)a4 requestURL:(id)a5 completion:(id)a6;
- (HDFHIRResourceSchema)resourceSchema;
- (NSURL)requestURL;
- (id)createURLRequestWithCredentialResult:(id)a3 error:(id *)a4;
- (id)queryCompletion;
- (id)resourceType;
- (int64_t)interactionType;
- (void)handleError:(id)a3 endState:(id)a4;
- (void)handleResponse:(id)a3 JSONData:(id)a4 endState:(id)a5;
@end

@implementation HDFHIRResourceRequestTask

- (HDFHIRResourceRequestTask)initWithCredentialedSession:(id)a3 resourceSchema:(id)a4 requestURL:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDFHIRResourceRequestTask;
  v13 = [(HDFHIRCredentialedRequestTask *)&v21 initWithCredentialedSession:a3];
  if (v13)
  {
    v14 = (HDFHIRResourceSchema *)[v10 copy];
    resourceSchema = v13->_resourceSchema;
    v13->_resourceSchema = v14;

    v16 = (NSURL *)[v11 copy];
    requestURL = v13->_requestURL;
    v13->_requestURL = v16;

    id v18 = [v12 copy];
    id queryCompletion = v13->_queryCompletion;
    v13->_id queryCompletion = v18;
  }
  return v13;
}

- (id)resourceType
{
  v2 = [(HDFHIRResourceRequestTask *)self resourceSchema];
  v3 = [v2 name];

  return v3;
}

- (int64_t)interactionType
{
  return 4;
}

- (id)createURLRequestWithCredentialResult:(id)a3 error:(id *)a4
{
  resourceSchema = self->_resourceSchema;
  v7 = [a3 credential];
  v8 = [(HDFHIREndpointSchema *)resourceSchema createRequestWithCredential:v7 requestURL:self->_requestURL error:a4];

  return v8;
}

- (void)handleResponse:(id)a3 JSONData:(id)a4 endState:(id)a5
{
}

- (void)handleError:(id)a3 endState:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = v12;
  id v9 = v7;
  if (!v12)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDFHIRResourceRequestTask.m", 71, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    id v8 = 0;
  }
  id v10 = +[NSError hrs_authorizationOrResourceFetchErrorFromError:v8];
  (*((void (**)(void))self->_queryCompletion + 2))();
}

- (id)queryCompletion
{
  return self->_queryCompletion;
}

- (HDFHIRResourceSchema)resourceSchema
{
  return self->_resourceSchema;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_resourceSchema, 0);

  objc_storeStrong(&self->_queryCompletion, 0);
}

@end