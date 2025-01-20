@interface TKAuthContext
- (LAContext)authContext;
- (NSData)ACMHandle;
- (TKAuthContext)initWithLAContext:(id)a3 ACMHandle:(id)a4 sharedResource:(id)a5;
- (TKSharedResource)sharedResource;
@end

@implementation TKAuthContext

- (TKAuthContext)initWithLAContext:(id)a3 ACMHandle:(id)a4 sharedResource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TKAuthContext;
  v12 = [(TKAuthContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authContext, a3);
    objc_storeStrong((id *)&v13->_ACMHandle, a4);
    objc_storeStrong((id *)&v13->_sharedResource, a5);
  }

  return v13;
}

- (NSData)ACMHandle
{
  return self->_ACMHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedResource, 0);
  objc_storeStrong((id *)&self->_ACMHandle, 0);

  objc_storeStrong((id *)&self->_authContext, 0);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (TKSharedResource)sharedResource
{
  return self->_sharedResource;
}

@end