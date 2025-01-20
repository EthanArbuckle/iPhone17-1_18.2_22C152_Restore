@interface LAAuthenticationMethodResult
- (BOOL)unlockKeyBagWithError:(id *)a3;
- (LAAuthenticationMethod)authenticationMethod;
- (LAAuthenticationMethodResult)initWithAuthenticatedUser:(id)a3 authenticationMethod:(id)a4;
- (NSString)authenticatedUser;
@end

@implementation LAAuthenticationMethodResult

- (LAAuthenticationMethodResult)initWithAuthenticatedUser:(id)a3 authenticationMethod:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAAuthenticationMethodResult;
  v9 = [(LAAuthenticationMethodResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authenticatedUser, a3);
    objc_storeStrong((id *)&v10->_authenticationMethod, a4);
  }

  return v10;
}

- (BOOL)unlockKeyBagWithError:(id *)a3
{
  return 1;
}

- (LAAuthenticationMethod)authenticationMethod
{
  return self->_authenticationMethod;
}

- (NSString)authenticatedUser
{
  return self->_authenticatedUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedUser, 0);

  objc_storeStrong((id *)&self->_authenticationMethod, 0);
}

@end