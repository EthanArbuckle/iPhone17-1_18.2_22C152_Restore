@interface DAEASOAuthIdentity
- (NSData)jwksData;
- (NSString)accessToken;
- (NSString)displayName;
- (NSString)issuer;
- (NSString)jwksURI;
- (NSString)oauthURI;
- (NSString)refreshToken;
- (NSString)tokenRequestURI;
- (NSString)username;
- (void)setAccessToken:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setJwksData:(id)a3;
- (void)setJwksURI:(id)a3;
- (void)setOauthURI:(id)a3;
- (void)setRefreshToken:(id)a3;
- (void)setTokenRequestURI:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation DAEASOAuthIdentity

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
}

- (NSString)oauthURI
{
  return self->_oauthURI;
}

- (void)setOauthURI:(id)a3
{
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (void)setTokenRequestURI:(id)a3
{
}

- (NSData)jwksData
{
  return self->_jwksData;
}

- (void)setJwksData:(id)a3
{
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (void)setJwksURI:(id)a3
{
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_jwksData, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
  objc_storeStrong((id *)&self->_oauthURI, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end