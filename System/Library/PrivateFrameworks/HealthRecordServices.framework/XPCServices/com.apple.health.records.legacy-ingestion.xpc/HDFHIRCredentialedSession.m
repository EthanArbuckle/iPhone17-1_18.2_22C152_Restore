@interface HDFHIRCredentialedSession
- (HDFHIRCredentialVendor)credentialVendor;
- (HDFHIRCredentialedSession)initWithSpecification:(id)a3 credentialVendor:(id)a4;
- (HKFHIRCredentialRefreshResult)refreshResult;
- (id)consumeRefreshResult;
- (void)credentialVendor:(id)a3 refreshCredential:(id)a4 completion:(id)a5;
- (void)setRefreshResult:(id)a3;
@end

@implementation HDFHIRCredentialedSession

- (HDFHIRCredentialedSession)initWithSpecification:(id)a3 credentialVendor:(id)a4
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDFHIRCredentialedSession;
  v9 = [(HDFHIRSession *)&v13 initWithSpecification:a3];
  if (v9)
  {
    v10 = [v8 delegate];

    if (v10)
    {
      v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2, v9, @"HDFHIRCredentialedSession.m", 32, @"Invalid parameter not satisfying: %@", @"credentialVendor.delegate == nil" object file lineNumber description];
    }
    [v8 setDelegate:v9];
    objc_storeStrong((id *)&v9->_credentialVendor, a4);
    v9->_refreshLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)consumeRefreshResult
{
  p_refreshLock = &self->_refreshLock;
  os_unfair_lock_lock(&self->_refreshLock);
  v4 = self->_refreshResult;
  refreshResult = self->_refreshResult;
  self->_refreshResult = 0;

  os_unfair_lock_unlock(p_refreshLock);

  return v4;
}

- (void)credentialVendor:(id)a3 refreshCredential:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [HDFHIRRefreshTokenTask alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A7CC;
  v13[3] = &unk_100014718;
  id v14 = v7;
  v15 = self;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  v12 = [(HDFHIRRefreshTokenTask *)v9 initWithSession:self credential:v11 completion:v13];
  [(HDFHIRRequestTask *)v12 resume];
}

- (HDFHIRCredentialVendor)credentialVendor
{
  return self->_credentialVendor;
}

- (HKFHIRCredentialRefreshResult)refreshResult
{
  return self->_refreshResult;
}

- (void)setRefreshResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshResult, 0);

  objc_storeStrong((id *)&self->_credentialVendor, 0);
}

@end