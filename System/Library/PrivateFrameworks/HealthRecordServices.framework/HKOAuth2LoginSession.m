@interface HKOAuth2LoginSession
+ (BOOL)supportsSecureCoding;
+ (id)generatePKCEChallengeFromVerifier:(id)a3 algorithm:(int64_t)a4 error:(id *)a5;
+ (id)generatePKCEVerifierWithAlgorithm:(int64_t)a3;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (HKOAuth2LoginSession)init;
- (HKOAuth2LoginSession)initWithCoder:(id)a3;
- (HKOAuth2LoginSession)initWithState:(id)a3 loginURL:(id)a4 callbackURLComponents:(id)a5 requestedScope:(id)a6 pkceVerifier:(id)a7;
- (NSString)pkceVerifier;
- (NSString)requestedScope;
- (NSURL)loginURL;
- (NSURLComponents)callbackURLComponents;
- (NSUUID)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOAuth2LoginSession

- (HKOAuth2LoginSession)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)new
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF4A0];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HKOAuth2LoginSession)initWithState:(id)a3 loginURL:(id)a4 callbackURLComponents:(id)a5 requestedScope:(id)a6 pkceVerifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKOAuth2LoginSession;
  v17 = [(HKOAuth2LoginSession *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    state = v17->_state;
    v17->_state = (NSUUID *)v18;

    uint64_t v20 = [v13 copy];
    loginURL = v17->_loginURL;
    v17->_loginURL = (NSURL *)v20;

    uint64_t v22 = [v14 copy];
    callbackURLComponents = v17->_callbackURLComponents;
    v17->_callbackURLComponents = (NSURLComponents *)v22;

    uint64_t v24 = [v15 copy];
    requestedScope = v17->_requestedScope;
    v17->_requestedScope = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    pkceVerifier = v17->_pkceVerifier;
    v17->_pkceVerifier = (NSString *)v26;
  }
  return v17;
}

+ (id)generatePKCEVerifierWithAlgorithm:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EFF990] dataWithLength:32];
    uint64_t v4 = (const __SecRandom *)*MEMORY[0x263F17510];
    size_t v5 = [v3 length];
    id v6 = v3;
    if (SecRandomCopyBytes(v4, v5, (void *)[v6 mutableBytes]))
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_FAULT)) {
        +[HKOAuth2LoginSession generatePKCEVerifierWithAlgorithm:](v7);
      }
      v8 = [MEMORY[0x263F08C38] UUID];
      v9 = [v8 UUIDString];
    }
    else
    {
      v9 = objc_msgSend(v6, "hk_base64URLEncodedString");
    }
  }

  return v9;
}

