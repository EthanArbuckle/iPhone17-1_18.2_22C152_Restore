@interface ASAuthorizationSingleSignOnCredential
+ (ASAuthorizationSingleSignOnCredential)new;
+ (BOOL)supportsSecureCoding;
+ (id)emptyCredential;
- (ASAuthorizationSingleSignOnCredential)init;
- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3;
- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3 privateKeys:(id)a4;
- (NSArray)authorizedScopes;
- (NSArray)privateKeys;
- (NSData)accessToken;
- (NSData)identityToken;
- (NSHTTPURLResponse)authenticatedResponse;
- (NSString)description;
- (NSString)state;
- (void)_initWithAuthenticatedResponse:(id)a3;
@end

@implementation ASAuthorizationSingleSignOnCredential

+ (id)emptyCredential
{
  v2 = (void *)[objc_alloc((Class)a1) initWithAuthenticatedResponse:0];

  return v2;
}

+ (ASAuthorizationSingleSignOnCredential)new
{
  return 0;
}

- (ASAuthorizationSingleSignOnCredential)init
{
  return 0;
}

- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationSingleSignOnCredential;
  v5 = [(ASAuthorizationSingleSignOnCredential *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
    privateKeys = v5->_privateKeys;
    v5->_privateKeys = (NSArray *)v6;

    if (v4) {
      [(ASAuthorizationSingleSignOnCredential *)v5 _initWithAuthenticatedResponse:v4];
    }
    v8 = v5;
  }

  return v5;
}

- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3 privateKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAuthorizationSingleSignOnCredential;
  v8 = [(ASAuthorizationSingleSignOnCredential *)&v13 init];
  if (v8)
  {
    if (v7)
    {
      v9 = (NSArray *)v7;
    }
    else
    {
      v9 = [MEMORY[0x263EFF8C0] array];
    }
    privateKeys = v8->_privateKeys;
    v8->_privateKeys = v9;

    if (v6) {
      [(ASAuthorizationSingleSignOnCredential *)v8 _initWithAuthenticatedResponse:v6];
    }
    v11 = v8;
  }

  return v8;
}

- (void)_initWithAuthenticatedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedResponse, a3);
  id v5 = a3;
  id v6 = [v5 allHeaderFields];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__ASAuthorizationSingleSignOnCredential__initWithAuthenticatedResponse___block_invoke;
  v7[3] = &unk_264396640;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __72__ASAuthorizationSingleSignOnCredential__initWithAuthenticatedResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  if ([v17 isEqualToString:@"state"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v5;
    v8 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v7;
  }
  else if ([v17 isEqualToString:@"access_token"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v5 dataUsingEncoding:4];
      uint64_t v10 = *(void *)(a1 + 32);
      v8 = *(void **)(v10 + 16);
      *(void *)(v10 + 16) = v9;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = v5;
      v8 = *(void **)(v13 + 16);
      *(void *)(v13 + 16) = v14;
    }
  }
  else
  {
    if (![v17 isEqualToString:@"id_token"]) {
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v5 dataUsingEncoding:4];
      uint64_t v12 = *(void *)(a1 + 32);
      v8 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = v5;
      v8 = *(void **)(v15 + 24);
      *(void *)(v15 + 24) = v16;
    }
  }

LABEL_15:
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p, state: %@, accessToken: %@, identityToken: %@, authorizedScopes: %@, authenticatedResponse: %@, privateKeys: %@>", v5, self, self->_state, self->_accessToken, self->_identityToken, self->_authorizedScopes, self->_authenticatedResponse, self->_privateKeys];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)state
{
  return self->_state;
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (NSArray)authorizedScopes
{
  return self->_authorizedScopes;
}

- (NSHTTPURLResponse)authenticatedResponse
{
  return self->_authenticatedResponse;
}

- (NSArray)privateKeys
{
  return self->_privateKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);
  objc_storeStrong((id *)&self->_authenticatedResponse, 0);
  objc_storeStrong((id *)&self->_authorizedScopes, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end