@interface CPSAppSignInRequest
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationRequest)appleIDRequest;
- (AKPasswordRequest)passwordRequest;
- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions;
- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions;
- (BOOL)_isPlatformKeyOnlyRequest;
- (BOOL)hasAnyNonPasskeyRegistrationRequest;
- (BOOL)isAppleIDOnlyRequest;
- (BOOL)isEmpty;
- (BOOL)isPasskeyRegistrationRequest;
- (BOOL)isPasskeyRequest;
- (BOOL)isWebAuthRequest;
- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordReqeust:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6;
- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordRequest:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6;
- (CPSAppSignInRequest)initWithCoder:(id)a3;
- (CPSAppSignInRequest)initWithRequests:(id)a3;
- (CPSAppSignInRequest)initWithWebRequest:(id)a3;
- (CPSWebRequest)webRequest;
- (NSArray)customAuthenticationMethods;
- (NSString)overrideBundleIdentifier;
- (id)description;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomAuthenticationMethods:(id)a3;
- (void)setOverrideBundleIdentifier:(id)a3;
@end

@implementation CPSAppSignInRequest

- (CPSAppSignInRequest)initWithRequests:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppSignInRequest;
  v5 = [(CPSAuthenticationRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__CPSAppSignInRequest_initWithRequests___block_invoke;
    v8[3] = &unk_26528A178;
    v9 = v5;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  return v6;
}

void __40__CPSAppSignInRequest_initWithRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4[2])
  {
LABEL_8:
    if (!v4[3])
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2050000000;
      v17 = (void *)getASAuthorizationPasswordRequestClass_softClass;
      uint64_t v33 = getASAuthorizationPasswordRequestClass_softClass;
      if (!getASAuthorizationPasswordRequestClass_softClass)
      {
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3221225472;
        v27 = __getASAuthorizationPasswordRequestClass_block_invoke;
        v28 = &unk_26528A1A0;
        v29 = &v30;
        __getASAuthorizationPasswordRequestClass_block_invoke((uint64_t)&v25);
        v17 = (void *)v31[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v30, 8);
      if (objc_opt_isKindOfClass())
      {
        id v19 = objc_alloc_init(MEMORY[0x263F29228]);
        uint64_t v20 = *(void *)(a1 + 32);
        v16 = *(void **)(v20 + 24);
        *(void *)(v20 + 24) = v19;
        goto LABEL_22;
      }
      id v4 = *(void **)(a1 + 32);
    }
    uint64_t v21 = 48;
    if (!v4[6])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [v3 coreCredentialAssertionOptions];
LABEL_21:
        uint64_t v23 = *(void *)(a1 + 32);
        v16 = *(void **)(v23 + v21);
        *(void *)(v23 + v21) = v22;
        goto LABEL_22;
      }
      id v4 = *(void **)(a1 + 32);
    }
    uint64_t v21 = 56;
    if (v4[7]) {
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v22 = [v3 coreCredentialCreationOptions];
    goto LABEL_21;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v5 = (void *)getASAuthorizationAppleIDRequestClass_softClass;
  uint64_t v33 = getASAuthorizationAppleIDRequestClass_softClass;
  if (!getASAuthorizationAppleIDRequestClass_softClass)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getASAuthorizationAppleIDRequestClass_block_invoke;
    v28 = &unk_26528A1A0;
    v29 = &v30;
    __getASAuthorizationAppleIDRequestClass_block_invoke((uint64_t)&v25);
    v5 = (void *)v31[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v30, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    goto LABEL_8;
  }
  id v7 = v3;
  if (v7)
  {
    v8 = v7;
    id v9 = objc_alloc_init(MEMORY[0x263F29160]);
    objc_super v10 = [v8 user];
    [v9 setUserIdentifier:v10];

    v11 = [v8 state];
    [v9 setState:v11];

    v12 = [v8 nonce];
    [v9 setNonce:v12];

    v13 = [v8 requestedScopes];
    v14 = objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_1);
    [v9 setRequestedScopes:v14];

    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 16);
    *(void *)(v15 + 16) = v9;
LABEL_22:

LABEL_23:
    return;
  }
  v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"inRequest"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __40__CPSAppSignInRequest_initWithRequests___block_invoke_cold_1((uint64_t)v24);
  }
  [v24 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (CPSAppSignInRequest)initWithWebRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)CPSAppSignInRequest;
    v8 = [(CPSAuthenticationRequest *)&v12 init];
    id v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_webRequest, a3);
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"webRequest != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(CPSAppSignInRequest *)a2 initWithWebRequest:(uint64_t)v11];
    }
    [v11 UTF8String];
    result = (CPSAppSignInRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordRequest:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPSAppSignInRequest;
  uint64_t v15 = [(CPSAuthenticationRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleIDRequest, a3);
    objc_storeStrong((id *)&v16->_passwordRequest, a4);
    objc_storeStrong((id *)&v16->_platformKeyCredentialAssertionOptions, a5);
    objc_storeStrong((id *)&v16->_platformKeyCredentialRegistrationOptions, a6);
  }

  return v16;
}

- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordReqeust:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPSAppSignInRequest;
  uint64_t v15 = [(CPSAuthenticationRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleIDRequest, a3);
    objc_storeStrong((id *)&v16->_passwordRequest, a4);
    objc_storeStrong((id *)&v16->_platformKeyCredentialAssertionOptions, a5);
    objc_storeStrong((id *)&v16->_platformKeyCredentialRegistrationOptions, a6);
  }

  return v16;
}

