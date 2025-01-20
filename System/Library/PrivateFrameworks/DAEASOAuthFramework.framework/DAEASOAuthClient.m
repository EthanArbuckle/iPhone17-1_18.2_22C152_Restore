@interface DAEASOAuthClient
+ (id)_defaultScopeWithDomainForOAuthType:(unint64_t)a3;
+ (id)_defaultScopeWithoutDomainForOAuthType:(unint64_t)a3 forToken:(BOOL)a4;
+ (id)clientIDForOAuthType:(unint64_t)a3;
+ (id)clientRedirect;
+ (id)clientRedirectForOAuthType:(unint64_t)a3;
+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 forToken:(BOOL)a5 isOnPrem:(BOOL)a6;
+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 isOnPrem:(BOOL)a5;
+ (id)scopeForUpgradingFromBasicCreds;
@end

@implementation DAEASOAuthClient

+ (id)clientIDForOAuthType:(unint64_t)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (a3 != 1)
    {
      v13 = 0;
      goto LABEL_14;
    }
    int v3 = [@"g8e99a:6.0:9:-53g5.8bf4-79:72c8bc433" length];
    MEMORY[0x270FA5388]();
    v5 = (char *)v15 - v4;
    uint64_t v6 = [@"g8e99a:6.0:9:-53g5.8bf4-79:72c8bc433" UTF8String];
    if (v3 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v3;
      do
      {
        v5[v7] = *(unsigned char *)(v6 + v7) - ((v7 + 1) & 1);
        ++v7;
      }
      while (v3 != v7);
      goto LABEL_13;
    }
  }
  else
  {
    int v9 = [@"91:ef870.a438-57cd.99ce-3b3543e71d71" length];
    MEMORY[0x270FA5388]();
    v5 = (char *)v15 - v10;
    uint64_t v11 = [@"91:ef870.a438-57cd.99ce-3b3543e71d71" UTF8String];
    if (v9 >= 1)
    {
      uint64_t v12 = 0;
      uint64_t v8 = v9;
      do
      {
        v5[v12] = *(unsigned char *)(v11 + v12) - ((v12 + 1) & 1);
        ++v12;
      }
      while (v9 != v12);
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
LABEL_13:
  v5[v8] = 0;
  v13 = [NSString stringWithUTF8String:v5];
LABEL_14:
  return v13;
}

+ (id)_defaultScopeWithDomainForOAuthType:(unint64_t)a3
{
  if (a3 == 1) {
    return &unk_26DF81428;
  }
  else {
    return 0;
  }
}

+ (id)_defaultScopeWithoutDomainForOAuthType:(unint64_t)a3 forToken:(BOOL)a4
{
  if (a3)
  {
    if (a3 == 2)
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26DF81470];
      uint64_t v4 = v6;
      if (!a4) {
        [v6 addObjectsFromArray:&unk_26DF81488];
      }
    }
    else if (a3 == 1)
    {
      uint64_t v4 = &unk_26DF81440;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = &unk_26DF81458;
  }
  return v4;
}

+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 isOnPrem:(BOOL)a5
{
  return (id)[a1 defaultScopeForOAuthType:a3 withResourceIdentifier:a4 forToken:1 isOnPrem:a5];
}

+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 forToken:(BOOL)a5 isOnPrem:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v12 = [a1 _defaultScopeWithoutDomainForOAuthType:a3 forToken:v7];
  [v11 addObjectsFromArray:v12];

  if (a6)
  {
    v13 = [a1 _defaultScopeWithDomainForOAuthType:a3];
    [v11 addObjectsFromArray:v13];
  }
  else if (v10)
  {
    v14 = (void *)[objc_alloc(NSURL) initWithString:v10];
    id v15 = objc_alloc_init(MEMORY[0x263F08BA0]);
    v16 = [v14 scheme];
    [v15 setScheme:v16];

    v28 = v14;
    v17 = [v14 host];
    [v15 setHost:v17];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v18 = [a1 _defaultScopeWithDomainForOAuthType:a3];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v24 = [v15 URL];
          v25 = [v24 URLByAppendingPathComponent:v23];
          v26 = [v25 absoluteString];
          [v11 addObject:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
    }
  }
  return v11;
}

+ (id)clientRedirectForOAuthType:(unint64_t)a3
{
  if (a3 == 1)
  {
    int v3 = NSString;
    uint64_t v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    uint64_t v6 = [v3 stringWithFormat:@"%@://%@", v5, @"oauth-redirect"];
  }
  else
  {
    uint64_t v6 = @"urn:ietf:wg:oauth:2.0:oob";
  }
  return v6;
}

+ (id)clientRedirect
{
  return @"urn:ietf:wg:oauth:2.0:oob";
}

+ (id)scopeForUpgradingFromBasicCreds
{
  return &unk_26DF814A0;
}

@end