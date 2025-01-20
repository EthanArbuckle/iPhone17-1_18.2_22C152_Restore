@interface ECAuthScheme
+ (NSArray)knownSchemes;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)schemeWithApplescriptScheme:(unsigned int)a3;
+ (id)schemeWithName:(id)a3;
- (BOOL)requiresPassword;
- (BOOL)requiresUsername;
- (NSSet)supportedSASLMechanisms;
- (NSString)humanReadableName;
- (NSString)name;
- (unsigned)applescriptScheme;
@end

@implementation ECAuthScheme

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    [NSString stringWithFormat:@"Cannot directly allocate a %@ object, use +knownSchemes, +schemeWithName:, or +authSchemesForAccount:connection: instead.", a1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ECAuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (NSArray)knownSchemes
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v13 = +[ECExternalAuthScheme externalAuthScheme];
  v14[0] = v13;
  v2 = +[ECGSSAPIAuthScheme gssapiAuthScheme];
  v14[1] = v2;
  v3 = +[ECAppleTokenAuthScheme appleTokenAuthScheme];
  v14[2] = v3;
  v4 = +[ECAppleToken2AuthScheme appleToken2AuthScheme];
  v14[3] = v4;
  v5 = +[ECOAuth2AuthScheme oauth2AuthScheme];
  v14[4] = v5;
  id v6 = +[ECNTLMAuthScheme ntlmAuthScheme];
  v14[5] = v6;
  objc_super v7 = +[ECDigestMD5AuthScheme digestMD5AuthScheme];
  v14[6] = v7;
  v8 = +[ECCramMD5AuthScheme cramMD5AuthScheme];
  v14[7] = v8;
  v9 = +[ECAPOPAuthScheme apopAuthScheme];
  v14[8] = v9;
  v10 = +[ECPlainAuthScheme plainAuthScheme];
  v14[9] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return (NSArray *)v11;
}

+ (id)schemeWithName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || [v4 isEqualToString:&stru_1F1A635E8])
  {
    uint64_t v6 = +[ECPlainAuthScheme plainAuthScheme];
LABEL_4:
    id v7 = (id)v6;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"X-APOP"])
  {
    uint64_t v6 = +[ECAPOPAuthScheme apopAuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"CRAM-MD5"])
  {
    uint64_t v6 = +[ECCramMD5AuthScheme cramMD5AuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"DIGEST-MD5"])
  {
    uint64_t v6 = +[ECDigestMD5AuthScheme digestMD5AuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"NTLM"])
  {
    uint64_t v6 = +[ECNTLMAuthScheme ntlmAuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"ATOKEN"])
  {
    uint64_t v6 = +[ECAppleTokenAuthScheme appleTokenAuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"ATOKEN2"])
  {
    uint64_t v6 = +[ECAppleToken2AuthScheme appleToken2AuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"XOAUTH2"])
  {
    uint64_t v6 = +[ECOAuth2AuthScheme oauth2AuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"GSSAPI"])
  {
    uint64_t v6 = +[ECGSSAPIAuthScheme gssapiAuthScheme];
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"EXTERNAL"])
  {
    uint64_t v6 = +[ECExternalAuthScheme externalAuthScheme];
    goto LABEL_4;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = objc_msgSend(a1, "knownSchemes", 0);
  id v7 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v9);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 supportedSASLMechanisms];
        char v14 = [v13 containsObject:v5];

        if (v14)
        {
          id v7 = v12;
          goto LABEL_36;
        }
      }
      id v7 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_36:

LABEL_5:
  return v7;
}

+ (id)schemeWithApplescriptScheme:(unsigned int)a3
{
  v3 = 0;
  if ((int)a3 <= 1635279731)
  {
    switch(a3)
    {
      case 0x6161706Fu:
        v3 = +[ECAPOPAuthScheme apopAuthScheme];
        break;
      case 0x61746F32u:
        v3 = +[ECAppleToken2AuthScheme appleToken2AuthScheme];
        break;
      case 0x61746F6Bu:
        v3 = +[ECAppleTokenAuthScheme appleTokenAuthScheme];
        break;
    }
  }
  else if ((int)a3 > 1635282275)
  {
    if (a3 == 1635282276)
    {
      v3 = +[ECCramMD5AuthScheme cramMD5AuthScheme];
    }
    else if (a3 == 1635282548)
    {
      v3 = +[ECNTLMAuthScheme ntlmAuthScheme];
    }
  }
  else if (a3 == 1635279732)
  {
    v3 = +[ECPlainAuthScheme plainAuthScheme];
  }
  else if (a3 == 1635281717)
  {
    v3 = +[ECGSSAPIAuthScheme gssapiAuthScheme];
  }
  return v3;
}

- (BOOL)requiresUsername
{
  return 1;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (NSSet)supportedSASLMechanisms
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSString)name
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ECAuthScheme.m" lineNumber:152 description:@"Subclass must implement."];

  return (NSString *)&stru_1F1A635E8;
}

- (NSString)humanReadableName
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ECAuthScheme.m" lineNumber:157 description:@"Subclass must implement."];

  return (NSString *)&stru_1F1A635E8;
}

- (unsigned)applescriptScheme
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ECAuthScheme.m" lineNumber:162 description:@"Subclass must implement."];

  return 1635284334;
}

@end