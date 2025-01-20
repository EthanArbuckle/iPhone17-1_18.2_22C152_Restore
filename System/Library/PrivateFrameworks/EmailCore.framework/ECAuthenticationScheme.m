@interface ECAuthenticationScheme
+ (id)authenticationSchemesForAccount:(id)a3 connection:(id)a4;
+ (id)knownSchemes;
+ (id)schemeWithName:(id)a3;
+ (void)initialize;
+ (void)registerSchemeClass:(Class)a3;
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (BOOL)hasEncryption;
- (BOOL)requiresPassword;
- (Class)authenticatorClass;
- (Class)connectionClassForAccountClass:(Class)a3;
- (NSString)humanReadableName;
- (NSString)name;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
@end

@implementation ECAuthenticationScheme

+ (void)initialize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_schemesByName)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(&unk_1F1A73140, "count"));
    v4 = (void *)_schemesByName;
    _schemesByName = v3;

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [&unk_1F1A73140 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(&unk_1F1A73140);
          }
          Class v8 = NSClassFromString(*(NSString **)(*((void *)&v9 + 1) + 8 * v7));
          if (v8) {
            [a1 registerSchemeClass:v8];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [&unk_1F1A73140 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

+ (id)knownSchemes
{
  return (id)[(id)_schemesByName allValues];
}

+ (void)registerSchemeClass:(Class)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(a3);
    uint64_t v3 = [v4 name];
    if (v3) {
      [(id)_schemesByName setObject:v4 forKeyedSubscript:v3];
    }
  }
}

+ (id)schemeWithName:(id)a3
{
  uint64_t v3 = [(id)_schemesByName objectForKeyedSubscript:a3];
  return v3;
}

+ (id)authenticationSchemesForAccount:(id)a3 connection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = [v6 authenticationMechanisms];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v14;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = +[ECAuthenticationScheme schemeWithName:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v12
          && [v12 canAuthenticateAccountClass:objc_opt_class() connection:v6]
          && [v7 indexOfObject:v12] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

- (Class)connectionClassForAccountClass:(Class)a3
{
  return 0;
}

- (Class)authenticatorClass
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  return [(ECAuthenticationScheme *)self authenticatorClass]
      || [(ECAuthenticationScheme *)self connectionClassForAccountClass:a3] != 0;
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ECAuthenticationScheme *)self authenticatorClass];
  if (v8) {
    uint64_t v9 = (void *)[[v8 alloc] initWithAuthenticationScheme:self account:v6 connection:v7];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (NSString)name
{
  return 0;
}

- (NSString)humanReadableName
{
  return 0;
}

@end