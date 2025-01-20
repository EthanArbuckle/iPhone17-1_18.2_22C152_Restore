@interface SOAuthorizationParameters
- (BOOL)canShowOnCoverScreen;
- (BOOL)isCFNetworkInterception;
- (BOOL)useInternalExtensions;
- (NSData)auditTokenData;
- (NSData)httpBody;
- (NSDictionary)httpHeaders;
- (NSString)identifier;
- (NSString)impersonationBundleIdentifier;
- (NSString)operation;
- (NSURL)url;
- (SOAuthorizationParameters)init;
- (SOAuthorizationParametersCore)authorizationParametersCore;
- (int64_t)responseCode;
- (void)setAuditTokenData:(id)a3;
- (void)setCFNetworkInterception:(BOOL)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setImpersonationBundleIdentifier:(id)a3;
- (void)setOperation:(id)a3;
- (void)setResponseCode:(int64_t)a3;
- (void)setShowOnCoverScreen:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUseInternalExtensions:(BOOL)a3;
@end

@implementation SOAuthorizationParameters

- (SOAuthorizationParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationParameters;
  v2 = [(SOAuthorizationParameters *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getSOAuthorizationParametersCoreClass_softClass;
    uint64_t v13 = getSOAuthorizationParametersCoreClass_softClass;
    if (!getSOAuthorizationParametersCoreClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getSOAuthorizationParametersCoreClass_block_invoke;
      v9[3] = &unk_26432A2A8;
      v9[4] = &v10;
      __getSOAuthorizationParametersCoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (SOAuthorizationParametersCore *)objc_alloc_init(v4);
    authorizationParametersCore = v2->_authorizationParametersCore;
    v2->_authorizationParametersCore = v5;

    [(SOAuthorizationParameters *)v2 setUseInternalExtensions:1];
  }
  return v2;
}

- (NSString)identifier
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)operation
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 operation];

  return (NSString *)v3;
}

- (void)setOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v5 setOperation:v4];
}

- (NSURL)url
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 url];

  return (NSURL *)v3;
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v5 setUrl:v4];
}

- (NSDictionary)httpHeaders
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 httpHeaders];

  return (NSDictionary *)v3;
}

- (void)setHttpHeaders:(id)a3
{
  id v4 = a3;
  id v5 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v5 setHttpHeaders:v4];
}

- (NSData)httpBody
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 httpBody];

  return (NSData *)v3;
}

- (void)setHttpBody:(id)a3
{
  id v4 = a3;
  id v5 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v5 setHttpBody:v4];
}

- (NSData)auditTokenData
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  v3 = [v2 auditTokenData];

  return (NSData *)v3;
}

- (void)setAuditTokenData:(id)a3
{
  id v4 = a3;
  id v5 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v5 setAuditTokenData:v4];
}

- (BOOL)useInternalExtensions
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  char v3 = [v2 useInternalExtensions];

  return v3;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v4 setUseInternalExtensions:v3];
}

- (int64_t)responseCode
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  int64_t v3 = [v2 responseCode];

  return v3;
}

- (void)setResponseCode:(int64_t)a3
{
  id v4 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v4 setResponseCode:a3];
}

- (BOOL)isCFNetworkInterception
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  char v3 = [v2 isCFNetworkInterception];

  return v3;
}

- (void)setCFNetworkInterception:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v4 setCfNetworkInterception:v3];
}

- (BOOL)canShowOnCoverScreen
{
  v2 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  char v3 = [v2 canShowOnCoverScreen];

  return v3;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SOAuthorizationParameters *)self authorizationParametersCore];
  [v4 setShowOnCoverScreen:v3];
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationParametersCore, 0);
}

- (SOAuthorizationParametersCore)authorizationParametersCore
{
  return self->_authorizationParametersCore;
}

@end