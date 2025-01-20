@interface SOAuthorizationParametersCore
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
- (SOAuthorizationParametersCore)init;
- (int64_t)responseCode;
- (void)setAuditTokenData:(id)a3;
- (void)setCfNetworkInterception:(BOOL)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setImpersonationBundleIdentifier:(id)a3;
- (void)setOperation:(id)a3;
- (void)setResponseCode:(int64_t)a3;
- (void)setShowOnCoverScreen:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUseInternalExtensions:(BOOL)a3;
@end

@implementation SOAuthorizationParametersCore

- (SOAuthorizationParametersCore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationParametersCore;
  v2 = [(SOAuthorizationParametersCore *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_useInternalExtensions = 1;
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    v3->_showOnCoverScreen = 0;
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void)setAuditTokenData:(id)a3
{
}

- (BOOL)useInternalExtensions
{
  return self->_useInternalExtensions;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  self->_useInternalExtensions = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (BOOL)isCFNetworkInterception
{
  return self->_cfNetworkInterception;
}

- (void)setCfNetworkInterception:(BOOL)a3
{
  self->_cfNetworkInterception = a3;
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
}

- (BOOL)canShowOnCoverScreen
{
  return self->_showOnCoverScreen;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  self->_showOnCoverScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end