@interface AKAuthorizationCredential(AuthenticationServicesExtras)
- (ASAuthorizationAppleIDCredential)authenticationServicesCredential;
- (id)_credentialScopes;
@end

@implementation AKAuthorizationCredential(AuthenticationServicesExtras)

- (ASAuthorizationAppleIDCredential)authenticationServicesCredential
{
  v2 = [ASAuthorizationAppleIDCredential alloc];
  v3 = [a1 userIdentifier];
  v4 = [a1 _credentialScopes];
  v5 = [(ASAuthorizationAppleIDCredential *)v2 initWithUser:v3 authorizedScopes:v4];

  v6 = [a1 identityToken];
  [(ASAuthorizationAppleIDCredential *)v5 setIdentityToken:v6];

  v7 = [a1 authorizationCode];
  [(ASAuthorizationAppleIDCredential *)v5 setAuthorizationCode:v7];

  v8 = [a1 state];
  [(ASAuthorizationAppleIDCredential *)v5 setState:v8];

  v9 = [a1 userInformation];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 selectedEmail];
    [(ASAuthorizationAppleIDCredential *)v5 setEmail:v11];

    id v12 = objc_alloc_init(MEMORY[0x263F08A68]);
    v13 = [v10 familyName];
    [v12 setFamilyName:v13];

    v14 = [v10 givenName];
    [v12 setGivenName:v14];

    [(ASAuthorizationAppleIDCredential *)v5 setFullName:v12];
    if (objc_opt_respondsToSelector()) {
      -[ASAuthorizationAppleIDCredential setUserAgeRange:](v5, "setUserAgeRange:", [v10 userAgeRange]);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    if ([a1 isLikelyRealUser]) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    [(ASAuthorizationAppleIDCredential *)v5 setRealUserStatus:v15];
  }

  return v5;
}

- (id)_credentialScopes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  v3 = [a1 authorizedScopes];
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "authorizedScopes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x263F29020];
    uint64_t v10 = *MEMORY[0x263F29018];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [v12 isEqualToString:v9];
        v14 = @"full_name";
        if ((v13 & 1) == 0)
        {
          int v15 = [v12 isEqualToString:v10];
          v14 = @"email";
          if (!v15) {
            continue;
          }
        }
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v16 = (void *)[v4 copy];

  return v16;
}

@end