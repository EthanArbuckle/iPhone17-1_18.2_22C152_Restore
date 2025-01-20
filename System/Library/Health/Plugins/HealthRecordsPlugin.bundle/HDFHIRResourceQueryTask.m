@interface HDFHIRResourceQueryTask
- (HDFHIRResourceQueryTask)initWithCredentialedSession:(id)a3 resourceSchema:(id)a4 queryMode:(int64_t)a5 bindings:(id)a6 completion:(id)a7;
- (HDFHIRResourceSchema)resourceSchema;
- (NSDictionary)bindings;
- (id)createURLRequestWithCredentialResult:(id)a3 error:(id *)a4;
- (id)queryCompletion;
- (id)resourceType;
- (int64_t)interactionType;
- (int64_t)queryMode;
- (void)handleError:(id)a3 endState:(id)a4;
- (void)handleResponse:(id)a3 JSONData:(id)a4 endState:(id)a5;
@end

@implementation HDFHIRResourceQueryTask

- (HDFHIRResourceQueryTask)initWithCredentialedSession:(id)a3 resourceSchema:(id)a4 queryMode:(int64_t)a5 bindings:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDFHIRResourceQueryTask;
  v15 = [(HDFHIRCredentialedRequestTask *)&v23 initWithCredentialedSession:a3];
  if (v15)
  {
    v16 = (HDFHIRResourceSchema *)[v12 copy];
    resourceSchema = v15->_resourceSchema;
    v15->_resourceSchema = v16;

    v15->_queryMode = a5;
    id v18 = [v14 copy];
    id queryCompletion = v15->_queryCompletion;
    v15->_id queryCompletion = v18;

    v20 = (NSDictionary *)[v13 copy];
    bindings = v15->_bindings;
    v15->_bindings = v20;
  }
  return v15;
}

- (id)resourceType
{
  v2 = [(HDFHIRResourceQueryTask *)self resourceSchema];
  v3 = [v2 name];

  return v3;
}

- (int64_t)interactionType
{
  return 5;
}

- (id)createURLRequestWithCredentialResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDFHIRResourceQueryTask *)self resourceSchema];
  v8 = [v6 credential];

  v9 = [(HDFHIRResourceQueryTask *)self bindings];
  v10 = objc_msgSend(v7, "createRequestWithCredential:bindings:queryMode:error:", v8, v9, -[HDFHIRResourceQueryTask queryMode](self, "queryMode"), a4);

  return v10;
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
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDFHIRResourceQueryTask.m", 81, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    id v8 = 0;
  }
  v10 = +[NSError hrs_authorizationOrResourceFetchErrorFromError:v8];
  (*((void (**)(void))self->_queryCompletion + 2))();
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (id)queryCompletion
{
  return self->_queryCompletion;
}

- (int64_t)queryMode
{
  return self->_queryMode;
}

- (HDFHIRResourceSchema)resourceSchema
{
  return self->_resourceSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceSchema, 0);
  objc_storeStrong(&self->_queryCompletion, 0);

  objc_storeStrong((id *)&self->_bindings, 0);
}

@end