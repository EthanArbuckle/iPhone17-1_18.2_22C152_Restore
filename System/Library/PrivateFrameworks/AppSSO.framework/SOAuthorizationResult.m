@interface SOAuthorizationResult
- (NSArray)privateKeys;
- (NSData)httpBody;
- (NSDictionary)httpAuthorizationHeaders;
- (NSHTTPURLResponse)httpResponse;
- (SOAuthorizationResult)init;
- (SOAuthorizationResult)initWithHTTPAuthorizationHeaders:(id)a3;
- (SOAuthorizationResult)initWithHTTPResponse:(id)a3 httpBody:(id)a4;
- (void)setHttpAuthorizationHeaders:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setPrivateKeys:(id)a3;
@end

@implementation SOAuthorizationResult

- (SOAuthorizationResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationResult;
  v2 = [(SOAuthorizationResult *)&v6 init];
  if (v2)
  {
    v3 = (SOAuthorizationResultCore *)objc_alloc_init((Class)getSOAuthorizationResultCoreClass());
    authorizationResultCore = v2->_authorizationResultCore;
    v2->_authorizationResultCore = v3;
  }
  return v2;
}

- (SOAuthorizationResult)initWithHTTPAuthorizationHeaders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationResult;
  v5 = [(SOAuthorizationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc((Class)getSOAuthorizationResultCoreClass()) initWithHTTPAuthorizationHeaders:v4];
    authorizationResultCore = v5->_authorizationResultCore;
    v5->_authorizationResultCore = (SOAuthorizationResultCore *)v6;
  }
  return v5;
}

- (SOAuthorizationResult)initWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOAuthorizationResult;
  v8 = [(SOAuthorizationResult *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc((Class)getSOAuthorizationResultCoreClass()) initWithHTTPResponse:v6 httpBody:v7];
    authorizationResultCore = v8->_authorizationResultCore;
    v8->_authorizationResultCore = (SOAuthorizationResultCore *)v9;
  }
  return v8;
}

- (NSDictionary)httpAuthorizationHeaders
{
  return (NSDictionary *)[(SOAuthorizationResultCore *)self->_authorizationResultCore httpAuthorizationHeaders];
}

- (void)setHttpAuthorizationHeaders:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return (NSHTTPURLResponse *)[(SOAuthorizationResultCore *)self->_authorizationResultCore httpResponse];
}

- (void)setHttpResponse:(id)a3
{
}

- (NSData)httpBody
{
  return (NSData *)[(SOAuthorizationResultCore *)self->_authorizationResultCore httpBody];
}

- (void)setHttpBody:(id)a3
{
}

- (NSArray)privateKeys
{
  return (NSArray *)[(SOAuthorizationResultCore *)self->_authorizationResultCore privateKeys];
}

- (void)setPrivateKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end