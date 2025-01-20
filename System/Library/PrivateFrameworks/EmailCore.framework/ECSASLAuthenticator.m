@interface ECSASLAuthenticator
- (BOOL)couldRetry;
- (BOOL)isUsingSSL;
- (BOOL)justSentPlainTextPassword;
- (BOOL)supportsInitialClientResponse;
- (BOOL)usesBase64EncodeResponseData;
- (ECAuthenticatableAccount)account;
- (ECAuthenticationScheme)authenticationScheme;
- (ECSASLAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5;
- (ECSASLSecurityLayer)securityLayer;
- (NSString)saslName;
- (id)authScheme;
- (id)responseForServerData:(id)a3;
- (int64_t)authenticationState;
- (void)setAuthenticationState:(int64_t)a3;
- (void)setInvalidCredentialsError;
- (void)setMissingPasswordError;
@end

@implementation ECSASLAuthenticator

- (ECSASLAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ECSASLAuthenticator;
  v12 = [(ECSASLAuthenticator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authenticationScheme, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_connection, a5);
  }

  return v13;
}

- (id)authScheme
{
  return self->_authenticationScheme;
}

- (ECAuthenticatableAccount)account
{
  return self->_account;
}

- (NSString)saslName
{
  return [(ECAuthenticationScheme *)self->_authenticationScheme name];
}

- (BOOL)supportsInitialClientResponse
{
  return 0;
}

- (id)responseForServerData:(id)a3
{
  return 0;
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (BOOL)justSentPlainTextPassword
{
  return 0;
}

- (ECSASLSecurityLayer)securityLayer
{
  return 0;
}

- (BOOL)isUsingSSL
{
  v2 = [(ECAuthenticatableConnection *)self->_connection securityProtocol];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 caseInsensitiveCompare:*MEMORY[0x1E4F1D4C0]] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)usesBase64EncodeResponseData
{
  return 1;
}

- (BOOL)couldRetry
{
  return 0;
}

- (void)setMissingPasswordError
{
  id v2 = [(ECSASLAuthenticator *)self account];
  [v2 setMissingPasswordError];
}

- (void)setInvalidCredentialsError
{
  id v2 = [(ECSASLAuthenticator *)self account];
  [v2 setInvalidCredentialsError];
}

- (ECAuthenticationScheme)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end