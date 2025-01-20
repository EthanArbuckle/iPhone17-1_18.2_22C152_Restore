@interface HKOAuth2Credential
+ (BOOL)supportsSecureCoding;
+ (id)expirationFromTimeInterval:(double)a3;
+ (id)scopeStringFromScopes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4;
- (BOOL)isExpired;
- (HKOAuth2Credential)init;
- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopeString:(id)a7;
- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7;
- (HKOAuth2Credential)initWithCoder:(id)a3;
- (NSDate)expiration;
- (NSSet)scopes;
- (NSString)accessToken;
- (NSString)refreshToken;
- (NSString)requestedScopeString;
- (NSString)scopeString;
- (id)description;
- (unint64_t)hash;
- (void)_commonInitWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOAuth2Credential

- (HKOAuth2Credential)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopeString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    a7 = +[HKOAuth2ScopeSet scopesFromScopeString:a7];
  }
  v16 = [(HKOAuth2Credential *)self initWithAccessToken:v12 refreshToken:v13 expiration:v14 requestedScopeString:v15 scopes:a7];

  return v16;
}

- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKOAuth2Credential;
  v17 = [(HKOAuth2Credential *)&v20 init];
  v18 = v17;
  if (v17) {
    [(HKOAuth2Credential *)v17 _commonInitWithAccessToken:v12 refreshToken:v13 expiration:v14 requestedScopeString:v15 scopes:v16];
  }

  return v18;
}