- (id)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_appleIDRequest withName:@"appleIDRequest" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_passwordRequest withName:@"passwordRequest" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_webRequest withName:@"webRequest" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_platformKeyCredentialAssertionOptions withName:@"platformKeyCredentialAssertionOptions" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_platformKeyCredentialRegistrationOptions withName:@"platformKeyCredentialRegistrationOptions" skipIfNil:1];
  id v9 = (id)[v3 appendObject:self->_customAuthenticationMethods withName:@"customAuthenticationMethods" skipIfNil:1];
  [v3 appendString:self->_overrideBundleIdentifier withName:@"overrideBundleIdentifier" skipIfEmpty:1];
  objc_super v10 = [v3 build];

  return v10;
}

- (int64_t)authType
{
  if (self->_webRequest) {
    return 5;
  }
  if ([(CPSAppSignInRequest *)self _isPlatformKeyOnlyRequest]) {
    return 6;
  }
  return 2;
}

- (BOOL)isAppleIDOnlyRequest
{
  return self->_appleIDRequest
      && !self->_passwordRequest
      && !self->_webRequest
      && !self->_platformKeyCredentialAssertionOptions
      && self->_platformKeyCredentialRegistrationOptions == 0;
}

- (BOOL)isEmpty
{
  return !self->_appleIDRequest
      && !self->_passwordRequest
      && !self->_webRequest
      && !self->_platformKeyCredentialAssertionOptions
      && self->_platformKeyCredentialRegistrationOptions == 0;
}

- (BOOL)isWebAuthRequest
{
  return self->_webRequest != 0;
}

- (BOOL)_isPlatformKeyOnlyRequest
{
  return (self->_platformKeyCredentialAssertionOptions || self->_platformKeyCredentialRegistrationOptions)
      && !self->_appleIDRequest
      && !self->_passwordRequest
      && self->_webRequest == 0;
}

- (BOOL)isPasskeyRequest
{
  return self->_platformKeyCredentialAssertionOptions || self->_platformKeyCredentialRegistrationOptions != 0;
}

- (BOOL)isPasskeyRegistrationRequest
{
  return self->_platformKeyCredentialRegistrationOptions != 0;
}

- (BOOL)hasAnyNonPasskeyRegistrationRequest
{
  return self->_platformKeyCredentialAssertionOptions
      || self->_appleIDRequest
      || self->_passwordRequest
      || self->_webRequest != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSAppSignInRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CPSAppSignInRequest;
  id v5 = [(CPSAuthenticationRequest *)&v28 initWithCoder:v4];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"appleIDRequest"];
    appleIDRequest = v5->_appleIDRequest;
    v5->_appleIDRequest = (AKAuthorizationRequest *)v7;

    id v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"passwordRequest"];
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v10;

    id v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"webRequest"];
    webRequest = v5->_webRequest;
    v5->_webRequest = (CPSWebRequest *)v13;

    uint64_t v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"platformKeyCredentialAssertionOptions"];
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v16;

    objc_super v18 = self;
    uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"platformKeyCredentialRegistrationOptions"];
    platformKeyCredentialRegistrationOptions = v5->_platformKeyCredentialRegistrationOptions;
    v5->_platformKeyCredentialRegistrationOptions = (ASCPublicKeyCredentialCreationOptions *)v19;

    uint64_t v21 = self;
    uint64_t v22 = [v4 decodeArrayOfObjectsOfClass:v21 forKey:@"customAuthenticationMethods"];
    customAuthenticationMethods = v5->_customAuthenticationMethods;
    v5->_customAuthenticationMethods = (NSArray *)v22;

    v24 = self;
    uint64_t v25 = [v4 decodeObjectOfClass:v24 forKey:@"overrideBundleIdentifier"];
    overrideBundleIdentifier = v5->_overrideBundleIdentifier;
    v5->_overrideBundleIdentifier = (NSString *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSAppSignInRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appleIDRequest, @"appleIDRequest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passwordRequest forKey:@"passwordRequest"];
  [v4 encodeObject:self->_webRequest forKey:@"webRequest"];
  [v4 encodeObject:self->_platformKeyCredentialAssertionOptions forKey:@"platformKeyCredentialAssertionOptions"];
  [v4 encodeObject:self->_platformKeyCredentialRegistrationOptions forKey:@"platformKeyCredentialRegistrationOptions"];
  [v4 encodeObject:self->_customAuthenticationMethods forKey:@"customAuthenticationMethods"];
  [v4 encodeObject:self->_overrideBundleIdentifier forKey:@"overrideBundleIdentifier"];
}

- (AKAuthorizationRequest)appleIDRequest
{
  return self->_appleIDRequest;
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (NSArray)customAuthenticationMethods
{
  return self->_customAuthenticationMethods;
}

- (void)setCustomAuthenticationMethods:(id)a3
{
}

- (CPSWebRequest)webRequest
{
  return self->_webRequest;
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions
{
  return self->_platformKeyCredentialRegistrationOptions;
}

- (NSString)overrideBundleIdentifier
{
  return self->_overrideBundleIdentifier;
}

- (void)setOverrideBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistrationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_webRequest, 0);
  objc_storeStrong((id *)&self->_customAuthenticationMethods, 0);
  objc_storeStrong((id *)&self->_passwordRequest, 0);
  objc_storeStrong((id *)&self->_appleIDRequest, 0);
}

void __40__CPSAppSignInRequest_initWithRequests___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithUTF8String:"AKAuthorizationRequest *_CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest(ASAuthorizationAppleIDRequest *__strong)"];
  int v3 = 138544130;
  id v4 = v2;
  __int16 v5 = 2114;
  id v6 = @"CPSAppSignInRequest.m";
  __int16 v7 = 1024;
  int v8 = 28;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

- (void)initWithWebRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  __int16 v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  __int16 v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"CPSAppSignInRequest.m";
  __int16 v16 = 1024;
  int v17 = 89;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end