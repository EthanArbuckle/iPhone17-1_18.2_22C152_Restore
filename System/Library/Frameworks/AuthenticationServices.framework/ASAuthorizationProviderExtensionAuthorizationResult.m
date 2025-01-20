@interface ASAuthorizationProviderExtensionAuthorizationResult
- (ASAuthorizationProviderExtensionAuthorizationResult)init;
- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders;
- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody;
- (NSArray)privateKeys;
- (NSData)httpBody;
- (NSDictionary)httpAuthorizationHeaders;
- (NSHTTPURLResponse)httpResponse;
- (SOAuthorizationResult)authorizationResult;
- (void)setHttpAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders;
- (void)setHttpBody:(NSData *)httpBody;
- (void)setHttpResponse:(NSHTTPURLResponse *)httpResponse;
- (void)setPrivateKeys:(NSArray *)privateKeys;
@end

@implementation ASAuthorizationProviderExtensionAuthorizationResult

- (ASAuthorizationProviderExtensionAuthorizationResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  v2 = [(ASAuthorizationProviderExtensionAuthorizationResult *)&v8 init];
  if (v2)
  {
    v3 = (SOAuthorizationResult *)objc_alloc_init(MEMORY[0x263F25250]);
    authorizationResult = v2->_authorizationResult;
    v2->_authorizationResult = v3;

    v5 = [MEMORY[0x263EFF8C0] array];
    [(ASAuthorizationProviderExtensionAuthorizationResult *)v2 setPrivateKeys:v5];

    v6 = v2;
  }

  return v2;
}

- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
  v4 = httpAuthorizationHeaders;
  v11.receiver = self;
  v11.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  v5 = [(ASAuthorizationProviderExtensionAuthorizationResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F25250]) initWithHTTPAuthorizationHeaders:v4];
    authorizationResult = v5->_authorizationResult;
    v5->_authorizationResult = (SOAuthorizationResult *)v6;

    objc_super v8 = [MEMORY[0x263EFF8C0] array];
    [(ASAuthorizationProviderExtensionAuthorizationResult *)v5 setPrivateKeys:v8];

    v9 = v5;
  }

  return v5;
}

- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody
{
  uint64_t v6 = httpResponse;
  v7 = httpBody;
  v14.receiver = self;
  v14.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  objc_super v8 = [(ASAuthorizationProviderExtensionAuthorizationResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F25250]) initWithHTTPResponse:v6 httpBody:v7];
    authorizationResult = v8->_authorizationResult;
    v8->_authorizationResult = (SOAuthorizationResult *)v9;

    objc_super v11 = [MEMORY[0x263EFF8C0] array];
    [(ASAuthorizationProviderExtensionAuthorizationResult *)v8 setPrivateKeys:v11];

    v12 = v8;
  }

  return v8;
}

- (NSDictionary)httpAuthorizationHeaders
{
  return (NSDictionary *)[(SOAuthorizationResult *)self->_authorizationResult httpAuthorizationHeaders];
}

- (void)setHttpAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
}

- (NSHTTPURLResponse)httpResponse
{
  return (NSHTTPURLResponse *)[(SOAuthorizationResult *)self->_authorizationResult httpResponse];
}

- (void)setHttpResponse:(NSHTTPURLResponse *)httpResponse
{
}

- (NSData)httpBody
{
  return (NSData *)[(SOAuthorizationResult *)self->_authorizationResult httpBody];
}

- (void)setHttpBody:(NSData *)httpBody
{
}

- (NSArray)privateKeys
{
  return (NSArray *)[(SOAuthorizationResult *)self->_authorizationResult privateKeys];
}

- (void)setPrivateKeys:(NSArray *)privateKeys
{
}

- (SOAuthorizationResult)authorizationResult
{
  return self->_authorizationResult;
}

- (void).cxx_destruct
{
}

@end