- (void)_commonInitWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = (NSString *)[a3 copy];
  accessToken = self->_accessToken;
  self->_accessToken = v16;

  v18 = (NSString *)[v15 copy];
  refreshToken = self->_refreshToken;
  self->_refreshToken = v18;

  objc_super v20 = (NSDate *)[v14 copy];
  expiration = self->_expiration;
  self->_expiration = v20;

  v22 = (NSString *)[v13 copy];
  requestedScopeString = self->_requestedScopeString;
  self->_requestedScopeString = v22;

  v24 = (NSSet *)[v12 copy];
  scopes = self->_scopes;
  self->_scopes = v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKOAuth2Credential *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(HKOAuth2Credential *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HKOAuth2Credential *)self isEqualToCredential:v4 epsilonExpiration:0.0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4
{
  id v6 = a3;
  v7 = [(HKOAuth2Credential *)self expiration];
  v8 = [v6 expiration];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  accessToken = self->_accessToken;
  id v12 = [v6 accessToken];
  if (accessToken != v12)
  {
    uint64_t v13 = [v6 accessToken];
    if (!v13)
    {
      char v22 = 0;
      goto LABEL_35;
    }
    v8 = (void *)v13;
    id v14 = self->_accessToken;
    id v15 = [v6 accessToken];
    if (![(NSString *)v14 isEqualToString:v15])
    {
      char v22 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v43 = v15;
  }
  refreshToken = self->_refreshToken;
  v17 = [v6 refreshToken];
  if (refreshToken != v17)
  {
    uint64_t v18 = [v6 refreshToken];
    if (!v18)
    {
      char v22 = 0;
      goto LABEL_39;
    }
    v19 = (void *)v18;
    objc_super v20 = self->_refreshToken;
    v21 = [v6 refreshToken];
    if (![(NSString *)v20 isEqualToString:v21])
    {

      char v22 = 0;
      goto LABEL_33;
    }
    v41 = v21;
    v42 = v19;
  }
  double v23 = fabs(v10);
  requestedScopeString = self->_requestedScopeString;
  v25 = [v6 requestedScopeString];
  if (requestedScopeString == v25)
  {
    if (v23 <= a4) {
      goto LABEL_22;
    }
LABEL_18:
    char v22 = 0;
    goto LABEL_30;
  }
  uint64_t v26 = [v6 requestedScopeString];
  if (!v26) {
    goto LABEL_18;
  }
  v40 = (void *)v26;
  v27 = self->_requestedScopeString;
  uint64_t v28 = [v6 requestedScopeString];
  v29 = v27;
  v30 = (void *)v28;
  if (![(NSString *)v29 isEqualToString:v28])
  {

    char v22 = 0;
    goto LABEL_37;
  }
  if (v23 > a4)
  {
    char v22 = 0;
LABEL_29:

LABEL_30:
    if (refreshToken != v17)
    {
    }
    goto LABEL_32;
  }
  v38 = v30;
LABEL_22:
  scopes = self->_scopes;
  uint64_t v32 = [v6 scopes];
  if (scopes == (NSSet *)v32)
  {

    char v22 = 1;
    goto LABEL_28;
  }
  v39 = (void *)v32;
  uint64_t v33 = [v6 scopes];
  if (!v33)
  {

    char v22 = 0;
LABEL_28:
    v30 = v38;
    if (requestedScopeString == v25) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  v34 = self->_scopes;
  v37 = (void *)v33;
  v35 = [v6 scopes];
  char v22 = [(NSSet *)v34 isEqual:v35];

  if (requestedScopeString == v25)
  {
  }
  else
  {
  }
LABEL_37:
  if (refreshToken != v17)
  {

LABEL_39:
    id v15 = v43;

    if (accessToken == v12) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_32:

LABEL_33:
  id v15 = v43;
  if (accessToken != v12) {
    goto LABEL_34;
  }
LABEL_35:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessToken hash];
  NSUInteger v4 = [(NSString *)self->_refreshToken hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_requestedScopeString hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_expiration hash];
  return v6 ^ [(NSSet *)self->_scopes hash];
}

- (void)encodeWithCoder:(id)a3
{
  accessToken = self->_accessToken;
  id v5 = a3;
  [v5 encodeObject:accessToken forKey:@"accessToken"];
  [v5 encodeObject:self->_refreshToken forKey:@"refreshToken"];
  [v5 encodeObject:self->_expiration forKey:@"expiration"];
  [v5 encodeObject:self->_scopes forKey:@"scopes"];
  [v5 encodeObject:self->_requestedScopeString forKey:@"requestedScopeString"];
}

- (HKOAuth2Credential)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessToken"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshToken"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  double v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"scopes"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedScopeString"];
  if (v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)HKOAuth2Credential;
    uint64_t v13 = [(HKOAuth2Credential *)&v17 init];
    id v14 = v13;
    if (v13) {
      [(HKOAuth2Credential *)v13 _commonInitWithAccessToken:v5 refreshToken:v6 expiration:v7 requestedScopeString:v12 scopes:v11];
    }
    self = v14;
    id v15 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExpired
{
  NSUInteger v3 = [(HKOAuth2Credential *)self accessToken];
  if (v3)
  {
  }
  else
  {
    uint64_t v9 = [(HKOAuth2Credential *)self refreshToken];

    if (v9) {
      return 1;
    }
  }
  id v4 = [(HKOAuth2Credential *)self expiration];

  if (!v4) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v6 = [(HKOAuth2Credential *)self expiration];
  char v7 = objc_msgSend(v6, "hk_isBeforeDate:", v5);

  return v7;
}

- (NSString)scopeString
{
  if (self->_scopes)
  {
    v2 = [(id)objc_opt_class() scopeStringFromScopes:self->_scopes];
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (id)description
{
  NSUInteger v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = HKStringFromBool();
  char v7 = HKStringFromBool();
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; has access token: %@, has refresh token: %@, expiration: %@, scopes: %lu>",
    v5,
    self,
    v6,
    v7,
    self->_expiration,
  v8 = [(NSSet *)self->_scopes count]);

  return v8;
}

+ (id)expirationFromTimeInterval:(double)a3
{
  return (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
}

+ (id)scopeStringFromScopes:(id)a3
{
  NSUInteger v3 = [a3 allObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_10];

  id v5 = [v4 componentsJoinedByString:@" "];

  return v5;
}

uint64_t __44__HKOAuth2Credential_scopeStringFromScopes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSSet)scopes
{
  return self->_scopes;
}

- (NSString)requestedScopeString
{
  return self->_requestedScopeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedScopeString, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);

  objc_storeStrong((id *)&self->_scopes, 0);
}

@end