+ (id)generatePKCEChallengeFromVerifier:(id)a3 algorithm:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if ([v7 length])
  {
    if (a4 == 2)
    {
      v9 = [v7 dataUsingEncoding:4];
      v10 = objc_msgSend(v9, "hk_SHA256");
      objc_msgSend(v10, "hk_base64URLEncodedString");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4 == 1)
    {
      v8 = (__CFString *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 125, @"PKCE algorithm %lu not implemented", a4);
      v8 = 0;
    }
  }
  else
  {
    v8 = &stru_26D44DC88;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  size_t v5 = (HKOAuth2LoginSession *)a3;
  id v6 = v5;
  if (self != v5)
  {
    id v7 = v5;
    if (![(HKOAuth2LoginSession *)v7 isMemberOfClass:objc_opt_class()])
    {
      char v14 = 0;
LABEL_53:

      goto LABEL_54;
    }
    state = self->_state;
    v9 = [(HKOAuth2LoginSession *)v7 state];
    if (state != v9)
    {
      uint64_t v10 = [(HKOAuth2LoginSession *)v7 state];
      if (!v10)
      {
        char v14 = 0;
        goto LABEL_52;
      }
      v11 = (void *)v10;
      id v12 = self->_state;
      id v13 = [(HKOAuth2LoginSession *)v7 state];
      if (![(NSUUID *)v12 isEqual:v13])
      {
        char v14 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v58 = v11;
      v57 = v13;
    }
    loginURL = self->_loginURL;
    id v16 = [(HKOAuth2LoginSession *)v7 loginURL];
    if (loginURL != v16)
    {
      uint64_t v17 = [(HKOAuth2LoginSession *)v7 loginURL];
      if (!v17)
      {
LABEL_32:

LABEL_33:
        char v14 = 0;
        goto LABEL_50;
      }
      v56 = (void *)v17;
      uint64_t v18 = self->_loginURL;
      uint64_t v3 = [(HKOAuth2LoginSession *)v7 loginURL];
      if (([(NSURL *)v18 isEqual:v3] & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    callbackURLComponents = self->_callbackURLComponents;
    uint64_t v20 = [(HKOAuth2LoginSession *)v7 callbackURLComponents];
    v55 = callbackURLComponents;
    if (callbackURLComponents == v20)
    {
      v54 = loginURL;
      v27 = v16;
    }
    else
    {
      uint64_t v21 = [(HKOAuth2LoginSession *)v7 callbackURLComponents];
      if (!v21)
      {
        v53 = v3;
        char v14 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v21;
      v54 = loginURL;
      uint64_t v22 = v20;
      v23 = self->_callbackURLComponents;
      uint64_t v24 = [(HKOAuth2LoginSession *)v7 callbackURLComponents];
      v25 = v23;
      uint64_t v26 = (void *)v24;
      if (([(NSURLComponents *)v25 isEqual:v24] & 1) == 0)
      {

        if (loginURL == v16)
        {

          goto LABEL_33;
        }
        goto LABEL_31;
      }
      v27 = v16;
      v48 = v26;
      uint64_t v20 = v22;
    }
    requestedScope = self->_requestedScope;
    uint64_t v29 = [(HKOAuth2LoginSession *)v7 requestedScope];
    v30 = (void *)v29;
    v51 = requestedScope;
    v53 = v3;
    if (requestedScope == (NSString *)v29)
    {
      v49 = (NSString *)v29;
      v50 = v20;
      id v16 = v27;
    }
    else
    {
      uint64_t v31 = [(HKOAuth2LoginSession *)v7 requestedScope];
      if (!v31)
      {
        char v14 = 0;
        id v16 = v27;
        loginURL = v54;
        v43 = v55;
        goto LABEL_37;
      }
      v47 = (void *)v31;
      v50 = v20;
      v32 = self->_requestedScope;
      uint64_t v33 = [(HKOAuth2LoginSession *)v7 requestedScope];
      v34 = v32;
      v35 = (void *)v33;
      id v16 = v27;
      if (![(NSString *)v34 isEqualToString:v33])
      {

        char v14 = 0;
        uint64_t v20 = v50;
        loginURL = v54;
        v44 = v55;
        goto LABEL_45;
      }
      v46 = v35;
      v49 = (NSString *)v30;
    }
    pkceVerifier = self->_pkceVerifier;
    uint64_t v37 = [(HKOAuth2LoginSession *)v7 pkceVerifier];
    char v14 = pkceVerifier == (NSString *)v37;
    if (pkceVerifier == (NSString *)v37)
    {

      v30 = v49;
      loginURL = v54;
      if (v51 == v49) {
        goto LABEL_41;
      }
    }
    else
    {
      v38 = (void *)v37;
      uint64_t v39 = [(HKOAuth2LoginSession *)v7 pkceVerifier];
      loginURL = v54;
      if (v39)
      {
        v40 = (void *)v39;
        v41 = self->_pkceVerifier;
        v42 = [(HKOAuth2LoginSession *)v7 pkceVerifier];
        char v14 = [(NSString *)v41 isEqualToString:v42];

        if (v51 == v49)
        {
        }
        else
        {
        }
        goto LABEL_44;
      }

      v30 = v49;
      if (v51 == v49)
      {
LABEL_41:

LABEL_44:
        uint64_t v20 = v50;
        v44 = v55;
LABEL_45:
        if (v44 != v20)
        {
LABEL_46:
        }
LABEL_47:

        if (loginURL != v16)
        {
        }
LABEL_50:
        id v13 = v57;
        v11 = v58;
        if (state != v9) {
          goto LABEL_51;
        }
LABEL_52:

        goto LABEL_53;
      }
    }

    uint64_t v20 = v50;
    v43 = v55;
LABEL_37:

    if (v43 == v20) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  char v14 = 1;
LABEL_54:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_state hash];
  uint64_t v4 = [(NSURL *)self->_loginURL hash] ^ v3;
  uint64_t v5 = [(NSURLComponents *)self->_callbackURLComponents hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_requestedScope hash];
  return v6 ^ [(NSString *)self->_pkceVerifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  state = self->_state;
  id v6 = a3;
  [v6 encodeObject:state forKey:@"state"];
  [v6 encodeObject:self->_loginURL forKey:@"loginURL"];
  uint64_t v5 = [(NSURLComponents *)self->_callbackURLComponents string];
  [v6 encodeObject:v5 forKey:@"callbackURLString"];

  [v6 encodeObject:self->_requestedScope forKey:@"requestedScope"];
  [v6 encodeObject:self->_pkceVerifier forKey:@"pkceVerifier"];
}

- (HKOAuth2LoginSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loginURL"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callbackURLString"];
  v8 = [MEMORY[0x263F08BA0] componentsWithString:v7];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedScope"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pkceVerifier"];
  if (!v5 || !v6 || !v7 || !v9)
  {
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = *MEMORY[0x263F07F70];
    uint64_t v14 = 4865;
LABEL_9:
    id v15 = (void *)[v12 initWithDomain:v13 code:v14 userInfo:0];
    [v4 failWithError:v15];

    v11 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = *MEMORY[0x263F07F70];
    uint64_t v14 = 4866;
    goto LABEL_9;
  }
  self = [(HKOAuth2LoginSession *)self initWithState:v5 loginURL:v6 callbackURLComponents:v8 requestedScope:v9 pkceVerifier:v10];
  v11 = self;
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)state
{
  return self->_state;
}

- (NSURL)loginURL
{
  return self->_loginURL;
}

- (NSURLComponents)callbackURLComponents
{
  return self->_callbackURLComponents;
}

- (NSString)requestedScope
{
  return self->_requestedScope;
}

- (NSString)pkceVerifier
{
  return self->_pkceVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkceVerifier, 0);
  objc_storeStrong((id *)&self->_requestedScope, 0);
  objc_storeStrong((id *)&self->_callbackURLComponents, 0);
  objc_storeStrong((id *)&self->_loginURL, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

+ (void)generatePKCEVerifierWithAlgorithm:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_221D38000, v1, OS_LOG_TYPE_FAULT, "HKOAuth2LoginSession.generatePKCEVerifierWithAlgorithm failed, will fall back to NSUUID. Error: %d", (uint8_t *)v3, 8u);
}

@end