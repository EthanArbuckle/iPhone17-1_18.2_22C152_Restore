@interface SOAuthorizationCredential
+ (BOOL)supportsSecureCoding;
- (NSArray)secKeyProxyEndpoints;
- (NSData)httpBody;
- (NSDictionary)httpAuthorizationHeaders;
- (NSHTTPURLResponse)httpResponse;
- (SOAuthorizationCredential)initWithAuthorizationResult:(id)a3;
- (SOAuthorizationCredential)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHttpAuthorizationHeaders:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setSecKeyProxyEndpoints:(id)a3;
@end

@implementation SOAuthorizationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationCredential)initWithAuthorizationResult:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SOAuthorizationCredential;
  v5 = [(SOAuthorizationCredential *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 httpAuthorizationHeaders];
    httpAuthorizationHeaders = v5->_httpAuthorizationHeaders;
    v5->_httpAuthorizationHeaders = (NSDictionary *)v6;

    uint64_t v8 = [v4 httpResponse];
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSHTTPURLResponse *)v8;

    uint64_t v10 = [v4 httpBody];
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v10;
  }
  return v5;
}

- (SOAuthorizationCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SOAuthorizationCredential;
  v5 = [(SOAuthorizationCredential *)&v27 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = NSStringFromSelector(sel_httpAuthorizationHeaders);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    httpAuthorizationHeaders = v5->_httpAuthorizationHeaders;
    v5->_httpAuthorizationHeaders = (NSDictionary *)v10;

    uint64_t v12 = objc_opt_class();
    objc_super v13 = NSStringFromSelector(sel_httpResponse);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSHTTPURLResponse *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_httpBody);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = NSStringFromSelector(sel_secKeyProxyEndpoints);
    uint64_t v24 = [v4 decodeObjectOfClasses:v22 forKey:v23];
    secKeyProxyEndpoints = v5->_secKeyProxyEndpoints;
    v5->_secKeyProxyEndpoints = (NSArray *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  httpAuthorizationHeaders = self->_httpAuthorizationHeaders;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_httpAuthorizationHeaders);
  [v5 encodeObject:httpAuthorizationHeaders forKey:v6];

  httpResponse = self->_httpResponse;
  uint64_t v8 = NSStringFromSelector(sel_httpResponse);
  [v5 encodeObject:httpResponse forKey:v8];

  httpBody = self->_httpBody;
  uint64_t v10 = NSStringFromSelector(sel_httpBody);
  [v5 encodeObject:httpBody forKey:v10];

  secKeyProxyEndpoints = self->_secKeyProxyEndpoints;
  NSStringFromSelector(sel_secKeyProxyEndpoints);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:secKeyProxyEndpoints forKey:v12];
}

- (NSDictionary)httpAuthorizationHeaders
{
  return self->_httpAuthorizationHeaders;
}

- (void)setHttpAuthorizationHeaders:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
}

- (NSArray)secKeyProxyEndpoints
{
  return self->_secKeyProxyEndpoints;
}

- (void)setSecKeyProxyEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secKeyProxyEndpoints, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpAuthorizationHeaders, 0);
}

@end