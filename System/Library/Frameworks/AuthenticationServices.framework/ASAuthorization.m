@interface ASAuthorization
+ (ASAuthorization)new;
+ (id)authorizationFromCredential:(id)a3;
- (ASAuthorization)init;
- (ASAuthorization)initWithCorePlatformKeyCredentialAssertion:(id)a3;
- (ASAuthorization)initWithCorePlatformKeyCredentialRegistration:(id)a3;
- (ASAuthorization)initWithProvider:(id)a3 credential:(id)a4;
- (id)credential;
- (id)debugDescription;
- (id)description;
- (id)provider;
@end

@implementation ASAuthorization

+ (ASAuthorization)new
{
  return 0;
}

- (ASAuthorization)init
{
  return 0;
}

- (ASAuthorization)initWithProvider:(id)a3 credential:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorization;
  v9 = [(ASAuthorization *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_credential, a4);
  }

  return v10;
}

- (ASAuthorization)initWithCorePlatformKeyCredentialAssertion:(id)a3
{
  id v4 = a3;
  v5 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
  v6 = [v4 relyingPartyIdentifier];
  id v7 = [(ASAuthorizationPlatformPublicKeyCredentialProvider *)v5 initWithRelyingPartyIdentifier:v6];

  id v8 = [[ASAuthorizationPlatformPublicKeyCredentialAssertion alloc] initWithCoreCredential:v4];
  v9 = [(ASAuthorization *)self initWithProvider:v7 credential:v8];

  return v9;
}

- (ASAuthorization)initWithCorePlatformKeyCredentialRegistration:(id)a3
{
  id v4 = a3;
  v5 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
  v6 = [v4 relyingPartyIdentifier];
  id v7 = [(ASAuthorizationPlatformPublicKeyCredentialProvider *)v5 initWithRelyingPartyIdentifier:v6];

  id v8 = [[ASAuthorizationPlatformPublicKeyCredentialRegistration alloc] initWithCoreCredential:v4];
  v9 = [(ASAuthorization *)self initWithProvider:v7 credential:v8];

  return v9;
}

+ (id)authorizationFromCredential:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(ASAuthorizationPasswordProvider);
    id v5 = v3;
    v6 = [ASPasswordCredential alloc];
    id v7 = [v5 user];
    id v8 = [v5 password];

    v9 = [(ASPasswordCredential *)v6 initWithUser:v7 password:v8];
LABEL_15:

    v21 = [[ASAuthorization alloc] initWithProvider:v4 credential:v9];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(ASAuthorizationAppleIDProvider);
    v10 = [v3 authorization];
    id v7 = [v10 credential];

    uint64_t v11 = [v7 authenticationServicesCredential];
LABEL_14:
    v9 = (ASPasswordCredential *)v11;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    objc_super v12 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
    v13 = [v7 relyingPartyIdentifier];
    id v4 = [(ASAuthorizationPlatformPublicKeyCredentialProvider *)v12 initWithRelyingPartyIdentifier:v13];

    v14 = ASAuthorizationPlatformPublicKeyCredentialAssertion;
LABEL_13:
    uint64_t v11 = [[v14 alloc] initWithCoreCredential:v7];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    v15 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
    v16 = [v7 relyingPartyIdentifier];
    id v4 = [(ASAuthorizationPlatformPublicKeyCredentialProvider *)v15 initWithRelyingPartyIdentifier:v16];

    v14 = ASAuthorizationPlatformPublicKeyCredentialRegistration;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    v17 = [ASAuthorizationSecurityKeyPublicKeyCredentialProvider alloc];
    v18 = [v7 relyingPartyIdentifier];
    id v4 = [(ASAuthorizationSecurityKeyPublicKeyCredentialProvider *)v17 initWithRelyingPartyIdentifier:v18];

    v14 = ASAuthorizationSecurityKeyPublicKeyCredentialAssertion;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    v19 = [ASAuthorizationSecurityKeyPublicKeyCredentialProvider alloc];
    v20 = [v7 relyingPartyIdentifier];
    id v4 = [(ASAuthorizationSecurityKeyPublicKeyCredentialProvider *)v19 initWithRelyingPartyIdentifier:v20];

    v14 = ASAuthorizationSecurityKeyPublicKeyCredentialRegistration;
    goto LABEL_13;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[ASAuthorization authorizationFromCredential:](v23);
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p { provider: %@ }>", v5, self, self->_provider];

  return v6;
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p { provider: %@, credential: %@ }>", v5, self, self->_provider, self->_credential];

  return v6;
}

- (id)provider
{
  return self->_provider;
}

- (id)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

+ (void)authorizationFromCredential:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v2 = 138477827;
  uint64_t v3 = objc_opt_class();
  _os_log_error_impl(&dword_21918F000, v1, OS_LOG_TYPE_ERROR, "Found credential of unexpected type: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end