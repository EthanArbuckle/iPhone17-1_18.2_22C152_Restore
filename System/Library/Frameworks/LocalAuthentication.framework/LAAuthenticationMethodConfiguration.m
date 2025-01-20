@interface LAAuthenticationMethodConfiguration
- (LAAuthenticationMethodConfiguration)initWithAllowedUsers:(id)a3 authenticationContext:(id)a4;
- (LAContext)authenticationContext;
- (NSArray)allowedUsers;
@end

@implementation LAAuthenticationMethodConfiguration

- (LAAuthenticationMethodConfiguration)initWithAllowedUsers:(id)a3 authenticationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAAuthenticationMethodConfiguration;
  v9 = [(LAAuthenticationMethodConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allowedUsers, a3);
    objc_storeStrong((id *)&v10->_authenticationContext, a4);
  }

  return v10;
}

- (NSArray)allowedUsers
{
  return self->_allowedUsers;
}

- (LAContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_allowedUsers, 0);
}

@end