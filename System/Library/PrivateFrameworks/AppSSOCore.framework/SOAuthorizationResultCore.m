@interface SOAuthorizationResultCore
- (NSArray)privateKeys;
- (NSData)httpBody;
- (NSDictionary)httpAuthorizationHeaders;
- (NSHTTPURLResponse)httpResponse;
- (SOAuthorizationResultCore)init;
- (SOAuthorizationResultCore)initWithHTTPAuthorizationHeaders:(id)a3;
- (SOAuthorizationResultCore)initWithHTTPResponse:(id)a3 httpBody:(id)a4;
- (void)setHttpAuthorizationHeaders:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setPrivateKeys:(id)a3;
@end

@implementation SOAuthorizationResultCore

- (SOAuthorizationResultCore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationResultCore;
  v2 = [(SOAuthorizationResultCore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    privateKeys = v2->_privateKeys;
    v2->_privateKeys = (NSArray *)v3;
  }
  return v2;
}

- (SOAuthorizationResultCore)initWithHTTPAuthorizationHeaders:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOAuthorizationResultCore;
  objc_super v6 = [(SOAuthorizationResultCore *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_httpAuthorizationHeaders, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
    privateKeys = v7->_privateKeys;
    v7->_privateKeys = (NSArray *)v8;
  }
  return v7;
}

- (SOAuthorizationResultCore)initWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SOAuthorizationResultCore;
  v9 = [(SOAuthorizationResultCore *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_httpResponse, a3);
    objc_storeStrong((id *)&v10->_httpBody, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
    privateKeys = v10->_privateKeys;
    v10->_privateKeys = (NSArray *)v11;
  }
  return v10;
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

- (NSArray)privateKeys
{
  return self->_privateKeys;
}

- (void)setPrivateKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpAuthorizationHeaders, 0);
}

@end